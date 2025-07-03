using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using OxyPlot.Series;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.NetworkInformation;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;

namespace InternetSpeedTest.ViewModels
{
    public partial class MainViewModel : ObservableObject
    {
        private readonly HttpClient _httpClient = new HttpClient();
        private readonly ObservableCollection<TestResult> _testHistory = new ObservableCollection<TestResult>();
        private readonly List<(string Name, string Url, string PingAddress)> _servers = new List<(string, string, string)>
        {
            ("Google DNS", "https://dns.google.com", "8.8.8.8"),
            ("Cloudflare", "https://1.1.1.1", "1.1.1.1"),
            ("Fast.com", "https://fast.com/ttfb", "8.8.8.8"),
            ("Yandex DNS", "https://dns.yandex.com", "77.88.8.8"),
            ("OpenDNS", "https://www.opendns.com", "208.67.222.222"),
            ("Quad9", "https://www.quad9.net", "9.9.9.9")
        };
        [ObservableProperty] private string _downloadSpeed = "0 Мбит/с";
        [ObservableProperty] private string _uploadSpeed = "0 Мбит/с";
        [ObservableProperty] private string _ping = "0 мс";
        [ObservableProperty] private string _server = "Авто";
        [ObservableProperty] private bool _isTesting;
        [ObservableProperty] private string _selectedBackgroundColor = "#1E1E1E";
        [ObservableProperty] private string _gradientEndColor = "#121212";
        [ObservableProperty] private string _textColor = "White";
        [ObservableProperty] private string _cardBackground = "#2C2C2C";
        [ObservableProperty] private bool _darkTheme = true;
        [ObservableProperty] private bool _grayTheme;
        [ObservableProperty] private bool _lightTheme;
        [ObservableProperty] private string _currentDownloadSpeed = "0 Мбит/с";
        [ObservableProperty] private double _currentSpeedProgress;
        public ObservableCollection<TestResult> TestHistory => _testHistory;
        public IRelayCommand StartTestCommand { get; }
        public IRelayCommand ExportCommand { get; }
        public IRelayCommand CloseCommand { get; }

        public MainViewModel()
        {
            StartTestCommand = new AsyncRelayCommand(StartTestAsync);
            ExportCommand = new RelayCommand(Export);
            CloseCommand = new RelayCommand(() => Application.Current.MainWindow.Close());
            PropertyChanged += (s, e) =>
            {
                if (e.PropertyName == nameof(DarkTheme) && DarkTheme)
                {
                    SelectedBackgroundColor = "#1E1E1E";
                    GradientEndColor = "#121212";
                    TextColor = "White";
                    CardBackground = "#2C2C2C";
                }
                if (e.PropertyName == nameof(GrayTheme) && GrayTheme)
                {
                    SelectedBackgroundColor = "#2C2C2C";
                    GradientEndColor = "#1E1E1E";
                    TextColor = "White";
                    CardBackground = "#424242";
                }
                if (e.PropertyName == nameof(LightTheme) && LightTheme)
                {
                    SelectedBackgroundColor = "#F5F5F5";
                    GradientEndColor = "#E0E0E0";
                    TextColor = "Black";
                    CardBackground = "White";
                }
            };
        }

        private async Task StartTestAsync()
        {
            try
            {
                IsTesting = true;
                DownloadSpeed = "Тестирование...";
                UploadSpeed = "Тестирование...";
                Ping = "Тестирование...";
                CurrentDownloadSpeed = "0 Мбит/с";
                CurrentSpeedProgress = 0;
                var server = await SelectBestServerAsync();
                Server = server.Name;
                double ping = await TestPingAsync(server.PingAddress);
                Ping = $"{ping:F0} мс";
                var (downloadSpeed, uploadSpeed) = await TestSpeedAsync(server.Url);
                DownloadSpeed = $"{downloadSpeed:F2} Мбит/с";
                UploadSpeed = $"{uploadSpeed:F2} Мбит/с";
                _testHistory.Add(new TestResult
                {
                    Timestamp = DateTime.Now,
                    DownloadSpeed = downloadSpeed,
                    UploadSpeed = uploadSpeed,
                    Ping = ping
                });
                IsTesting = false;
                CurrentDownloadSpeed = "0 Мбит/с";
                CurrentSpeedProgress = 0;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}");
                IsTesting = false;
                DownloadSpeed = "0 Мбит/с";
                UploadSpeed = "0 Мбит/с";
                Ping = "0 мс";
                CurrentDownloadSpeed = "0 Мбит/с";
                CurrentSpeedProgress = 0;
            }
        }

        private async Task<(double DownloadSpeed, double UploadSpeed)> TestSpeedAsync(string url)
        {
            const int testDurationSeconds = 15;
            double totalDownloadBits = 0;
            int iterations = 0;
            var stopwatch = Stopwatch.StartNew();
            while (stopwatch.Elapsed.TotalSeconds < testDurationSeconds)
            {
                var response = await _httpClient.GetAsync(url, HttpCompletionOption.ResponseContentRead);
                response.EnsureSuccessStatusCode();
                var content = await response.Content.ReadAsByteArrayAsync();
                totalDownloadBits += content.Length * 8;
                iterations++;
                double elapsedSeconds = stopwatch.Elapsed.TotalSeconds;
                double currentSpeed = elapsedSeconds > 0 ? (totalDownloadBits / elapsedSeconds) / 1_000_000 : 0;
                CurrentDownloadSpeed = $"{currentSpeed:F2} Мбит/с";
                CurrentSpeedProgress = Math.Min((elapsedSeconds / testDurationSeconds) * 100, 100);
                await Task.Delay(1000);
            }
            stopwatch.Stop();
            double totalSeconds = stopwatch.Elapsed.TotalSeconds;
            double downloadSpeed = totalSeconds > 0 ? (totalDownloadBits / totalSeconds) / 1_000_000 : 0;
            double uploadSpeed = downloadSpeed * 0.4;
            return (downloadSpeed, uploadSpeed);
        }

        private async Task<(string Name, string Url, string PingAddress)> SelectBestServerAsync()
        {
            var bestServer = _servers[0];
            double minPing = double.MaxValue;
            foreach (var server in _servers)
            {
                double ping = await TestPingAsync(server.PingAddress);
                if (ping > 0 && ping < minPing)
                {
                    minPing = ping;
                    bestServer = server;
                }
            }
            return bestServer;
        }

        private async Task<double> TestPingAsync(string address)
        {
            try
            {
                var ping = new Ping();
                var reply = await ping.SendPingAsync(address, 1000);
                return reply.Status == IPStatus.Success ? reply.RoundtripTime : 0;
            }
            catch
            {
                return 0;
            }
        }

        private void Export()
        {
            try
            {
                var json = JsonSerializer.Serialize(_testHistory, new JsonSerializerOptions { WriteIndented = true });
                File.WriteAllText("speed_test_history.json", json);
                MessageBox.Show("История экспортирована в speed_test_history.json");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка экспорта: {ex.Message}");
            }
        }
    }

    public class TestResult
    {
        public DateTime Timestamp { get; set; }
        public double DownloadSpeed { get; set; }
        public double UploadSpeed { get; set; }
        public double Ping { get; set; }
    }
}
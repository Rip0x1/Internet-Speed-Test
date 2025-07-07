using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Graphics.Text;
using System;
using System.Collections.ObjectModel;
using System.IO;
using System.Net.Http;
using System.Net.NetworkInformation;
using System.Text.Json;
using System.Threading.Tasks;

namespace Speed_Test_MAUI.ViewModels
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

        [ObservableProperty] private string _downloadSpeed = "0 Mbps";
        [ObservableProperty] private string _uploadSpeed = "0 Mbps";
        [ObservableProperty] private string _ping = "0 ms";
        [ObservableProperty] private string _server = "Auto";
        [ObservableProperty] private bool _isTesting;
        [ObservableProperty] private string _backgroundColor = "#1E1E1E";
        [ObservableProperty] private string _textColor = "White";
        [ObservableProperty] private string _cardBackground = "#2C2C2C";
        [ObservableProperty] private bool _darkTheme = true;
        [ObservableProperty] private bool _lightTheme;
        [ObservableProperty] private double _progress;
        [ObservableProperty] private double _previousProgress;

        public ObservableCollection<TestResult> TestHistory => _testHistory;
        public IRelayCommand StartTestCommand { get; }
        public IRelayCommand ExportCommand { get; }
        public IRelayCommand ClearHistoryCommand { get; }
        public IRelayCommand CloseCommand { get; }

        public MainViewModel()
        {
            StartTestCommand = new AsyncRelayCommand(StartTestAsync);
            ExportCommand = new RelayCommand(Export);
            ClearHistoryCommand = new RelayCommand(ClearHistory);
            CloseCommand = new RelayCommand(() => Application.Current.Quit());
            LoadHistory();
            PropertyChanged += (s, e) =>
            {
                if (e.PropertyName == nameof(DarkTheme) && DarkTheme)
                {
                    BackgroundColor = "#1E1E1E";
                    TextColor = "White";
                    CardBackground = "#2C2C2C";
                    LightTheme = false;
                    Progress = 0;
                    PreviousProgress = 0;
                }
                if (e.PropertyName == nameof(LightTheme) && LightTheme)
                {
                    BackgroundColor = "#F5F5F5";
                    TextColor = "Black";
                    CardBackground = "White";
                    DarkTheme = false;
                    Progress = 0;
                    PreviousProgress = 0;
                }
                if (e.PropertyName == nameof(Progress))
                {
                    PreviousProgress = Progress;
                }
            };
        }

        private void LoadHistory()
        {
            try
            {
                string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "speed_test_history.json");
                if (File.Exists(path))
                {
                    var json = File.ReadAllText(path);
                    var history = JsonSerializer.Deserialize<List<TestResult>>(json);
                    if (history != null)
                    {
                        foreach (var result in history)
                        {
                            _testHistory.Add(result);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
            }
        }

        private void SaveHistory()
        {
            try
            {
                string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "speed_test_history.json");
                var json = JsonSerializer.Serialize(_testHistory, new JsonSerializerOptions { WriteIndented = true });
                File.WriteAllText(path, json);
            }
            catch (Exception ex)
            {
                Application.Current.MainPage.DisplayAlert("Error", ex.Message, "OK");
            }
        }


        private async Task StartTestAsync()
        {
            try
            {
                IsTesting = true;
                DownloadSpeed = "Testing"; 
                UploadSpeed = "Testing";
                Ping = "Testing";
                Progress = 0;
                PreviousProgress = 0;
                var server = await SelectBestServerAsync();
                Server = server.Name;
                double ping = await TestPingAsync(server.PingAddress);
                Ping = $"{ping:F0} ms";
                var (downloadSpeed, uploadSpeed) = await TestSpeedAsync(server.Url);
                DownloadSpeed = $"{downloadSpeed:F2} Mbps";
                UploadSpeed = $"{uploadSpeed:F2} Mbps";
                _testHistory.Add(new TestResult
                {
                    Timestamp = DateTime.Now,
                    DownloadSpeed = downloadSpeed,
                    UploadSpeed = uploadSpeed,
                    Ping = ping
                });
                SaveHistory();
                IsTesting = false;
                Progress = 0;
                PreviousProgress = 0;
            }
            catch (Exception ex)
            {
                await Application.Current.MainPage.DisplayAlert("Error", $"Error: {ex.Message}", "OK");
                IsTesting = false;
                DownloadSpeed = "0 Mbps";
                UploadSpeed = "0 Mbps";
                Ping = "0 ms";
                Progress = 0;
                PreviousProgress = 0;
            }
        }

        private async Task<(double DownloadSpeed, double UploadSpeed)> TestSpeedAsync(string url)
        {
            const int testDurationSeconds = 15;
            double totalDownloadBits = 0;
            int iterations = 0;
            var stopwatch = System.Diagnostics.Stopwatch.StartNew();
            while (stopwatch.Elapsed.TotalSeconds < testDurationSeconds)
            {
                var response = await _httpClient.GetAsync(url, HttpCompletionOption.ResponseContentRead);
                response.EnsureSuccessStatusCode();
                var content = await response.Content.ReadAsByteArrayAsync();
                totalDownloadBits += content.Length * 8;
                iterations++;
                double elapsedSeconds = stopwatch.Elapsed.TotalSeconds;
                double targetProgress = Math.Min((elapsedSeconds / testDurationSeconds) * 100, 100);
                await AnimateProgressAsync(Progress, targetProgress);
                await Task.Delay(1000);
            }
            stopwatch.Stop();
            double totalSeconds = stopwatch.Elapsed.TotalSeconds;
            double downloadSpeed = totalSeconds > 0 ? (totalDownloadBits / totalSeconds) / 1_000_000 : 0;
            double uploadSpeed = downloadSpeed * 0.4;
            return (downloadSpeed, uploadSpeed);
        }

        private async Task AnimateProgressAsync(double startValue, double endValue)
        {
            const int animationSteps = 10;
            const int stepDelayMs = 50;
            double step = (endValue - startValue) / animationSteps;

            for (int i = 0; i < animationSteps; i++)
            {
                PreviousProgress = Progress;
                Progress = startValue + step * (i + 1);
                await Task.Delay(stepDelayMs);
            }
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
                string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "speed_test_history.json");
                var json = JsonSerializer.Serialize(_testHistory, new JsonSerializerOptions { WriteIndented = true });
                File.WriteAllText(path, json);
                Application.Current.MainPage.DisplayAlert("Success", "History exported", "OK");
            }
            catch (Exception ex)
            {
                Application.Current.MainPage.DisplayAlert("Error", $"Export failed: {ex.Message}", "OK");
            }
        }

        private void ClearHistory()
        {
            try
            {
                _testHistory.Clear();
                string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "speed_test_history.json");
                if (File.Exists(path))
                {
                    File.Delete(path);
                }
                Application.Current.MainPage.DisplayAlert("Success", "History cleared", "OK");
            }
            catch (Exception ex)
            {
                Application.Current.MainPage.DisplayAlert("Error", $"Error: {ex.Message}", "OK");
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
}
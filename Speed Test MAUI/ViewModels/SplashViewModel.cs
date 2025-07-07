using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using Microsoft.Maui.Controls;
using System.Diagnostics;
using System.Threading.Tasks;

namespace Speed_Test_MAUI.ViewModels;

public partial class SplashViewModel : ObservableObject
{
    public SplashViewModel()
    {
        FadeInCommand = new AsyncRelayCommand(FadeInAsync);
        _ = FadeInAsync();
    }

    public IAsyncRelayCommand FadeInCommand { get; }

    private async Task FadeInAsync()
    {
        try
        {
            Debug.WriteLine("Starting splash animation");
            var page = Application.Current.MainPage;
            var titleLabel = page?.FindByName<Label>("TitleLabel");
            var loadingLabel = page?.FindByName<Label>("LoadingLabel");

            if (titleLabel != null)
            {
                Debug.WriteLine("Animating TitleLabel");
                await Task.WhenAll(
                    titleLabel.FadeTo(1, 2000, Easing.CubicIn),
                    titleLabel.ScaleTo(1, 2000, Easing.CubicOut)
                );
            }
            else
            {
                Debug.WriteLine("TitleLabel not found");
            }

            if (loadingLabel != null)
            {
                Debug.WriteLine("Animating LoadingLabel");
                await loadingLabel.FadeTo(0.7, 1000, Easing.Linear);
                for (int i = 0; i < 2; i++)
                {
                    await Task.WhenAll(
                        loadingLabel.ScaleTo(1.1, 500, Easing.SinInOut),
                        loadingLabel.ScaleTo(0.9, 500, Easing.SinInOut)
                    );
                }
                await loadingLabel.ScaleTo(1, 500, Easing.SinInOut);
            }
            else
            {
                Debug.WriteLine("LoadingLabel not found");
            }

            Debug.WriteLine("Waiting for 1 second");
            await Task.Delay(1000);
            Debug.WriteLine("Navigating to AppShell");
            await page.Navigation.PushAsync(new AppShell());
            Debug.WriteLine("Navigation to AppShell completed");
        }
        catch (Exception ex)
        {
            Debug.WriteLine($"SplashViewModel error: {ex.Message}\n{ex.StackTrace}");
            await Application.Current.MainPage?.DisplayAlert("Error", $"Failed to load main page: {ex.Message}", "OK");
        }
    }
}
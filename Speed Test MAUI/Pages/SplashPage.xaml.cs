using Speed_Test_MAUI.ViewModels;

namespace Speed_Test_MAUI.Pages;

public partial class SplashPage : ContentPage
{
	public SplashPage()
	{
		InitializeComponent();
        BindingContext = new SplashViewModel();
    }
}
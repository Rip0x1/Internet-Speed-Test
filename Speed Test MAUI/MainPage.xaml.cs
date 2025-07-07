using Speed_Test_MAUI.ViewModels;

namespace Speed_Test_MAUI
{
    public partial class MainPage : ContentPage
    {

        public MainPage(MainViewModel viewModel)
        {
            InitializeComponent();
            BindingContext = viewModel;
        }
    }

}

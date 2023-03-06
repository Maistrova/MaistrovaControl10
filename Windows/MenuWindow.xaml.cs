using MaistrovaControl10.ClassFrame;
using System.Windows;

namespace MaistrovaControl10.Windows
{
    /// <summary>
    /// Логика взаимодействия для MenuWindow.xaml
    /// </summary>
    public partial class MenuWindow : Window
    {
        public MenuWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            FrameClass.FrameBody = FrameBodyMain;
            FrameClass.FrameBody.Navigate(new Pages.Page1());
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            FrameClass.FrameBody = FrameBodyMain;
            FrameClass.FrameBody.Navigate(new Pages.Page2());
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            FrameClass.FrameBody = FrameBodyMain;
            FrameClass.FrameBody.Navigate(new Pages.Page3());
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            FrameClass.FrameBody = FrameBodyMain;
            FrameClass.FrameBody.Navigate(new Pages.Page4());
        }
    }
}

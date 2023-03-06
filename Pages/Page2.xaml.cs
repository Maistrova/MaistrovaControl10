using MaistrovaControl10.Models;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace MaistrovaControl10.Pages
{
    /// <summary>
    /// Логика взаимодействия для Page2.xaml
    /// </summary>
    public partial class Page2 : Page
    {
        public Page2()
        {
            InitializeComponent();
            Connect.database = new DepoMaistrovaEntities1();
            VidRabCB.ItemsSource = Connect.database.TypeWorkTable.ToList();
        }

        private void GetClear()
        {
            TBNameRab.Text = null;
            VidRabCB.Text = null;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (TBNameRab.Text == "" || VidRabCB.Text == "")
            {
                MessageBox.Show("Поля пустые");
            }
            else
            {
                if (TBNameRab.Text.Length <= 2)
                {
                    MessageBox.Show("Работа должна именть нозвание");
                }
                else
                {
                    try
                    {
                        WorkTable workTable = new WorkTable()
                        {
                            TypeWorkTable = VidRabCB.SelectedItem as TypeWorkTable,
                            TitleWork = TBNameRab.Text
                        };
                        Connect.database.WorkTable.Add(workTable);
                        Connect.database.SaveChanges();
                        MessageBox.Show("Работа добавлена");
                        GetClear();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message.ToString());
                    }
                }
            }
        }
    }
}

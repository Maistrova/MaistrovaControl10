using MaistrovaControl10.Models;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace MaistrovaControl10.Pages
{
    public partial class Page1 : Page
    {
        public Page1()
        {
            InitializeComponent();
            Connect.database = new DepoMaistrovaEntities1();
            VagonItaCB.ItemsSource = Connect.database.FloorsTable.ToList();
        }
        private void GetClear()
        {
            TBNumber.Text = null;
            VagonItaCB.Text = null;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (TBNumber.Text == "" || VagonItaCB.Text == "")
            {
                MessageBox.Show("Поля пустые");
            }
            else
            {
                if (TBNumber.Text.Length <= 5)
                {
                    MessageBox.Show("Номер вагона должен состоять из 6 цифр");
                }
                else
                {
                    int Id = Convert.ToInt32(TBNumber.Text);
                    if (Connect.database.TrolleyTable.Count(date => date.PersonalNumberTrolley == Id) > 0)
                    {
                        MessageBox.Show("Такой вагон уже существует");
                    }
                    else
                    {
                        try
                        {
                            TrolleyTable trolleyTable = new TrolleyTable()
                            {
                                PersonalNumberTrolley = Id,
                                FloorsTable = VagonItaCB.SelectedItem as FloorsTable
                            };
                            Connect.database.TrolleyTable.Add(trolleyTable);
                            Connect.database.SaveChanges();
                            MessageBox.Show("Вагон добавлен");
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
}

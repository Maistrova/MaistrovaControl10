using MaistrovaControl10.Models;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace MaistrovaControl10.Pages
{
    public partial class Page4 : Page
    {
        public Page4()
        {
            InitializeComponent();
            Connect.database = new DepoMaistrovaEntities1();
            DateGr2.ItemsSource = Connect.database.ReportTable.ToList();
        }

        private void SweepButton_Click(object sender, RoutedEventArgs e)
        {
            if (DateStartDP.Text == "" || DateEndDP.Text == "")
            {
                MessageBox.Show("Пустые поля");
            }
            else
            {
                var DateStart = (DateTime)DateStartDP.SelectedDate;
                var DateEnd = (DateTime)DateEndDP.SelectedDate;

                var GetDate = Connect.database.ReportTable
                    .Where(date => date.DateStart >= DateStart && date.DateEnd <= DateEnd)
                    .GroupBy(id => id.IdReport);

                DateGr2.ItemsSource = GetDate.ToList();
            }
        }
    }
}

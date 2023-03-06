using MaistrovaControl10.Models;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace MaistrovaControl10.Pages
{
    public partial class Page3 : Page
    {
        public Page3()
        {
            InitializeComponent();
            Connect.database = new DepoMaistrovaEntities1();
            NameRabCB.ItemsSource = Connect.database.WorkTable.ToList();
            NomerVagCB.ItemsSource = Connect.database.TrolleyTable.ToList();
            StatusComboBox.ItemsSource = Connect.database.StatusWorkTable.ToList();
        }

        private void GetClear()
        {
            NameRabCB.Text = null;
            NachaloDP.Text = null;
            KonecDP.Text = null;
            NomerVagCB.Text = null;
            StatusComboBox.Text = null;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if (NameRabCB.Text == "" || NachaloDP.Text == "" || KonecDP.Text == "" || NomerVagCB.Text == "" || StatusComboBox.Text == "")
            {
                MessageBox.Show("Поля пустые");
            }
            else
            {
                try
                {
                    DateTime dateStart, dateEnd;
                    dateStart = Convert.ToDateTime(NachaloDP.Text);
                    dateEnd = Convert.ToDateTime(KonecDP.Text);
                    ReportTable reportTable = new ReportTable()
                    {
                        IdWork = (NameRabCB.SelectedItem as WorkTable).PersonalNumberWork,
                        IdTrolly = (NomerVagCB.SelectedItem as TrolleyTable).PersonalNumberTrolley,
                        IdStatus = (StatusComboBox.SelectedItem as StatusWorkTable).PersonalNumberStatusWork,
                        DateStart = dateStart,
                        DateEnd = dateEnd,
                    };
                    Connect.database.ReportTable.Add(reportTable);
                    Connect.database.SaveChanges();
                    MessageBox.Show("Данные сохранены");
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

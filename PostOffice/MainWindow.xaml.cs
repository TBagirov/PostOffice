using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Collections; 
using System.Windows.Threading;
using System.Threading;

using PostOffice.Views;
using PostOffice.Controllers;


namespace PostOffice
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        // контроллер
        private PostOfficeController _controller;
         
        public PostOfficeController Controller {
            get => _controller;
            set => _controller = value;
        }

        // конструктор по умолчанию
        public MainWindow() : this(new PostOfficeController()) { }
         
        // конструктор инициализирующий
        public MainWindow(PostOfficeController controller) {
            InitializeComponent();
             
            _controller = controller;
        }

        #region Демонстрация данных таблиц

        // демнострация таблицы Улицы
        private void ShowTableStreets_Executed(object sender, ExecutedRoutedEventArgs e){ 
            // очистка DataGrid
            ClearDataGrid(DgdTableData);

            // заполнение DataGrid
            UpdateBinding(DgdTableData, _controller.GetStreets()
                .Select(item => new {
                        item.Id,
                        Street = item.Name 
                        }));

            // отображение названиея таблицы  
            UpdateGroupBox(GbxTable, $"Улицы");
        }
         
        // демнострация таблицы Регионы
        private void ShowTableRegions_Executed(object sender, ExecutedRoutedEventArgs e) { 
            // очистка DataGrid
            ClearDataGrid(DgdTableData);

            // заполнение DataGrid
            UpdateBinding(DgdTableData, _controller.GetRegions()
                .Select(item => new { 
                        item.Id,
                        RegionName = item.Name,
                        Street = item.Street.Name
                        }));

            // отображение названиея таблицы
            UpdateGroupBox(GbxTable, "Регионы");
        }
         

        // демнострация таблицы Отношения почтальонов к участкам
        private void ShowTableDistricts_Executed(object sender, ExecutedRoutedEventArgs e) { 
            // очистка DataGrid
            ClearDataGrid(DgdTableData);

            // заполнение DataGrid
            UpdateBinding(DgdTableData, _controller.GetDistricts());

            // отображение названиея таблицы
            UpdateGroupBox(GbxTable, "Отношения почтальонов к участкам");
        } 


        // демнострация таблицы Почтальоны
        private void ShowTablePostmans_Executed(object sender, ExecutedRoutedEventArgs e) { 
            // очистка DataGrid
            ClearDataGrid(DgdTableData);

            // заполнение DataGrid
            UpdateBinding(DgdTableData, _controller.GetPostmans()
                .Select(item => new  {
                        item.Id,
                        Postman = $"{item.Person.Surname} {item.Person.Name} " +
                                    $"{item.Person.Patronymic}"
                        }));
            // отображение названиея таблицы
            UpdateGroupBox(GbxTable, "Почтальоны");
        } 

        // демнострация таблицы Персоны
        private void ShowTablePersons_Executed(object sender, ExecutedRoutedEventArgs e) { 
            // очистка DataGrid
            ClearDataGrid(DgdTableData);

            // заполнение DataGrid
            UpdateBinding(DgdTableData, _controller.GetPersons()
                .Select(item => new { 
                        item.Id,
                        item.Name,
                        item.Surname,
                        item.Patronymic
                        }));

            // отображение названиея таблицы
            UpdateGroupBox(GbxTable, "Персоны");
        }


        // демнострация таблицы Тип издания
        private void ShowTablePublicationTypes_Executed(object sender, ExecutedRoutedEventArgs e) {
            // очистка DataGrid
            ClearDataGrid(DgdTableData);

            // текущая дата
            DateTime date = DateTime.Now;

            // заполнение DataGrid
            UpdateBinding(DgdTableData, _controller.GetPublicationTypes()
                .Select(item => new { 
                        item.Id,
                        PublicationType = item.Name}));

            // отображение названиея таблицы
            UpdateGroupBox(GbxTable, "Тип издания");
        }
         

        // демнострация таблицы Издания
        private void ShowTablePublications_Executed(object sender, ExecutedRoutedEventArgs e) { 
            // очистка DataGrid
            ClearDataGrid(DgdTableData);

            // заполнение DataGrid
            UpdateBinding(DgdTableData, _controller.GetPublications());

            // отображение названиея таблицы
            UpdateGroupBox(GbxTable, "Издания");
        }

        // демнострация таблицы Подписчики
        private void ShowTableSubscribers_Executed(object sender, ExecutedRoutedEventArgs e) { 
            // очистка DataGrid
            ClearDataGrid(DgdTableData);

            // заполнение DataGrid
            UpdateBinding(DgdTableData, _controller.GetSubscribers()
                .Select(item =>new { 
                        item.Id,
                        item.Surname,
                        item.Name,
                        item.Patronymic,
                        item.Street,
                        item.Building,
                        item.Apartment,
                        item.RegionName}));


            // отображение названиея таблицы
            UpdateGroupBox(GbxTable, "Подписчики");
        }


        // демнострация таблицы Подписки
        private void ShowTableSubscribes_Executed(object sender, ExecutedRoutedEventArgs e) { 
            // очистка DataGrid
            ClearDataGrid(DgdTableData);

            // заполнение DataGrid
            UpdateBinding(DgdTableData, _controller.GetSubscribes()
                .Select(item => new { 
                        item.Id,
                        SubscriberId = item.IdSubscriber,
                        Subscriber = $"{item.Surname} {item.Name[0]}. {item.Patronymic[0]}.",
                        item.PubIndex,
                        item.Title,
                        item.PubType,
                        StartDate = item.StartDate.ToShortDateString(),
                        item.Duration,
                        item.TotalPrice 
            
            }));

            // отображение названиея таблицы
            UpdateGroupBox(GbxTable, "Подписки");
        }  
        #endregion

        // обновление привязки для DataGrid
        public void UpdateBinding(DataGrid grid, IEnumerable collection) {
            Dispatcher.BeginInvoke(DispatcherPriority.Normal, (ThreadStart)(() =>
            {
                // обновление привязки
                grid.ItemsSource = null;
                grid.ItemsSource = collection; 

                // вывод количества элементов
                ShowCountElem(grid.Items.Count); 
            }));
        }

        // обновление заголовка в GroupBox
        public void UpdateGroupBox(GroupBox groupBox, string header) {
            Dispatcher.BeginInvoke(DispatcherPriority.Normal, (ThreadStart)(() =>
            {
                groupBox.Header = header;
            }));
        }

        // очистка DataGrid
        public void ClearDataGrid(DataGrid grid) {
            Dispatcher.BeginInvoke(DispatcherPriority.Normal, (ThreadStart)(() =>
            {
                grid.ItemsSource = null;
                 
            }));
        }

        // вывод количество элементов если count == -1, то вывод "——"
        public void ShowCountElem(int count) {
            LblCount.Content = $"Количество элементов: {(count == -1 ? "——" : $"{count}")}";
        }

        // выход из приложения
        private void Exit_Executed(object sender, ExecutedRoutedEventArgs e) => Application.Current.Shutdown();

        // открыть окна добавление почтальона
        private void OpenPostmanWindow_Executed(object sender, ExecutedRoutedEventArgs e) {
            var window = new PostmanWindow(_controller);
            window.ShowDialog();

            // необходимо явное сравнение
            if(window.DialogResult == true)
                ShowTablePostmans_Executed(sender, e);
        } // OpenPostmanWindow_Executed
         



    }
}

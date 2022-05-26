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
using System.Windows.Shapes;

using PostOffice.Controllers;
using PostOffice.Models;

namespace PostOffice.Views
{
    public partial class PostmanWindow : Window
    {

        PostOfficeController _controller;

        public PostOfficeController Controller => _controller;

        public PostmanWindow() : this(new PostOfficeController()) { }

        public PostmanWindow(PostOfficeController controller)
        {
            InitializeComponent();
            _controller = controller;
            Title = "Добавление почтальона";
            BtnOK.Content = "Добавить";
              
        } // SubscriberWindow 

        private void Add_Click(object sender, RoutedEventArgs e) {

            if(string.IsNullOrWhiteSpace(TbxSurname.Text) || 
               string.IsNullOrWhiteSpace(TbxName.Text) || 
               string.IsNullOrWhiteSpace(TbxPatronymic.Text)) {
                MessageBox.Show("Неверно введены данные", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                DialogResult = false;
                return;
            }

            var Person = _controller.PostalDb.Persons
                .Where(p => p.Surname == TbxSurname.Text
                       && p.Name == TbxName.Text 
                       && p.Patronymic == TbxPatronymic.Text)
                .FirstOrDefault();

            var Postman = _controller.PostalDb.Postmans
                .Where(p => p.Person.Surname == TbxSurname.Text
                       && p.Person.Name == TbxName.Text
                       && p.Person.Patronymic == TbxPatronymic.Text)
                .FirstOrDefault();

            // действия если почтальона с указанным Ф.И.О. не существует,
            // и нет такой персоны
            if (Postman == null && Person == null)  {

                // добавить новую персону в таблицу персоны
                Person = _controller.PostalDb.Persons
                    .Add(new Person { Surname = TbxSurname.Text, Name = TbxName.Text, Patronymic = TbxPatronymic.Text });

                // добавить почтальона
                _controller.PostalDb.Postmans.Add(new Postman { IdPerson = Person.Id });
            }
            // действия если почтальона с указанным Ф.И.О. не существует,
            // но есть такая персона, то есть один из подписчиков устраиваеться на работу
            else if (Postman == null && Person != null) {
                // добавить почтальона
                _controller.PostalDb.Postmans.Add(new Postman { IdPerson = Person.Id });
            }
            else { 
                MessageBox.Show("Невозможно, такой почтальон существует!","Ошибка",MessageBoxButton.OK,MessageBoxImage.Error);
                DialogResult = false;
                return;
            }
            _controller.PostalDb.SaveChanges();

            DialogResult = true; 
        } // Add_Click

    }
}
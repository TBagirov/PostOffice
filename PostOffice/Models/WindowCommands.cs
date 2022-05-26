using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace PostOffice.Models
{
    public class WindowCommands
    {

        // команда - выхода из приложения
        public static RoutedUICommand Exit { get; set; } 
       
        // команда - открыть окно добавление почтальона
        public static RoutedUICommand OpenPostmanWindow { get; set; } 

        #region Команды демонстрации таблиц
       
        // команда - демонстрация таблицы Улицы
        public static RoutedUICommand ShowTableStreets { get; set; }

        // команда - демонстрация таблицы Регионы
        public static RoutedUICommand ShowTableRegions { get; set; }

        // команда - демонстрация таблицы Отношения почтальонов к участкам
        public static RoutedUICommand ShowTableDistricts { get; set; }

        // команда - демонстрация таблицы Почтальоны
        public static RoutedUICommand ShowTablePostmans { get; set; }

        // команда - демонстрация таблицы Персоны
        public static RoutedUICommand ShowTablePersons { get; set; }

        // команда - демонстрация таблицы Тип издания
        public static RoutedUICommand ShowTablePublicationTypes { get; set; } 

        // команда - демонстрация таблицы Издания
        public static RoutedUICommand ShowTablePublications { get; set; }

        // команда - демонстрация таблицы Подписчик
        public static RoutedUICommand ShowTableSubscribers { get; set; }

        // команда - демонстрация таблицы Подписки
        public static RoutedUICommand ShowTableSubscribes { get; set; }

        #endregion

        #region Конструкторы

        // статический конструктор
        static WindowCommands()
        {
            // установка значений
            Exit = new RoutedUICommand("Выход", "Exit", typeof(WindowCommands), new InputGestureCollection { new KeyGesture(Key.F4, ModifierKeys.Alt, "Alt+F4") });
            
            // установка значений
            OpenPostmanWindow = new RoutedUICommand("Добавление почтальона", "OpenPostmanWindow", typeof(WindowCommands));

            #region Команды демонстрации таблиц
            // команда - демонстрация таблицы Улицы
            ShowTableStreets = new RoutedUICommand("Улицы", "ShowTableStreets", typeof(WindowCommands));

            // команда - демонстрация таблицы Регионы
            ShowTableRegions = new RoutedUICommand("Регионы", "ShowTableRegions", typeof(WindowCommands));

            // команда - демонстрация таблицы Отношения почтальонов к участкам
            ShowTableDistricts = new RoutedUICommand("Отношения почтальонов к участкам", "ShowTableDistricts", typeof(WindowCommands));

            // команда - демонстрация таблицы Почтальоны
            ShowTablePostmans = new RoutedUICommand("Почтальоны", "ShowTablePostmans", typeof(WindowCommands));

            // команда - демонстрация таблицы Персоны
            ShowTablePersons = new RoutedUICommand("Персоны", "ShowTablePersons", typeof(WindowCommands));

            // команда - демонстрация таблицы Тип издания
            ShowTablePublicationTypes = new RoutedUICommand("Типы изданий", "ShowTablePublicationTypes", typeof(WindowCommands));

            // команда - демонстрация таблицы Издания
            ShowTablePublications = new RoutedUICommand("Издания", "ShowTablePublications", typeof(WindowCommands));

            // команда - демонстрация таблицы Подписчик
            ShowTableSubscribers = new RoutedUICommand("Подписчики", "ShowTableSubscribers", typeof(WindowCommands));

            // команда - демонстрация таблицы Подписки
            ShowTableSubscribes = new RoutedUICommand("Подписки", "ShowTableSubscribes", typeof(WindowCommands)); 

            #endregion
        }

        #endregion

    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PostOffice.Models;

namespace PostOffice.Controllers
{
     public class PostOfficeController {

        // связь с базой данных
        private PostOfficeEntities _postalDb;  
        public PostOfficeEntities PostalDb { get => _postalDb; }

        #region Конструкторы

        public PostOfficeController() : this(new PostOfficeEntities()) { }

        public PostOfficeController(PostOfficeEntities postalDb)  {
            _postalDb = postalDb; 
        } // PostOfficeController

        #endregion


        #region Получение данных из таблиц 
        // получить данные из таблицы Улицы (Street)
        public List<Street> GetStreets() => _postalDb.Streets.ToList();

        // получить данные из таблицы Регионы (Region)
        public List<Region> GetRegions() => _postalDb.Regions.ToList();


        // получить данные из таблицы Отношения почтальонов к участкам (DistrictsView)
        public List<DistrictsView> GetDistricts() => _postalDb.DistrictsViews.ToList();
         
        // получить данные из таблицы Почтальоны (Postmans)
        public List<Postman> GetPostmans() => _postalDb.Postmans.ToList();

        // получить данные из таблицы Персоны (Persons)
        public List<Person> GetPersons() => _postalDb.Persons.ToList();

        // получить данные из таблицы Тип издания (PublicationTypes)
        public List<PublicationType> GetPublicationTypes() => _postalDb.PublicationTypes.ToList();

        // получить данные из таблицы Издания (PublicationsView)
        public List<PublicationsView> GetPublications() => _postalDb.PublicationsViews.ToList();

        // получить данные из таблицы Подписчики (SubscribersView)
        public List<SubscribersView> GetSubscribers() => _postalDb.SubscribersViews.ToList();

        // получить данные из таблицы Подписки (SubscribesView)
        public List<SubscribesView> GetSubscribes() => _postalDb.SubscribesViews.ToList(); 


        #endregion

    }
}

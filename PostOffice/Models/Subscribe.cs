//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PostOffice.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Subscribe
    {
        public int Id { get; set; }
        public int IdSubscriber { get; set; }
        public int IdPublication { get; set; }
        public System.DateTime StartDate { get; set; }
        public int Duration { get; set; }
    
        public virtual Publication Publication { get; set; }
        public virtual Subscriber Subscriber { get; set; }
    }
}

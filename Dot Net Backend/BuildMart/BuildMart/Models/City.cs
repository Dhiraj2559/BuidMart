﻿using System;
using System.Collections.Generic;

namespace BuildMart.Models
{
    public partial class City
    {
        public City()
        {
            Areas = new HashSet<Area>();
        }

        public int Id { get; set; }
        public string? CityName { get; set; }

        public virtual ICollection<Area> Areas { get; set; }
    }
}

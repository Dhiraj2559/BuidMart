﻿using System;
using System.Collections.Generic;

namespace BuildMart.Models
{
    public partial class VendorProduct
    {
        public VendorProduct()
        {
            Carts = new HashSet<Cart>();
            OrderItems = new HashSet<OrderItem>();
        }

        public int Id { get; set; }
        public int? OfferPercentage { get; set; }
        public DateOnly? OfferValidDate { get; set; }
        public double? Price { get; set; }
        public int? Quantity { get; set; }
        public int? ProductId { get; set; }
        public int? VendorId { get; set; }

        public virtual Product? Product { get; set; }
        public virtual ConstructionMaterialVendor? Vendor { get; set; }
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<OrderItem> OrderItems { get; set; }
    }
}

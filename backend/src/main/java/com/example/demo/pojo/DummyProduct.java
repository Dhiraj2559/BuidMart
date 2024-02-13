package com.example.demo.pojo;



import com.example.demo.entities.Category;

public class DummyProduct {

	    private String productName;
	    private String description;
	    private String stockQuantity;
	    
	    private byte[] picture;
	  
	    private int category_id;

		public String getProductName() {
			return productName;
		}

		public void setProductName(String productName) {
			this.productName = productName;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getStockQuantity() {
			return stockQuantity;
		}

		public void setStockQuantity(String stockQuantity) {
			this.stockQuantity = stockQuantity;
		}

		public byte[] getPicture() {
			return picture;
		}

		public void setPicture(byte[] picture) {
			this.picture = picture;
		}

		public int getCategory_id() {
			return category_id;
		}

		public void setCategory_id(int category_id) {
			this.category_id = category_id;
		}

		public DummyProduct() {
			super();
			// TODO Auto-generated constructor stub
		}

		public DummyProduct(String productName, String description, String stockQuantity, byte[] picture,
				int category_id) {
			super();
			this.productName = productName;
			this.description = description;
			this.stockQuantity = stockQuantity;
			this.picture = picture;
			this.category_id = category_id;
		}
	    

}

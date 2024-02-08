Buildmart Database

DROP TABLE IF EXISTS cities;

CREATE TABLE cities (
  id int NOT NULL AUTO_INCREMENT,
  city_name varchar(100),
  PRIMARY KEY (id)
) AUTO_INCREMENT=4;

DROP TABLE IF EXISTS area;

CREATE TABLE area (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(100),
  pincode varchar(10),
  city_id int,
  PRIMARY KEY (id),
  KEY FK01 (city_id),
  CONSTRAINT FK01 FOREIGN KEY (city_id) REFERENCES cities (id)
) AUTO_INCREMENT=32;




DROP TABLE IF EXISTS roles;

CREATE TABLE roles (
  id int NOT NULL AUTO_INCREMENT,
  role varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
) AUTO_INCREMENT=6;


DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id int NOT NULL AUTO_INCREMENT,
  active_status varchar(100),
  answer varchar(100),
  password varchar(100),
  username varchar(100),
  role_id int,
  PRIMARY KEY (id),
  KEY FK04 (role_id),
  CONSTRAINT FK04 FOREIGN KEY (role_id) REFERENCES roles (id)
) AUTO_INCREMENT=9;


DROP TABLE IF EXISTS address;

CREATE TABLE address (
  id int NOT NULL AUTO_INCREMENT,
  add_line varchar(255),
  area_id int,
  user_id int,
  PRIMARY KEY (id),
  KEY FK02 (area_id),
  KEY FK03 (user_id),
  CONSTRAINT FK03 FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT FK02 FOREIGN KEY (area_id) REFERENCES area (id)
) AUTO_INCREMENT=48;


DROP TABLE IF EXISTS category;

CREATE TABLE category (
  id int NOT NULL AUTO_INCREMENT,
  description varchar(100),
  name varchar(100),
  PRIMARY KEY (id)
) AUTO_INCREMENT=23;

DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id int NOT NULL AUTO_INCREMENT,
  description varchar(255) DEFAULT NULL,
  product_name varchar(255) DEFAULT NULL,
  stock_quantity int DEFAULT NULL,
  cid int DEFAULT NULL,
  picture longblob,
  PRIMARY KEY (id),
  KEY FK05 (cid),
  CONSTRAINT FK05 FOREIGN KEY (cid) REFERENCES category (id)
)AUTO_INCREMENT=95;


DROP TABLE IF EXISTS construction_material_vendors;

CREATE TABLE construction_material_vendors (
  id int NOT NULL AUTO_INCREMENT,
  contact_number varchar(100),
  email varchar(100),
  shop_name varchar(100),
  uid int,
  PRIMARY KEY (id),
  KEY FK08 (uid),
  CONSTRAINT FK08 FOREIGN KEY (uid) REFERENCES users (id)
)AUTO_INCREMENT=4;



DROP TABLE IF EXISTS vendor_product;

CREATE TABLE vendor_product (
  id int NOT NULL AUTO_INCREMENT,
  offer_percentage int DEFAULT NULL,
  offer_valid_date date DEFAULT NULL,
  price double DEFAULT NULL,
  quantity int DEFAULT NULL,
  product_id int DEFAULT NULL,
  vendor_id int DEFAULT NULL,
  PRIMARY KEY (id),
  KEY FK06 (product_id),
  KEY FK07 (vendor_id),
  CONSTRAINT FK06 FOREIGN KEY (product_id) REFERENCES products (id),
  CONSTRAINT FK07 FOREIGN KEY (vendor_id) REFERENCES construction_material_vendors (id)
) AUTO_INCREMENT=17 ;


DROP TABLE IF EXISTS individual_customer;

CREATE TABLE individual_customer (
  id int NOT NULL AUTO_INCREMENT,
  contact_number varchar(100),
  email varchar(100),
  first_name varchar(100),
  last_name varchar(100),
  user_id int,
  PRIMARY KEY (id),
  KEY FK09 (user_id),
  CONSTRAINT FK09 FOREIGN KEY (user_id) REFERENCES users (id)
) AUTO_INCREMENT=5;



DROP TABLE IF EXISTS service_providers;

CREATE TABLE service_providers (
  id int NOT NULL AUTO_INCREMENT,
  contact_number varchar(255),
  email varchar(255),
  experience int,
  first_name varchar(255),
  last_name varchar(255),
  rates double,
  status varchar(255),
  uid int,
  PRIMARY KEY (id),
  KEY FK10 (uid),
  CONSTRAINT `FKohlwfq5rgdtx3o5s72cvlcbk6` FOREIGN KEY (uid) REFERENCES users (id)
) ;

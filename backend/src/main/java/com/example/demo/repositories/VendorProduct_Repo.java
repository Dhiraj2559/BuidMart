package com.example.demo.repositories;

import java.sql.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.demo.entities.User;
import com.example.demo.entities.Product;
import com.example.demo.entities.Vendor_Product;

@Transactional
@Repository
public interface VendorProduct_Repo extends JpaRepository<Vendor_Product, Integer> {
	
	@Query("select v from Vendor_Product v where vendor_id=:vid")
	public List<Vendor_Product> getVendorProductsForVendors(int vid);
	
	@Query("select v from Vendor_Product v where product_id=:pid")
	public List<Vendor_Product> getVendorProductsForCustomers(int pid);
	
	
	@Modifying
	@Query("delete from Vendor_Product u where id=:vid")
	public int deleteVendorProduct(int vid);
	


	

}

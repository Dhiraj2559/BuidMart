package com.example.demo.services;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entities.Product;
import com.example.demo.entities.User;
import com.example.demo.entities.Vendor_Product;
import com.example.demo.repositories.VendorProduct_Repo;

@Service
public class VendorProduct_Service {
	@Autowired
	VendorProduct_Repo vrepo;
	
	
	public List<Vendor_Product> getVendorProductsForVendors(int id)
	{
		return vrepo.getVendorProductsForVendors(id);
	}
	public List<Vendor_Product> getVendorProductsForCustomers(int id)
	{
		return vrepo.getVendorProductsForCustomers(id);
	}
	
	public void delete_VendorProduct(int vpid)
	{
		 vrepo.deleteById(vpid);
	}

	public Vendor_Product addProduct(Vendor_Product p)
	{
		return vrepo.save(p);
	}
	
	
	
	public Vendor_Product getVendor_ProductById(int id)
	{
		 Optional<Vendor_Product> or=vrepo.findById(id);
		 Vendor_Product r=null;
		 try
		 {
			 if(or!=null)
			 {
				 r=or.get();
			 }
			  
		 }
		 catch(Exception e)
		 {
			 e.printStackTrace();
		 }
		 return r;
	}
	
	
	public int deleteVendorProduct(int vid)
	{
		return vrepo.deleteVendorProduct(vid);
	}
	


}

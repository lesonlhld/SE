package com.vienmv.service;

import java.util.List;

import com.vienmv.model.Product;

public interface ProductService {
	void insert(Product product);

	void edit(Product product);

	void delete(int id);

	Product get(int id);

	List<Product> getAll();

	List<Product> search(String username);
	
	List<Product> searchByCategory(int cate_id);
	
	List<Product> searchByName(String productName);
}

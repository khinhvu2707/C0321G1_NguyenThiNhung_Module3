package model.service;

import model.bean.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductService {
    List<Product> findAll();
    void save(Product product);
    void save2(Product product);
    Product findById(int id);
    void update(int id, Product product);
    void remove(int id);
    List<Product> findByName(String name);
    int findByIdToSave();
    void saveTime(int id,Product product);
}

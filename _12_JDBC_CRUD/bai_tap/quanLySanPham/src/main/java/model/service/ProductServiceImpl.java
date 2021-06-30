package model.service;

import model.bean.Product;
import model.repository.ProductReponsitory;
import model.repository.ProductRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class ProductServiceImpl implements ProductService {
    private ProductReponsitory reponsitory = new ProductRepositoryImpl();
    @Override
    public List<Product> findAll(){
        return reponsitory.findAll();
    }

    @Override
    public void save(Product product) {
reponsitory.save(product);
    }

    @Override
    public Product findById(int id) {
        return reponsitory.findById(id);
    }

    @Override
    public void update(int id, Product product) {
reponsitory.update(id,product);
    }

    @Override
    public void remove(int id) {
reponsitory.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        return reponsitory.findByName(name);
    }
}

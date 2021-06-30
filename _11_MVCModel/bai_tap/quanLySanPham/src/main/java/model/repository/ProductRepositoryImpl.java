package model.repository;

import model.bean.Product;

import java.util.*;

public class ProductRepositoryImpl implements ProductReponsitory {
    private static Map<Integer, Product> products;

    static {
        products = new HashMap<>();
        products.put(1, new Product(1, "Bút bi đen", 10, "màu đen", "Thiên Long"));
        products.put(2, new Product(2, "Bút bi đỏ", 10, "màu đỏ", "Thiên Long"));
        products.put(3, new Product(3, "Bút chì", 7, "mực đen", "Thiên Long"));
        products.put(4, new Product(4, "Bút chì màu", 20, "12 màu", "Thiên Long"));
        products.put(5, new Product(5, "Vở ô li", 10, "kẻ ô li", "Thiên Long"));
        products.put(6, new Product(6, "Vở kẻ ngang", 9, "kẻ ngang", "Thiên Long"));
        products.put(7, new Product(7, "Thước kẻ", 5, "20cm", "Thiên Long"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }


    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productsList = new ArrayList<>();
        Set<Integer> set = products.keySet();
        Product product = null;
        for (Integer key : set) {
            if (products.get(key).getTenSanPham().equals(name)) {
                product = products.get(key);
                productsList.add(product);
            }
        }
        return productsList;
    }

}

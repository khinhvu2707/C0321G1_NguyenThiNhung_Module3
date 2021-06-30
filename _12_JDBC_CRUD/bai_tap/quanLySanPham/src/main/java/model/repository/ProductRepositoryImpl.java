package model.repository;

import model.bean.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class ProductRepositoryImpl implements ProductReponsitory {
     public ProductRepositoryImpl() {
    }
    @Override
    public List<Product> findAll(){
        List<Product> products =new ArrayList<>();
        Connection connection =ProductConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if(connection != null){
            try {
                statement = connection.prepareStatement("SELECT * FROM product");
                resultSet = statement.executeQuery();
                Product product = null;
                while (resultSet.next()){
                    int id = resultSet.getInt("id");
                    String ten = resultSet.getString("ten_san_pham");
                    int gia = resultSet.getInt("gia_san_pham");
                    String moTa = resultSet.getString("mo_ta_san_pham");
                    String hsx = resultSet.getString("hang_san_xuat");
                    product = new Product(id,ten,gia,moTa,hsx);
                    products.add(product);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                ProductConnection.close();
            }
        }
        return products;
    }

    @Override
    public void save(Product product) {
        Connection connection = ProductConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement("insert into product(ten_san_pham,gia_san_pham,mo_ta_san_pham,hang_san_xuat) value (?,?,?,?); ");
                    statement.setString(1,product.getTenSanPham());
                   statement.setInt(2,product.getGiaSanPham());
                   statement.setString(3,product.getMoTaSanPham());
                   statement.setString(4,product.getNhaSanXuat());
                statement.executeUpdate();
            } catch (SQLException throwables){
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                ProductConnection.close();
            }
        }
    }

    @Override
    public Product findById(int findId) {
        Product product = null;
        Connection connection = ProductConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement("select * from product where id = ?;");
                statement.setString(1, String.valueOf(findId));
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                    int id = resultSet.getInt(1);
                    String ten = resultSet.getString(2);
                    int gia = resultSet.getInt(3);
                    String moTa = resultSet.getString(4);
                    String hsx = resultSet.getString(5);
                    product = new Product(id,ten,gia,moTa,hsx);
                }
            } catch (SQLException throwables){
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                ProductConnection.close();
            }
        }
        return product;
    }

    @Override
    public void update(int id, Product product) {
        Connection connection = ProductConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement("update product set ten_san_pham=?,gia_san_pham=?,mo_ta_san_pham=?,hang_san_xuat=? where id =?; ");
                statement.setString(1,product.getTenSanPham());
                statement.setInt(2,product.getGiaSanPham());
                statement.setString(3,product.getMoTaSanPham());
                statement.setString(4,product.getNhaSanXuat());
                statement.setInt(5,id);
                statement.executeUpdate();
            } catch (SQLException throwables){
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                ProductConnection.close();
            }
        }
    }

    @Override
    public void remove(int id) {
        Connection connection = ProductConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement("delete from product where id =?; ");
                statement.setInt(1,id);
                statement.executeUpdate();
            } catch (SQLException throwables){
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                ProductConnection.close();
            }
        }
    }

    @Override
    public List<Product> findByName(String name) {

        List<Product> productsList = new ArrayList<>();
        Connection connection = ProductConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement("select * from product where ten_san_pham = ?;");
                statement.setString(1,name);
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                    int id = resultSet.getInt(1);
                    String ten = resultSet.getString(2);
                    int gia = resultSet.getInt(3);
                    String moTa = resultSet.getString(4);
                    String hsx = resultSet.getString(5);
                   productsList.add(new Product(id,ten,gia,moTa,hsx));
                }
            } catch (SQLException throwables){
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                ProductConnection.close();
            }
        }
        return productsList;
    }

}

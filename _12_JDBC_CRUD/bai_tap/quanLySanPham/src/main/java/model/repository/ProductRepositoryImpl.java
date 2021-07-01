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
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("select product.* , time.nsx , time.hsd from product join time where product.id=time.id;");
                resultSet = statement.executeQuery();
                Product product = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String ten = resultSet.getString("ten_san_pham");
                    int gia = resultSet.getInt("gia_san_pham");
                    String moTa = resultSet.getString("mo_ta_san_pham");
                    String hsx = resultSet.getString("hang_san_xuat");
                    String nsx = resultSet.getString("nsx");
                    String hsd = resultSet.getString("hsd");
                    product = new Product(id, ten, gia, moTa, hsx, nsx, hsd);
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
                DBConnection.close();
            }
        }
        return products;
    }

    @Override
    public void save(Product product) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("insert into product(ten_san_pham,gia_san_pham,mo_ta_san_pham,hang_san_xuat) value (?,?,?,?); ");
                statement.setString(1, product.getTenSanPham());
                statement.setInt(2, product.getGiaSanPham());
                statement.setString(3, product.getMoTaSanPham());
                statement.setString(4, product.getNhaSanXuat());
                statement.executeUpdate();

//                statement = connection.prepareStatement("insert into time(id,nsx,hsd) value (?,?,?); ");
//                statement.setInt(1, product.getId());
//                statement.setString(2, product.getNgaySanXuat());
//                statement.setString(3, product.getHanSuDung());
//                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    public void saveTime(int id, Product product) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("insert into time(id,nsx,hsd) value (?,?,?); ");
                statement.setInt(1, id);
                statement.setString(2, product.getNgaySanXuat());
                statement.setString(3, product.getHanSuDung());
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }


    @Override
    public Product findById(int findId) {
        Product product = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("select product.* , time.nsx , time.hsd from product join time where product.id=time.id and product.id = ?;");
                statement.setString(1, String.valueOf(findId));
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt(1);
                    String ten = resultSet.getString(2);
                    int gia = resultSet.getInt(3);
                    String moTa = resultSet.getString(4);
                    String hsx = resultSet.getString(5);
                    String nsx = resultSet.getString(6);
                    String hsd = resultSet.getString(7);
                    product = new Product(id, ten, gia, moTa, hsx, nsx, hsd);
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
                DBConnection.close();
            }
        }
        return product;
    }

    public int findByIdToSave() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int id = 0;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("select id from product where id not in (select id from time);");
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    id = resultSet.getInt("id");
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
                DBConnection.close();
            }
        }
        return id;
    }

    @Override
    public void update(int id, Product product) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("update product set ten_san_pham=?,gia_san_pham=?,mo_ta_san_pham=?,hang_san_xuat=? where id =?; ");
                statement.setString(1, product.getTenSanPham());
                statement.setInt(2, product.getGiaSanPham());
                statement.setString(3, product.getMoTaSanPham());
                statement.setString(4, product.getNhaSanXuat());
                statement.setInt(5, id);
                statement.executeUpdate();
                statement = connection.prepareStatement("update time set nsx=?,hsd=? where id =?; ");
                statement.setString(1, product.getNgaySanXuat());
                statement.setString(2, product.getHanSuDung());
                statement.setInt(3, id);

                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public void remove(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("delete from product where id =?; ");
                statement.setInt(1, id);

                statement = connection.prepareStatement("delete from time where id =?; ");
                statement.setInt(1, id);

                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    @Override
    public List<Product> findByName(String name) {

        List<Product> productsList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement("select product.* , time.nsx , time.hsd from product join time where product.id=time.id and ten_san_pham = ?;");
                statement.setString(1, name);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt(1);
                    String ten = resultSet.getString(2);
                    int gia = resultSet.getInt(3);
                    String moTa = resultSet.getString(4);
                    String hsx = resultSet.getString(5);
                    String nsx = resultSet.getString(6);
                    String hsd = resultSet.getString(7);
                    productsList.add(new Product(id, ten, gia, moTa, hsx, nsx, hsd));
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
                DBConnection.close();
            }
        }
        return productsList;
    }

}

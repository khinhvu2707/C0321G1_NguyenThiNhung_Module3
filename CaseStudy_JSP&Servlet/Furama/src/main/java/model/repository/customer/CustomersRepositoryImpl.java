package model.repository.customer;

import model.bean.Customer;
import model.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomersRepositoryImpl implements CustomersRepository{

    public static final String FIND_BY_NAME = "select * from customer where customer_name=?;";
    public static final String DELETE = "delete from customer where customer_id =?; ";
    public static final String UPDATE = "update customer set customer_code=?,customer_type_id=?,customer_name=?,customer_birthday=?,customer_gender=?,customer_id_card=?,customer_phone=?,customer_email=?,customer_address=? where customer_id =?; ";
    public static final String FIND_BY_ID = "select * from   customer where customer_id = ?;";
    public static final String SAVE = "insert into customer(customer_code,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address ) value (?,?,?,?,?,?,?,?,?); ";
    public static final String FIND_ALL = "SELECT * FROM customer;";

    public CustomersRepositoryImpl() {
    }
    @Override
    public List<Customer> findAll(){
        List<Customer> customers =new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if(connection != null){
            try {
                statement = connection.prepareStatement(FIND_ALL);
                resultSet = statement.executeQuery();
                Customer customer = null;
                while (resultSet.next()){
                    int id = resultSet.getInt("customer_id");
                    String code = resultSet.getString("customer_code");
                    int typeId = resultSet.getInt("customer_type_id");
                    String name = resultSet.getString("customer_name");
                    String birthday = resultSet.getString("customer_birthday");
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    customer = new Customer(id,code,typeId,name,birthday,gender,idCard,phone,email,address);
                    customers.add(customer);
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
        return customers;
    }

    @Override
    public void save(Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(SAVE);
                statement.setString(1,customer.getCustomerCode());
                statement.setInt(2,customer.getCustomerTypeId());
                statement.setString(3,customer.getCustomerName());
                statement.setString(4,customer.getCustomerBirthday());
                statement.setInt(5,customer.getCustomerGender());
                statement.setString(6,customer.getCustomerIdCard());
                statement.setString(7,customer.getCustomerPhone());
                statement.setString(8,customer.getCustomerEmail());
                statement.setString(9,customer.getCustomerAddress());
                statement.executeUpdate();
            } catch (SQLException throwables){
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
    public Customer findById(int findId) {
        Customer customer = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(FIND_BY_ID);
                statement.setInt(1,findId);
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                    int id = resultSet.getInt("customer_id");
                    String code = resultSet.getString("customer_code");
                    int typeId = resultSet.getInt("customer_type_id");
                    String name = resultSet.getString("customer_name");
                    String birthday = resultSet.getString("customer_birthday");
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    customer = new Customer(id,code,typeId,name,birthday,gender,idCard,phone,email,address);
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
                DBConnection.close();
            }
        }
        return customer;
    }

    @Override
    public void update(int id, Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(UPDATE);
                statement.setString(1,customer.getCustomerCode());
                statement.setInt(2,customer.getCustomerTypeId());
                statement.setString(3,customer.getCustomerName());
                statement.setString(4,customer.getCustomerBirthday());
                statement.setInt(5,customer.getCustomerGender());
                statement.setString(6,customer.getCustomerIdCard());
                statement.setString(7,customer.getCustomerPhone());
                statement.setString(8,customer.getCustomerEmail());
                statement.setString(9,customer.getCustomerAddress());
                statement.setInt(10,customer.getCustomerId());
                statement.executeUpdate();
            } catch (SQLException throwables){
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
            try{ statement = connection.prepareStatement(DELETE);
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
                DBConnection.close();
            }
        }
    }

    @Override
    public List<Customer> findByName(String findName) {

        List<Customer> customerList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(FIND_BY_NAME);
                statement.setString(1,findName);
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                    int id = resultSet.getInt("customer_id");
                    String code = resultSet.getString("customer_code");
                    int typeId = resultSet.getInt("customer_type_id");
                    String name = resultSet.getString("customer_name");
                    String birthday = resultSet.getString("customer_birthday");
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    customerList.add(new Customer(id,code,typeId,name,birthday,gender,idCard,phone,email,address));
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
                DBConnection.close();
            }
        }
        return customerList;
    }

}

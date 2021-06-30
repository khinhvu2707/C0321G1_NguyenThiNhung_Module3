package model.repository;

import model.bean.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class UserConnection  {
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "ginny2707";
    private static final String HOST = "localhost";
    private static final String DATABASE = "demo";
    private static final String PORT = "3306";
    public UserConnection() {
    }
private static Connection connection;
    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://"+HOST+":"+PORT+"/"+DATABASE,USER_NAME,PASSWORD);
        } catch (ClassNotFoundException |SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    public static void close(){
        try {
            if(connection != null){
                connection.close();
            }
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}
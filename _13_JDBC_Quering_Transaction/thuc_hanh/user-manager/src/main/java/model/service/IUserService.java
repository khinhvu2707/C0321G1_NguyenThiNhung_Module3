package model.service;

import model.bean.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    User getUserById(int id);
    void insertUserStore(User user) throws SQLException;
    void insertUser(User user) throws SQLException;
    User selectUser(int id);
    List<User> selectAllUsers();
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;
    List<User>  findByCountry(String findCountry) throws SQLException;
    List<User> sortName();
    void addUserTransaction(User user, int[] permision);
    void insertUpdateWithoutTransaction();
    void insertUpdateUseTransaction();
}

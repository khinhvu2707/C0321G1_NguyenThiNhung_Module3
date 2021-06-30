package model.service;

import model.bean.User;
import model.repository.IUserRepository;
import model.repository.UserRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements IUserService {
private IUserRepository iUserRepository = new UserRepositoryImpl();
    @Override
    public void insertUser(User user) throws SQLException {
iUserRepository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return iUserRepository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return iUserRepository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return iUserRepository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return iUserRepository.updateUser(user);
    }

    @Override
    public List<User>  findByCountry(String findCountry) throws SQLException {
        return iUserRepository.findByCountry(findCountry);
    }

    @Override
    public List<User> sortName() {
        return iUserRepository.sortName();
    }
}

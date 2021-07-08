package model.repository.employee;

import model.bean.Employee;

import java.util.List;

public interface EmployeeRepository {
    List<Employee> findAll();
    void save(Employee employee);
    Employee findById(int id);
    void update(int id, Employee employee);
    void remove(int id);
    List<Employee> findByName(String name);
}

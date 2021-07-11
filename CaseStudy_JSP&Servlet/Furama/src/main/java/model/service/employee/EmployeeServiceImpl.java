package model.service.employee;

import model.bean.Employee;
import model.repository.employee.EmployeeRepository;
import model.repository.employee.EmployeeRepositoryImpl;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeServiceImpl implements EmployeeService {
    private EmployeeRepository employeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public Map<String, String> save(Employee employee) {

        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateName(employee.getEmployeeName()) != null
                || Validate.validateDate(employee.getEmployeeBirthday()) != null
                || Validate.validateIdCard(employee.getEmployeeIdCard()) != null
                || Validate.validateTelephone(employee.getEmployeePhone()) != null
                || Validate.validateEmail(employee.getEmployeeEmail()) != null
                || Validate.validateNumber2(String.valueOf(employee.getEmployeeSalary())) != null) {
            mapMessage.put("name", Validate.validateName(employee.getEmployeeName()));
            mapMessage.put("birthday", Validate.validateDate(employee.getEmployeeBirthday()));
            mapMessage.put("idCard", Validate.validateIdCard(employee.getEmployeeIdCard()));
            mapMessage.put("phone", Validate.validateTelephone(employee.getEmployeePhone()));
            mapMessage.put("email", Validate.validateEmail(employee.getEmployeeEmail()));
            mapMessage.put("salary", Validate.validateNumber2(String.valueOf(employee.getEmployeeSalary())));
        } else {
            employeeRepository.save(employee);
        }
        return mapMessage;
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findById(id);
    }

    @Override
    public Map<String, String> update(int id, Employee employee) {


        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateName(employee.getEmployeeName()) != null
                || Validate.validateDate(employee.getEmployeeBirthday()) != null
                || Validate.validateIdCard(employee.getEmployeeIdCard()) != null
                || Validate.validateTelephone(employee.getEmployeePhone()) != null
                || Validate.validateEmail(employee.getEmployeeEmail()) != null
                || Validate.validateNumber2(String.valueOf(employee.getEmployeeSalary())) != null) {
            mapMessage.put("name", Validate.validateName(employee.getEmployeeName()));
            mapMessage.put("birthday", Validate.validateDate(employee.getEmployeeBirthday()));
            mapMessage.put("idCard", Validate.validateIdCard(employee.getEmployeeIdCard()));
            mapMessage.put("phone", Validate.validateTelephone(employee.getEmployeePhone()));
            mapMessage.put("email", Validate.validateEmail(employee.getEmployeeEmail()));
            mapMessage.put("salary", Validate.validateNumber2(String.valueOf(employee.getEmployeeSalary())));
        } else {
            employeeRepository.update(id, employee);
        }
        return mapMessage;
    }

    @Override
    public void remove(int id) {
        employeeRepository.remove(id);
    }

    @Override
    public List<Employee> findByName(String name) {
        return employeeRepository.findByName(name);
    }
}

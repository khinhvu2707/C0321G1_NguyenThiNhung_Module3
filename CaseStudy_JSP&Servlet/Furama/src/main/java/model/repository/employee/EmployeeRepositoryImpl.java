package model.repository.employee;

import model.bean.Employee;
import model.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements EmployeeRepository{

    public static final String SELECT_FROM_EMPLOYEE = "SELECT * FROM employee;";
    public static final String INSERT_INTO_EMPLOYEE = "insert into employee(employee_name,employee_birthday,employee_id_card,employee_salary,employee_phone,employee_email,employee_address,position_id,education_degree_id,division_id,username) value (?,?,?,?,?,?,?,?,?,?,?)";
    public static final String FIND_BY_ID = "select * from   employee where employee_id = ?;";
    public static final String UPDATE_EMPLOYEE = "update employee set employee_name=?,employee_birthday=?,employee_id_card=?,employee_salary=?,employee_phone=?,employee_email=?,employee_address=?,position_id=?,education_degree_id=?,division_id=?,username=? where employee_id =?; ";
    public static final String FIND_BY_NAME = "select * from employee where employee_name=?;";
    public static final String DELETE = "delete from employee where employee_id =?; ";

    public EmployeeRepositoryImpl(){
        
    }
    @Override
    public List<Employee> findAll(){
        List<Employee> employees =new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if(connection != null){
            try {
                statement = connection.prepareStatement(SELECT_FROM_EMPLOYEE);
                resultSet = statement.executeQuery();
                Employee employee = null;
                while (resultSet.next()){
                    int employeeId = resultSet.getInt("employee_id");
                    String employeeName = resultSet.getString("employee_name");
                    String employeeBirthday = resultSet.getString("employee_birthday");
                    String employeeIdCard = resultSet.getString("employee_id_card");
                    double employeeSalary = resultSet.getDouble("employee_salary");
                    String employeePhone = resultSet.getString("employee_phone");
                    String employeeEmail = resultSet.getString("employee_email");
                    String employeeAddress = resultSet.getString("employee_address");
                    int positionId = resultSet.getInt("position_id");
                    int educationDegreeId = resultSet.getInt("education_degree_id");
                    int divisionId = resultSet.getInt("division_id");
                    String userName = resultSet.getString("username");
                     employee = new Employee(employeeId, employeeName,employeeBirthday,employeeIdCard,employeeSalary,employeePhone,employeeEmail,employeeAddress,positionId,educationDegreeId,divisionId,userName);
                    employees.add(employee);
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
        return employees;
    }

    @Override
    public void save(Employee employee) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(INSERT_INTO_EMPLOYEE);
                statement.setString(1,employee.getEmployeeName());
                statement.setString(2,employee.getEmployeeBirthday());
                statement.setString(3,employee.getEmployeeIdCard());
                statement.setDouble(4,employee.getEmployeeSalary());
                statement.setString(5,employee.getEmployeePhone());
                statement.setString(6,employee.getEmployeeEmail());
                statement.setString(7,employee.getEmployeeAddress());
                statement.setInt(8,employee.getPositionId());
                statement.setInt(9,employee.getEducationDegreeId());
                statement.setInt(10,employee.getDivisionId());
                statement.setString(11,employee.getUsername());
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
    public Employee findById(int findId) {
       Employee employee = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(FIND_BY_ID);
                statement.setInt(1,findId);
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                    int employeeId = resultSet.getInt("employee_id");
                    String employeeName = resultSet.getString("employee_name");
                    String employeeBirthday = resultSet.getString("employee_birthday");
                    String employeeIdCard = resultSet.getString("employee_id_card");
                    double employeeSalary = resultSet.getDouble("employee_salary");
                    String employeePhone = resultSet.getString("employee_phone");
                    String employeeEmail = resultSet.getString("employee_email");
                    String employeeAddress = resultSet.getString("employee_address");
                    int positionId = resultSet.getInt("position_id");
                    int educationDegreeId = resultSet.getInt("education_degree_id");
                    int divisionId = resultSet.getInt("division_id");
                    String userName = resultSet.getString("username");
                    employee = new Employee(employeeId, employeeName,employeeBirthday,employeeIdCard,employeeSalary,employeePhone,employeeEmail,employeeAddress,positionId,educationDegreeId,divisionId,userName);

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
        return employee;
    }

    @Override
    public void update(int id,Employee employee) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(UPDATE_EMPLOYEE);
                statement.setString(1,employee.getEmployeeName());
                statement.setString(2,employee.getEmployeeBirthday());
                statement.setString(3,employee.getEmployeeIdCard());
                statement.setDouble(4,employee.getEmployeeSalary());
                statement.setString(5,employee.getEmployeePhone());
                statement.setString(6,employee.getEmployeeEmail());
                statement.setString(7,employee.getEmployeeAddress());
                statement.setInt(8,employee.getPositionId());
                statement.setInt(9,employee.getEducationDegreeId());
                statement.setInt(10,employee.getDivisionId());
                statement.setString(11,employee.getUsername());
                statement.setInt(12,employee.getEmployeeId());
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
    public List<Employee> findByName(String findName) {

        List<Employee> employees = new ArrayList<>();
        Employee employee = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(FIND_BY_NAME);
                statement.setString(1,findName);
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                    int employeeId = resultSet.getInt("employee_id");
                    String employeeName = resultSet.getString("employee_name");
                    String employeeBirthday = resultSet.getString("employee_birthday");
                    String employeeIdCard = resultSet.getString("employee_id_card");
                    double employeeSalary = resultSet.getDouble("employee_salary");
                    String employeePhone = resultSet.getString("employee_phone");
                    String employeeEmail = resultSet.getString("employee_email");
                    String employeeAddress = resultSet.getString("employee_address");
                    int positionId = resultSet.getInt("position_id");
                    int educationDegreeId = resultSet.getInt("education_degree_id");
                    int divisionId = resultSet.getInt("division_id");
                    String userName = resultSet.getString("username");
                    employee = new Employee(employeeId, employeeName,employeeBirthday,employeeIdCard,employeeSalary,employeePhone,employeeEmail,employeeAddress,positionId,educationDegreeId,divisionId,userName);
                    employees.add(employee);
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
        return employees;
    }

}

package model.repository.contract;

import model.bean.Contract;
import model.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepositoryImpl implements ContractRepository {

    public static final String FIND_ALL = "SELECT * FROM contract;";
    public static final String SAVE = "insert into contract(contract_start_date,contract_end_date,contract_deposit,contract_total_money,employee_id,customer_id,service_id ) value (?,?,?,?,?,?,?); ";
    public static final String UPDATE = "update contract set contract_start_date=?,contract_end_date=?,contract_deposit=?,contract_total_money=?,employee_id=?,customer_id=?,service_id=? where contract_id =?; ";
    public static final String DELETE = "delete from contract where contract_id=?; ";
    public static final String FIND_BY_ID = "select * from contract where contract_id=?;";

    public ContractRepositoryImpl() {
    }
    @Override
    public List<Contract> findAll(){
        List<Contract> customers =new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if(connection != null){
            try {
                statement = connection.prepareStatement(FIND_ALL);
                resultSet = statement.executeQuery();
                Contract contract = null;
                while (resultSet.next()){
                    int id = resultSet.getInt("contract_id");
                    String startDate = resultSet.getString("contract_start_date");
                    String endDate = resultSet.getString("contract_end_date");
                    double deposit = resultSet.getDouble("contract_deposit");
                    double totalMoney = resultSet.getDouble("contract_total_money");
                    int employeeId = resultSet.getInt("employee_id");
                    int customerId = resultSet.getInt("customer_id");
                    int serviceId = resultSet.getInt("service_id");
                    contract = new Contract(id,startDate,endDate,deposit,totalMoney,employeeId,customerId,serviceId);
                    customers.add(contract);
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
    public void save(Contract contract) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(SAVE);
                statement.setString(1,contract.getContractStartDate());
                statement.setString(2,contract.getContractEndDate());
                statement.setDouble(3,contract.getContractDeposit());
                statement.setDouble(4,contract.getContractTotalMoney());
                statement.setInt(5,contract.getEmployeeId());
                statement.setInt(6,contract.getCustomerId());
                statement.setInt(7,contract.getServiceId());
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
    public void update(int id, Contract contract) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(UPDATE);
                statement.setString(1,contract.getContractStartDate());
                statement.setString(2,contract.getContractEndDate());
                statement.setDouble(3,contract.getContractDeposit());
                statement.setDouble(4,contract.getContractTotalMoney());
                statement.setInt(5,contract.getEmployeeId());
                statement.setInt(6,contract.getCustomerId());
                statement.setInt(7,contract.getServiceId());
                statement.setInt(8,contract.getContractId());
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
    public Contract findById(int findId) {
        Contract contract = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(FIND_BY_ID);
                statement.setInt(1,findId);
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                    int id = resultSet.getInt("contract_id");
                    String startDate = resultSet.getString("contract_start_date");
                    String endDate = resultSet.getString("contract_end_date");
                    double deposit = resultSet.getInt("contract_deposit");
                    double totalMoney = resultSet.getInt("contract_total_money");
                    int employeeId = resultSet.getInt("employee_id");
                    int customerId = resultSet.getInt("customer_id");
                    int serviceId = resultSet.getInt("service_id");
                     contract = new Contract(id,startDate,endDate,deposit,totalMoney,employeeId,customerId,serviceId);
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
        return contract;
    }

}

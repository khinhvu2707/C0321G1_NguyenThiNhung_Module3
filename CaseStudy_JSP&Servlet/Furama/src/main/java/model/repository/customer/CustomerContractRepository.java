package model.repository.customer;

import model.bean.*;
import model.repository.DBConnection;
import model.repository.attachService.AttachServiceRepository;
import model.repository.employee.EmployeeRepositoryImpl;
import model.repository.service.ServiceRepositoryImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class CustomerContractRepository {
    private static final String SELECT_CONTRACT_USING_BY_CUSTOMER = "select co.*,a.attach_service_id,a.attach_service_name,co.employee_id,cu.customer_id,co.service_id from customer cu\n" +
            "join contract co on cu.customer_id = co.customer_id\n" +
            "left join contract_detail cd on  co.contract_id = cd.contract_id\n" +
            "left join attach_service a on cd.attach_service_id = a.attach_service_id;";

    private static final String SELECT_CONTRACT_USING_BY_CUSTOMER2 =
            "select h.contract_id,d.service_cost+sum(c.quantity*dk.attach_service_cost) as tong_tien\n" +
            "from customer k\n" +
            " join contract h on k.customer_id= h.customer_id\n" +
            "left join service d on h.service_id = d.service_id\n" +
            "left join contract_detail c on h.contract_id = c.contract_id\n" +
            "left join attach_service dk on c.attach_service_id = dk.attach_service_id\n" +
            "group by h.contract_id,k.customer_id;";

    private static final String FIND_BY_NAME = "select co.*,a.attach_service_id,co.employee_id,cu.*,co.service_id from customer cu\n" +
            "join contract co on cu.customer_id = co.customer_id\n" +
            "left join contract_detail cd on  co.contract_id = cd.contract_id\n" +
            "left join attach_service a on cd.attach_service_id = a.attach_service_id where cu.customer_name=?;";


    EmployeeRepositoryImpl employeeRepository = new EmployeeRepositoryImpl();
    CustomersRepositoryImpl customerRepository = new CustomersRepositoryImpl();
    ServiceRepositoryImpl serviceRepository = new ServiceRepositoryImpl();
    AttachServiceRepository attachServiceRepository = new AttachServiceRepository();


    public List<Contract> findCustomerContract() {
        List<Contract> contracts = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_CONTRACT_USING_BY_CUSTOMER);
                rs = statement.executeQuery();
                while (rs.next()) {
                    int contractId = rs.getInt("contract_id");
                    String startDate = rs.getString("contract_start_date");
                    String endDate = rs.getString("contract_end_date");
                    double contractDeposit = rs.getDouble("contract_deposit");
                    double totalMoney = rs.getDouble("contract_total_money");
                    AttachService attachService = attachServiceRepository.findById(rs.getInt("attach_service_id"));
                    Employee employee = employeeRepository.findById(rs.getInt("employee_id"));
                    Customer customer = customerRepository.findById(rs.getInt("customer_id"));
                    Service service = serviceRepository.findById(rs.getInt("service_id"));
                    contracts.add(new Contract(contractId, startDate, endDate, contractDeposit, totalMoney, employee, customer, service, attachService));
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    rs.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return contracts;
    }
    public List<Contract> findByName(String findName) {
        List<Contract> contracts = new ArrayList<>();
        Customer customer = new Customer();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(FIND_BY_NAME);
                statement.setString(1,findName);
                rs = statement.executeQuery();
                while (rs.next()){
                    int id = rs.getInt("customer_id");
                    String code = rs.getString("customer_code");
                    int typeId = rs.getInt("customer_type_id");
                    String name = rs.getString("customer_name");
                    String birthday = rs.getString("customer_birthday");
                    int gender = rs.getInt("customer_gender");
                    String idCard = rs.getString("customer_id_card");
                    String phone = rs.getString("customer_phone");
                    String email = rs.getString("customer_email");
                    String address = rs.getString("customer_address");
                    customer = new Customer(id,code,typeId,name,birthday,gender,idCard,phone,email,address);
                    int contractId = rs.getInt("contract_id");
                    String startDate = rs.getString("contract_start_date");
                    String endDate = rs.getString("contract_end_date");
                    double contractDeposit = rs.getDouble("contract_deposit");
                    double totalMoney = rs.getDouble("contract_total_money");
                    AttachService attachServiceId = attachServiceRepository.findById(rs.getInt("attach_service_id"));
                    Employee employee = employeeRepository.findById(rs.getInt("employee_id"));
                    Service service = serviceRepository.findById(rs.getInt("service_id"));
                    contracts.add(new Contract(contractId, startDate, endDate, contractDeposit, totalMoney, employee, customer, service, attachServiceId));
                }
            } catch (SQLException throwables){
                throwables.printStackTrace();
            } finally {
                try {
                    rs.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return contracts;
    }

    public Map<Integer,Double> findMoney() {
        Map<Integer,Double > mapContractDetail = new HashMap<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_CONTRACT_USING_BY_CUSTOMER2);
                rs = statement.executeQuery();
                while (rs.next()) {
                    int contractId = rs.getInt("contract_id");
                    double money = rs.getDouble("tong_tien");
                    mapContractDetail.put(contractId,money);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    rs.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return mapContractDetail;
    }

    public List<Contract> findCustomerContract2(Map<Integer,Double> mapMoney) {
        List<Contract> contracts = new ArrayList<>();
        int temp = 0;
        int temp1 = 0;
//
        String attachserviceListId ="";
        String attachserviceListName ="";
        Set<Integer> setTemp = new HashSet<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_CONTRACT_USING_BY_CUSTOMER);
                rs = statement.executeQuery();
                while (rs.next()) {
                    int contractId = rs.getInt("contract_id");
                    temp = contractId;

                    if (setTemp.add(temp)) {
                        AttachService attachServiceId = attachServiceRepository.findById(rs.getInt("attach_service_id"));
                        int index = rs.getInt("contract_id");
                        attachserviceListId = String.valueOf(rs.getInt("attach_service_id"));
                        attachserviceListName = rs.getString("attach_service_name");
                        Employee employee = employeeRepository.findById(rs.getInt("employee_id"));
                        Customer customer = customerRepository.findById(rs.getInt("customer_id"));
                        Service service = serviceRepository.findById(rs.getInt("service_id"));
                        double money = 0.0;
                        if (mapMoney.containsKey(index)){
                            money = mapMoney.get(index);
                        }
                        contracts.add(new Contract(contractId, employee, customer, service,attachServiceId,attachserviceListId,attachserviceListName,money));
                        temp1++;
                    } else {
                        attachserviceListId = String.valueOf(rs.getInt("attach_service_id"));
                        attachserviceListName = rs.getString("attach_service_name");
                        contracts.get(temp1-1).setAttachServiceListId(contracts.get(temp1-1).getAttachServiceListId()+","+attachserviceListId);
                        contracts.get(temp1-1).setAttachServiceListName(contracts.get(temp1-1).getAttachServiceListName()+","+attachserviceListName);
                    }
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    rs.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return contracts;
    }
    
}

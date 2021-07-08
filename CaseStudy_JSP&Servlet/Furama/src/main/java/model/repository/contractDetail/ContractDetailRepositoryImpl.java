package model.repository.contractDetail;

import model.bean.ContractDetail;
import model.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDetailRepositoryImpl implements ContractDetailRepository {

    public static final String FIND_ALL = "SELECT * FROM contract_detail;";
    public static final String SAVE = "insert into contract_detail(contract_id,attach_service_id,quantity) value (?,?,?); ";
    public static final String UPDATE = "update contract_detail set contract_id=?,attach_service_id=?,quantity=? where contract_detail_id =?; ";
    public static final String DELETE = "delete from contract_detail where contract_detail_id=?; ";
    public static final String FIND_BY_ID = "select * from contract_detail where contract_detail_id=?;";

    public ContractDetailRepositoryImpl(){

    }
    @Override
    public List<ContractDetail> findAll(){
        List<ContractDetail> customers =new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if(connection != null){
            try {
                statement = connection.prepareStatement(FIND_ALL);
                resultSet = statement.executeQuery();
                ContractDetail contract = null;
                while (resultSet.next()){
                    int contractDetailId = resultSet.getInt("contract_detail_id");
                    int contractId = resultSet.getInt("contract_id");
                    int attachServiceId = resultSet.getInt("attach_service_id");
                    int quantity = resultSet.getInt("quantity");
                    contract = new ContractDetail(contractDetailId,contractId,attachServiceId,quantity);
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
    public void save(ContractDetail contractDetail) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(SAVE);
                statement.setInt(1,contractDetail.getContractId());
                statement.setInt(2,contractDetail.getAttachServiceId());
                statement.setInt(3,contractDetail.getQuantity());
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
    public void update(int id, ContractDetail contractDetail) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(UPDATE);
                statement.setInt(1,contractDetail.getContractId());
                statement.setInt(2,contractDetail.getAttachServiceId());
                statement.setInt(3,contractDetail.getQuantity());
                statement.setInt(4,contractDetail.getContractDetailId());
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
    public ContractDetail findById(int findId) {
        ContractDetail contractDetail = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement(FIND_BY_ID);
                statement.setInt(1,findId);
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                    int contractDetailId = resultSet.getInt("contract_detail_id");
                    int contractId = resultSet.getInt("contract_id");
                    int attachServiceId = resultSet.getInt("attach_service_id");
                    int quantity = resultSet.getInt("quantity");
                    contractDetail = new ContractDetail(contractDetailId,contractId,attachServiceId,quantity);}
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
        return contractDetail;
    }

}

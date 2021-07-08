package model.repository.service;

import model.bean.Service;
import model.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepositoryImpl implements ServiceRepository {
    public ServiceRepositoryImpl(){

    }
    @Override
    public List<Service> findAll(){
        List<Service> services =new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if(connection != null){
            try {
                statement = connection.prepareStatement("SELECT * FROM service;");
                resultSet = statement.executeQuery();
                Service service = null;
                while (resultSet.next()){
                    int serviceId = resultSet.getInt("service_id");
                    String serviceCode = resultSet.getString("service_code");
                    String serviceName = resultSet.getString("service_name");
                    int serviceArea = resultSet.getInt("service_area");
                    double serviceCost = resultSet.getDouble("service_cost");
                    int serviceMaxPeople = resultSet.getInt("service_max_people");
                    int rentTypeId = resultSet.getInt("rent_type_id");
                    int serviceTypeId = resultSet.getInt("service_type_id");
                    String standardRoom = resultSet.getString("standard_room");
                    String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                    double poolArea = resultSet.getDouble("pool_area");
                    int numberOfFloor = resultSet.getInt("number_of_floor");
                    service = new Service(serviceId,serviceCode,serviceName,serviceArea,serviceCost,serviceMaxPeople,rentTypeId,serviceTypeId,standardRoom,descriptionOtherConvenience,poolArea,numberOfFloor);
                    services.add(service);
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
        return services;
    }

    @Override
    public void save(Service service) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement("insert into service(service_code,service_name,service_area,service_cost,service_max_people,rent_type_id,service_type_id,standard_room,description_other_convenience ,pool_area,number_of_floor ) value (?,?,?,?,?,?,?,?,?,?,?); ");
                statement.setString(1,service.getServiceCode());
                statement.setString(2,service.getServiceName());
                statement.setInt(3,service.getServiceArea());
                statement.setDouble(4,service.getServiceCost());
                statement.setInt(5,service.getServiceMaxPeople());
                statement.setInt(6,service.getRentTypeId());
                statement.setInt(7,service.getServiceTypeId());
                statement.setString(8,service.getStandardRoom());
                statement.setString(9,service.getDescriptionOtherConvenience());
                statement.setDouble(10,service.getPoolArea());
                statement.setInt(11,service.getNumberOfFloor());
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
    public Service findById(int findId) {
        Service service = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement("select * from   service where service_id = ?;");
                statement.setInt(1,findId);
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                    int serviceId = resultSet.getInt("service_id");
                    String serviceCode = resultSet.getString("service_code");
                    String serviceName = resultSet.getString("service_name");
                    int serviceArea = resultSet.getInt("service_area");
                    double serviceCost = resultSet.getDouble("service_cost");
                    int serviceMaxPeople = resultSet.getInt("service_max_people");
                    int rentTypeId = resultSet.getInt("rent_type_id");
                    int serviceTypeId = resultSet.getInt("service_type_id");
                    String standardRoom = resultSet.getString("standard_room");
                    String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                    double poolArea = resultSet.getDouble("pool_area");
                    int numberOfFloor = resultSet.getInt("number_of_floor");
                    service = new Service(serviceId,serviceCode,serviceName,serviceArea,serviceCost,serviceMaxPeople,rentTypeId,serviceTypeId,standardRoom,descriptionOtherConvenience,poolArea,numberOfFloor);

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
        return service;
    }

    @Override
    public void update(int id,Service service) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement("update service set service_code=?,service_name=?,service_area=?,service_cost=?,service_max_people=?,rent_type_id=?,service_type_id=?,standard_room=?,description_other_convenience=?,pool_area=?,number_of_floor=? where service_id =?; ");
                statement.setString(1,service.getServiceCode());
                statement.setString(2,service.getServiceName());
                statement.setInt(3,service.getServiceArea());
                statement.setDouble(4,service.getServiceCost());
                statement.setInt(5,service.getServiceMaxPeople());
                statement.setInt(6,service.getRentTypeId());
                statement.setInt(7,service.getServiceTypeId());
                statement.setString(8,service.getStandardRoom());
                statement.setString(9,service.getDescriptionOtherConvenience());
                statement.setDouble(10,service.getPoolArea());
                statement.setInt(11,service.getNumberOfFloor());
                statement.setInt(12,service.getServiceId());
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
            try{ statement = connection.prepareStatement("delete from service where service_id =?; ");
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
    public List<Service> findByName(String findName) {

        List<Service> serviceList = new ArrayList<>();
        Service service = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try{ statement = connection.prepareStatement("select * from service where service_name=?;");
                statement.setString(1,findName);
                resultSet = statement.executeQuery();
                while (resultSet.next()){
                    int serviceId = resultSet.getInt("service_id");
                    String serviceCode = resultSet.getString("service_code");
                    String serviceName = resultSet.getString("service_name");
                    int serviceArea = resultSet.getInt("service_area");
                    double serviceCost = resultSet.getDouble("service_cost");
                    int serviceMaxPeople = resultSet.getInt("service_max_people");
                    int rentTypeId = resultSet.getInt("rent_type_id");
                    int serviceTypeId = resultSet.getInt("service_type_id");
                    String standardRoom = resultSet.getString("standard_room");
                    String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                    double poolArea = resultSet.getDouble("pool_area");
                    int numberOfFloor = resultSet.getInt("number_of_floor");
                    service = new Service(serviceId,serviceCode,serviceName,serviceArea,serviceCost,serviceMaxPeople,rentTypeId,serviceTypeId,standardRoom,descriptionOtherConvenience,poolArea,numberOfFloor);
                    serviceList.add(service);
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
        return serviceList;
    }

}

package model.repository.attachService;

import model.bean.AttachService;
import model.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AttachServiceRepository {
    private static final String SELECT_ATTACH_SERVICE = "select * from attach_service";
    private static final String SELECT_ATTACH_SERVICE_BY_ID = "select * from attach_service where attach_service_id=?;";
    public AttachServiceRepository(){

    }
    public List<AttachService> findAll() {
        List<AttachService> attachServiceList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        if(connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ATTACH_SERVICE);
                rs = statement.executeQuery();
                while (rs.next()) {
                    int attachServiceId = rs.getInt("attach_service_id");
                    String attachServiceName = rs.getString("attach_service_name");
                    String attachServiceCost = rs.getString("attach_service_cost");
                    int attachServiceUnit = rs.getInt("attach_service_unit");
                    String attachServiceStatus = rs.getString("attach_service_status");
                    attachServiceList.add(new AttachService(attachServiceId, attachServiceName, attachServiceCost, attachServiceUnit, attachServiceStatus));
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
        return attachServiceList;
    }
    public AttachService findById(int id) {
        AttachService attachService = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        if(connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ATTACH_SERVICE_BY_ID);
                statement.setInt(1, id);
                resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    String attachServiceName = resultSet.getString("attach_service_name");
                    String attachServiceCost = resultSet.getString("attach_service_cost");
                    int attachServiceUnit = resultSet.getInt("attach_service_unit");
                    String attachServiceStatus = resultSet.getString("attach_service_status");

                    attachService = new AttachService(id, attachServiceName, attachServiceCost, attachServiceUnit, attachServiceStatus);
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
        return attachService;
    }

}

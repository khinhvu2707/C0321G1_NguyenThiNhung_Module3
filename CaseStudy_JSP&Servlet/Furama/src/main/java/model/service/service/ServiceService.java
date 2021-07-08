package model.service.service;

import model.bean.Customer;
import model.bean.Service;

import java.util.List;
import java.util.Map;

public interface ServiceService {
    List<Service> findAll();
    Map<String, String> save(Service service);
    Service findById(int id);
    void update(int id, Service service);
    void remove(int id);
    List<Service> findByName(String name);
}

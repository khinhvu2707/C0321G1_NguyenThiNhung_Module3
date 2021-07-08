package model.repository.service;

import model.bean.Service;

import java.util.List;

public interface ServiceRepository {
    List<Service> findAll();
    void save(Service service);
    Service findById(int id);
    void update(int id, Service service);
    void remove(int id);
    List<Service> findByName(String name);
}

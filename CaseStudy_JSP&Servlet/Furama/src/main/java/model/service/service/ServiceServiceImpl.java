package model.service.service;

import model.bean.Service;
import model.repository.service.ServiceRepository;
import model.repository.service.ServiceRepositoryImpl;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceServiceImpl implements ServiceService {
    private ServiceRepository serviceRepository = new ServiceRepositoryImpl();

    @Override
    public List<Service> findAll() {
        return serviceRepository.findAll();
    }

    @Override
    public Map<String, String> save(Service service) {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateServiceCode(service.getServiceCode()) != null
                || Validate.validateNumber2(String.valueOf(service.getServiceCost())) != null
                || Validate.validateNumber1(String.valueOf(service.getServiceMaxPeople())) != null
                || Validate.validateNumber2(String.valueOf(service.getPoolArea())) != null
                || Validate.validateNumber1(String.valueOf(service.getNumberOfFloor())) != null
                || Validate.validateNumber2(String.valueOf(service.getServiceArea())) != null) {
            mapMessage.put("code", Validate.validateServiceCode(service.getServiceCode()));
            mapMessage.put("area", Validate.validateNumber2(String.valueOf(service.getServiceArea())));
            mapMessage.put("cost", Validate.validateNumber2(String.valueOf(service.getServiceCost())));
            mapMessage.put("maxPeople", Validate.validateNumber1(String.valueOf(service.getServiceMaxPeople())));
            mapMessage.put("poolArea", Validate.validateNumber2(String.valueOf(service.getPoolArea())));
            mapMessage.put("numberOfFloor", Validate.validateNumber1(String.valueOf(service.getNumberOfFloor())));
        } else {
            serviceRepository.save(service);
        }
        return mapMessage;

    }

    @Override
    public Service findById(int id) {
        return serviceRepository.findById(id);
    }

    @Override
    public void update(int id, Service service) {
        serviceRepository.update(id, service);
    }

    @Override
    public void remove(int id) {
        serviceRepository.remove(id);
    }

    @Override
    public List<Service> findByName(String name) {
        return serviceRepository.findByName(name);
    }
}

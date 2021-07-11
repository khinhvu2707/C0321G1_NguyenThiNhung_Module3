package model.service.customer;

import model.bean.Customer;
import model.repository.customer.CustomersRepository;
import model.repository.customer.CustomersRepositoryImpl;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    private CustomersRepository customersRepository = new CustomersRepositoryImpl();

    @Override
    public List<Customer> findAll() {
        return customersRepository.findAll();
    }

    @Override
    public Map<String, String> save(Customer customer) {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateName(customer.getCustomerName()) != null
                || Validate.validateDate(customer.getCustomerBirthday()) != null
                || Validate.validateCustomerCode(customer.getCustomerCode()) != null
                || Validate.validateEmail(customer.getCustomerEmail()) != null
                || Validate.validateIdCard(customer.getCustomerIdCard()) != null
                || Validate.validateTelephone(customer.getCustomerPhone()) != null) {
            mapMessage.put("code", Validate.validateCustomerCode(customer.getCustomerCode()));
            mapMessage.put("name", Validate.validateName(customer.getCustomerName()));
            mapMessage.put("birthday", Validate.validateDate(customer.getCustomerBirthday()));
            mapMessage.put("email", Validate.validateEmail(customer.getCustomerEmail()));
            mapMessage.put("idCard", Validate.validateIdCard(customer.getCustomerIdCard()));
            mapMessage.put("phone", Validate.validateTelephone(customer.getCustomerPhone()));
        } else {
            customersRepository.save(customer);
        }
        return mapMessage;
    }

    @Override
    public Customer findById(int id) {
        return customersRepository.findById(id);
    }

    @Override
    public Map<String, String> update(int id, Customer customer) {
        Map<String, String> mapMessage = new HashMap<>();
        if (Validate.validateName(customer.getCustomerName()) != null
                || Validate.validateDate(customer.getCustomerBirthday()) != null
                || Validate.validateCustomerCode(customer.getCustomerCode()) != null
                || Validate.validateEmail(customer.getCustomerEmail()) != null
                || Validate.validateIdCard(customer.getCustomerIdCard()) != null
                || Validate.validateTelephone(customer.getCustomerPhone()) != null) {
            mapMessage.put("code", Validate.validateCustomerCode(customer.getCustomerCode()));
            mapMessage.put("name", Validate.validateName(customer.getCustomerName()));
            mapMessage.put("birthday", Validate.validateDate(customer.getCustomerBirthday()));
            mapMessage.put("email", Validate.validateEmail(customer.getCustomerEmail()));
            mapMessage.put("idCard", Validate.validateIdCard(customer.getCustomerIdCard()));
            mapMessage.put("phone", Validate.validateTelephone(customer.getCustomerPhone()));
        } else {
            customersRepository.update(id, customer);
        }
        return mapMessage;

    }

    @Override
    public void remove(int id) {
        customersRepository.remove(id);
    }

    @Override
    public List<Customer> findByName(String name) {
        return customersRepository.findByName(name);
    }
}

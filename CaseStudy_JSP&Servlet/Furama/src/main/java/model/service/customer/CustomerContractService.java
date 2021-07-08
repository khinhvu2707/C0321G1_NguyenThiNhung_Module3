package model.service.customer;

import model.bean.Contract;
import model.repository.customer.CustomerContractRepository;

import java.util.List;
import java.util.Map;

public class CustomerContractService {
private CustomerContractRepository customerContractRepository = new CustomerContractRepository();
    public List<Contract> findCustomerContract() { return customerContractRepository.findCustomerContract();}
    public List<Contract> findCustomerContract2(Map<Integer,Double > mapContractDetail) { return customerContractRepository.findCustomerContract2(mapContractDetail);}
//
//    public List<Contract> findCustomerContract2() { return customerContractRepository.findCustomerContract2();}

    public List<Contract> findByName(String findName) {return customerContractRepository.findByName(findName);}
    public Map<Integer,Double > findMoney() { return customerContractRepository.findMoney();}
}

package model.service.contract;

import model.bean.Contract;

import java.util.List;
import java.util.Map;

public interface ContractService {
    List<Contract> findAll();
    Map<String, String> save(Contract contract);
    Contract findById(int id);
    void update(int id, Contract contract);
    void remove(int id);
}

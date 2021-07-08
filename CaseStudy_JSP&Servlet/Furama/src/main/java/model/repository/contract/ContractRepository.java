package model.repository.contract;

import model.bean.Contract;

import java.util.List;

public interface ContractRepository {
    List<Contract> findAll();
    void save(Contract contract);
    Contract findById(int id);
    void update(int id, Contract contract);
    void remove(int id);
}

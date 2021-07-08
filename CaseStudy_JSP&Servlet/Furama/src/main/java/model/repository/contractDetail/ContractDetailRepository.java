package model.repository.contractDetail;

import model.bean.ContractDetail;

import java.util.List;

public interface ContractDetailRepository {
    List<ContractDetail> findAll();
    void save(ContractDetail contractDetail);
    ContractDetail findById(int id);
    void update(int id, ContractDetail contractDetail);
    void remove(int id);
}

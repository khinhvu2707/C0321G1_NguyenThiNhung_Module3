package model.service.contractDetail;

import model.bean.ContractDetail;

import java.util.List;

public interface ContractDetailService {
    List<ContractDetail> findAll();
    void save(ContractDetail contractDetail);
    ContractDetail findById(int id);
    void update(int id, ContractDetail contractDetail);
    void remove(int id);
}

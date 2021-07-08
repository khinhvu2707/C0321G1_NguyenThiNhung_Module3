package model.service.contractDetail;

import model.bean.ContractDetail;
import model.repository.contractDetail.ContractDetailRepository;
import model.repository.contractDetail.ContractDetailRepositoryImpl;

import java.util.List;

public class ContractDetailServiceImpl implements ContractDetailService {
    private ContractDetailRepository contractDetailRepository = new ContractDetailRepositoryImpl();

    @Override
    public List<ContractDetail> findAll() {
        return contractDetailRepository.findAll();
    }

    @Override
    public void save(ContractDetail contractDetail) {
        contractDetailRepository.save(contractDetail);
    }

    @Override
    public ContractDetail findById(int id) {
        return contractDetailRepository.findById(id);
    }

    @Override
    public void update(int id, ContractDetail contractDetail) {
        contractDetailRepository.update(id, contractDetail);
    }

    @Override
    public void remove(int id) {
        contractDetailRepository.remove(id);
    }
}

package model.service.contract;

import model.bean.Contract;
import model.repository.contract.ContractRepository;
import model.repository.contract.ContractRepositoryImpl;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ContractServiceImpl implements ContractService {
    private ContractRepository contractRepository = new ContractRepositoryImpl();

    @Override
    public List<Contract> findAll() {
        return contractRepository.findAll();
    }

    @Override
    public Map<String, String> save(Contract contract) {

        Map<String, String> mapMessage = new HashMap<>();
        if ( Validate.validateDate(contract.getContractStartDate()) != null
        || Validate.validateDate(contract.getContractEndDate()) != null
                || Validate.validateNumber2(String.valueOf(contract.getContractTotalMoney())) != null
                || Validate.validateNumber2(String.valueOf(contract.getContractDeposit())) != null) {
            mapMessage.put("startDate", Validate.validateDate(contract.getContractStartDate()));
            mapMessage.put("endDate", Validate.validateDate(contract.getContractEndDate()));
            mapMessage.put("money", Validate.validateNumber2(String.valueOf(contract.getContractTotalMoney())));
            mapMessage.put("deposit", Validate.validateNumber2(String.valueOf(contract.getContractDeposit())));
        } else {
            contractRepository.save(contract);
        }
        return mapMessage;
    }

    @Override
    public Contract findById(int id) {
        return contractRepository.findById(id);
    }

    @Override
    public void update(int id, Contract contract) {
        contractRepository.update(id, contract);
    }

    @Override
    public void remove(int id) {
        contractRepository.remove(id);
    }

}

package model.bean;

import java.util.ArrayList;
import java.util.List;

public class Contract {
    private int contractId;
    private String contractStartDate;
    private String contractEndDate;
    private double contractDeposit;
    private double contractTotalMoney;
    private int employeeId;
    private int customerId;
    private int serviceId;

    public Employee employee;
    public Customer customer;
    public Service service;
    public AttachService attachService;
    //thử nghiệm task 3.9
    public String attachServiceListId;
    public String attachServiceListName;
    public double totalMoney;
    public Contract(int contractId,Employee employee, Customer customer, Service service, AttachService attachService, String attachServiceListId) {
        this.contractId = contractId;
        this.employee = employee;
        this.customer = customer;
        this.service = service;
        this.attachService = attachService;
        this.attachServiceListId = attachServiceListId;
    }
    public Contract(int contractId,Employee employee, Customer customer, Service service, AttachService attachService, String attachServiceListId, String attachServiceListName) {
        this.contractId = contractId;
        this.employee = employee;
        this.customer = customer;
        this.service = service;
        this.attachService = attachService;
        this.attachServiceListId = attachServiceListId;
        this.attachServiceListName = attachServiceListName;
    }
    public Contract(int contractId,Employee employee, Customer customer, Service service, AttachService attachService, String attachServiceListId, String attachServiceListName, double totalMoney) {
        this.contractId = contractId;
        this.employee = employee;
        this.customer = customer;
        this.service = service;
        this.attachService = attachService;
        this.attachServiceListId = attachServiceListId;
        this.attachServiceListName = attachServiceListName;
        this.totalMoney = totalMoney;
    }

    public String getAttachServiceListId() {
        return attachServiceListId;
    }

    public void setAttachServiceListId(String attachServiceListId) {
        this.attachServiceListId = attachServiceListId;
    }

    public String getAttachServiceListName() {
        return attachServiceListName;
    }

    public void setAttachServiceListName(String attachServiceListName) {
        this.attachServiceListName = attachServiceListName;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    // hết thử nghiệm task 3.9
    public Contract(int contractId, String contractStartDate, String contractEndDate, double contractDeposit,
                    double contractTotalMoney, Employee employee, Customer customer, Service service, AttachService attachService) {
        this.contractId = contractId;
        this.contractStartDate = contractStartDate;
        this.contractEndDate = contractEndDate;
        this.contractDeposit = contractDeposit;
        this.contractTotalMoney = contractTotalMoney;
        this.employee = employee;
        this.customer = customer;
        this.service = service;
        this.attachService = attachService;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public AttachService getAttachService() {
        return attachService;
    }

    public void setAttachService(AttachService attachService) {
        this.attachService = attachService;
    }

    public Contract(int contractId, Employee employee, Customer customer, Service service, List<AttachService> attachServiceList) {

    }

    public Contract(String contractStartDate, String contractEndDate, double contractDeposit, double contractTotalMoney, int employeeId, int customerId, int serviceId) {
        this.contractStartDate = contractStartDate;
        this.contractEndDate = contractEndDate;
        this.contractDeposit = contractDeposit;
        this.contractTotalMoney = contractTotalMoney;
        this.employeeId = employeeId;
        this.customerId = customerId;
        this.serviceId = serviceId;
    }

    public Contract(int contractId, String contractStartDate, String contractEndDate, double contractDeposit, double contractTotalMoney, int employeeId, int customerId, int serviceId) {
        this.contractId = contractId;
        this.contractStartDate = contractStartDate;
        this.contractEndDate = contractEndDate;
        this.contractDeposit = contractDeposit;
        this.contractTotalMoney = contractTotalMoney;
        this.employeeId = employeeId;
        this.customerId = customerId;
        this.serviceId = serviceId;
    }

    public int getContractId() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId = contractId;
    }

    public String getContractStartDate() {
        return contractStartDate;
    }

    public void setContractStartDate(String contractStartDate) {
        this.contractStartDate = contractStartDate;
    }

    public String getContractEndDate() {
        return contractEndDate;
    }

    public void setContractEndDate(String contractEndDate) {
        this.contractEndDate = contractEndDate;
    }

    public double getContractDeposit() {
        return contractDeposit;
    }

    public void setContractDeposit(double contractDeposit) {
        this.contractDeposit = contractDeposit;
    }

    public double getContractTotalMoney() {
        return contractTotalMoney;
    }

    public void setContractTotalMoney(double contractTotalMoney) {
        this.contractTotalMoney = contractTotalMoney;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }
}

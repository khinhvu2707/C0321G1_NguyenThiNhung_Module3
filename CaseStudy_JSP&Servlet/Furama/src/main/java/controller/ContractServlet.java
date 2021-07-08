package controller;

import model.bean.Contract;
import model.service.contract.ContractService;
import model.service.contract.ContractServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ContractServlet",urlPatterns = {"/contract"})
public class ContractServlet extends HttpServlet {
    private ContractService contractService = new ContractServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createContract(request, response);
                break;
            case "edit":
                editContract(request, response);
                break;
        }
    }


    private void editContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int contractId = Integer.parseInt(request.getParameter("contractId"));
        String contractStartDate = request.getParameter("contractStartDate");
        String contractEndDate = request.getParameter("contractEndDate");
        double contractDeposit = Double.parseDouble(request.getParameter("contractDeposit"));
        double  contractTotalMoney = Double.parseDouble(request.getParameter("contractTotalMoney"));
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        int customerId= Integer.parseInt(request.getParameter("customerId"));
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
       Contract contract = new Contract(contractId,contractStartDate,contractEndDate,contractDeposit, contractTotalMoney,employeeId,customerId,serviceId);
        contractService.update(contractId, contract);
        showList(request, response);
    }

    private void createContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String contractStartDate = request.getParameter("contractStartDate");
        String contractEndDate = request.getParameter("contractEndDate");
        double contractDeposit = Double.parseDouble(request.getParameter("contractDeposit"));
        double  contractTotalMoney = Double.parseDouble(request.getParameter("contractTotalMoney"));
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        int customerId= Integer.parseInt(request.getParameter("customerId"));
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        Contract contract = new Contract(contractStartDate,contractEndDate,contractDeposit, contractTotalMoney,employeeId,customerId,serviceId);
        Map<String, String> mapMessage = contractService.save(contract);
        if (mapMessage.isEmpty()){
            showList(request, response);
        }else {
            request.setAttribute("messStartDate", mapMessage.get("startDate"));
            request.setAttribute("messEndDate", mapMessage.get("endDate"));
            request.setAttribute("messMoney", mapMessage.get("money"));
            request.setAttribute("messDeposit", mapMessage.get("deposit"));
            request.setAttribute("contract", contract);
            showCreate(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            case "delete":
                showDelete(request, response);
                break;
            case "show":
                showList(request, response);
                break;
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Contract> contractList = contractService.findAll();
        request.setAttribute("contracts", contractList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/contract/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        contractService.remove(id);
        showList(request, response);
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("contracts", contractService.findById(id));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/contract/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/contract/create.jsp");
        requestDispatcher.forward(request, response);
    }
}

package controller;

import model.bean.Contract;
import model.bean.Customer;
import model.bean.Service;
import model.service.customer.CustomerContractService;
import model.service.service.ServiceService;
import model.service.service.ServiceServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerContractServlet",urlPatterns = {"/customerContract"})
public class CustomerContractServlet extends HttpServlet {
    private CustomerContractService customerContractService = new CustomerContractService();
    private ServiceService serviceService = new ServiceServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
//                createCustomer(request, response);
                break;
            case "edit":
                editService(request, response);
                break;
            case "search":
                searchCustomer(request, response);
                break;
        }
    }

    private void editService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int serviceId = Integer.parseInt(request.getParameter("serviceId"));
        String serviceCode = request.getParameter("serviceCode");
        String serviceName = request.getParameter("serviceName");
        int serviceArea = Integer.parseInt(request.getParameter("serviceArea"));
        double serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
        int serviceMaxPeople = Integer.parseInt(request.getParameter("serviceMaxPeople"));
        int rentTypeId = Integer.parseInt(request.getParameter("rentTypeId"));
        int serviceTypeId = Integer.parseInt(request.getParameter("serviceTypeId"));
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloor = Integer.parseInt(request.getParameter("numberOfFloor"));
        Service service = new Service(serviceId,serviceCode,serviceName,serviceArea,serviceCost,serviceMaxPeople,rentTypeId,serviceTypeId,standardRoom,descriptionOtherConvenience,poolArea,numberOfFloor);
        serviceService.update(serviceId, service);
        showList(request, response);
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Contract> contractList = customerContractService.findByName(name);
        request.setAttribute("contracts", contractList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/CustomerContract/list.jsp");
        requestDispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
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
//                Map<Integer,Integer > mapContractDetail = new HashMap<>();
//        mapContractDetail = customerContractService.findMoney();
//        double index = mapContractDetail.get(1);
//        List<Contract> contractList = customerContractService.findCustomerContract2();
//        request.setAttribute("contracts", contractList);
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/CustomerContract/list2.jsp");
//        requestDispatcher.forward(request, response);

        Map<Integer,Double> mapContractDetail = new HashMap<>();
        mapContractDetail = customerContractService.findMoney();
        List<Contract> contractList = customerContractService.findCustomerContract2(mapContractDetail);
        request.setAttribute("contracts", contractList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/CustomerContract/list2.jsp");
        requestDispatcher.forward(request, response);

    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        serviceService.remove(id);
        response.sendRedirect("/service");
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("services", serviceService.findById(id));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/service/edit.jsp");
        requestDispatcher.forward(request, response);
    }
}
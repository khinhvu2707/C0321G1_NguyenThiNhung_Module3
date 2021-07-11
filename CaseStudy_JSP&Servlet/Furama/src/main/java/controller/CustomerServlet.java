package controller;

import model.bean.Customer;
import model.service.common.Validate;
import model.service.customer.CustomerService;
import model.service.customer.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "CustomerServlet",urlPatterns = {"/customers"})
public class CustomerServlet extends HttpServlet {
    private CustomerService customerService = new CustomerServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            case "edit":
                editCustomer(request, response);
                break;
            case "search":
                searchCustomer(request, response);
                break;
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
            default:
                showHome(request, response);
        }
    }
    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Customer> productList = customerService.findByName(name);
        request.setAttribute("customers", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/search.jsp");
        requestDispatcher.forward(request, response);
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("customerId"));
        String code = request.getParameter("customerCode");
        int typeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String name = request.getParameter("customerName");
        String birthday = request.getParameter("customerBirthday");
        int gender = Integer.parseInt(request.getParameter("customerGender"));
        String idCard = request.getParameter("customerIdCard");
        String phone = request.getParameter("customerPhone");
        String email = request.getParameter("customerEmail");
        String address = request.getParameter("customerAddress");
        Customer customer = new Customer(id,code,typeId,name,birthday,gender,idCard,phone,email,address);
        Map<String, String> mapMessage = customerService.update(id, customer);
        if (mapMessage.isEmpty()){
            showList(request, response);
        }else {
            request.setAttribute("messCode", mapMessage.get("code"));
            request.setAttribute("messName", mapMessage.get("name"));
            request.setAttribute("messBirthday", mapMessage.get("birthday"));
            request.setAttribute("messIdCard", mapMessage.get("idCard"));
            request.setAttribute("messPhone", mapMessage.get("phone"));
            request.setAttribute("messEmail", mapMessage.get("email"));
            request.setAttribute("customer", customer);
            showEdit(request,response);
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("customerCode");
        int typeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String name = request.getParameter("customerName");
        String birthday = request.getParameter("customerBirthday");
        int gender = Integer.parseInt(request.getParameter("customerGender"));
        String idCard = request.getParameter("customerIdCard");
        String phone = request.getParameter("customerPhone");
        String email = request.getParameter("customerEmail");
        String address = request.getParameter("customerAddress");
        Customer customer = new Customer(code,typeId,name,birthday,gender,idCard,phone,email,address);
        Map<String, String> mapMessage = customerService.save(customer);
        if (mapMessage.isEmpty()){
            showList(request, response);
        }else {
            request.setAttribute("messCode", mapMessage.get("code"));
            request.setAttribute("messName", mapMessage.get("name"));
            request.setAttribute("messBirthday", mapMessage.get("birthday"));
            request.setAttribute("messIdCard", mapMessage.get("idCard"));
            request.setAttribute("messPhone", mapMessage.get("phone"));
            request.setAttribute("messEmail", mapMessage.get("email"));
            request.setAttribute("customers", customer);
            showCreate(request,response);
        }


    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customers", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        customerService.remove(id);
        showList(request, response);
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("customer", customerService.findById(id));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/customer/create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/homePage.jsp");
        requestDispatcher.forward(request, response);
    }
}

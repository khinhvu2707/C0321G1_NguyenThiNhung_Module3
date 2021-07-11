package controller;

import model.bean.Employee;
import model.service.employee.EmployeeService;
import model.service.employee.EmployeeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeServlet",urlPatterns = {"/employee"})
public class EmployeeServlet extends HttpServlet {
    private EmployeeService employeeService = new EmployeeServiceImpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployee(request, response);
                break;
            case "edit":
                editEmployee(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;
        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Employee> employeeList = employeeService.findByName(name);
        request.setAttribute("employees", employeeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/employee/search.jsp");
        requestDispatcher.forward(request, response);
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("id"));
        String employeeName= request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String username = request.getParameter("username");
        Employee employee = new Employee(employeeId,employeeName,employeeBirthday,employeeIdCard,employeeSalary,employeePhone,employeeEmail,employeeAddress,positionId,educationDegreeId,divisionId,username);
        Map<String, String> mapMessage =  employeeService.update(employeeId, employee);
        if (mapMessage.isEmpty()){
            showList(request, response);
        }else {
            request.setAttribute("messName", mapMessage.get("name"));
            request.setAttribute("messBirthday", mapMessage.get("birthday"));
            request.setAttribute("messIdCard", mapMessage.get("idCard"));
            request.setAttribute("messPhone", mapMessage.get("phone"));
            request.setAttribute("messEmail", mapMessage.get("email"));
            request.setAttribute("messSalary", mapMessage.get("salary"));
            request.setAttribute("employees", employee);
            showEdit(request,response);
        }
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeName= request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        int positionId = Integer.parseInt(request.getParameter("positionId"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        int divisionId = Integer.parseInt(request.getParameter("divisionId"));
        String username = request.getParameter("username");
        Employee employee = new Employee(employeeName,employeeBirthday,employeeIdCard,employeeSalary,employeePhone,employeeEmail,employeeAddress,positionId,educationDegreeId,divisionId,username);
        Map<String, String> mapMessage =  employeeService.save(employee);
        if (mapMessage.isEmpty()){
            showList(request, response);
        }else {
            request.setAttribute("messName", mapMessage.get("name"));
            request.setAttribute("messBirthday", mapMessage.get("birthday"));
            request.setAttribute("messIdCard", mapMessage.get("idCard"));
            request.setAttribute("messPhone", mapMessage.get("phone"));
            request.setAttribute("messEmail", mapMessage.get("email"));
            request.setAttribute("messSalary", mapMessage.get("salary"));
            request.setAttribute("employee", employee);
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
            default:
                showHome(request, response);
        }
    }

    private void showHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/homePage.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = employeeService.findAll();
        request.setAttribute("employees", employeeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/employee/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.remove(id);
        showList(request, response);
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("employees", employeeService.findById(id));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/employee/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/employee/create.jsp");
        requestDispatcher.forward(request, response);
    }
}

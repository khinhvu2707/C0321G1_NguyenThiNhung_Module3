package controller;

import model.bean.ContractDetail;
import model.service.contractDetail.ContractDetailService;
import model.service.contractDetail.ContractDetailServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractDetailServlet", urlPatterns = {"/contractDetail"})
public class ContractDetailServlet extends HttpServlet {
    private ContractDetailService contractDetailService = new ContractDetailServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createContractDetail(request, response);
                break;
            case "edit":
                editContractDetail(request, response);
                break;
        }
    }

    private void editContractDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int contractDetailId = Integer.parseInt(request.getParameter("contractDetailId"));
        int contractId = Integer.parseInt(request.getParameter("contractId"));
        int attachServiceId = Integer.parseInt(request.getParameter("attachServiceId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        ContractDetail contractDetail = new ContractDetail(contractDetailId,contractId,attachServiceId,quantity);
        contractDetailService.update(contractDetailId, contractDetail);
        showList(request, response);
    }

    private void createContractDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int contractId = Integer.parseInt(request.getParameter("contractId"));
        int attachServiceId = Integer.parseInt(request.getParameter("attachServiceId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        ContractDetail contractDetail = new ContractDetail(contractId,attachServiceId,quantity);
        contractDetailService.save(contractDetail);
        showList(request, response);
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
        List<ContractDetail> contractDetailList = contractDetailService.findAll();
        request.setAttribute("contractDetails", contractDetailList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/contractDetail/list.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        contractDetailService.remove(id);
        response.sendRedirect("/contractDetail");
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("contractDetails", contractDetailService.findById(id));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/contractDetail/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/contractDetail/create.jsp");
        requestDispatcher.forward(request, response);
    }
}

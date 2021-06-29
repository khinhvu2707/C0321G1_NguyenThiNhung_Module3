package controller;

import model.bean.Product;
import model.service.ProductService;
import model.service.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductServlet", urlPatterns = {"", "/products"})
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request,response);
                break;
            case "delete":
                deleteProduct(request,response);
                break;
            case "search":
                searchProduct(request,response);
                break;
            default:
                showProduct(request, response);
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {

    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String ten = request.getParameter("ten");
        int gia = Integer.parseInt(request.getParameter("gia"));
        String mTSP = request.getParameter("mtsp");
        String hSX = request.getParameter("hsx");
        Product product = new Product(id, ten, gia, mTSP, hSX);
        productService.save(product);
        showList(request, response);
    }

    private void showProduct(HttpServletRequest request, HttpServletResponse response) {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreate(request,response);
                break;
            case "edit":
                showEdit(request,response);
                break;
            case "delete":
                showDelete(request,response);
                break;
            case "search":
                showSearch(request,response);
                break;
            default:
                showList(request, response);
        }
    }

    private void showSearch(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) {
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/create.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("product", productService.findAll());
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/list.jsp");
        requestDispatcher.forward(request, response);
    }
}

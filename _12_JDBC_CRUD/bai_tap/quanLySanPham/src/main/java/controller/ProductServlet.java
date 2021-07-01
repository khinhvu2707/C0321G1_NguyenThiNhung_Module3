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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
                editProduct(request, response);
                break;
            case "search":
                searchProduct(request, response);
                break;
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Product> productList = productService.findByName(name);
        request.setAttribute("product", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/search.jsp");
        requestDispatcher.forward(request, response);
    }


    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String ten = request.getParameter("ten");
        int gia = Integer.parseInt(request.getParameter("gia"));
        String moTa = request.getParameter("moTa");
        String nhaSX = request.getParameter("nhaSX");
        String nsx = request.getParameter("nsx");
        String hsd = request.getParameter("hsd");
        Product product = productService.findById(id);
        product.setTenSanPham(ten);
        product.setGiaSanPham(gia);
        product.setMoTaSanPham(moTa);
        product.setNhaSanXuat(nhaSX);
        product.setNgaySanXuat(nsx);
        product.setHanSuDung(hsd);
        productService.update(id, product);
        showList(request, response);
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ten = request.getParameter("ten");
        int gia = Integer.parseInt(request.getParameter("gia"));
        String mTSP = request.getParameter("mtsp");
        String hSX = request.getParameter("hsx");
        String nsx = request.getParameter("nsx");
        String hsd = request.getParameter("hsd");
        Product product = new Product(ten, gia, mTSP, hSX,nsx,hsd);
        productService.save(product);
        int id = productService.findByIdToSave();
        productService.saveTime(id,product);
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
            default:
                showList(request, response);
        }
    }


    private void showDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.remove(id);
        response.sendRedirect("/products");
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("product", productService.findById(id));
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/create.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        request.setAttribute("product", productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/product/list.jsp");
        requestDispatcher.forward(request, response);
    }
}

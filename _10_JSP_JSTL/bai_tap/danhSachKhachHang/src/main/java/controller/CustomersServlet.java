package controller;

import Models.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomersServlet", urlPatterns = "")
public class CustomersServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> listCustomer = new ArrayList<>();
        listCustomer.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://static2.yan.vn/YanNews/2167221/201711/20171124-014810-301386_full1.jpg"));
        listCustomer.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://kenh14cdn.com/Images/Uploaded/Share/2011/06/29/110629starema5.jpg"));
        listCustomer.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://kenh14cdn.com/thumb_w/660/2018/11/20/photo-1-1542695789682571515655.jpg"));
        listCustomer.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://toplist.vn/images/800px/luna-lovegood-574028.jpg"));
        listCustomer.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://photo-cms-anninhthudo.zadn.vn/w600/Uploaded/2021/194/2018_09_30/ron.jpg"));

        request.setAttribute("listCustomers", listCustomer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}

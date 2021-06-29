package controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculate")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float first = Integer.parseInt(request.getParameter("first-operand"));
        float second = Integer.parseInt(request.getParameter("second-operand"));
        String operator = request.getParameter("operator");

        double result = 0;
        String result2 ="";
        try { CalculateException.Calculate(second);
            if (operator.equals("+")) {
                result = first + second;
            } else if (operator.equals("-")) {
                result = first - second;

            } else if (operator.equals("*")) {
                result = first * second;

            } else {
                    result = first / second;

            }
            result2 = (first + " " + operator + " " + second + " = " + result);
        } catch (Exception ex) {
            result2 = "Error: " + ex.getMessage();
        }
        request.setAttribute("result3",result2);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/result.jsp");
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

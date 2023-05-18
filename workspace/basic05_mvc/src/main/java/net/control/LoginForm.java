package main.java.net.control;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginForm extends HttpServlet {

    //결과 확인 http://localhost:9090/basic05_mvc/login.do
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1) http://localhost:9090/basic05_mvc/control/loginForm.jsp
        // response.sendRedirect("control/loginForm.jsp");

        // 2) http://localhost:9090/basic05_mvc/login.do
        String view = "control/loginForm.jsp";
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}

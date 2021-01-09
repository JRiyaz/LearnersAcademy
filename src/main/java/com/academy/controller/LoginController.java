package main.java.com.academy.controller;

import main.java.com.academy.dao.Authenticate;
import main.java.com.academy.entity.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class Login
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.getRequestDispatcher("login.html").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub

        String user_name = request.getParameter("username");
        String password = request.getParameter("password");

        Users user = null;

        if (user_name.matches("^(.+)@(.+)$"))
            user = Authenticate.getUserWithEmail(user_name, password);
        else
            user = Authenticate.getUser(user_name, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user.getEmail());

            response.sendRedirect("home?login-successful");
        } else
            response.sendRedirect("login?login-failed");
    }

}

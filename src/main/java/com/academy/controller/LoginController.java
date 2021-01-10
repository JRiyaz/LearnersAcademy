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
 * Servlet implementation class LoginController
 * This class handles get and post request of url pattern '/login'.
 *
 * @author Riyaz J
 * @version 1.1
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
     * This method takes get request of url pattern '/login' and forward the request to login.html file.
     *
     * @param request  - {@link HttpServletRequest}
     * @param response - {@link HttpServletResponse}
     * @throws ServletException, IOException
     * @jsp /WebContent/login.html
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.getRequestDispatcher("login.html").forward(request, response);
    }

    /**
     * This method takes post request of url pattern '/login'.
     * This method takes 'username' and 'password' parameters and checks if user is present or not.
     * If user is present, the request will be redirected to {@link HomeController} with login success message.
     * If user is not present, the request will be redirected to {@link LoginController} with login failure message.
     *
     * @param request  - {@link HttpServletRequest}
     * @param response - {@link HttpServletResponse}
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
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

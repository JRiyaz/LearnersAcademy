package main.java.com.academy.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class HomeController
 * This class handles get request of url pattern '/home'.
 *
 * @author Riyaz J
 * @version 1.1
 */
@WebServlet(name = "home", urlPatterns = {"/home"})
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This method takes get request of url pattern '/home' and include the index.jsp file in response.
     *
     * @param request  - {@link HttpServletRequest}
     * @param response - {@link HttpServletResponse}
     * @throws ServletException, IOException
     * @jsp /WebContent/index.jsp
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub

        request.getRequestDispatcher("index.jsp")
                .include(request, response);
    }

}

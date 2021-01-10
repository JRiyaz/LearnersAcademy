package main.java.com.academy.controller;

import main.java.com.academy.dao.ClassDAO;
import main.java.com.academy.entity.Classes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class ClassController
 * This class handles get request of url pattern '/classes'.
 *
 * @author Riyaz J
 * @version 1.1
 */
@WebServlet(name = "classes", urlPatterns = {"/classes"})
public class ClassController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClassController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This method takes get request of url pattern '/classes' and fetch the list of all class records
     * from {@link ClassDAO} and forward the request to classes.jsp file.
     *
     * @param request  - {@link HttpServletRequest}
     * @param response - {@link HttpServletResponse}
     * @throws ServletException, IOException
     * @jsp /WebContent/classes.jsp
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0);

        List<Classes> classes = ClassDAO.getAllClassesWithStrength();

        request.setAttribute("classes", classes);

        request.getRequestDispatcher("classes.jsp")
                .include(request, response);
    }
}

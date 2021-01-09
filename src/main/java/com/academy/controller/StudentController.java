package main.java.com.academy.controller;

import main.java.com.academy.dao.StudentDAO;
import main.java.com.academy.entity.Students;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class StudentController
 */
@WebServlet(name = "students", urlPatterns = {"/students"})
public class StudentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentController() {
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

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0);

        int from = 0;
        int to = 10;

        int currentPage = 1;

        if (request.getParameter("page") != null)
            currentPage = Integer.parseInt(request.getParameter("page"));

        if (currentPage > 1) {

            to *= currentPage;
            from = to - 10;
        }

        boolean showClass = true;

        List<Students> students = StudentDAO.getFewStudentsWithOffset(30, from, showClass);

        int count = StudentDAO.countOfStudents();

        int pages = (int) Math.round(((double) count) / 30);

        request.setAttribute("students", students);

        request.setAttribute("showClass", showClass);

        request.setAttribute("pages", pages);
        request.setAttribute("currentPage", currentPage);

        request.getRequestDispatcher("students.jsp")
                .forward(request, response);
    }

}

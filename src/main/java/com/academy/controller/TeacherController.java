package main.java.com.academy.controller;

import main.java.com.academy.dao.TeacherDAO;
import main.java.com.academy.entity.Teachers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class TeacherController
 * This class handles get request of url pattern '/teachers' and '/teacher/.
 *
 * @author Riyaz J
 * @version 1.1
 */
@WebServlet(name = "teachers", urlPatterns = {"/teachers", "/teacher"})
public class TeacherController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TeacherController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This method takes get request of url pattern '/teachers' and '/teacher/.
     * If the servlet path is '/teachers' it will fetch the list of all Teacher records
     * from {@link TeacherDAO} and forward the request to teachers.jsp file.
     * <p>
     * If the servlet path is '/teacher' it will fetch the particular Teacher records
     * from {@link TeacherDAO} and forward the request to teacher.jsp file.
     *
     * @param request  - {@link HttpServletRequest}
     * @param response - {@link HttpServletResponse}
     * @throws ServletException, IOException
     * @jsp /WebContent/teachers.jsp, /WebContent/teacher.jsp
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0);

        if (request.getServletPath().equals("/teacher")) {

            int teacherId = 1;

            if (request.getParameter("teacherId") != null)
                teacherId = Integer.parseInt(request.getParameter("teacherId"));

            Teachers teacher = TeacherDAO.getTeacherWithClassesAndSubjects(teacherId);

            request.setAttribute("teacher", teacher);

            request.getRequestDispatcher("teacher.jsp")
                    .forward(request, response);

        } else {

            int from = 0;
            int to = 10;

            int currentPage = 1;

            if (request.getParameter("page") != null)
                currentPage = Integer.parseInt(request.getParameter("page"));

            if (currentPage > 1) {

                to *= currentPage;
                from = to - 10;
            }

            List<Teachers> teachers = TeacherDAO
                    .getFewTeachersWithLimitAndOffset(10, from, false, false);

            int count = TeacherDAO.countOfTeachers();

            int pages = (int) Math.round(((double) count) / 10);

            request.setAttribute("teachers", teachers);

            request.setAttribute("pages", pages);

            request.setAttribute("currentPage", currentPage);

            request.getRequestDispatcher("teachers.jsp")
                    .forward(request, response);
        }
    }
}

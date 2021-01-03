package main.java.com.academy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.java.com.academy.dao.TeacherDAO;
import main.java.com.academy.entity.Teachers;

/**
 * Servlet implementation class TeacherController
 */
@WebServlet(name = "teachers", urlPatterns = { "/teachers" })
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0);

		int from = 1;
		int to = 10;

		int currentPage = 1;

		if (request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));

		if (currentPage > 1) {

			to *= currentPage;
			from = to - 10;
		}

		List<Teachers> teachers = TeacherDAO.getFewTeachersWithOffset(11, from, false, true);

		int count = TeacherDAO.countOfTeachers();

		int pages = count / 10;

		request.setAttribute("teachers", teachers);

		request.setAttribute("classes", false);

		request.setAttribute("subjects", true);

		request.setAttribute("pages", pages);

		request.setAttribute("currentPage", currentPage);

		request.getRequestDispatcher("teachers.jsp").forward(request, response);
	}
}
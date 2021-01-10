package main.java.com.academy.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class LogoutController
 * This class handles get request of url pattern '/logout'.
 *
 * @author Riyaz J
 * @version 1.1
 */
@WebServlet(name = "logout", urlPatterns = {"/logout"})
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This method takes get request of url pattern '/logout' and removes the user from session object.
     * After removing the user from session object, the request will be redirected to {@link HomeController} with
     * logout success message.
     *
     * @param request  - {@link HttpServletRequest}
     * @param response - {@link HttpServletResponse}
     * @throws IOException
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // TODO Auto-generated method stub

        HttpSession session = request.getSession(false);
        session.setAttribute("user", "");
        session.removeAttribute("user");
        session.invalidate();

        response.sendRedirect("home?logout-successful");
    }
}

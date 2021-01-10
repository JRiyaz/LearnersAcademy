package main.java.com.academy.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ErrorController This class handles get request
 * of url pattern '/error'.
 *
 * @author Riyaz J
 * @version 1.1
 */
@WebServlet(name = "error", urlPatterns = {"/error"})
public class ErrorController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ErrorController() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This method takes get request of url pattern '/error' and forward the request
     * to error.jsp file.
     *
     * @param request  - {@link HttpServletRequest}
     * @param response - {@link HttpServletResponse}
     * @throws ServletException, IOException
     * @jsp /WebContent/error.jsp
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        processError(request, response);
    }

    /**
     * This method takes post request of url pattern '/error' and forward the
     * request to error.jsp file.
     *
     * @param request  - {@link HttpServletRequest}
     * @param response - {@link HttpServletResponse}
     * @throws ServletException, IOException
     * @jsp /WebContent/error.jsp
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        processError(request, response);
    }

    /**
     * This method is internal implementation for doGet() and doPost() methods.
     *
     * @param request  - {@link HttpServletRequest}
     * @param response - {@link HttpServletResponse}
     * @throws ServletException, IOException
     * @jsp /WebContent/error.jsp
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    private void processError(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0);

        String error = null;

        String path = request.getContextPath();

        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");

        switch (statusCode) {

            case 500:
                error = "Internal Server Error";
                break;
            case 403:
                error = "Request Forbidden";
                break;
			case 400:
                error = "Bad Request";
                break;
            case 401:
                error = "Unauthorized";
                break;
            default:
                error = "Page Not Found";
        }

        request.setAttribute("statusCode", statusCode);
        request.setAttribute("error", error);
        request.setAttribute("path", path);

        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
}

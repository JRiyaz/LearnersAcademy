package main.java.com.academy.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class Authentication
 */
@WebFilter(filterName = "authentication", urlPatterns = { "/*" })
public class Authentication implements Filter {

	/**
	 * Default constructor.
	 */
	public Authentication() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession(false);

		String user = null;

		if (session != null)
			user = (String) session.getAttribute("user");

		String servletPath = request.getServletPath();

		if (session == null || user == null || user.equals(" ")) {

			if (servletPath.equals("/home") || servletPath.equals("/login"))
				chain.doFilter(req, res);
			else
				response.sendRedirect("login?login-first");

		} else {

			if (servletPath.equals("/login"))
				response.sendRedirect("home?user-exists");
			else
				chain.doFilter(req, res);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

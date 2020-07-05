package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.UserService;
import service.impl.UserServiceImpl;
import tools.SendMail;
import util.Constant;

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);
		if (session != null && session.getAttribute("username") != null) {
			resp.sendRedirect(req.getContextPath() + "/admin");
			return;
		}
		// Check cookie
		Cookie[] cookies = req.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username")) {
					session = req.getSession(true);
					session.setAttribute("username", cookie.getValue());
					resp.sendRedirect(req.getContextPath() + "/admin");
					return;
				}
			}
		}

		req.getRequestDispatcher(Constant.Path.REGISTER).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String firstName = req.getParameter("firstName");
		String lastName = req.getParameter("lastName");
		String gender = req.getParameter("gender");

		UserService service = new UserServiceImpl();
		String alertMsg = "";

		if (service.checkExistUsername(username)) {
			alertMsg = "Username already exist!";
			req.setAttribute("alertMsg", alertMsg);
			req.getRequestDispatcher(Constant.Path.REGISTER).forward(req, resp);
			return;
		}

		boolean isSuccess = service.register(username, firstName, lastName, gender, password);

		if (isSuccess) {
//			SendMail sm= new SendMail();
//			sm.sendMail(email, "UNIFY", "Welcome to UNIFY. Please Login to use service. Thanks !");
			alertMsg = "Welcome to UNIFY. Please Login to use service. Thanks !";
			req.setAttribute("alertMsg", alertMsg);
			resp.sendRedirect(req.getContextPath() + "/login");
		} else {
			alertMsg = "System error!";
			req.setAttribute("alertMsg", alertMsg);
			req.getRequestDispatcher(Constant.Path.REGISTER).forward(req, resp);
		}
	}

}

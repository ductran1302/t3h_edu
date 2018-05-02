package t3h.edu.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import t3h.edu.dao.UserDao;
import t3h.edu.model.User;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String INSERT_OR_EDIT = "/user.jsp";
	private static String INSERT_DELETE_OR_EDIT = "/WEB-INF/templates/user/ajax_exec.jsp";
	private static String LIST_USER = "/WEB-INF/templates/user/ajaxUser.jsp";
	private static String COUNT_USER = "/WEB-INF/templates/user/ajax_count.jsp";
	private UserDao dao;

	public UserController() {
		super();
		dao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter("action");
		String page = request.getParameter("page_index");
		String record_per_page = request.getParameter("record_per_page");

		String user_name = request.getParameter("user_name");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");

		if (action.equalsIgnoreCase("listUser") && !page.equals("-1")) {
			forward = LIST_USER;
			request.setAttribute("users", dao.getAllUsers(user_name, firstName, lastName, record_per_page, page));
		} else if (action.equalsIgnoreCase("listUser") && page.equals("-1")) {
			forward = COUNT_USER;
			//request.setAttribute("countUser", dao.countAllUsers(record_per_page));
			request.setAttribute("countUser", dao.getAllUsers(user_name, firstName, lastName, record_per_page, page));
		} else {
			forward = INSERT_OR_EDIT;
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String result = "";
		RequestDispatcher view;
		User user = new User();

		user.setUserName(request.getParameter("user_name"));
		user.setFirstName(request.getParameter("firstName"));
		user.setLastName(request.getParameter("lastName"));
		user.setPassword(request.getParameter("password"));
		System.out.println("password" + user.getPassword());
		user.setEmail(request.getParameter("email"));
		user.setUserPhone(request.getParameter("phone"));

		String action = request.getParameter("action");
		if (action == null || action.isEmpty()) {
			result = dao.addUser(user);
		} else if (action.equals("edit")) {
			result = dao.updateUser(user);
		} else if (action.equals("delete")) {
			result = dao.deleteUser(user.getUserName());
		}
		view = request.getRequestDispatcher(INSERT_DELETE_OR_EDIT);
		request.setAttribute("ajax_exec", result);
		view.forward(request, response);
	}
}
package com.health.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.health.dao.UserDao;
import com.health.entity.User;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDao userdao = new UserDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		System.out.println(method);
		if (method.equals("login")) {
			login(request, response);
		} else if (method.equals("reg")) {
			reg(request, response);
		} else if (method.equals("addinfo")) {
			addinfo(request, response);
		}

	}

	private void addinfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		int id = (int) session.getAttribute("id");
		String heightStr = request.getParameter("height");
		if (heightStr == "") {
			heightStr = null;
		}
		int height = 0;
		float weight = 0;
		try {
			height = Integer.parseInt(heightStr);
			weight = Float.parseFloat(request.getParameter("weight"));
		} catch (Exception e) {
			System.out.println(e);
		}

		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		User user = new User();
		user.setBirthday(birthday);
		user.setGender(gender);
		user.setWeight(weight);
		user.setHeight(height);
		int num = userdao.addInfo(user, id);
		if (num == 0) {
			System.out.println("信息添加失败！");
			request.setAttribute("msg", "信息添加失败！请检查输入！");
			request.getRequestDispatcher("addinfo.jsp").forward(request, response);
			return;
		} else {
			System.out.println("信息添加成功！");
			request.setAttribute("msg", "信息添加成功！");
			request.getRequestDispatcher("addinfo.jsp").forward(request, response);
			return;
		}
	}

	// 用户注册
	public void reg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String code = request.getParameter("code");
		if (username == "" || password == "" || phone == "") {
			System.out.println("注册失败");
			request.setAttribute("msg", " ✖  注册失败！用户名/密码/手机号不能为空");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		User user = new User();

		user.setUsername(username);
		user.setPassword(password);
		user.setPhone(phone);
		user.setCode(code);

		int num = userdao.saveUser(user);
		if (num == 0) {
			System.out.println("注册失败");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		} else {
			System.out.println("注册成功");
			response.sendRedirect("index.jsp");
			return;
		}
	}

	// 用户登录
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		HttpSession session = request.getSession();
		User user = userdao.login(username, password);
		if (user == null) {
			System.out.println("登录失败");
			request.setAttribute("msg", " ✖  登录失败！请检查用户名或密码是否正确！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		} else {
			System.out.println("登录成功");
			session.setAttribute("id", user.getId());
			session.setAttribute("user", user);
			session.setAttribute("username", username);
			response.sendRedirect("loginSuccess.jsp");
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

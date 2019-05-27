package com.health.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.health.dao.StepDao;
import com.health.entity.Step;
import com.health.entity.User;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class StepServlet
 */
public class StepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StepServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		if (u == null) {
			System.out.println("没有获取到用户信息");
			return;
		} else {
			int id = u.getId();
			StepDao stepdao = new StepDao();
			ArrayList<Step> array = stepdao.findStepById(id);
			response.setContentType("text/html; charset=utf-8");
			// 调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
			JSONArray json = JSONArray.fromObject(array);
			PrintWriter out = response.getWriter();
			out.println(json);
			out.flush();
			out.close();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

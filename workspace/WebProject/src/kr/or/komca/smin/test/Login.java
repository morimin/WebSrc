package kr.or.komca.smin.test;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("Text/html; charset=UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("Text/html; charset=UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pass =request.getParameter("pass");
		
		PrintWriter out = response.getWriter();
		out.print("ID = " + id + "<br>");
		out.print("PW = " + pass + "<br>");
		
		doGet(request, response);
	}

}

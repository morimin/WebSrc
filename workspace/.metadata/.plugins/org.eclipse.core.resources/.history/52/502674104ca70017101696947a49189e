package kr.or.komca.smin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/SessionLogin")
public class SessionLogin extends HttpServlet {

  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("Text/html; charset=UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pass");
		
		session.setAttribute("sessID", id);
		session.setAttribute("sessName", "JOSMin");
		
		session.setAttribute("sessPW", pw);
		
		RequestDispatcher rd = request.getRequestDispatcher("sessionCheck.jsp");
		rd.forward(request, response);
		
		
		
	}

}

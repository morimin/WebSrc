package kr.or.komca.smin.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Hundreds")
public class Hundreds extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("Text/html; charset=UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		int total =0 ;
		
		for (int i = 1 ; i <= 99 ; i ++){
		
			total += i;
			
		}
		
		request.setAttribute("myTotal", total + "");
		
		RequestDispatcher rd = request.getRequestDispatcher("hundreds.jsp");
		rd.forward(request, response);
		
		
		
	}// POST



}



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A05CheckInput
 */
@WebServlet("/A05CheckInput")  // = 필터 이름이 안맞으면 compile 문제생김
public class A05CheckInput extends HttpServlet {



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
				
		response.setContentType("Text/html; charset=utf-8");
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");  // request는 파라미터로 넘어온 response임.
		
		PrintWriter out = response.getWriter();  // = System.print.out();
		out.print("<!doctype html>"
				+ "<html>"
				+ "	<head>"
				+ "		<meta charset = utf-8>"
				+ "		<title> 입력값 검사 </title>"
				+ "	</head>"
				+ "<body>"
				+ " 입력값 검사 예제 입니다.<br>");
		
		String id = request.getParameter("id");  // ID PW 받기위함  // request로 id라는 파라메터를 찾아서 변수선언
		String pass = request.getParameter("pass");
		String gender = request.getParameter("gender");
		String lang = request.getParameter("lang");
		String computer = request.getParameter("computer");
		String game = request.getParameter("game");
		String travel = request.getParameter("travel");
		String memo = request.getParameter("memo");
		
				
		out.print("id = " + id + "<br>");
		out.print("pass = " + pass + "<br>");
		out.print("gender = " + gender + "<br>");
		out.print("lang = " + lang + "<br>");
		out.print("computer = " + computer + "<br>");
		out.print("game = " + game + "<br>");
		out.print("travel = " + travel + "<br>");
		out.print("memo = " + memo + "<br>");		
		
		
		out.print("</body>"
				+ "</html>" );  // 자바로 컴파일 시켰을떄 실행시켰을때 원하는 것을 나오게 하기 위함.
			
		//servlet의 영향을 받았으니 reload 해야함.
				
	}// doPost

}// Main Class



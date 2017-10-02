
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/A02HelloServlet")
public class A02HelloServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("Text/html; charset=utf-8");
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");  // request는 파라미터로 넘어온 response임.
		
		PrintWriter out = response.getWriter();  // = System.print.out();
		out.print("<!doctype html>"
				+ "<html>"
				+ "	<head>"
				+ "		<meta charset = utf-8>"
				+ "		<title> 첫번째 Servlet </title>"
				+ "	</head>"
				+ "<body>"
				+ "첫번째 setvlet 테스트 입니다.<br>");
		
		for (int i = 1 ; i <10 ; i ++)
		{
			out.print("Servlet " + i + "<br>");
		}
		
		out.print("</body>"
				+ "</html>" );  // 자바로 컴파일 시켰을떄 실행시켰을때 원하는 것을 나오게 하기 위함.
			
		
	}// doGet

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
		
		out.print("id = " + id + "<br>");
		out.print("pass = " + pass + "<br>");
		
		out.print("</body>"
				+ "</html>" );  // 자바로 컴파일 시켰을떄 실행시켰을때 원하는 것을 나오게 하기 위함.
			
		//servlet의 영향을 받았으니 reload 해야함.
				
	}// doPost
	
}// Main Class








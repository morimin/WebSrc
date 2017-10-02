
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A05CheckInput
 */
@WebServlet("/A07Hundreds")  // = 필터 이름이 안맞으면 compile 문제생김
public class A07Hundreds extends HttpServlet {



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
				
		response.setContentType("Text/html; charset=utf-8");
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");  // request는 파라미터로 넘어온 response임.
		
		int total = 0;
		
		for ( int i = 1 ; i <=99 ; i++)
		{
			total = total + i;			
		}
		
		request.setAttribute("mytotal", total + "");  // total 값을 메모리에 잠시 저장 (mytotal 에 4950문자저장)
		
		RequestDispatcher rd = request.getRequestDispatcher("A06add.jsp");  // A06add.jsp 파일로 페이지를 이동시켜줌
		rd.forward(request, response);  
		
				
								
	}// doPost

}// Main Class



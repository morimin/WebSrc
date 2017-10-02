

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class B08Login
 */
@WebServlet("/B08Login")
public class B08Login extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("Text/html; charset=utf-8");
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");  
		
		HttpSession session = request.getSession();
		
		/* id, pass가 DB에 값과 비교해서 데이터가 존재하면 성공했기 때문에 로그인 시켜줘야한다. */
		// 여기서는 입력한 값으로 무조건 성공시켜주겠다.
		//
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		session.setAttribute("sessID", id);  // attribute 를 session 으로해주는 것이다.
		// ; id 를 sessID로 저장
		session.setAttribute("sessName", "홍길동");  
		session.setAttribute("sessPass", pass);  
		// session 은 모든 파일이 닫혀야 나가짐.
		
		RequestDispatcher rd = request.getRequestDispatcher("B09checkLogin.jsp");  // B09checkLogin.jsp 파일로 페이지를 이동시켜줌
		rd.forward(request, response);  
		
		
	}// doPost

}// Main Class













package kr.or.rapa1.bbs;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class BBSMakeList
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
	
		
		/* DB접속 */
		//
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		

		try{
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/rapadb1_pool");
			// ; Context 내부를 읽어오면서 rapadb1_pool 을 찾아서 가져온다.
			
			
			/* get connection */
			//
			conn = ds.getConnection();
			String sql = String.format("select * from users where id = '%s' and pass = password('%s')", id, pass );			
			// ; upperIdx 가 %d 자리로 들어감.
			pstmt = conn.prepareStatement(sql);
			System.out.println("[DEBUG] sql = " + sql);
			rs = pstmt.executeQuery(); 
			
			if(rs.next())
			{  // db가 있으면
				
				HttpSession session;
				session = request.getSession();
				session.setAttribute("sessID", rs.getString("id"));
				session.setAttribute("sessName", rs.getString("name"));
				session.setAttribute("sessLevel", rs.getInt("level"));
				
				
				request.setAttribute("dbResult", "SUCCESS");
				request.setAttribute("dbResultMsg", rs.getString("name") + "님 반갑습니다.");
				
			}else{  // 없으면
				request.setAttribute("dbResult", "FAIL");
				request.setAttribute("dbResultMsg", "아이디와 비밀번호를 확인하세요.");
				request.setAttribute("nextURL", "main.jsp?CMD=printlogin.jsp");
			}
						
				
			/* resource release into connection pool */
			//
			//if ( rs != null)
			rs.close(); 									
			pstmt.close();
			conn.close();
			
		}catch(Exception e){
			System.out.print("ERROR : " + e.getMessage() + "<br>");  
			// ; syso 이므로 콘솔에 출력
			
		}
		
		// if 문을 포워드 할것임
		RequestDispatcher rd = request.getRequestDispatcher("main.jsp?CMD=bbsResult.jsp");
		rd.forward(request, response);			
	
	}// doPost Method	
	
}// MAIN Class











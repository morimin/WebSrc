package kr.or.rapa1.bbs;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Enumeration;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BBSMakeList
 */
@WebServlet("/BBSUpdateManager")
public class BBSUpdateManager extends HttpServlet {	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String useflag = request.getParameter("useflag");
		String odr = request.getParameter("odr");
		String grp = request.getParameter("grp");
		String head = request.getParameter("head");
		String rlevel = request.getParameter("rlevel");
		String wlevel = request.getParameter("wlevel");
		String line = request.getParameter("line");
		String idx = request.getParameter("idx");
				
				
		
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
						
			String sql = String.format("update bbsmanager set title='%s', useflag='%s', odr='%s', head='%s', rlevel='%s', wlevel='%s', line='%s' where idx='%s' ", title, useflag, odr, head, rlevel, wlevel, line, idx );			
			pstmt = conn.prepareStatement(sql);
			System.out.println("[DEBUG] sql = " + sql);
			int affectedCount = pstmt.executeUpdate();  // 영향을 받을 갯수
			
			
			// bbsResult.jsp 에서 결과를 알고 싶다.			
			if ( affectedCount < 1 )
			{  // 1보다 작으면 error
				request.setAttribute("dbResult", "FAIL");
				request.setAttribute("dbResultMsg", "데이터 변경 실패");
				request.setAttribute("nextURL", "main.jsp?CMD=manBBS.jsp?sub=3");
				// ; 성공하면 main.jsp?CMD=manBBS.jsp?sub=1 로 페이지 이동
			}else
			{  // 그렇지 않으면 성공
				request.setAttribute("dbResult", "SUCCESS");
				request.setAttribute("dbResultMsg", "데이터 변경 성공.!!");
				request.setAttribute("nextURL", "main.jsp?CMD=manBBS.jsp?sub=3");
			}
			
				
			/* resource release into connection pool */
			//
			//rs.close();						
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











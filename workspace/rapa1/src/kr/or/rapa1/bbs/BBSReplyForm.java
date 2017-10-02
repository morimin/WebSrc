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
@WebServlet("/BBSReplyForm")
public class BBSReplyForm extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String idx = request.getParameter("idx");
		// idx 값을 찾아서 가져옴
		
		
		if (idx == null)  // 만약 idx가 없으면 
		{
			request.setAttribute("dbResult", "FAIL");
			request.setAttribute("dbResultMsg", "처리를 위한 필수정보가 없습니다.");
			request.setAttribute("nextURL", "main.jsp?CMD=index.jsp");
			
			RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
			rd.forward(request, response);		
		}// if
			
		
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
			String sql = String.format("select * from bbs where idx = '%s' ", idx );			
			// ; upperIdx 가 %d 자리로 들어감. = idx로 키값을 찾아옴
			pstmt = conn.prepareStatement(sql);
			System.out.println("[DEBUG] sql = " + sql);
			rs = pstmt.executeQuery(); 
			
			if(rs.next())
			{  // db가 있으면 다음을 가져오자				
				request.setAttribute("title", "Re: " + rs.getString("title"));  
				// ; 원본글에 Re: 를 덧붙여서 뿌려줄 것이다.				
				//request.setAttribute("html", toUnicode(rs.getString("html")));
				
				String tmpHtml = toUnicode(rs.getString("html"));
				// ; 원본글을 가져왔다.
				
				tmpHtml = tmpHtml.replaceAll("^", ">> ");  // ; 처음부분(^) 에 >> 로 바꿔라
				tmpHtml = tmpHtml.replaceAll("\n", "\n>> ");  // ; 마지막 부분을 찾아서 줄바꾸고 >> 표시해라
				tmpHtml = tmpHtml.replaceAll("^", "\n\n\n");  // ; 처음을 찾아서 엔터 3번 해줘라.
				
				request.setAttribute("html", tmpHtml);
				// ; html 값을 tmpHtml 값으로 채워라
				
				
				request.setAttribute("bid", rs.getString("bid"));
				
			}else{  // 없으면
				request.setAttribute("dbResult", "FAIL");
				request.setAttribute("dbResultMsg", "해당 데이터 없음.");
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
		RequestDispatcher rd = request.getRequestDispatcher("main.jsp?CMD=bbsReplyForm.jsp?idx="+idx);
		rd.forward(request, response);			
	
	}// doGet Method	
	

	/* 한글깨짐을 유니코드로 바꿔주는 메소드 */
	public String toUnicode(String str)
	{		if( str == null ) return null;
		
		try {
			byte[] b = str.getBytes("ISO-8859-1");
			return new String(b);
		} catch (Exception e) {
			return null;
		}		
	}// Unicode Method
	
	
}// MAIN Class











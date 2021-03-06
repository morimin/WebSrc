package kr.or.komca.smin.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@WebServlet("/DbmsInsertTest")
public class DbmsInsertTest extends HttpServlet {


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("Text/html; charset=UTF-8");
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		Connection conn;
		Statement stat = null;
		ResultSet rs = null;
		
		String sql = "";
		String result = "";
		int affectedCount = 0 ;
		
		String getID = request.getParameter("id");
		String getNAME = request.getParameter("name");
		String getPW = request.getParameter("pass");
		String getLEVEL = request.getParameter("level");
		
		 
		  try{
		   Class.forName("com.mysql.jdbc.Driver");  // connector 복사해둔게 있어야 가능함.
		   conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/smdb?characterEncoding=utf8" , "smuser1", "smpass" );
		   
		   if(conn != null)
		   {
		    stat = conn.createStatement();
		    
		    /* insert */
		    //
		    sql = sql.format("insert into users (id, name, pass, level) values('%s','%s', password('%s'), '%d')", getID, getNAME, getPW, Integer.parseInt(getLEVEL));
		    affectedCount = stat.executeUpdate(sql);  // 데이터의 영향을 미치는 것은 리턴타입이 숫자 = 영향을 미치는 갯수
		    
		     
		     
		    sql = "select * from users";
		    rs = stat.executeQuery(sql);
		    
		    while(rs.next())
		    {  // idx, id, name, level 값을 가져와 보기로 한다.
		     int idx = rs.getInt("idx");
		     String id = rs.getString("id");
		     String name = rs.getString("name");
		     int level = rs.getInt("level");
		     
		     // (idx, id, name, level) = (1, test, 홍길동 ,1);
		     
		     result = result.format("(idx, id, name, level) = (%d, %s, %s, %d)<br>", idx, id, name, level);
		     
		    }
		    
		    conn.close();
		    
		   }else
		   {
		    
		   } 
		   
		   
		  }catch(Exception e)
		  {
		   
		  }
		  
		  
			
			request.setAttribute("result", result);		
			request.setAttribute("affectedCount", affectedCount);		
		
			
			RequestDispatcher rd = request.getRequestDispatcher("dbmsQueryTest.jsp");
			rd.forward(request, response);
	}

}

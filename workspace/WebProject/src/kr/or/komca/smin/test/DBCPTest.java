package kr.or.komca.smin.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/DBCPTest")
public class DBCPTest extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("Text/html; charset=UTF-8");

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";
		String result = "";
		// int affectedCount = 0;

		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/smdb_pool");

			conn = ds.getConnection();

			sql = "SELECT * FROM USERS";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery(sql);

			List<String> listName = new ArrayList<String>();
			List<Integer> listIdx = new ArrayList<Integer>();
			List<String> listId = new ArrayList<String>();
			List<Integer> listLevel = new ArrayList<Integer>();

			while (rs.next()) { // idx, id, name, level 값을 가져와 보기로 한다.

				int idx = rs.getInt("idx");
				String id = rs.getString("id");
				String name = rs.getString("name");
				int level = rs.getInt("level");

				listName.add(name);
				listIdx.add(idx);
				listId.add(id);
				listLevel.add(level);

			} // while

			request.setAttribute("listName", listName);
			request.setAttribute("listIdx", listIdx);
			request.setAttribute("listId", listId);
			request.setAttribute("listLevel", listLevel);

			int listSize = listName.size();
			request.setAttribute("listSize", listSize);


			// request.setAttribute("result", result);
			// request.setAttribute("affectedCount", affectedCount);


		} catch (Exception e) {
			//String error01 = e.getMessage();
		}finally{
			try{
				rs.close();
				pstmt.close();			
				conn.close();
			}catch(Exception e){
				
			}//try-catch
		}// finally
		
		RequestDispatcher rd = request.getRequestDispatcher("dbmsQueryTest.jsp");
		rd.forward(request, response);
	}//get
}

// protected void doPost(HttpServletRequest request, HttpServletResponse
// response) throws ServletException, IOException {
//
// }

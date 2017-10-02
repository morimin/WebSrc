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
import javax.sql.DataSource;

/**
 * Servlet implementation class BBSMakeList
 */
@WebServlet("/BBSMakeList")
public class BBSMakeList extends HttpServlet {
	String bid;
	String opt;
	String key;
	String page;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		opt = request.getParameter("opt");
		key = request.getParameter("key");
				
		doGet(request, response);
				
	}//doPost
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		
		String strUpperIdx = request.getParameter("LAST_IDX"); // 최고 큰 idx 값 찾아오기
		
		String page = request.getParameter("page");
		if(page == null) {page= "1";}  // 페이지를 문자로 처리
		
		System.out.println("first page = " + page);
		
		bid = request.getParameter("bid");
		
		if(bid == null) bid="1";  // 혹시 bid 가 없으면 bid는 1로 정의
		
		int upperIdx;		
		if ( strUpperIdx == null )	upperIdx = Integer.MAX_VALUE;  // 2**32
		else	upperIdx = Integer.parseInt(strUpperIdx);
		// ; idx 값을 주는 것이 아니라 처음에 리스트를 볼때 리스트 전체를 보려고 함.
		
		BBSList list;
				
		list = readDB(upperIdx, page);  // 가장큰 수부터 가져와서 readDB에 넣는다.
		key= null;	
		
		request.setAttribute("BBSLIST", list);
				
		
		//RequestDispatcher rd = request.getRequestDispatcher("bbsList.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("main.jsp?CMD=bbsList.jsp");
		rd.forward(request, response);		
				
	}// doGet Method
	
	
	
	private BBSList readDB(int upperIdx, String page)  // 큰 수에서 10자리를 채우기 위함 for making List. 
	{										// 파라미터로 page 넣어줌
		
		BBSList list = new BBSList();
		
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
			
			String sql ;
			
			sql = String.format("select * from bbsmanager where idx='%s'", bid);
			// ; bid 가 bbsmanager의 idx 이므로
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			int line = 10;
			if(rs.next())
			{
				line = rs.getInt("line");
			}else{
				
			}
			
			/* 라인이 결정되고 나서 총 데이터수를 찾아와야한다. */
			//
			
			
			
			
			
			
			/* 검색관련 */
			//			
			if(opt != null && key != null)  // 두개가 다 있다는 소리
			{ // 검색하겠다				
				if (opt.equals("1"))  // 1-> 제목검색이였다.
				{
					sql = "select * from bbs where bid='"+bid+"'  and title like '%" + key + "%' order by notice DESC, gid DESC,  thread ASC "; 
							
				}else if(opt.equals("2"))
				{
					sql = "select * from bbs where bid='"+bid+"'  and writer like '%" + key + "%' order by notice DESC, gid DESC,  thread ASC ";
				}else
				{  // 이도저도 아니면 처음꺼 가져와서 보여줌
					sql = String.format("select * from bbs where bid='%s' and idx < '%d'  order by notice DESC, gid DESC, thread ASC", bid, upperIdx);
				}
				
			}else
			{ // 없다는 소리는 정상동작하겠다.
				
				int start= (Integer.parseInt(page) -1 ) * line; // 시작포인트
				
				
				sql = String.format("select * from bbs where bid='%s' order by notice DESC, gid DESC,  thread ASC limit %d, %d",bid, start, line);
				// ; 화면에 보여주는 쿼리가 이것임
			}												
			
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			int cnt = 0;							
			
			while( rs.next() )  // 값을 채워주는 역할
			{
				cnt ++;
				
				/*if ( cnt > line ) break;*/
				
				list.setIdx( rs.getInt("idx") ); 
				// ; idx 값을 가져와서 add 한 것을 셋 한다.				
				list.setNotice( rs.getInt("notice") );
				
				
				if(key != null)
				{
					String tmpTitle = rs.getString("title");
					String tmpWriter = rs.getString("writer");
					
					tmpTitle = tmpTitle.replaceAll(key, "<mark>" + key + "</mark>");
					tmpWriter = tmpWriter.replaceAll(key, "<mark>" + key + "</mark>");
					
					list.setTitle(tmpTitle);
					list.setWriter(tmpWriter);
					
				}else
				{
					list.setTitle( rs.getString("title"));
					list.setWriter( rs.getString("writer"));					
				}				
				
				
				list.setHead(rs.getString("head"));
				list.setYmd( rs.getDate("ymd") );
				list.setHms( rs.getTime("hms") );
				list.setSpace(rs.getString("thread").length());  // Thread의 길이만큼 읽어옴
				list.setHit(rs.getInt("hit") );  
				
				
				System.out.println("[DEBUG1] title = "+ rs.getString("title") + ", writer = " + rs.getString("writer") );				
				
			}// while
			
			
			// row카운트 계산
			sql = String.format("select count(*) as maxcount from bbs where bid='%s'", bid);
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			rs.next();
			
			list.setDataCount(rs.getInt("maxcount"));  // 총몇개인지 들어간다.
			
			int maxpage = (int)Math.ceil(rs.getInt("Maxcount") / line);
			list.setMaxPage(maxpage);
						
			
			/* 읽기 쓰기 권한에 관련된 rlevel wlevel 값을 결정해줘야함. */
			sql = String.format("select * from bbsmanager where idx='%s'", bid);
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				list.setWlevel(rs.getInt("wlevel"));
				list.setRlevel(rs.getInt("rlevel"));				
			}
			
			
			
						
			if( !rs.next() )  // next가 없으면
			{
				list.setLastpage(true);  // true 있으면 false(default)				
			}		
						
			System.out.println("[DEBUG2] lastpage = " + list.isLastpage());
				
			/* resource release into connection pool */
			//
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(Exception e){
			System.out.print("ERROR REASON : " + e.getMessage() + "<br>");  
			// ; syso 이므로 콘솔에 출력
			
		}
		
		
		
		return list;
		
	}// readDB(int upperIdx) Method
	
}// MAIN Class











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
@WebServlet("/BBSInput")
public class BBSInput extends HttpServlet {
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
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
			
			/* Multipart/form-data ; 파일첨부할때 null 처리 되지 않기 위함. */
			//
			// 첨부파일 처리 시작
			//
			String savePath = "data/bbs" ;
			String uploadFilePath = getServletContext().getRealPath(savePath);			
			// ; 실제 real path
			System.out.println("[DEBUG] Path = " + uploadFilePath);
			
			
			int uploadFileSizeLimit = 30 * 1024 *  1024 ; // 30 MB 메가바이트
			String encType = "utf-8";  // 파일이름이 한글이 있을 수 있기 때문에
			
			MultipartRequest multi = new MultipartRequest(
										request,
										uploadFilePath,
										uploadFileSizeLimit,
										encType,
										new DefaultFileRenamePolicy()
					);
			String serverFileName1 = multi.getFilesystemName("upfile1"); // db에 저장되는 파일 이름
			//String originalFileName1 = multi.getOriginalFileName("upfile1");
			
			String serverFileName2 = multi.getFilesystemName("upfile2"); // db에 저장되는 파일 이름
			//String originalFileName2 = multi.getOriginalFileName("upfile2");
			//
			// title, writer, html 처리를 해줘야함
			//
			Enumeration params = multi.getParameterNames();
			String title = "";
			String writer = "";
			String html = "";
			
			

			//추가되는 항목
			String bid = "";
			String notice = "";
			String head = "";
			String pass = "";
			String idx="";
			
			while(params.hasMoreElements())  // 찾아오는 코드들
			{
				String tmpName = null;
				
				tmpName = (String) params.nextElement();
				
				if( tmpName.equals("title") )
				{
					title = multi.getParameter(tmpName);
				}
				if( tmpName.equals("writer") )
				{
					writer = multi.getParameter(tmpName);
				}
				if( tmpName.equals("html") )
				{
					html = multi.getParameter(tmpName);
				}
				
				// 추가된 부분 추가해주기.
				if(tmpName.equals("head"))
				{
					head = multi.getParameter(tmpName);
				}
				if(tmpName.equals("bid"))
				{
					bid = multi.getParameter(tmpName);
				}
				if(tmpName.equals("notice"))
				{
					notice = multi.getParameter(tmpName);
				}
				if(tmpName.equals("pass"))
				{
					pass = multi.getParameter(tmpName);
				}
				if(tmpName.equals("idx"))
				{
					idx = multi.getParameter(tmpName);
				}
				
			}// while
						
			System.out.println("[DEBUG] File Info");
			System.out.println("bid = " + bid);
			if(serverFileName1 == null)
				serverFileName1 = "";
			if(serverFileName2 == null)
				serverFileName2 = "";
			
			//
			/* 첨부파일 처리 끝 */			
			
			
			// 답글이면 원본데이터를 가져와서 gid, thread를 결정해줘야한다.
			// idx 유무로 답글 인지아닌지를 확인한다.
			//
			int gid = 0;
			String thread = "A";  // for 댓글
			
			if ( idx.equals("") )
			{
				// 새글 -> gid 받아오기
				//
				String gidSql = "select max(gid) + 1 as newgid from bbs";  // bid가 어디가 됐든 관계없이 최대값 찾아오는 쿼리
				pstmt = conn.prepareStatement(gidSql);
				rs = pstmt.executeQuery();  //resultset 은 영향을 안미치므로 Query() 사용
								
				if(rs.next())
				{
					if(Integer.toString(rs.getInt("newgid")) == null)
					{
						gid = 1;  // null 이면 (처음이 없으면) 1;
					}else
					{
						gid = rs.getInt("newgid");
					}
				}else
				{
					System.out.println("[DEBUG] Fail ResultSet");
				}
				
			}else{
				// 답글 -> 원본글 찾아와야함.
				String orgSql = "select * from bbs where idx='"+ idx+"'";  // 'idx'
				
				pstmt = conn.prepareStatement(orgSql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) // rs에 값이 존재하면
				{
					gid = rs.getInt("gid");  // gid를 찾아와서 재정의
					String orgThread = rs.getString("thread");
					
					// 새로운 Thread 를 결정해주면된다.
					//
					String threadSql = "select thread as result_thread, right(thread, 1) as result_right from bbs where gid='"+gid+"' and length(thread) = length('"+orgThread+"') +1 and locate('"+orgThread+"', thread)=1 order by thread DESC limit 1 ";
					// ; orgThread 가 한글자(A)보다 많은 오른쪽 값을 찾아오는 쿼리
					pstmt = conn.prepareStatement(threadSql);
					ResultSet rs1 = pstmt.executeQuery();
					
					if (rs1.next())
					{
						String heads = rs1.getString("result_thread").substring(0, rs1.getString("result_thread").length()-1);
						String foot = rs1.getString("result_right");
						char tmpLast = foot.charAt(0);
						String tail = ++tmpLast + "";
						thread = heads + tail;
						// ; result_right 를 foot으로 찾아와서 char로 받아와서 ++ 시키고 해드에 붙인다. 
					}else
					{
						thread = orgThread + "A";  // 없을때는 원본 + A
					}
										
				}//if
				
			}// if			
			
			
			if(notice.equals("on"))  // 체크가 되어있는것
			{
				notice = "1";
			}else  // 체크 안되면
			{
				notice = "0";
			}
			
			
			
						
			String sql = String.format("insert into bbs (title, writer, html, ymd, hms, file1, file2, head, notice, gid, thread, bid) values('%s', '%s', '%s', now(), now(), '%s', '%s', '%s', '%s','%d', '%s', '%s' )", title, writer, html, serverFileName1, serverFileName2, head, notice, gid, thread, bid );			
			pstmt = conn.prepareStatement(sql);
			System.out.println("[DEBUG] sql = " + sql);
			int affectedCount = pstmt.executeUpdate();  // 영향을 받을 갯수
			
			
			// bbsResult.jsp 에서 결과를 알고 싶다.			
			if ( affectedCount < 1 )
			{  // 1보다 작으면 error
				request.setAttribute("dbResult", "FAIL");
				request.setAttribute("dbResultMsg", "데이터 등록 실패");
			}else
			{  // 그렇지 않으면 성공
				request.setAttribute("dbResult", "SUCCESS");
				request.setAttribute("dbResultMsg", "데이터 등록 성공.!!");
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











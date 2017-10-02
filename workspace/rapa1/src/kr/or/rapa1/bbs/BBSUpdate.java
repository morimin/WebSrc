package kr.or.rapa1.bbs;

import java.io.File;
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
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BBSMakeList
 */
@WebServlet("/BBSUpdate")
public class BBSUpdate extends HttpServlet {
	String bid;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ; hidden 으로 오기 때문에 Post로 처리
		
		response.setContentType("text/html; charset=utf-8");		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");


		/* 처리순서 */
		// Update 할때는 원본 데이터를 가져와야 함. 불필요한 파일을 정리하기 위함.
		//
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
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
			String savePath = "data/bbs";  // 첨부파일에 대한 위치
			String uploadFilePath = getServletContext().getRealPath(savePath);
			// ; 실제 real path
			
			System.out.println("[DEBUG] Path = " + uploadFilePath);
			
			int uploadFileSizeLimit = 30 * 1024 * 1024; // 30 MB 메가바이트
			String encType = "utf-8";  // 파일이름이 한글이 있을 수 있기 때문에
			
			MultipartRequest multi = new MultipartRequest( 
										request,
										uploadFilePath,
										uploadFileSizeLimit,
										encType,
										new DefaultFileRenamePolicy()
									);
			// ; 파일 업로드
			
			String serverFileName1 = multi.getFilesystemName("upfile1");  // db에 저장되는 파일 이름
			String originalFileName1 = multi.getOriginalFileName("upfile1");
			
			String serverFileName2 = multi.getFilesystemName("upfile2");  // db에 저장되는 파일 이름
			String originalFileName2 = multi.getOriginalFileName("upfile2");
			
			
			/* title, writer, html 처리를 해줘야함 */
			//
			Enumeration params = multi.getParameterNames();
			String title = "";
			String writer = "";
			String html = "";
			String delfile1 = "";
			String delfile2 = "";
			String idx = "";
			
			//추가
			bid="";
			String head= "";
			String notice = "";
			String pass = "";
			
			
			
			while(params.hasMoreElements())
			{
				String tmpName = null;
				
				tmpName = (String) params.nextElement();
				
				if(tmpName.equals("title"))
				{
					title = multi.getParameter(tmpName);
				}
				if(tmpName.equals("writer"))
				{
					writer = multi.getParameter(tmpName);
				}
				if(tmpName.equals("html"))
				{
					html = multi.getParameter(tmpName);
				}
				if(tmpName.equals("delfile1"))
				{
					delfile1 = multi.getParameter(tmpName);
				}
				if(tmpName.equals("delfile2"))
				{
					delfile2 = multi.getParameter(tmpName);
				}
				if(tmpName.equals("idx"))
				{
					idx = multi.getParameter(tmpName);
				}		
				if(tmpName.equals("bid"))
				{
					bid = multi.getParameter(tmpName);
				}	
				if(tmpName.equals("head"))
				{
					head = multi.getParameter(tmpName);
				}	
				if(tmpName.equals("notice"))
				{
					notice = multi.getParameter(tmpName);
				}	
				if(tmpName.equals("pass"))
				{
					pass = multi.getParameter(tmpName);
				}				
				
			}// while
			
			if(serverFileName1 ==null) serverFileName1="";
			if(serverFileName2 ==null) serverFileName2="";
			
			if(notice.equals("on")) notice ="1"; else notice = "0";
			
			
			
			System.out.println("[DEBUG] File Info");
			System.out.println("serverFileName1 = " + serverFileName1);
			System.out.println("serverFileName2 = " + serverFileName2);
			// ; 실제 파일 이름
			//
			//
			/* 첨부파일 처리 끝 */
			//
			
			
			//delfile1, delfile2 이런거 영향을 받아서 원본 삭제여부 판단.
			String orgSql = String.format("select * from bbs where idx='%s'", idx);
			pstmt = conn.prepareStatement(orgSql);
			rs = pstmt.executeQuery();  // select 는 영향을 안받음.
			
			System.out.println("[DEBUG] orgSql = " + orgSql);
			
			if(!rs.next())
			{
				// error
			}
			
			
			int delFileFlag1 = 0;
			
			if(rs.getString("file1") != "" && delfile1.equals("on"))  // file1 이 있으면서 (원본글에 파일이 있다) 체크가 되어있다. 
			{  // 원본글 삭제
				
				delFileFlag1 = 1;
				if(serverFileName1 == null )
				{
					// 원본이 존재 하면서, 삭제체크 하면서, 새 첨부 안됐다. => 원본만 삭제.!! 
				}else
				{
					// 원본존재 + 삭제체크 + 파일 첨부 => 원본 삭제 후 새 파일 첨부.!!
				}
			}
			if(rs.getString("file1") != "" && !delfile1.equals("on"))  // file1 이 있으면서 (원본글에 파일이 있다) 체크가 안되어있다. 
			{  // 새로 첨부가 되어있으면 삭제
				if(serverFileName1== null)  // 첨부가 되었다
				{  // 원본 삭제			
					serverFileName1 = rs.getString("file1");  // 원본글로 집어넣어라 
				}else
				{						
					delFileFlag1 = 1;					
				}
			}
			
			if(delFileFlag1 == 1)
			{
				String fileName = rs.getString("file1");
				// ; 이 파일을 삭제해줄 예정이므로 file1에서 가져온 값을 변수로 잡는다.
				String fn = uploadFilePath + "\\" + fileName;
				// ; uploadFilePath 가 실제 위치
				File f = new File(fn);
				if(f.exists())  // f가 존재한다면
				{
					f.delete();  // f삭제
				}
				
			}//if
			
			System.out.println("[DEBUG] delFileFlag1 = " + delFileFlag1);
			
			int delFileFlag2 = 0;
			
			if(rs.getString("file2") != "" && delfile2.equals("on"))  // file2 이 있으면서 (원본글에 파일이 있다) 체크가 되어있다. 
			{  // 원본글 삭제
				delFileFlag2 = 1;
				if(serverFileName2 == null)
				{
					// 원본이 존재 하면서, 삭제체크 하면서, 새 첨부 안됐다. => 원본만 삭제.!! 
				}else
				{
					// 원본존재 + 삭제체크 + 파일 첨부 => 원본 삭제 후 새 파일 첨부.!!
				}
			}
			if(rs.getString("file2") != "" && !delfile2.equals("on"))  // file2 이 있으면서 (원본글에 파일이 있다) 체크가 안되어있다. 
			{  // 새로 첨부가 되어있으면 삭제	
				if(serverFileName2 == null)  // 첨부가 되었다
				{   // 원본 삭제
					delFileFlag2 = 1;
				}else  // 원본 존재 + 삭제체크X + 새파일첨부X => 원본글
				{					
					serverFileName2 = rs.getString("file2");					
				}
			}// if
			
			if(delFileFlag2 == 1)
			{
				String fileName = rs.getString("file2");
				// ; 이 파일을 삭제해줄 예정이므로 file2에서 가져온 값을 변수로 잡는다.
				String fn = uploadFilePath + "\\" + fileName;
				// ; uploadFilePath 가 실제 위치
				
				File f = new File(fn);
				if(f.exists())  // f 가 존재한다면
				{
					f.delete();  // f 삭제
				}				
			}
			
			System.out.println("[DEBUG] delFileFlag2 = " + delFileFlag2);
			
			
			if(serverFileName1 == null)
				serverFileName1 = "";
			if(serverFileName2 == null)
				serverFileName2 = "";
			
			
			
			String sql = String.format("update bbs set title='%s', writer='%s', html='%s', file1='%s', file2='%s', idx='%s', head='%s', notice='%s' where idx='%s' " , title, writer, html, serverFileName1, serverFileName2, idx, head, notice);
			
			pstmt = conn.prepareStatement(sql);
			System.out.println("[DEBUG] sql = "+ sql );
			int affectedCount = pstmt.executeUpdate();  // 영향을 받을 갯수
			
			
			// bbsResult.jsp 에서 결과를 알고 싶다.	
			//
			if(affectedCount <1)
			{  // 1보다 작으면 error
				request.setAttribute("dbResult", "FAIL");
				request.setAttribute("dbResultMsg", "데이터 변경 실패입니다.");
			}else
			{  // 그렇지 않으면 성공
				request.setAttribute("dbResult", "SUCCESS");
				request.setAttribute("dbResultMsg", "데이터 변경 성공입니다.");
				request.setAttribute("nextURL", "main.jsp?CMD=bbsView.jsp?idx="+idx+"&bid"+bid);
				// 이동하는 페이지에 bid도 같이 이동되어야 하기 때문에 bid를 추가해줬다.
			}
			
			
			/* resource release into connection pool */
			//
			//rs.close();
			pstmt.close();
			conn.close();
			
		}catch(Exception e)
		{
			request.setAttribute("dbResult", "FAIL");
			request.setAttribute("dbResultMsg", "변경중 예외발생");
			System.out.print("Error Reason : " + e.getMessage() + "<br>");
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("main.jsp?CMD=bbsResult.jsp?bid"+bid);  // 수정되면서 그 게시판으로 이동시키기 위함.
		rd.forward(request, response);
		
	}// doPost Method
	
	
	/* 한글깨짐을 유니코드로 바꿔주는 메소드 */
	public String  toUnicode(String str)
	{
		if( str == null )
			return null;
		
		try {
			byte[] b = str.getBytes("ISO-8859-1");
			return new String(b);
		}catch(Exception e)
		{
			return null;
		}
	}// Unicode Method
}// MAIN Class

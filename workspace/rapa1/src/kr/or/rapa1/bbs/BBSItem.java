package kr.or.rapa1.bbs;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BBSItem {
	private int idx;
	private String title;
	private String html;
	private String writer;
	private Date ymd;
	private Time hms;
	private String file1;
	private String file2;
	

	private int hit;
	private String head;
	
	
	
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	
	
	
	
	/* idx */
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	/* title */
	public String getTitle() {		
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	/* html */
	public String getHtml() {
		// TODO : blob 요소는 한글 깨짐 현상을 처리해줘야한다.
		//return html;
		
		return toUnicode(html);  // 이렇게 해야 깨짐 방지
	}
	public void setHtml(String html) {
		this.html = html;
	}
	
	/* writer */
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	/* ymd */
	public Date getYmd() {
		return ymd;
	}
	public void setYmd(Date ymd) {
		this.ymd = ymd;
	}
	
	/* hms */
	public Time getHms() {
		return hms;
	}
	public void setHms(Time hms) {
		this.hms = hms;
	}	
	
	/* file1 */
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	
	/* file2 */
	public String getFile2() {
		return file2;
	}
	public void setFile2(String file2) {
		this.file2 = file2;
	}
	
	
	
	public void readDB()  // idx 값을 입력해주면 DB에서 쿼리되도록 설정
	{  
		
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
			String sql;
			// 읽기 수행했으므로, hit값을 증가
			//
			sql = String.format("update bbs set hit=hit +1 where idx='%d'", this.idx);
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();			
			
			
			
			sql= String.format("select * from bbs where idx = '%d'", this.idx);	
			// ; idx 가 키 값이므로 while 문 대신 if 문 사용
			
			
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			
			
			if( rs.next() )  // 값을 채워주는 역할
			{
				this.title = rs.getString("title");
				this.html = rs.getString("html");				
				
				this.html = this.html.replaceAll("\n", "<br>");  // \n 을 <br> 태그로 바꾼다.
				
				
				this.writer = rs.getString("writer");
				this.ymd  = rs.getDate("ymd");
				this.hms = rs.getTime("hms");
				this.file1 = rs.getString("file1");
				this.file2 = rs.getString("file2");
				
				this.hit = rs.getInt("hit");
				this.head = rs.getString("head");
				
			}// while -> If
			
			System.out.println("[DEBUG] title = "+this.title + ", name = " + this.writer);
			// ; 디버그 가 필요할때 콘솔에서 보기 위함.			
				
			/* resource release into connection pool */
			//
			rs.close();
			pstmt.close();
			conn.close();
			
		}catch(Exception e){
			System.out.print("ERROR : " + e.getMessage() + "<br>");  
			// ; syso 이므로 콘솔에 출력
		}
		
	}// readDB Method
	
	
	/* 한글깨짐을 유니코드로 바꿔주는 메소드 */
	public String toUnicode(String str)
	{
		if( str == null ) return null;
		
		try {
			byte[] b = str.getBytes("ISO-8859-1");
			return new String(b);
		} catch (Exception e) {
			return null;
		}
		
	}// Unicode Method
		
	
}// BBSItem Class














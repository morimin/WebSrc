<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	
	
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
		

	String sql = null;

	sql = String.format("select * from bbsgroup where useflag='1' order by odr asc");
	/* sql = "select * from bbsgroup where useflag='1' order by bbsgroup.odr asc"; */
	// ; 사용하는거(useflag)만 가져와서 odr 순으로 정리
	
	pstmt = conn.prepareStatement(sql);
	System.out.println("[DEBUG 1] sql = " + sql);
	rs = pstmt.executeQuery(); 
	
	List<String> listGroupTitle = new ArrayList<String>();
	List<Integer> listGidx = new ArrayList<Integer>();

	
	while( rs.next() )
	{
		listGroupTitle.add(rs.getString("title"));
		listGidx.add(rs.getInt("gidx"));		
	}// while
		
	request.setAttribute("listGroupTitle", listGroupTitle);	
	request.setAttribute("listGidx", listGidx);
	
	request.setAttribute("groupSize", listGroupTitle.size());
	
	
	//게시판 매니지에서 정보를 다 가져와야 한다.
	
	sql="select * from bbsmanager where useflag='1' order by odr asc";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	
	// 메뉴 구성을 위해서는 타이틀 인덱스 그룹 만 있으면 됨
	// 그렇지만, head 는 오른쪽 화면에서 이용할 목적이다.
	
	List<String> listTitle = new ArrayList<String>();
	// ; 화면에 보여줄
	List<String> listHead = new ArrayList<String>();
	List<Integer> listIdx = new ArrayList<Integer>();
	// ; 링크에 걸어줄
	List<Integer> listGrp = new ArrayList<Integer>();
	
	
	
	while( rs.next() )
	{
		listTitle.add(rs.getString("title"));
		listHead.add(rs.getString("head"));
		listGrp.add(rs.getInt("grp"));
		listIdx.add(rs.getInt("idx")); // ; bid 로 사용되는 녀석
		
		
	}// while
		
	request.setAttribute("listTitle", listTitle);
	request.setAttribute("listHead", listHead);	
	request.setAttribute("listGrp", listGrp);
	request.setAttribute("listIdx", listIdx);
	
	request.setAttribute("bbsSize", listTitle.size());
	
		
	/* resource release into connection pool */
	//
	//rs.close();						
	pstmt.close();
	conn.close();
	
	}
	catch(Exception e){
		System.out.println("[DEBUG 111]"+ e.getMessage()+"<br>");
	}
	
	
	
%> 

bbsMenu.jsp 파일임 <br>
<!-- 그룹에 대한 정보를 가져와서 펼치기 형식으로 만들어줘야함<br> -->

<c:if test="${groupSize gt 0 }">	
	<table border = 1 width="90%" >
		<c:forEach var="i" begin="0" end="${groupSize - 1}" >
			<tr height = 30>
				<td>
					${listGroupTitle[i] }				
				</td>
			</tr>		
			
			<c:if test="${bbsSize gt 0 }">
				<c:forEach var="j" begin="0" end="${bbsSize -1 }">
					<c:if test="${listGrp[j] eq listGidx[i] }" >
						<tr height=20>
							<td align="right" >
								<a href="main.jsp?CMD=bbslist?bid=${listIdx[j] }"> ${listTitle[j] }</a> 
							</td>
						</tr>					
					</c:if>				
				</c:forEach>			
			</c:if>			
		</c:forEach>		
	</table>
</c:if>
















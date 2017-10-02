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
	
	List<String> menuList = new ArrayList<String>();

	menuList.add("Dummy");  // 리스트는 순서가 0번부터 시작되기때문에 의미없이 만듬.
	menuList.add("그룹관리");
	menuList.add("게시판등록");
	menuList.add("게시판목록");
	
	pageContext.setAttribute("menuList", menuList);
	pageContext.setAttribute("menuListSize", menuList.size());
	
	String sub = request.getParameter("sub");
	
	if(sub ==null) sub = "1";
	
	request.setAttribute("sub", sub);
	// pageContext.setAttribute 나 request.setAttribute 이나 거의 차이없다.
	
	
	/* sub ==1 일때 목록을 수집해보겠다. */
	//
	/* DB접속 */
	//
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;		

	
	Context initContext = new InitialContext();
	Context envContext = (Context) initContext.lookup("java:/comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/rapadb1_pool");
	// ; Context 내부를 읽어오면서 rapadb1_pool 을 찾아서 가져온다.
	
	
	/* get connection */
	//
	conn = ds.getConnection();			
		
	if ( sub.equals("1") )
	{
		String sql = null;
		
		sql = "select max(odr) +1 as maxodr from bbsgroup";
		// ; 최고 큰값 +1 값으로 재정의
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery(); 
		// ; 쿼리 수행후 재정의
		
		if (rs.next())
		{
			String tmp = Integer.toString(rs.getInt("maxodr"));
			// ; 숫자를 문자로 바꿔서 tmp 재정의
			if ( tmp.equals("0"))
			{
				tmp = "1";  // default 로 1
			}// if
			
			request.setAttribute("newodr", tmp);					
			
		}// if
		
		
		sql = String.format("select * from bbsgroup order by odr asc");			
		pstmt = conn.prepareStatement(sql);
		System.out.println("[DEBUG] sql = " + sql);
		rs = pstmt.executeQuery(); 
		
		List<String> listTitle = new ArrayList<String>();
		List<Integer> listOdr = new ArrayList<Integer>();
		List<Integer> listUseflag = new ArrayList<Integer>();
		List<Integer> listIdx = new ArrayList<Integer>();
		
		while( rs.next() )
		{
			listTitle.add(rs.getString("title"));
			listOdr.add(rs.getInt("odr"));
			listUseflag.add(rs.getInt("useflag"));
			listIdx.add(rs.getInt("gidx"));
			
		}// while
			
		request.setAttribute("listTitle", listTitle);
		request.setAttribute("listOdr", listOdr);
		request.setAttribute("listUseflag", listUseflag);
		request.setAttribute("listIdx", listIdx);
		
		request.setAttribute("groupSize", listTitle.size());
					
		
	}// if	
	
	
	if ( sub.equals("2") )
	{
		String sql = "select * from bbsgroup order by odr asc";  
		// ; 그룹정보를 일단 가져온다.
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		List<String> listTitle = new ArrayList<String>();
		// ; 그룹의 제목을 가져오는 배열
		List<Integer> listIdx = new ArrayList<Integer>();
		// ; 그룹에 있는 인덱스를 가져옴
		
		while( rs.next() )
		{
			listTitle.add(rs.getString("title"));			
			listIdx.add(rs.getInt("gidx"));			
		}// while
			
		request.setAttribute("listTitle", listTitle);		
		request.setAttribute("listIdx", listIdx);
		
		request.setAttribute("groupSize", listTitle.size());	
		
		String idx =request.getParameter("idx");
		if( idx != null) // null 아님 = 수정하기
		{  //  변경하기 위한 원본데이터를 수집
			
			sql = "select * from bbsmanager where idx='"+idx+"' ";
			pstmt = conn.prepareStatement(sql);  // query
			rs = pstmt.executeQuery();
			
			if ( rs.next())
			{
				request.setAttribute("orgTitle", rs.getString("title"));
				request.setAttribute("orgHead", rs.getString("head"));
				request.setAttribute("orgGrp", rs.getInt("grp"));
				request.setAttribute("orgOdr", rs.getInt("odr"));
				request.setAttribute("orgUseflag", rs.getInt("useflag"));
				request.setAttribute("orgRlevel", rs.getInt("rlevel"));
				request.setAttribute("orgWlevel", rs.getInt("wlevel"));
				request.setAttribute("orgLine", rs.getInt("line"));				
				
			}// if			
		}// if		
	}// if
	
	
	
	if ( sub.equals("3") )
	{
		String sql = "select *, bbsgroup.title from bbsmanager, bbsgroup where bbsmanager.grp = bbsgroup.gidx order by grp asc, bbsmanager.odr asc";  
		// ; bbsgroup 에서 bbstitle 가져오고 manager에서는 * 을 일단 가져온다.
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		List<String> listTitle = new ArrayList<String>();
		// ; 그룹에 있는 제목을 가져오는 배열
		List<String> listGrpTitle = new ArrayList<String>();
		// ; 그룹타이틀
		List<Integer> listIdx = new ArrayList<Integer>();
		// ; 그룹에 있는 인덱스를 가져옴
		List<Integer> listOdr = new ArrayList<Integer>();		
		// ; 그룹의 순서
		List<Integer> listUseflag = new ArrayList<Integer>();
		
		
		while( rs.next() )
		{
			listTitle.add(rs.getString("title"));
			listGrpTitle.add(rs.getString("bbsgroup.title"));  // ; for group title	
			listOdr.add(rs.getInt("odr"));			
			listUseflag.add(rs.getInt("Useflag"));
			listIdx.add(rs.getInt("idx"));
		}// while
			
		request.setAttribute("listTitle", listTitle);
		request.setAttribute("listGrpTitle", listGrpTitle);		
		request.setAttribute("listIdx", listIdx);
		request.setAttribute("listOdr", listOdr);
		request.setAttribute("listUseflag", listUseflag);
		
		request.setAttribute("bbsSize", listTitle.size());		
		
	}// if
	
	
	
		
	/* resource release into connection pool */
	//
	//rs.close();						
	pstmt.close();
	conn.close();	
	
%> 




<c:if test="${sessionScope.sessLevel ne 9}">
<%-- <c:if test="${sessionScope.sessLevel ne 9 or empty sessionScope.sessId }">  --%>
	<script>
		alert('관리자 전용 메뉴입니다.');
		location.href='main.jsp';
	</script>
</c:if>

<table border=1>
	<tr height=30>
		<c:forEach var="i" begin="1" end="${menuListSize-1 }">
		
			<c:if test="${sub eq i }">			
				<td width=150 align=center bgcolor="#ABCDEF"><a href="main.jsp?CMD=manBBS.jsp?sub=${i }">${menuList[i] } </td>
			</c:if>
			<c:if test="${sub ne i }">
				<td width=150 align=center bgcolor="#EEEEEE"><a href="main.jsp?CMD=manBBS.jsp?sub=${i }">${menuList[i] } </td>
			</c:if>
		
		</c:forEach>	
	</tr>
</table> <br><br>


<c:if test="${sub eq 3 }">
	<c:if test="${bbsSize gt 0 }">
		<table border=1>
			<tr height=30>
				<td>그룹</td>
				<td>순서</td>
				<td>게시판이름</td>
				<td>사용여부</td>
				<td>비고</td>				
			</tr>		
			
			<c:forEach var="i" begin="0" end="${bbsSize -1 }">
				<tr height=30>
					<td>${listGrptitle[i] }</td> <!-- 그룹 -->
					<td>${listOdr[i] }</td> <!-- 순서 -->
					<td>${listTitle[i] }</td> <!-- 게시판이름 -->
					<td>
						<c:if test="${listUseflag[i] eq 1}">
							YES
						</c:if>
						<c:if test="${listUseflag[i] ne 1}">
							--
						</c:if>
					</td>
					<td>
						<input type ="button" value="수정" onClick="location.href='main.jsp?CMD=manBBS.jsp?sub=2&idx=${listIdx[i]}' ">
					</td> <!-- 비고 -->
				</tr>		
			</c:forEach>		
			
		</table>	
	</c:if>
</c:if> 


<c:if test="${sub eq 2 }">
	<c:if test="${!empty param.idx }"> <!-- idx 값이 있으므로 수정 -->
		<c:set var="actionName" value="수정" />
		<c:set var="actionURL" value="BBSUpdateManager" />
	</c:if>
	
	<c:if test="${empty param.idx }"> <!-- idx 값이 없으므로 등록 -->
		<c:set var="actionName" value="등록" />
		<c:set var="actionURL" value="BBSInsertManager" />
	</c:if>

	<form method=post action="${actionURL }">
		<input type=hidden name=idx value="${param.idx }">
		<table border=1>
			<tr height =30>
				<td colspan=4>게시판 ${actionName } </td>
			</tr>
			<tr>
				<td>제목</td>
				<td> <input type = "text" name = "title" placeholder="제목입력" value="${orgTitle }" required> </td>
				<td>그룹</td>
				<td>
					<select name = "grp">
						<option value="0"> == 선택 ==</option>
						
						<c:if test="${groupSize gt 0 }">
							<c:forEach var="i" begin="0" end="${groupSize -1 }">
								<c:if test="${orgGrp eq listIdx[i] }">
									<option value="${listIdx[i] }" selected>${listTitle[i] }</option>									
								</c:if>
								
								<c:if test="${orgGrp ne listIdx[i] }">
									<option value="${listIdx[i] }">${listTitle[i] }</option>
									<!-- 가져오는건 Idx i 번재값 이고 화면에 보여줄때는 Title i 번째 값 -->
								</c:if>
								
								
							
							</c:forEach>						
						</c:if>
											
					</select>					
				</td>
			</tr>
			<tr height=30>
				<td > 머리글 </td>
				<td colspan=3><input type="text" name=head value="${orgHead }"></td>
			</tr>
			<tr height=30>
				<td>순서</td>
				<td><input type="text" name="odr" required value="${orgOdr }"></td>
				<td>사용</td>
				<td>
					
					<c:if test="${orgUseflag eq 0}">
						<input type = "radio" name=useflag value='1' > Y &nbsp; &nbsp;
						<input type = "radio" name=useflag value='0' checked> N
					</c:if>
					<c:if test="${orgUseflag ne 0}">
						<input type = "radio" name=useflag value='1' checked> Y &nbsp; &nbsp;
						<input type = "radio" name=useflag value='0' > N
					</c:if>
				
				
					
				</td>				
			</tr>
			<tr height=30>
				<td>읽기레벨</td>
				<td> <input type = "text" name="rlevel" value="${orgRlevel }"></td>
				<td>쓰기레벨</td>
				<td><input type = "text" name="wlevel" value="${orgWlevel }"></td>			
			</tr>
			<tr>
				<td>라인수</td>
				<td><input type="text" name="line" required value="${orgLine }"></td>
				<td colspan=2><input type=submit value="등록" value="${actionName }"></td>
			</tr>		
		</table>	
	</form> <br><br>	
	<!-- This part is under the table on sub2 HERE -->	
</c:if>




<c:if test="${sub eq 1 }">
	<form name =gForm method=post  action="BBSInsertGroup">
	<!-- ; onSubmit="return checkError()" 대신 타이틀 입력 옆에 required 를 입력해도 된다. -->
		<table border=1>
			<tr height = 30 >
				<td colspan=4> 그룹 등록</td>
			</tr>
			<tr height = 30>
				<td> 타이틀 </td>
				<td> <input type ="text" name="title" placeholder="타이틀입력" required></td>
				<td> 사용여부 </td>
				<td> <input type="radio" name = useflag value="1" checked>Y &nbsp; &nbsp;
					 <input type="radio" name = useflag value="0" >N 
			</tr>
			
			<tr height = 30>
				<td> 순서 </td>
				<td> <input type ="text" name=odr value="${newodr }" required></td>
				<td colspan=2>
					<input type=submit value="등록">
			</tr>
			
			
		</table>	
	</form>	
	
	목록을 보여주기...<br><br>
	
	<c:if test="${groupSize gt 0 }">
		<table border =1>
			<tr height=30>
				<td> 순서 </td>
				<td> 타이틀 </td>
				<td> 사용 </td>
				<td> 비고 </td>				
			</tr>
			
			<c:forEach var="i" begin="0" end="${groupSize -1 }">
				<form method=post action="BBSUpdateGroup">
				<input type=hidden name=gidx value="${listIdx[i] }">
					<tr height=30>
						<td> <input type="text" name="odr" value="${listOdr[i] }" style='width:30px;'> </td>
						<td> <input type="text" name="title" value="${listTitle[i]}" style='width:150px;'}> </td>
						<td> 
							<c:if test="${listUseflag[i] eq 1 }">
								<input type="radio" name = useflag value="1" checked>Y &nbsp; &nbsp;
						 		<input type="radio" name = useflag value="0" >N
							</c:if>
							<c:if test="${listUseflag[i] ne 1 }">
								<input type="radio" name = useflag value="1" checked>Y &nbsp; &nbsp;
						 		<input type="radio" name = useflag value="0" >N
							</c:if>
						</td>
						<td> 
							<input type = "submit" value = "변경">
						</td>				
					</tr>
				</form>
			</c:forEach>
		</table>
	</c:if>	
</c:if>


















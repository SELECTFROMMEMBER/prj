<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>12Wa~</title>
</head>
  
<body>
 <div id="container">    
 <%@ include file="header.jsp" %>
        
<div style="position:absolute;top;100px;left;150px width:145px; float: left; z-index:3;">
 <br><br>
		<li><a onCLick= "location.replace('/gongGoList.do')">지역별</a></li>
		<li onCLick= "location.replace('/gongGoList.do')">업무별</li>
		<li onCLick= "location.replace('/gongGoList.do')">TOP100</li>
</div>
    
   
    
    
  		<br>
  		<br>
  	<center>
                지역별
                <select name="sido1" id="sido1"></select>
                  <select name="gugun1" id="gugun1"></select>
            
                 
                 업종별
                  
                      <select id="industry" name="industry" required>
                          <option value="it">IT</option>
                          <option value="finance">금융</option>
                          <option value="manufacturing">제조업</option>
                      </select>
			            
			     <form>
			        <div style="text-align: center; margin-bottom: 20px;">
			            <input type="text"   name="keyword" class="keyword">
			            <input type="button" value="검색"   class="searchBtn" onclick="search()"></input>
			        </div>
			     </form>
</center>
<br>
<center>
  	<!-- 게시판 목록 출력하기. 시작 -->
	<div id= "wrap" class="gongGoListDiv">
	<table class="gongGoTable" border="0" align="center" style="border-collapse:collapse" cellpadding="10">
	
	<tr>

	<th>기업</th>
	
	<c:if test="${sessionScope.mid!='xyz'}">
		<th width="100">관심도</th>
		<th width="100">등록일</th>
	</c:if>


 
 
   <tr onClick="location.replace('/gongGoLocationListDetail.do')">
    <td>
        <div style="display: flex; align-items: center;">
            <img width="80" src="images/photo-1.jpg" style="margin-right: 10px;">
            <div>
                이름: ABC Company<br>
                학력: 고등학교졸업<br>
                경력: 신입
            </div>
        </div>
    </td>
    <td>1</td>
            <td>2022-12-12</td>
</tr>
	<c:if test="${sessionScope.mid=='xyz'}">
	<!-- 만약 파명 "sort" 의 파값이 비었으면 -->
	<!-- 즉 정렬 의지가 없으면 -->
	<c:if test="${param.sort!='readcount asc' and param.sort!='readcount desc'}">
	<th width="100" style="cursor:pointer" onClick="searchWithSort('readcount desc')"><center>조회수</center></th>
	</c:if>
	
	<!-- 만약 파명 "sort" 의 파값이 'reg_date desc' 면 -->
	<!-- 즉 정렬 의지가 'reg_date desc' 면 -->
	<c:if test="${param.sort=='readcount desc'}">
	<th width="100" style="cursor:pointer" onClick="searchWithSort('readcount asc')">조회수▼</th>
	</c:if>
	
	<!-- 만약 파명 "sort" 의 파값이 'reg_date asc' 면 -->
	<!-- 즉 정렬 의지가 'reg_date asc' 면 -->
	<c:if test="${param.sort=='readcount asc'}">
	<th width="100" style="cursor:pointer" onClick="searchWithSort('')">조회수▲</th>
	</c:if>
	
	<!--============================================================= -->
	<!-- 만약 파명 "sort" 의 파값이 비었으면 -->
	<!-- 즉 정렬 의지가 없으면               -->
	<!--============================================================= -->
	<c:if test="${param.sort!='reg_date asc' and param.sort!='reg_date desc'}">
		<th width="100" style="cursor:pointer" onClick="searchWithSort('reg_date desc')">등록일</th>
	</c:if>
	<!--============================================================= -->
	<!-- 만약 파명 "sort" 의 파값이 'reg_date desc' 면 -->
	<!-- 즉 정렬 의지가 'reg_date desc' 면             -->
	<!--============================================================= -->
	<c:if test="${param.sort=='reg_date desc'}">
		<th width="100" style="cursor:pointer" onClick="searchWithSort('reg_date asc')">등록일▼</th>
	</c:if>
	<!--============================================================= -->
	<!-- 만약 파명 "sort" 의 파값이 'reg_date asc' 면 -->
	<!-- 즉 정렬 의지가 'reg_date asc' 면             -->
	<!--============================================================= -->
	<c:if test="${param.sort=='reg_date asc'}">
		<th width="100" style="cursor:pointer" onClick="searchWithSort('')">등록일▲</th>
	</c:if>
	
	</c:if>
	<!-- <th>등록일</th> -->
	</tr>
	
	<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
	<!-- c코어 태그의 반복문을 게시판 목록을 c코어 태그와 EL 문법을 사용하여 html 태그로 표현하기-->
	<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
	<c:forEach var="board" items="${requestScope.boardList}" varStatus="status">
	
		<tr style="cursor:pointer" onClick="goBoardDetailForm(${board.b_no})">
			<td>${requestScope.boardMap.begin_serialNo_desc-status.index}</td>
			<td>
				<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
				<!-- c코어 태그의 반복문을 사용하여 들여쓰기를 위한 공백 확보하기 			 -->
				<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
				<c:forEach var="no" begin="1" end="${board.print_level}">
					&nbsp;&nbsp;
				</c:forEach>
				<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
				<!-- c코어 태그의 조건문을 사용하여 들여쓰기 레벨이 0보다 크면
				       문자 ㄴ 표현하기 -->
				<!--nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn-->
				<c:if test="${board.print_level>0}">
					ㄴ
				</c:if>
				<!-- EL 문법을 사용하여 1개의 게시판 내용이 들어 있는
						BoardDTO 객체의 멤버변수 subject 안의 내용을 표현하기 -->
				${board.subject}
			</td>
				<!-- 아래로 게시판 정보들이 들어옴 -->
			<td>${board.writer}</td>
			<td><center>${board.readcount}</center></td>
			<td>${board.reg_date}</td>
		</tr>
		
	</c:forEach>
	</table>
</center>  
  
   
  </div> 
  
  		<script src="js/slideshow.js"></script>
	</body>
	<%@include file="/WEB-INF/views/common.jsp" %>
	<%@ include file="footer.jsp" %>
</html>
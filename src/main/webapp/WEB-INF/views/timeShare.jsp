<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html>

<head>
<script>
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
// 상세보기 화면으로 이동하는 
// gotimeShareDetailForm 함수 선언하기
// 매개변수로 게시판의 고유번호가 들어온다.
//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
function gotimeShareDetailForm(b_no){
	
	//----------------------------------
	// name='boardDetailForm' 을 가진 form 태그 후손중에 
	// name='b_no' 가진 태그에 매개변수로 들어온 게시판의 고유번호를 
	// 삽입하기
	//----------------------------------
	$("[name='timeShareDetailForm']").find("[name='b_no']").val(b_no);
	//----------------------------------
	// name='buupListDetailForm' 을 가진 
	// form 태그의 action 에 설정된 URL 주소로 WAS 접속해서 
	// 얻은 새 HTML 를 웹브라우저 열기.
	// 즉 화면 이동하기.
	//---------------------------------- 
	document.timeShareDetailForm.submit();
}
</script>

</head>
<body>
	<div id="container">
		<%@ include file="header.jsp"%>






		<h1 style="text-align: center;">프리랜서</h1>

		<form>
			<div style="text-align: center; margin-bottom: 20px;">
				<input type="text" name="keyword" class="keyword"> <input
					type="button" value="검색" class="searchBtn" onclick="search()"></input>
			</div>
		</form>

		<div id="wrap">
			<table
				style="border: 1px solid black; margin-left: auto; margin-right: auto;">

				<tr>
					<th>임시</th>
					<th>이름</th>
					<th>번호</th>
					<th>선호업무</th>
					<th>희망 근무시간</th>
					<th>작성일</th>
				</tr>


				<c:forEach var="board" items="${requestScope.timeShareList}"
					varStatus="status">
					<tr style="cursor: pointer"
						onClick="gotimeShareDetailForm(${board.b_no});">
						<td>${board.b_no}</td>
						<td>${board.name}</td>
						<td>${board.phone}</td>
						<td>${board.preferred_work}</td>
						<td>${board.start_time}시~${board.end_time}시</td>
						<td>${board.reg_date}</td>
					</tr>
				</c:forEach>

			</table>

			<c:if test="${empty requestScope.timeShareList}">
				<center>
					<b>조회할 데이터가 없습니다.</b>
				</center>
			</c:if>
			<c:if test="${sessionScope.member=='person'}">
				<center>
					<input type="button" value="등록"
						onCLick="location.replace('/timeShareRegForm.do')">
				</center>
			</c:if>
			</form>
		</div>
		<form name="timeShareDetailForm" action="/timeShareDetailForm.do"
			method="post">
			<input type="hidden" name="b_no" class="b_no">
		</form>
	</div>

</body>
<%@ include file="footer.jsp"%>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html>

<head>


</head>
<body>
	<div id="container">
		<%@ include file="header.jsp"%>


		<c:if test="${empty requestScope.boardDTO}">
			<script>
			alert("게시판이 삭제되었습니다.");
			location.replace("/timeShare.do");
		</script>
		</c:if>


		<center>
			<h1 style="text-align: center;">프리랜서 상세보기</h1>
			<form>
				<center>
					<c:if test="${!empty requestScope.boardDTO}">

						<table>

							<tr>
								<th style="height: 40px; width: 200px;">항목</th>
								<th>등록 사항</th>
							</tr>

							<tr>
								<td>이름</td>
								<td>${requestScope.boardDTO.name}</td>
							</tr>

							<tr>
								<td>휴대폰번호</td>
								<td>${requestScope.boardDTO.phone}</td>
							</tr>

							<tr>
								<td>주소</td>
								<td>${requestScope.boardDTO.addr}</td>
							</tr>


							<tr>
								<td>경력</td>
								<td>${requestScope.boardDTO.career}</td>
							</tr>

							<tr>
								<td>근무 시간</td>
								<td>${requestScope.boardDTO.start_time}~
									${requestScope.boardDTO.end_time}</td>
							</tr>


							<!--     <tr> -->
							<!--         <td>보유자격증</td> -->
							<%--          <td>${requestScope.boardDTO.license_name}</td> --%>
							<!--     </tr> -->


							<tr>
								<td>선호업무</td>
								<td>${requestScope.boardDTO.preferred_work}</td>
							</tr>

							<tr>
								<td>내용</td>
								<td>${requestScope.boardDTO.content}</td>
							</tr>

							<input type="hidden" name="b_no" class="b_no">

						</table>


						<span style="cursor: pointer"
							onClick="location.replace('/timeShare.do')">[목록으로]</span>
						<input type="button" value="수정/삭제"
							onclick="document.timeShareUpDelForm.submit();">


						<form name="timeShareDetailForm" action="/timeShareDetailForm.do"
							method="post">
							<input type="hidden" name="b_no"
								value="${requestScope.boardDTO.b_no}">
						</form>

						<form name="timeShareUpDelForm" action="/timeShareUpDelForm.do"
							method="post">
							<input type="hidden" name="b_no"
								value="${requestScope.boardDTO.b_no}">
						</form>

						<form name="timeShareRegForm" action="timeShareRegForm"
							method="post">
							<input type="hidden" name="b_no"
								value="${requestScope.boardDTO.b_no}">
						</form>
			</form>
		</center>
		</c:if>
	</div>
</body>


<%@ include file="footer.jsp"%>
</html>

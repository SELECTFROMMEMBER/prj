<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<div
		style="position: absolute; top; 100 px; left; 150 px width: 145px; float: left; z-index: 3;">
		<br>
		<br>
		<li onClick="pushboardname('freeboard','freedome')">자유 게시판</li>
		<li onClick="pushboardname('newbieboard','newComer')">신입 게시판</li>
		<li onClick="pushboardname('qnaboard','qna')">QnA 게시판</li>
		<li onClick="pushboardname('jobsearchboard','jobReady')">취업 게시판</li>
		<li onClick="pushboardname('interviewboard','interview')">면접 게시판</li>

		<li><input id="joongGosubmenu" type="checkbox" /> <label
			for="joongGosubmenu">중고 게시판</label>
			<ul class="submenu">
				<li><a onClick="pushboardname('tradeboard','joongGo')"> -
						전체</a></li>
				<li><a onClick="pushboardname('tradeboard','joongGo')"> -
						구매</a></li>
				<li><a onClick="pushboardname('tradeboard','joongGo')"> -
						판매</a></li>
			</ul></li>
	</div>


	<form name="freedome" action="/freedome.do" method="post">
		<input type="hidden" name="boardname" class="boardname">
	</form>

	<form name="freedomeDetailForm" action="/freedomeDetailForm.do"
		method="post">
		<input type="hidden" name="Detail_b_no"> 
		<input type="hidden" name="Detail_board">
	</form>

	<form name="freedomeRegForm" action="/freedomeRegForm.do" method="post">
		<input type="hidden" name="b_no" >
	</form>
	
 <form name="freedomeUpDelForm" action="/freedomeUpDelForm.do" method="post">
		<input type="hidden" name="UpDel_b_no" >
		<input type="hidden" name="UpDel_board">
	</form>
	
</body>
</html>
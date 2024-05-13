<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html>

<head>
<script>
	  function pageNoClick( clickPageNo ){

			$("[name='boardSearchForm']").find(".selectPageNo").val(clickPageNo);
			
			search("newComer");
			
		}
		
//		게시판 검색하는 함수 search() 선언.
//		[검색] 버튼 클릭 시 호출되는 함수이다.
// 		function search(){
			
// 			var boardSearchFormObj = $("[name='boardSearchForm']");
			
// 			var keywordObj = boardSearchFormObj.find(".keyword");

// 			var keyword = keywordObj.val();
			
// 			if(typeof(keyword)!='string'){ keyword=""; }
			
// 			keyword = $.trim(keyword);
// 			keywordObj.val(keyword);

// 			boardSearchFormObj.find(".rowCntPerPage").val($("select").filter(".rowCntPerPage").val());
			
// 			alert(boardSearchFormObj.serialize());
// 			$.ajax(
// 				{
// 					url: "/newComer.do"
// 					,type: "post"
// 					,data: boardSearchFormObj.serialize()
// 					,success: function(responseHtml){
// 						var obj = $(responseHtml);
// 						alert(
// 								boardSearchFormObj.serialize()
// 						)
						
// 						$(".newComerListDiv").html(
// 								obj.find(".newComerListDiv").html()
// 						);
// 						$(".pagingNos").html(
// 								obj.find(".pagingNos").html()
// 						);

// 					}
// 					,error: function(){
// 						alert("검색 실패! 관리자에게 문의 바람");
// 					}
// 				}		
// 			);


// 			}
	</script>

</head>
<body>
	<div id="container">
		<%@ include file="header.jsp"%>

		<%@ include file="boardSideCategori.jsp"%>



		<div id="wrap" class="container">
			<h1 style="text-align: center;">신입 게시판</h1>

			<form name="boardSearchForm">
				<div style="text-align: center; margin-bottom: 20px;">
					<input type="text" name="keyword" class="keyword"> <input
						type="button" value="검색" class="searchBtn" onclick="search('newComer')"></input>
					<input type="hidden" name="SelectPageNo" class="SelectPageNo"
						value="1"> <input type="hidden" name="rowCntPerPage"
						class="rowCntPerPage"> <input type="hidden"
						name="boardname" class="boardname" value="newbieboard">
				</div>
			</form>

			<form action="submit.php" method="POST">
				<div class="newComerListDiv">
				<table
					style="border: 1px solid black; margin-left: auto; margin-right: auto;">

					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>닉네임</th>
						<th>작성일</th>
						<th>조회수</th>
						<th>추천수</th>
					</tr>

						<c:forEach var="board" items="${requestScope.newComerList }"
							varStatus="status">
							
							<tr style="cursor: pointer"
								onCLick="goBoardDetailForm(${board.b_no},'newComer', 'newbieboard');">
								<td align="center"> ${requestScope.boardMap.begin_serialNo_desc - status.index}</td>
								<td align="center">${board.subject }</td>
								<td align="center">${board.nickname }</td>
								<td align="center">${board.reg_date }</td>
								<td align="center">${board.read_count }</td>
								<td align="center">${board.rec_count }</td>
							</tr>
						</c:forEach>

				</table>
				</div>
				<center>
					<span class="pagingNos"> 
				<c:if test="${empty requestScope.newComerList }">
					<center>
						<b> 조회할 데이터가 없습니다. </b>
					</center>
				</c:if>
					<span style="cursor: pointer"
						onClick="pageNoClick(1)">[처음]</span> <span style="cursor: pointer"
						onClick="pageNoClick(${requestScope.boardMap.selectPageNo}-1)">[이전]</span>&nbsp;&nbsp;


						<c:forEach var="pageNo"
							begin="${requestScope.boardMap.begin_pageNo}"
							end="${requestScope.boardMap.end_pageNo}">

							<c:if test="${requestScope.boardMap.selectPageNo==pageNo}">
				${pageNo}
			</c:if>

							<c:if test="${requestScope.boardMap.selectPageNo!=pageNo}">
								<span style="cursor: pointer" onClick="pageNoClick(${pageNo})">[${pageNo}]</span>
							</c:if>
						</c:forEach>&nbsp;&nbsp; <span style="cursor: pointer"
						onClick="pageNoClick(${requestScope.boardMap.selectPageNo}+1)">[다음]</span>
						<span style="cursor: pointer"
						onClick="pageNoClick(${requestScope.boardMap.last_pageNo})">[마지막]</span>
						&nbsp;&nbsp;&nbsp;

						[${requestScope.newComerListCnt}/${requestScope.newComerListAllCnt}]개

						&nbsp;&nbsp;
					</span> <select name="rowCntPerPage" class="rowCntPerPage"
						onChange="search('newComer')">
						<option value="10">10
							<option value="15">15
						
						<option value="20">20
					
					</select>행보기 &nbsp;&nbsp;&nbsp;
				</center>
          <center>
								<input type="button" value="등록"
									onCLick="location.replace('/newComerRegForm.do')">
     </center>
      
						</form>
  </div>
       

</body>
<%@ include file="footer.jsp"%>  
</html>

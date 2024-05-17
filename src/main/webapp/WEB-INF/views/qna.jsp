<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  

<!DOCTYPE html>
<html>

<head>
<script>


function pageNoClick( clickPageNo ){

		$("[name='boardSearchForm']").find(".SelectPageNo").val(clickPageNo);
		
		search('qna');
		
	}
	
  </script>
</head>
<body>
     <div id="container">    
  <%@ include file="header.jsp" %>

  <%@ include file="boardSideCategori.jsp" %>



    <div id="wrap" class="container"  >
      <h1 style="text-align: center;">QnA 게시판</h1>
      
     <form name="boardSearchForm">
        <div style="text-align: center; margin-bottom: 20px;">
			<input type="hidden" name="boardname" class="boardname" value="qnaboard">
            <input type="text"   name="keyword" class="keyword">
            <input type="button" value="검색"   class="searchBtn" onclick="search('qna')"></input>
            <input type="hidden" name="SelectPageNo" class="SelectPageNo" value="1">
			<input type="hidden" name="rowCntPerPage" class="rowCntPerPage">
        </div>
     </form>
      
      
      <form action="submit.php" method="POST">
      <div class="qnaListDiv">
          <table style="border:1px solid black;margin-left:auto;margin-right:auto;">
              
              <tr>
                  <th>번호</th>
                    <th>제목</th>
                  <th>닉네임</th>
                  <th>작성일</th>
                  <th>조회수</th>
                  <th>추천수</th>
              </tr>
<!--               <tr onCLick= "location.replace('/qnaDetailForm.do')"> -->

						<c:forEach var="board" items="${requestScope.qnaList }"
							varStatus="status">

							
								<tr style="cursor: pointer" onClick="goBoardDetailForm(${board.b_no},'qna', 'qnaboard', 'qna');">
									<td align="center"> ${requestScope.boardMap.begin_serialNo_desc - status.index}</td>
									<td align="center">${board.subject}</td>
									<td align="center">${board.nickname}</td>
									<td align="center">${board.reg_date}</td>
									<td align="center">${board.read_count}</td>
									<td align="center">${board.rec_count}</td>
								</tr>
						</c:forEach>

					</table>
      	</div>
				<center>
					<span class="pagingNos"> 
          <c:if test="${empty requestScope.qnaList }">
			              <center>
			              	<b>
			              	조회할 데이터가 없습니다.
			              	</b>
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

						[${requestScope.qnaListCnt}/${requestScope.qnaListAllCnt}]개

						&nbsp;&nbsp;
					</span> <select name="rowCntPerPage" class="rowCntPerPage"
						onChange="search('qna')">
						<option value="10">10
						<option value="15">15
						<option value="20">20
					</select>행보기 &nbsp;&nbsp;&nbsp;
				</center>
				<center>
          <input type="button" value="등록" onCLick= "location.replace('/qnaRegForm.do')">
     </center>
      </form>
  </div>
  		
   </div>
</body>
<%@ include file="footer.jsp" %>
</html>

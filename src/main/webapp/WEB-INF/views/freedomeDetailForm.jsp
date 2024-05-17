<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>12Wa~</title>
  <style>
    .hidden-row {
        display: none;
    }
</style>
  
<script>

	
</script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
</head>
  
<body>

 <div id="container">    
    <%@ include file="header.jsp" %>

	<%@ include file="boardSideCategori.jsp" %>


    <div id="wrap" class="container"  >
      <h1 style="text-align: center;">자유 게시판 상세페이지</h1>
      <form action="submit.php" method="POST" name="commentRegForm" class="commentRegForm">
              <table style="border:1px solid black;margin-left:auto;margin-right:auto;">
                   
               <tr>
                  <td>닉네임</td>
                  <td>${boardDTO.nickname }</td> 
              </tr>
                 
               <tr>
                  <td>제목</td>
                  <td>${boardDTO.subject }</td>
              </tr> 
              
              <tr>
                  <td>내용</td>
                  <td>${boardDTO.content }</td>
			  </tr>
			   
               
                 <tr>
                  <td>조회수</td>
                  <td>${boardDTO.read_count }</td>
              </tr> 
               
              <tr>
                  <td>작성일 </td>
                  <td>${boardDTO.reg_date }</td>
              </tr>  
 

			  <tr>
                <td>추천수</td>
                <td>${boardDTO.rec_count }</td>                       
              </tr>
              
              <tr>
                  <td >댓글</td>
                  <td>
                   <textarea  style="width:100%; height:100%;" rows="4"  name="content" class="content"></textarea>
                   	 <input type="hidden" value="comment_free" name="table" class="table"> 
                  	 <input type="hidden" value="${boardDTO.p_no }" name="p_no" class="p_no"> 
                  	 <input type="hidden" value="${boardDTO.b_no }" name="b_no" class="b_no">                    	 
                  	 <input type="button" value="등록"  onClick="checkCommentReg()">
                  </td>                       
              </tr> 
          </table>
          
          
          <center>
         <span onClick="pushboardname('freeboard','freedome')">[목록으로]</span>
         <input type="button" value="수정/삭제"
							onclick="goUpDelForm(${boardDTO.b_no},'freedome','freeboard');">
     </center>
      </form>
      
      
      <c:if
            test="${param.sort!='sal_avg asc' and param.sort!='sal_avg desc'}">
            <p style="cursor: pointer" onClick="searchWithSort('sal_avg desc')">연봉</p>
         </c:if>

         <c:if test="${param.sort=='sal_avg desc'}">
            <p style="cursor: pointer" onClick="searchWithSort('sal_avg asc')">연봉▼</p>
         </c:if>

         <c:if test="${param.sort=='sal_avg asc'}">
            <p style="cursor: pointer" onClick="searchWithSort('')">연봉▲</p>
         </c:if>
      
      
      <table style="margin: 0 auto;">
      	<tr>
      		<td>
      			댓글
      		</td>
      		<td>
      			<c:if test="${param.commentSort!='rec_count asc' and param.commentSort!='rec_count desc'}">
              <th  style="width: 10%; text-align: center; cursor:pointer; "onClick="searchWithSort('rec_count desc')">좋아요</th>
              </c:if>
             
             <c:if test="${param.commentSort=='rec_count desc'}">
              <th  style="width: 10%; text-align: center; cursor:pointer; "onClick="searchWithSort('rec_count asc')">좋아요▼</th>
              </c:if>
             
             <c:if test="${param.commentSort=='rec_count asc'}">
              <th  style="width: 10%; text-align: center; cursor:pointer; "onClick="searchWithSort('')">좋아요▲</th>
              </c:if>
      		</td>
      	</tr>
      	 <c:forEach var="board" items="${requestScope.commentList}" varStatus="status">
        <tr class="<c:if test="${status.index >= 5}">hidden-row</c:if>">
            <td>
                <b>${board.nickname}</b> &nbsp;&nbsp;&nbsp; ${board.reg_date}<br><br>
                ${board.content}
            </td>
            <td>
                <span class="likeButton" onclick="toggleLike(this,${board.comment_no})"><i  class="far fa-thumbs-up"></i></span>
                ${board.rec_count}
            </td>
        </tr>
    </c:forEach>
    <tr id="showMoreBtn" <c:if test="${requestScope.commentList.size() <= 5}">style="display: none;"</c:if>>
    	<td colspan="2" style="text-align: center;" onclick="showMoreComments()">
        	더보기
    	</td>
	</tr>
    <c:if test="${empty requestScope.commentList}">
        <tr>
            <td colspan="2">
                댓글이 아직 없습니다.
            </td>
        </tr>
    </c:if>
      	
      	
      </table>
      
                  <input type="hidden" name="commentSort" class="commentSort" value="">
  </div>
</body>
<%@include file="/WEB-INF/views/common.jsp"%>  
<%@ include file="footer.jsp" %>
</html>

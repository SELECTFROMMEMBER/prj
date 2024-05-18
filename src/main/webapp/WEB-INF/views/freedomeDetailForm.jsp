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
function searchWithSort(sort){
// 	   $("[name='reviewUpForm']").find("[name='reviewSort']").val(sort);
	   search();
	}
	
function search(){
	
	var commentFormObj = $("[name='commentRegForm']");
		alert(commentFormObj.serialize());
		return
	$.ajax(
	         {
	            //-------------------------------
	            // WAS 로 접속할 주소 설정
	            //-------------------------------
	            url      : "/freedomeDetailForm.do"
	            //-------------------------------
	            // WAS 로 접속하는 방법 설정. get 또는 post
	            //-------------------------------
	            ,type    : "post"
	            //--------------------------------------
	            // WAS 에 보낼 파명과 파값을 설정하기. "파명=파값&파명=파값~"
	            //--------------------------------------
	            ,data    : commentFormObj.serialize()
	            //----------------------------------------------------------
	            // WAS 의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
	            // 이때 익명함수의 매개변수로 WAS 의 응답물이 들어 온다.
	            // "/boardList.do" 주소의 응답물은  boardList.jsp 페이지의
	            // 실행결과인 HTML 문서 문자열이이다.
	            //----------------------------------------------------------
	            ,success : function(responseHtml){
	               //-----------------------------------
	               // 매개변수로 들어오는 HTML 문자열을 관리하는 
	               // JQuery 객체 생성하여 변수 obj 에 저장하기
	               //-----------------------------------
	               var obj = $(responseHtml);
	               //-----------------------------------
	               // 매개변수로 받은 HTML 문자열 중에 
	               // <div class='boardListDiv'> 태그 안의 html 문자열을
	               // 현 화면의 <div class='boardListDiv'> 태그 안에  덮어쓰기
	               //-----------------------------------boardListDiv pagingNos
	               $(".commentList").html( 
	                     obj.find(".commentList").html() 
	               );
	            

	               /*$(".xxx").remove();
	               $("body").prepend(
	                  "<textarea class=xxx cols=100 rows=100>"
	                  + obj.filter(".boardListDiv").html()
	                  +"</textarea>"
	               )*/
	               
	            }
	            ,error   : function(){
	               alert("정렬 실패! 관리자에게 문의 바람니다.");
	            }
	         }
	      );
	
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
                  	 <input type="hidden" name="commentSort" class="commentSort" value="">                    	 
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
      
      <div name="commentList">
      <table style="margin: 0 auto;">
      	<tr>
      		<th>
      			댓글
      		</th>
      			<c:if test="${param.comment_sort!='rec_count asc' and param.comment_sort!='rec_count desc'}">
              <th  style="width: 10%; text-align: center; cursor:pointer; "onCLick= "goBoardDetailForm(${boardDTO.b_no},'freedome', 'freeboard','free','rec_count desc');">좋아요</th>
              </c:if>
             
             <c:if test="${param.comment_sort=='rec_count desc'}">
              <th  style="width: 10%; text-align: center; cursor:pointer; "onCLick= "goBoardDetailForm(${boardDTO.b_no},'freedome', 'freeboard','free','rec_count asc');">좋아요▼</th>
              </c:if>
             
             <c:if test="${param.comment_sort=='rec_count asc'}">
              <th  style="width: 10%; text-align: center; cursor:pointer; "onCLick= "goBoardDetailForm(${boardDTO.b_no},'freedome', 'freeboard','free','');">좋아요▲</th>
              </c:if>
      		
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
      </div>
      
                  <input type="hidden" name="commentSort" class="commentSort" value="">
  </div>
</body>
<%@include file="/WEB-INF/views/common.jsp"%>  
<%@ include file="footer.jsp" %>
</html>

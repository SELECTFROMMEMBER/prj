<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

  
</head>
<body>
    <div id="container">    
    
   <%@ include file="header.jsp" %>

 <div class="container">
  
    <h1 style="text-align: center;">부업글 상세보기</h1>
      <form action="submit.php" method="POST">
      <center>
      
      <c:if test="${!empty requestScope.boardDTO}">
          <table>
              
           <tr>
               <th style="height: 40px; width: 200px;">항목</th>
               <th>등록 사항</th>
           </tr>
           
              
	  <tr>
	    <td>이름:</td>
	    <td>${requestScope.boardDTO.name}</td>     
	</tr>
 
             
         <tr>                                                       
             <td>주소</td>                                           
            <td>${requestScope.boardDTO.addr}</td>               
         </tr>                                                      
            
         <tr>
            <td>휴대폰 번호:</td>
            <td>${requestScope.boardDTO.phone}</td>    
         </tr>  
             
             
        <tr>
            <td>경력</td>
             <td>${requestScope.boardDTO.career}</td>  
        </tr> 
	    
	   
	   
	    <tr>
	        <td>희망업무</td>
	        <td>${requestScope.boardDTO.hope_work}</td>
	    </tr>
	    

	     
	     <tr> 
	        <td>희망근무 시간</td>   
	        <td>${requestScope.boardDTO.start_time}시 ~ ${requestScope.boardDTO.end_time}시</td>
	    </tr>
           
          <tr>
             <td>내용</td>
             <td>${requestScope.boardDTO.content}</td>
          <tr>  
          
          
                      
	  <tr>
	    <td>작성일</td>
	    <td>${requestScope.boardDTO.reg_date}</td>     
	</tr>
	
		
 
 <input type="hidden" name="b_no" class="b_no">
 </table>
          
           <span style= cursor:pointer  onClick="location.replace('/buupList.do')">[목록으로]</span>
           <input type="button" value="수정/삭제" onclick="document.buupListUpDelForm.submit();">
          
           <form name="buupListDetailForm" action="/buupListDetailForm.do" method="post">
				<input type="hidden" name="b_no" value="${requestScope.boardDTO.b_no}">
		   </form>
		   
		    <form name="buupListUpDelForm" action="/buupListUpDelForm.do" method="post">		
				<input type="hidden" name="b_no" value="${requestScope.boardDTO.b_no}">
			</form>
          
            <form name="buupListRegForm" action="/buupListRegForm.do" method="post">
				<input type="hidden" name="b_no" value="${requestScope.boardDTO.b_no}">
			</form>
			
         </center>
      </form>
    </c:if>  
 </div>
 

		<c:if test="${empty requestScope.boardDTO}">
				<script>
					alert("게시판이 삭제되었습니다.");
					location.replace("/buupList.do");
				</script>
		</c:if>
       </div>
</body>
<%@include file="/WEB-INF/views/common.jsp" %>
    <%@ include file="footer.jsp" %>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common.jsp"%>  
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>12Wa~</title>


<script >
function gonoticeDetailForm(n_no){
    $("[name='noticeDetailForm']").find("[name='n_no']").val(n_no);

     document.noticeDetailForm.submit();
 
}
</script>
</head>


<body>
<script src="js/slideshow.js"></script>
 <div id="container">    
  	
    <%@ include file="header.jsp" %>
    
    <div id="slideShow">
      <div id="slides">
       <img src="images/photo-1.jpg"alt="">
        <img src="images/photo-2.jpg"alt="">
        <img src="images/photo-3.jpg" alt="">  
        <button id="prev">&lang;</button>
        <button id="next">&rang;</button>
      </div>
    </div>


		<div id="contents">
      <div id="tabMenu">
        <input type="radio" id="tab1" name="tabs" checked>
        <label for="tab1">공지사항</label>
        <input type="radio" id="tab2" name="tabs">
        <label for="tab2">갤러리</label>      
        <div id="notice" class="tabContent">
          <h2>공지사항 내용입니다.</h2>
          <ul>        

			<c:set var="mainCount" value="0" />
			<c:forEach var="board" items="${requestScope.noticeList}" varStatus="status">
			    <c:if test="${mainCount < 5}">
			        <c:if test="${board.category eq 'main'}">
			            <c:set var="mainCount" value="${mainCount + 1}" />
			            <li style="cursor:pointer" onClick="gonoticeDetailForm(${board.n_no})">
			                ${board.subject}
			            </li>
			        </c:if>
			    </c:if>
			</c:forEach>
          </ul>
  
        </div>
        
        
        <div id="gallery" class="tabContent">
          <h2>갤러리 내용입니다.</h2>
          <ul>
            <li><img src="images/img-1.jpg"></li>
            <li><img src="images/img-2.jpg"></li>
            <li><img src="images/img-3.jpg"></li>
            <li><img src="images/img-1.jpg"></li>
            <li><img src="images/img-2.jpg"></li>
            <li><img src="images/img-3.jpg"></li>                     
          </ul>
        </div>        
      </div>
      
      
      <div id="links">
        <ul>
          <li>
            <a href="#">
              <span id="quick-icon1"></span>
              <p>평화기행</p>
            </a>
          </li>
          
          <li>
            <a href="#">
              <span id="quick-icon2"></span>
              <p>힐링 워크샵</p>
            </a>            
          </li>
          
          <li>
            <a href="#">
              <span id="quick-icon3"></span>
              <p>문의하기</p>
            </a>            
          </li>
          
        </ul>
      </div>
    </div>  

  </div> 
    			    <form name="noticeDetailForm" action="/noticeDetail.do"	method="post">
						<!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 -->
						<input type="hidden" name="n_no"  value="${board.n_no}">
												
		       </form>  
</body>
<%@ include file="footer.jsp" %>
</html>
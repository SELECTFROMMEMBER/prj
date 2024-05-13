<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/common.jsp"%>  

<!DOCTYPE html>
<html>

<head>

  
</head>
<body>
     <div id="container">    
 <%@ include file="header.jsp" %>




    
     <div id="wrap" class="container">
      <h1 style="text-align: center;">프로젝트</h1>
      
     <form>
        <div style="text-align: center; margin-bottom: 20px;">
            <input type="text"   name="keyword" class="keyword">
            <input type="button" value="검색"   class="searchBtn" onclick="search()"></input>
        </div>
     </form>
      
      
      <form action="submit.php" method="POST">
          <table style="border:1px solid black;margin-left:auto;margin-right:auto;">
              
              <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>프로젝트 종류</th>
                  <th>작성일</th>
              </tr>
              
              <c:forEach var="board" items="${requestScope.prjList }"  varStatus="status">
              <tr style="cursor:pointer" onCLick= "location.replace('/prjDetailForm.do')">
              	<td align="center"> 1111111</td>
              	<td align="center"> ${board.subject }</td>
              	<td align="center"> ${board.field_name }</td>
              	<td align="center"> ${board.reg_date }</td>
              </tr>
              
              </c:forEach>
              
          </table>
          <c:if test="${empty prjList }">
          	<center>
          		조회할 데이터가 없습니다.
          	</center>
          </c:if>
          <center>
          <input type="button" value="등록" onCLick= "location.replace('/prjRegForm.do')">
     </center>
      </form>
  </div>
       
</body>
<%@ include file="footer.jsp" %>
</html>

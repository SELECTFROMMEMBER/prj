<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/common.jsp"%>  

<!DOCTYPE html>
<html>

<head>

  
</head>
<body>
     <div id="container">    
   <header>
    <div id="logo">
      <a  href="javascript:location.replace('/12Wa.do')">
        <h1>12Wa~</h1> 
        </a>
      </div>
      
      <nav>
        <ul id="topMenu">
          <li><a  style="cursor: pointer;" href="javascript:location.replace('/gongGoList.do')">채용정보 </a>
            <ul>
              <li><a href="javascript:location.replace('/gongGoList.do')">지역별</a></li>
              <li><a href="javascript:location.replace('/gongGoList.do')">업무별</a></li>
              <li><a href="javascript:location.replace('/gongGoList.do')">TOP100</a></li>
            </ul>
            
          </li>
          <li><a href="javascript:location.replace('/companyList.do')">기업정보 </a>
          </li>
   
     	<li>
     		<a style="cursor: pointer;" href="javascript:location.replace('/freedome.do')">커뮤니티 </a> 
         <ul>
            <li><a href="javascript:location.replace('/freedome.do')">자유 게시판</a></li>
			<li><a href="javascript:location.replace('/newComer.do')">신입 게시판</a></li>
			<li><a href="javascript:location.replace('/qna.do')">Q&A 게시판</a></li>
			<li><a href="javascript:location.replace('/joongGo.do')">중고 게시판</a></li>
			<li><a href="javascript:location.replace('/jobReady.do')">취업 게시판</a></li>
			<li><a href="javascript:location.replace('/interview.do')">면접 게시판 </a></li>		
         </ul>
      </li>
  
       <li><a style="cursor: pointer;" href="javascript:location.replace('/timeShare.do')">타임쉐어</a>
           <ul>
             <li><a href="javascript:location.replace('/timeShare.do')">프리랜서</a></li>
             <li><a href="javascript:location.replace('/buupList.do')">부업</a></li>
           </ul>
        </li>

         <li><a href="javascript:location.replace('/prj.do')">프로젝트/공모전  </a>
           <ul>
             <li><a href="javascript:location.replace('/prj.do')">프로젝트</a></li>
             <li><a href="javascript:location.replace('/gongMo.do')">공모전</a></li>
           </ul>
         </li>
          
         <li>
         	<a style="cursor: pointer;" href="javascript:location.replace('/timeShareRegForm.do')">프리랜서 등록</a>
         </li>  
         
       </ul>
    </nav>
  </header>




    
     <div id="wrap" class="container">
      <h1 style="text-align: center;">공모전</h1>
      
      
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
                  <th>조회수</th>
                  <th>날짜</th>
                  
                
              </tr >
              
              <c:forEach var="board" items="${requestScope.gongMoList }"  varStatus="status">
              <tr style="cursor:pointer" onCLick= "location.replace('/gongMoDetailForm.do')">
              	<td align="center"> 1111111</td>
              	<td align="center"> ${board.subject }</td>
              	<td align="center"> ${board.read_count }</td>
              	<td align="center"> ${board.reg_date }</td>
              </tr>
              
              </c:forEach>
             
              
            
          </table>
          <c:if test="${empty gongMoList }">
          	<center>
          		조회할 데이터가 없습니다.
          	</center>
          </c:if>
          <center>
          <input type="button" value="등록" onCLick= "location.replace('/gongMoRegForm.do')">
     </center>
      </form>
  </div>
      
</body>
<%@ include file="footer.jsp" %>
</html>

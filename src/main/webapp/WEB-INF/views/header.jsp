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
     		<a style="cursor: pointer;" onClick="pushboardname('freeboard','freedome')">커뮤니티 </a> 
         <ul>
            <li><a onClick="pushboardname('freeboard','freedome')">자유 게시판</a></li>
			<li><a onClick="pushboardname('newbieboard','newComer')">신입 게시판</a></li>
			<li><a onClick="pushboardname('qnaboard','qna')">Q&A 게시판</a></li>
			<li><a onClick="pushboardname('jobsearchboard','jobReady')">취업 게시판</a></li>
			<li><a onClick="pushboardname('interviewboard','interview')">면접 게시판 </a></li>		
			<li><a onClick="pushboardname('tradeboard','joongGo')">중고 게시판</a></li>
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
  </div>
  
  <form name="freedome" action="/freedome.do"
						method="post">
   		 <input type="hidden" name="boardname" class="boardname">
    </form>
    
</body>
</html>
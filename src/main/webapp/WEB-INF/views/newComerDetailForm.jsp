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
  
<%@ include file="boardSideCategori.jsp" %>



    <div id="wrap" class="container"  >
      <h1 style="text-align: center;">신입 게시판 상세페이지</h1>
      <form name="newComerDetailForm">
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
                  <td>댓글</td>
                  <td>
                   <textarea textarea style="width:100%; height:100%;" rows="4"></textarea>
                  	 <input type="button" value="등록" >
                  </td>                       
              </tr> 
          </table>
          
          <center>
         <span onClick="pushboardname('newbieboard','newComer')">[목록으로]</span>
       	 <input type="button" value="수정/삭제"
							onclick="goUpDelForm(${boardDTO.b_no},'newComer','newbieboard');">
     </center>
      </form>
  </div>
       
</body>
<%@ include file="footer.jsp" %>
</html>

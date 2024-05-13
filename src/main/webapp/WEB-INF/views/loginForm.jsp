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


    
     <div class="container">
      <h1 style="text-align: center;">로그인</h1>
      <table style="border:1px solid black;margin-left:auto;margin-right:auto;">
       <tr>
              <th>
              	개인
              </th>
              <th>
              	기업
              </th>
      </table>
      
      <form action="submit.php" method="POST">
          <table style="border:1px solid black;margin-left:auto;margin-right:auto;">
              
             
              </tr>
              
                 </tr>   
             
                  <td>아이디</td>
                  <td> <input type="text"></td>
                 
              </tr>
              <tr>
                  <td>
                 비밀번호
                  </td>
                 
                    <td> <input type="text"></td>
                 
  
  		

             
          </table>
          <center>          
          <input type="button" value="로그인" onCLick= "location.replace('/12Wa.do')">
          <input type="button" value="회원가입" onCLick= "location.replace('/memberRegForm.do')">
     </center>
      </form>
  </div>
       
       
</body>
<%@ include file="footer.jsp" %>
</html>

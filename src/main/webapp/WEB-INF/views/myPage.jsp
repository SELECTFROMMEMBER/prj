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
        <h1 style="text-align: center; font-size:2em;">개인 마이페이지</h1>
        <table>
            <thead>
               <div class="right-align">
    <a href="#" class="button">정보 수정</a>
   </div>
            
                <tr>
                    <th colspan="2" >개인 정보 수정</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>이름:</td>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <td>이메일:</td>
                    <td>example@example.com</td>
                </tr>
                <tr>
                    <td>전화번호:</td>
                    <td>010-1234-5678</td>
                </tr>
            </tbody>
        </table>
        
        <div class="right-align">
              <input type="button" value="타임쉐어 등록" onClick="location.replace('/timeShareRegForm.do')">
        <table>
            <thead>
                <tr>
                    <th colspan="2">타임쉐어 등록</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>시간:</td>
                    <td>2024-04-23 ~ 2024-04-30</td>
                </tr>
                <tr>
                    <td>설명:</td>
                    <td>웹 개발 프로젝트 참여</td>
                </tr>
            </tbody>
        </table>
        
      <br>
      <br>
        <table>
            <thead>
                <tr>
                    <th colspan="3">이력서 관리</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>이력서 1</td>
                    <td>2024-04-23</td>
                    <td><a href="#">수정</a> | <a href="#">삭제</a></td>
                </tr>
                <tr>
                    <td>이력서 2</td>
                    <td>2024-04-22</td>
                    <td><a href="#">수정</a> | <a href="#">삭제</a></td>
                </tr>
               
            </tbody>
        </table>
      <br>
      <br>
        <table>
            <thead>
                <tr>
                    <th colspan="4">프로젝트 관리</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>프로젝트 1</td>
                    <td>2024-04-20</td>
                    <td>프로젝트 설명</td>
                    <td><a href="#">수정</a> | <a href="#">삭제</a></td>
                </tr>
                <tr>
                    <td>프로젝트 2</td>
                    <td>2024-04-15</td>
                    <td>프로젝트 설명</td>
                    <td><a href="#">수정</a> | <a href="#">삭제</a></td>
                </tr>
            </tbody>
        </table>
           <br>
           
    </div>
      
</body>
<%@ include file="footer.jsp" %>
</html>

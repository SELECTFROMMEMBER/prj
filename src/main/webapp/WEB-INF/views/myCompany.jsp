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
        <h1 style="text-align: center; font-size:2em;">기업 마이페이지</h1>
        <table>
            <thead>
            <div class="right-align">
    	  <input type="button" value="정보 수정 보기"  onClick="location.replace('/gongMo.do')">
   </div>
                <tr>
                    <th colspan="2">기업 정보 수정</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>기업명:</td>
                    <td>ABC 주식회사</td>
                </tr>
                <tr>
                    <td>업종:</td>
                    <td>IT</td>
                </tr>
                <tr>
                    <td>주소:</td>
                    <td>서울시 강남구</td>
                </tr>
            </tbody>
        </table>

        <table>
        	<div class="right-align">
		    	  <input type="button" value="이력서 보기"  onClick="location.replace('/.do')">
		   </div>
            <thead>
                <tr>
                    <th colspan="2">스카우트 이력서</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>지원자명:</td>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <td>직무:</td>
                    <td>개발자</td>
                </tr>
                <tr>
                    <td>이메일:</td>
                    <td>example@example.com</td>
                </tr>
            </tbody>
        </table>

        <table>
        	<div class="right-align">
		    	  <input type="button" value="공고 보기"  onClick="location.replace('/.do')">
		   </div>
            <thead>
                <tr>
                    <th colspan="2">등록한 공고</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>공고 제목:</td>
                    <td>웹 개발자 채용</td>
                </tr>
                <tr>
                    <td>공고 기간:</td>
                    <td>2024-04-23 ~ 2024-05-07</td>
                </tr>
            </tbody>
        </table>

        <table>
		     <div class="right-align">
		  <input type="button" value="공모전 보기"  onClick="location.replace('/gongMo.do')">
		   </div>
            <thead>
                <tr>
                    <th colspan="2">등록한 공모전</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>공모전 제목:</td>
                    <td>AI 아이디어 공모전</td>
                </tr>
                <tr>
                    <td>응모 기간:</td>
                    <td>2024-05-01 ~ 2024-06-30</td>
                </tr>
            </tbody>
        </table>
        <center>
          <input type="button"  value="수정하기">
          </center>
    </div>
      
</body>
<%@ include file="footer.jsp" %> 
</html>

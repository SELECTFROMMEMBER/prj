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


<div id="wrap" >
    <center>
    
    	<h1> 공모전 등록 </h1>
   <table align="center" bordercolor="gray" border=1 cellpadding=7 style="border-collpase:collpase">
              
             <tr>
                 <td>제목</td>
                 <td><input type="text" id="gongMo_suject" name="gongMo_suject" required></td>
             </tr>
             
               <tr>
                 <td>주최측 기업명</td>
                 <td><input type="text" id="company_name" name="company_name" required></td>
             </tr> 
             
                <tr>
                 <td>분야</td>
                  <td>
                  <select id="field" class="select">
                    <option value="">직군 선택</option>
                    <option value="management">경영·사무</option>
                    <option value="sales">영업·고객상담</option>
                    <option value="it">IT·인터넷</option>
                    <option value="design">디자인</option>
                    <option value="media">미디어</option>
                    <option value="construction">건설</option>
                    <option value="education">교육</option>
                    <option value="medical">의료</option>
                    <option value="production">생산</option>
                </select>
                </td>
             </tr>  
             
             <tr>
                 <td>기간</td>
	             <td><label for="gongMostartdate">시작일:</label> 
				<input type="date" id="gongMostartdate" name="gongMostartdate" value="2024-04-30" min="2030-01-01" max="2018-12-31" />
                ~
                <label for="gongMoenddate">마감일:</label> 
				<input type="date" id="gongMoenddate" name="gongMoenddate" value="2024-04-30" min="2030-01-01" max="2018-12-31" />
                 </td>
             </tr>  
             
             
               
            <tr>
			    <td>설명</td>
			    <td><textarea id="explanation" name="explanation" rows="20" cols="50" required></textarea></td>
			</tr>
				
			<tr>
			    <td>파일 업로드</td>
			    <td><input type="file" id="competition_file" name="competition_file" accept=".pdf, .doc, .docx" required></td>
			</tr>
             
              </table>
          <input type="button" onClick="location.replace('/gongMo.do')" value="등록">
          
          </center>
 </div>      
</body>
<%@ include file="footer.jsp" %>
</html>

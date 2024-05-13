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
    
	<center>
<div id="wrap" >
 <table align="center"border="1"cellpadding="7"style="border-collapse:collapse"><table align="center"border="1"cellpadding="7"style="border-collapse:collapse">
        <h1 style="text-align: center;">프로젝트 등록</h1> 
        <tr>
            <td>제목</td>
            <td><input type="text" id="subject" name="subject" required></td>
        </tr>   
          
        <tr>
                       
        <td>희망 프로젝트</td>   
             <td>
            <input type="radio" id="" name="personal" class="personal"> 개인 
            <input type="radio" id="" name="contest" class="contest"> 공모전
            </td>       
        </tr>

        <tr>
            <td>프로젝트 종류</td>
            <td><input type="text" id="prjtype" name="prjtype" required></td>
        </tr>

       
        
        <tr>
	        <td>모집인원</td>   
	        <td> 
	        <input type="number" id="people_recruited" name="people_recruited" min="1" max="99" required oninput="checkNumber()">명
	        </td>
        </tr>
        
          <tr>
                 <td>기간</td>
	             <td><label for="prjstartdate">시작일:</label> 
				<input type="date" id="prjstartdate" name="prjstartdate" value="2024-04-30" min="2000-01-01" max="2050-12-31" />
                ~
                <label for="prjenddate">마감일:</label> 
				<input type="date" id="prjenddate" name="prjenddate" value="2024-04-30" min="2000-01-01" max="2050-12-31" />
                 </td>
             </tr>  
             
        
        <tr>
            <td>보유자격증</td>
            <td>
                <input type="text" id="license" name="license" >
                <input type="button" class="addRowButton" onclick="addRow()" value="추가">
            </td>
        </tr>
    
    <tr>
        <td>요구 기술</td>
            <td>
                <input type="checkbox" id="skill" name="skill" class="skill">   
            </td>
    </tr>

    
    <tr>
        <td>내용</td>
                <textarea name="CONTENT" textarea style="width:100%; height:100%;" rows="4"></textarea>
      
    </tr>
        

    <tr>
        <td>파일업로드</td>
            <td>
                <input id="fileUpload" class="input" type="file">
        </td>
    </tr>

    </table>
  <input type="button" value="등록" onClick="location.replace('/prj.do')">
            
         </center>
</div>
       
</body>
<%@ include file="footer.jsp" %>
</html>

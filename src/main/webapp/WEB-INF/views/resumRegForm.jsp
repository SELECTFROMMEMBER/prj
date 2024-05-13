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
      <h1 style="text-align: center; font-size:2em;">이력서 등록</h1>
      <br>
      <form action="submit.php" method="POST">   
    <table align="center" bordercolor="gray" border=1 cellpadding=7 style="border-collpase:collpase">
              
                <tr>
                  <td>이름</td>
                  <td></td>
                </tr>   

	            
	            <tr>
				    <td>결혼여부</td>
				    <td><input type="radio" id="MARRIED" name="MARRIED">미혼
				    	<input type="radio" id="MARRIED" name="MARRIED">기혼
				    </td>
				</tr>
				
				<tr>
				    <td>군필여부</td>
				    <td><input type="radio" id="MILITARY" name="MILITARY">군필
				    	<input type="radio" id="MILITARY" name="MILITARY">미필
				    	<input type="radio" id="MILITARY" name="MILITARY">기타
				    </td>
				</tr>				
				
				
				<tr>
				    <td>수상경력</td>
				    <td>대회이름: <input type="text" id="name" name="name">
				  		 수상명: <input type="text" id="type"    name="type">
				   	<br> 주최기관:<input type="text" id="ORGANIZER"    name="ORGANIZER">
				  		 상장번호:<input type="text" id="AWARD_NO"     name="AWARD_NO">
				     
				    </td>
				</tr>
				
			<tr>
	                <td for="startDate" >보유스킬</td>
	               <td>
	     
	               <label><input type="checkbox" name="skill_name" value="JAVA"> JAVA</label>
	                 <label><input type="checkbox" name="skill_name" value="Servlet/JSP"> Servlet/JSP</label>
	                 <label><input type="checkbox" name="skill_name" value="XML"> XML</label>
	                 <label><input type="checkbox" name="skill_name" value="DataBase"> DataBase</label>
	                 <label><input type="checkbox" name="skill_name" value="MVC"> MVC</label>
	                 <label><input type="checkbox" name="skill_name" value="Spring"> Spring</label>
	                 <br>
	                 <label><input type="checkbox" name="skill_name" value="Front-End"> Front-End</label>
	                 <label><input type="checkbox" name="skill_name" value="Excel"> Excel</label>
	                 <label><input type="checkbox" name="skill_name" value="PPT"> PPT</label>
	                 <label><input type="checkbox" name="skill_name" value="OS"> OS</label>
	                 <label><input type="checkbox" name="skill_name" value="CAD"> CAD</label>
	                 <label><input type="checkbox" name="skill_name" value="3D RINTING"> 3D RINTING</label>
	           
	                 
	               
	                
	                </td>
       		 </tr>
				
				
				<tr>
				    <td>경력</td>
				    <td>
					    <input type="text" id="CAREER" name="CAREER">
					    <input type="button"  value="추가" onclick="addRow()"></button>
				    </td>
				</tr>
				
				<tr>
				    <td>보유자격증</td>
				    <td>
				    	<input type="text" id="license_code" name="license_code">&nbsp;
					    <input type="date" id="license_code" name="license_code">
					    <input type="button" value="추가" onclick="addRow()"></button>
				    </td>
				</tr>
				
			<tr>
                <td>최종 학력</td>
                <td>
                   <select id="EDUCATION" name="EDUCATION" class="EDUCATION" >
                        <option value="none">최종 학력 선택</option>
                        <option value="primary">초등학교 졸업</option>
                        <option value="middle">중학교 졸업</option>
                        <option value="high">고등학교 졸업</option>
                        <option value="university">대학교 졸업 (4년 이상)</option>
                   </select>
                    	<input type="text" id="SCHOOL_NAME" name="SCHOOL_NAME"  value="학교명" onfocus="if(this.value=='학교명') this.value='';">              
               
			              <br>
			            <label for="ADMISSION_DATE">입학일:</label> 
						<input type="date" id="enter_date" name="enter_date" value="2000-01-01" min="1970-01-01" max="2040-12-31" />
			               ~
			            <label for="GRADUATION_DATE">졸업일:</label> 
						<input type="date" id="GRADUATION_DATE" name="GRADUATION_DATE" value="2000-01-01" min="1970-01-01" max="2040-12-31" />
                </td>
            </tr>
				
				<tr>
				    <td>포트폴리오</td>
				    <td><input type="file" id="portfolio" name="portfolio" accept=".pdf, .doc, .docx" ></td>
				</tr>
				
				<tr>
					<td>자기소개</td>
					<td><textarea name="INTRODUCE" textarea style="width:100%; height:100%;" rows="4"></textarea></td>
					
				</tr>
				
				
				<tr>
                <td>제안받기</td>
                <td><input type="radio" id="is_offer" name="is_offer">
                    <label for="is_offer">수락</label>
                    <input type="radio" id="is_offer" name="is_offer">
                    <label for="is_offer">거절</label>
            </tr> 
             
            <tr>
            <td>
            	희망연봉
            </td>
            <td>
            	<input type="text" id="hope_salary" name="hope_salary">
            </td>
            </tr>
	
        
      </table>
       <input type="button"  value="이전"onclick="location.replace('personalRegForm.do')"></button>
      <input type="button"  value="등록"onclick="location.replace('loginForm.do')"></button>
</body>
<%@ include file="footer.jsp" %>  
</html>

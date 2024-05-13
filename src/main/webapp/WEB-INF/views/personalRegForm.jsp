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
      <h1 style="text-align: center;">개인 회원가입</h1>
      <form action="submit.php" method="POST">
      <center>
          <table>
              
         <tr>
             <th>항목</th>
             <th>등록 사항</th>
         </tr>
         
         <tr>
             <td>아이디:</td>
             <td><input type="text" id="id" name="id" required></td>
         </tr>  
               
         <tr>
           <td>패스워드:</td>
           <td><input type="password" id="pwd" name="pwd" required></td>
       </tr>
          
        <tr>
            <td>이 름:</td>
            <td><input type="text" id="name" name="name" required></td>
        </tr> 
        
        <tr>
            <td>휴대폰 번호:</td>
            <td><input type="text" id="phone" name="phone" required></td>
        </tr> 
            
        <tr>
                <td> 주소</td>
                <td><select name="addr" id="sido1"></select>
                  <select name="addr" id="gugun1"></select>&nbsp; <input type="text" name="addr" id="addr" value="나머지 상세주소" onfocus="if(this.value=='나머지 상세주소') this.value='';"></td>
        </tr>

   
              <tr>
                  <td>email:</td>
                  <td><input type="text" id="email" name="email" required> @ <select name='tag'>
                      <option value=" "> naver. com </option>
                      <option value=" "> daum. net </option>
                      <option value=" "> 직접입력 </option>

                  </td>
              </tr>
              <tr>
                <td>취업여부:</td>
                <td><input type="radio" id="is_job" name="is_job">
                    <label for="is_job">Y/</label>
                    <input type="radio" id="is_job" name="is_job">
                    <label for="is_job">N</label>
            </tr>  
            <tr>
                <td>닉네임:</td>
                <td><input type="text" id="nicname" name="nicname" required></td>
            </tr> 
               <tr>
				    <td>성별</td>
				    <td><input type="radio" id="sex" name="sex">남
				    	<input type="radio" id="sex" name="sex">여
				    	<input type="radio" id="sex" name="sex">공개안함
				    </td>
				</tr>
               <tr>
                <td>관심분야:</td>
                <td><select name='field_code'>
                      <option value="경영·사무"> 경영·사무 </option>
                      <option value="영업·고객상담"> 영업·고객상담 </option>
                      <option value="IT·인터넷"> IT·인터넷 </option>
                      <option value="디자인 "> 디자인 </option>
                      <option value="미디어"> 미디어 </option>
                      <option value="건설"> 건설 </option>
                      <option value="교육"> 교육 </option>
                      <option value="의료"> 의료 </option>
                      <option value="생산"> 생산 </option>
            </tr> 
              
            
          </table>
          
          <input type="button" value="다음" onClick="location.replace('/resumRegForm.do')">
     </center>
      </form>
  </div>
       
</body>
<%@ include file="footer.jsp" %>
</html>

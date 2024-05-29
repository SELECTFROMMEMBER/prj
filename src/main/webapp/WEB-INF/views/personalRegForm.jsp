<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/common.jsp"%>  


<!DOCTYPE html>
<html>

<head>
<script>
function checkmemberRegForm(){
	   var formObj = $("[name='memRegForm']");
	
	   var pidObj = formObj.find(".pid");
	   var pwdObj = formObj.find(".pwd");
	   var phoneObj = formObj.find(".phone");
	   var jumin_num1Obj = formObj.find(".jumin_num1");
	   var jumin_num2Obj = formObj.find(".jumin_num2");
	   var addr1Obj = formObj.find(".addr1");
	   var addr2Obj = formObj.find(".addr2");
	   var addr3Obj = formObj.find(".addr3");
	   var email1Obj = formObj.find(".email1");
	   var email2Obj = formObj.find(".email2");
	   var is_jobObj = formObj.find(".is_job");
	   var nicknameObj = formObj.find(".nickname");
	   var sexObj = formObj.find(".sex");
	  
	   if(pidObj.val() == ''){
		   alert("아이디를 입력해주세요.");
		   return false;
	   }
	   if( new RegExp(/^[a-z][a-zA-Z0-9]{2,15}$/).test(pidObj.val())==false){
		   alert("아이디는 영어와 숫자로 작성해주세요.");
		   return false;
	   }
	   if(pwdObj.val() == ''){
		   alert("패스워드를 입력해주세요.");
		   return false;
	   }
	   if(!/^\d{4}$/.test(pwdObj.val().trim())){
			  alert("암호는 공백 없이 4자리 숫자여야 합니다.");
				$("[name='pwd']").val("").focus();
				return;
		  }
	   if(new RegExp(/^[0-9]{11}$/).test(phoneObj.val())==false){
		   alert("휴대폰번호를 제대로 입력해주세요.");
		   return false;
	   }
	   if(phoneObj.val() != '010'){
		   alert("휴대폰번호는 010으로 시작해야 합니다..");
		   return false;
	   }
	   if(new RegExp(/^[0-9]{6}$/).test(jumin_num1Obj.val())==false){
		   alert("주민번호 앞자리는 6자리를 입력해주세요.");
		   return false;
	   }
	   if(new RegExp(/^[0-9]{7}$/).test(jumin_num2Obj.val())==false){
		   alert("주민번호 뒷자리는 7자리를 입력해주세요.");
		   return false;
	   }	   
// 	   alert(jumin_num2Obj.val())
// 	   if(new RegExp(/^[1-4]{1}$/).test(jumin_num2Obj.val()) == false){
// 		   alert("주민번호 뒷자리 첫째자리를 확인해주세요.");
// 		   return false;
// 	   }
	   if(addr1Obj.val() == '시/도 선택' || addr2Obj.val()=='구/군 선택'|| addr3Obj.val() ==''){
 			alert("주소를 입력해 주세요")
 			return false;
 		}
	   if(email1Obj.val() == '' || email2Obj.val()==''){
 			alert("이메일을 입력해 주세요")
 			return false;
 		}
	  
	   if(is_jobObj.is(':checked') == false){
		   alert("취업여부를 선택해주세요.")
		   return false;
	   }
	   if(new RegExp(/^[a-zA-Z0-9가-힣]{2,15}$/).test(nicknameObj.val())==false){
		   alert("닉네임은 2~15자 까지 가능합니다.");
		   return false;
	   }	 
	   if(sexObj.is(':checked') == false){
		   alert("성별을 선택해주세요.")
		   return false;
	   }
	   
	   alert(formObj.serialize());
	   return;
	$.ajax(
	      { 
	         
	         url    : "/memProc.do"
	         
	         ,type  : "post"
	         
	         ,data  : formObj.serialize( )
	         
	         ,success : function(json){
	            var result = json["result"];
	            
	            
	            if(result==1){
	               alert("가입 성공입니다.");
	               alert("로그인 후 이력서 등록 후 사용바랍니다.")
	               location.replace("/loginForm.do")
	            }
	            else if(result==2){
	               alert("아이디가 중복 됩니다. 재 입력 바람.")
	               $(".id").val("");
	            }else{
	               alert("입력 실패.");
	            }
	         }
	         //----------------------------------------------------------
	         // WAS 의 응답이 실패했을 실행할 익명함수 설정.
	         //----------------------------------------------------------
	         ,error : function(){
	            alert("회원가입 실패! 관리자에게 문의 바람니다.");
	         }
	      }
	   );
	}
</script>
  
</head>
<body>
    <div id="container">    
 <%@ include file="header.jsp" %>

 <div class="container">
      <h1 style="text-align: center;">개인 회원가입</h1>
      <form action="submit.php" method="POST" name="memRegForm">
      
          <table style="margin: 0 auto;">
              
       <tr>
             <th>항목</th>
             <th>등록 사항</th>
         </tr>
         
         <tr>
             <td>아이디:</td>
             <td><input type="text" id="pid" name="pid" class="pid" required></td>
         </tr>  
               
         <tr>
           <td>패스워드:</td>
           <td><input type="password" id="pwd" name="pwd"  class="pwd" required></td>
       </tr>
          
        <tr>
            <td>이 름:</td>
            <td><input type="text" id="name" name="name" class="name" required></td>
        </tr> 
        
        <tr>
            <td>휴대폰 번호:</td>
            <td><input type="text" id="phone" name="phone"  class="phone" required></td>
        </tr> 
        <tr>
            <td>주민 번호</td>
            <td><input type="text" id="jumin_num1" name="jumin_num1"   class="jumin_num1" required> - 
               <input type="password" id="jumin_num2" name="jumin_num2"  class="jumin_num2" required>
                                                                  </td>
        </tr> 
            
        <tr>
                <td> 주소</td>
                <td><select name="addr1" id="sido1" value="addr" class="addr1"></select>
                  <select name="addr2" id="gugun1" value="addr" class="addr2"></select>&nbsp; 
                  <input type="text" name="addr3" id="addr" value="나머지 상세주소" class="addr3" onfocus="if(this.value=='나머지 상세주소') this.value='';"></td>
        </tr>

   
              <tr>
                  <td>email:</td>
                  <td><input type="text" id="email1" name="email1" class="email1"required> @ 
                  <select  name="email2" class="email2">
                      <option value="@ naver. com "> naver. com </option>
                      <option value="@ daum. net "> daum. net </option>
                      <option value=""> 직접입력 </option>
                  </select>

                  </td>
              </tr>
              <tr>
                <td>취업여부:</td>
                <td><input type="radio" id="is_job" value="Y" name="is_job"  class="is_job">
                    <label for="is_job">Y</label>
                    <input type="radio" id="is_job" value="N" name="is_job"  class="is_job">
                    <label for="is_job">N</label>
            </tr>  
            <tr>
                <td>닉네임:</td>
                <td><input type="text" id="nickname" name="nickname" class="nickname"required></td>
            </tr> 
               <tr>
                <td>성별</td>
                <td><input type="radio" id="sex" name="sex" value="남"  class="sex">남
                   <input type="radio" id="sex" name="sex" value="여"  class="sex">여
                   
                </td>
            </tr>
               <tr>
                <td>관심분야:</td>
                <td><select name='field_code'>
                      <option value="1"> 경영·사무 </option>
                      <option value="2"> 영업·고객상담 </option>
                      <option value="3"> IT·인터넷 </option>
                      <option value="4"> 디자인 </option>
                      <option value="5"> 미디어 </option>
                      <option value="6"> 건설 </option>
                      <option value="7"> 교육 </option>
                      <option value="8"> 의료 </option>
                      <option value="9"> 생산 </option>
                      </select>
            </tr> 
              
            
          </table>

		<center>
          <input type="button" value="가입하기" onClick="checkmemberRegForm()">
		</center>
          
      </form>
  </div>
       
</body>
<%@ include file="footer.jsp" %>
</html>

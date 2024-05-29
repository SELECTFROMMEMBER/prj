<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>  

<!DOCTYPE html>
<html>
<head>
  
  <script>
  
  function checkprjRegForm(){
	  
	  var formObj    = $("[name='prjRegForm']");
	  
	  var subjectObj = formObj.find(".subject");
	  var project_typeObj =  formObj.find('input[name=project_type]');
	  var people_toObj = formObj.find("#people_to");
	  var prjstartdateObj= formObj.find("#prjstartdate");
	  var prjenddateObj = formObj.find("#prjenddate");
	  var contentObj = formObj.find(".content");
	  var pwdObj = formObj.find(".pwd");
	  
	  if( new RegExp(/^[가-힣a-zA-Z]{2,15}$/).test(subjectObj.val())==false ){
			alert("제목은 2~15자 한글,영어로 입력해주세요.");
			subjectObj.val("");
			return false;
		}

	  if(project_typeObj.is(':checked') == false){
			alert("프로젝트 종류를 선택해주세요")
			return false;
	  }
	  if(people_toObj.val() == ''){
		  alert("모집인원을 입력해주세요.")
		  return false;
	  }
	  if(people_toObj.val() > 20){
		  alert("모집인원은 20명을 넘을 수 없습니다..")
		  return false;
	  }
	  if(! prjstartdateObj.val() ||  ! prjenddateObj.val() ){
		  alert("기간을 등록해주세요")
		  return false;
	  }
	  if(prjstartdateObj.val() >  prjenddateObj.val() ){
		  alert("시작일은 마감일보다 작아야 합니다.")
		  return false;
	  }
	  if(pwdObj.val() == '' ){
		  alert("비밀번호를 입력해주세요.")
		  return false;
	  }
	  if(!/^\d{4}$/.test(pwdObj.val().trim())){
		  alert("암호는 공백 없이 4자리 숫자여야 합니다.");
			$("[name='pwd']").val("").focus();
			return;
	  }
	  



	  $.ajax(
				{ 
					//--------------------------------------
					// WAS 에 접속할 URL 주소 지정
					//--------------------------------------
					url    : "/prjRegProc.do"
					//--------------------------------------
					// 파라미터값을 보내는 방법 지정
					//--------------------------------------
					,type  : "post"
					//--------------------------------------
					// WAS 에 보낼 파명과 파값을 설정하기. "파명=파값&파명=파값~"
					//--------------------------------------
					,data  : formObj.serialize( )
					//----------------------------------------------------------
					// WAS 의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
					// 이때 익명함수의 매개변수로 WAS 의 응답물이 들어 온다.
					//----------------------------------------------------------
					,success : function(json){
						var result = json["result"];
						if(result==1){
							alert("프로젝트 모집 작성 성공입니다.");
							location.replace("/prj.do")
						}
						else{
							alert("프로젝트 모집 작성 실패입니다. 관리자에게 문의 바람!");
						}
					}
					//----------------------------------------------------------
					// WAS 의 응답이 실패했을 실행할 익명함수 설정.
					//----------------------------------------------------------
					,error : function(){
						alert("작성 실패! 관리자에게 문의 바람니다.");
					}
				}
			);
		}
  
  </script>
  
  
</head>
<body>
    <div id="container" >    
        <%@ include file="header.jsp" %>
        <center>
         <form action="submit.php" method="POST" name='prjRegForm'>
            <div id="wrap">
            	<br>
                <h1 style="text-align: center;">프로젝트 등록</h1> 
                <br>
                <table align="center" border="1" cellpadding="7" style="border-collapse:collapse">
                    <tr>
                        <td>제목</td>
                        <td><input type="text" id="subject" name="subject"  class="subject" required></td>
                    </tr>   
                    
                    <tr>
                        <td>프로젝트 종류</td>   
                        <td>
                            <input type="radio" name="project_type" value="개인" class="project_type"> 개인 
                            <input type="radio" name="project_type" value="공모전" class=" project_type"> 공모전
                        </td>       
                    </tr>

                    <tr>
                        <td>프로젝트 분야</td>
                        <td>
                        	<select name="field_code" id="field_code" class="field_code"> 
				                <option value="1">IT·인터넷</option>
				                <option value="2">디자인</option>
				                <option value="3">미디어</option>
				                <option value="4">교육</option>
				                <option value="5">의료</option>
				            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>모집인원</td>   
                        <td> 
                            <input type="number" id="people_to" name="people_to" min="1" max="100" required oninput="checkNumber()"> 명
                        </td>
                    </tr>
                    
                    <tr>
                        <td>기간</td>
                        <td>
                            <label for="prjstartdate">시작일:</label> 
                            <input type="date" id="prjstartdate" name="start_time" min="2000-01-01" max="2050-12-31" />
                            ~
                            <label for="prjenddate">마감일:</label> 
                            <input type="date" id="prjenddate" name="end_time" min="2000-01-01" max="2050-12-31" />
                        </td>
                    </tr>  
                
                    <tr>
                        <td>요구 기술</td>
                        <td>
                            <select name="skill_name" id="skill_name" class="skill_name"> 
				                <option value="JAVA">JAVA</option>
				                <option value="Servlet/JSP">Servlet/JSP</option>
				                <option value="XML">XML</option>
				                <option value="DataBase">DataBase</option>
				                <option value="MVC">MVC</option>
				                <option value="Spring">Spring</option>
				                <option value="Front-End">Front-End</option>
				                <option value="Excel">Excel</option>
				                <option value="PPT">PPT</option>
				                <option value="OS">OS</option>
				            </select>  
                        </td>
                    </tr>

                    
                    <tr>
                        <td>내용</td>
                        <td>        
                            <textarea name="content" textarea style="width:100%; height:100%;" rows="20" class="content"></textarea>
                        </td>
                    </tr>
                        

                    <tr>
                        <td>파일업로드</td>
                        <td>
                            <input id="fileUpload" class="input" type="file">
                        </td>
                    </tr>
                    
                    <tr>
                        <td>비밀번호</td>
                        <td>
                            <input  type="password" name="pwd" class="pwd">
                        </td>
                    </tr>
                </table>
                <input type="hidden" value="${sessionScope.p_no}" name="p_no">
                <br>
                <input type="button" value="등록" onClick="checkprjRegForm()" style="font-size: 20px; padding: 5px 10px;">
            </div>
        </form>
        </center>
    </div>
       
    <%@ include file="footer.jsp" %>
</body>
</html>

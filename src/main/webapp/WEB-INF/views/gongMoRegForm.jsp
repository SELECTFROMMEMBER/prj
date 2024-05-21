<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/common.jsp"%>  

<!DOCTYPE html>
<html>

<head>

	<script>
  
  function checkGongMoRegForm(){
	  
	  var formObj    = $("[name='gongMoRegForm']");
	  
	  alert(formObj.serialize( ));
	  
	  $.ajax(
				{ 
					//--------------------------------------
					// WAS 에 접속할 URL 주소 지정
					//--------------------------------------
					url    : "/gongMoRegProc.do"
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
							alert("공모글 작성 성공입니다.");
							location.replace("/gongMo.do")
						}
						else{
							alert("공모글 작성 실패입니다. 관리자에게 문의 바람!");
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
    <div id="container">    
 <%@ include file="header.jsp" %>


<div id="wrap" >
    <center>
    	<br>
    	<h1> 공모전 등록 </h1>
    	<form action="submit.php" method="POST" name='gongMoRegForm'>
  		 <br>
  		 <table align="center" bordercolor="gray" border=1 cellpadding=7 style="border-collpase:collpase">
              
             <tr>
                 <th>제목</th>
                 <td><input type="text" id="subject" name="subject" required></td>
             </tr>
             
                <tr>
                 <th>분야</th>
                  <td>
                  <select name="field_code" id="field_code" class="select">
                    <option value="1">IT·인터넷</option>
                    <option value="2">디자인</option>
                    <option value="3">미디어</option>
                    <option value="4">교육</option>
                    <option value="5">의료</option>
                </select>
                </td>
             </tr>  
             
             <tr>
                 <th>기간</th>
	             <td><label for="gongMostartdate">시작일:</label> 
				<input type="date" id="start_time" name="start_time" min="2018-12-31" max="2030-01-01" />
                ~
                <label for="gongMoenddate">마감일:</label> 
				<input type="date" id="end_time" name="end_time" min="2018-12-31" max="2030-01-01" />
                 </td>
             </tr>  
             
             
               
            <tr>
			    <th>설명</th>
			    <td><textarea id="content" name="content" rows="20" cols="50" required></textarea></td>
			</tr>
				
			<tr>
			    <th>파일 업로드</th>
			    <td><input type="file" id="competition_file" name="competition_file" accept=".pdf, .doc, .docx" required></td>
			</tr>
			
			<tr>
                <th>비밀번호</th>
                <td>
                    <input  type="password" name="pwd" class="pwd">
                </td>
            </tr>
             
              </table>
              <input type="hidden" name="c_no" value="${sessionScope.c_no}">
              </form>
              <br>
          <input type="button" onClick="checkGongMoRegForm()" value=" 등록 ">
          
          </center>
 </div>      
</body>
<%@ include file="footer.jsp" %>
</html>

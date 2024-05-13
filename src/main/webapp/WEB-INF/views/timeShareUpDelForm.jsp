<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/common.jsp" %>

<!DOCTYPE html>
<html>

<head>
<script>


function checktimeShareUpForm(){

	var formObj  = $("[name='timeShareUpDelForm']");
	var pwdObj   = formObj.find(".pwd");
	
	if( pwdObj.val().trim().length==0 ){
		alert("암호를 입력하십시요");
		pwdObj.val("");
		return;
	}
	/*
	//----------------------------------------------
	var formObj      = $("[name='buupUpDelForm']");
	var nameObj      = formObj.find(".name");
	var phoneObj     = formObj.find(".phone");
	var hope_workObj = formObj.find(".hope_work");
	var contentObj   = formObj.find(".content");
	//----------------------------------------------
	if( 
			contentObj.val().trim().length==0 
			||
			contentObj.val().trim().length>500 
	){
		alert("내용은 임의 문자 1~500자 입력해야합니다.");
		//contentObj.val("");
		return;
	}
	//----------------------------------------------
	if( new RegExp(/^[가-힣]{2,15}$/).test(writerObj.val())==false ){
		alert("작성자는 2~15자 한글이어야합니다.");
		writerObj.val("");
		return;
	}
	//----------------------------------------------
	if( new RegExp(/^.{2,30}$/).test(subjectObj.val())==false ){
		alert("제목은 임의 문자 2~30자 입력해야합니다");
		subjectObj.val("");
		return;
	}
	//----------------------------------------------
	if( new RegExp(/^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/).test(emailObj.val())
																		==false ){
		alert("이메일 형식이 아닙니다. 재입력 바랍니다.");
		emailObj.val("");
		return;
	}
	//----------------------------------------------
	
    */
	
	if( confirm("정말 수정하시겠습니까?")==false ){ return; }
	
	
	//----------------------------------------------
	// JQuery 객체의 [ajax 메소드]를 호출하여
	// 페이지 이동없이(=현 화면 고정) 
	// WAS 와 비동기 방식으로 통신하고 얻은 데이터를 현재 화면에 반영한다.
	//-----------------------------------------------------
	//-----------------------------------------------------
	// JQuery 객체의 [ajax 메소드]를 호출하여
	// WAS 에 "/boardUpProc.do" 주소로 접속하고 
	// 게시판 수정 결과를 받아서
	// 성공했으면 경고하고 게시판 목록화면으로 이동하고
	// 실패했으면 경고하기
	//-----------------------------------------------------
	$.ajax(
		{ 
			//--------------------------------------
			// WAS 에 접속할 URL 주소 지정
			//--------------------------------------
			url    : "/timeShareUpProc.do"
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
				if(result==-1){
					alert("암호가 틀립니다.");
					pwdObj.val("");
				}
				
				else if(result==0){
					alert("삭제된 게시글 입니다.");
					location.replace("/timeShare.do");
				}
				
				else{
					alert("게시글 수정 성공입니다.");
					location.replace("/timeShare.do");
				}
				
			}
			//----------------------------------------------------------
			// WAS 의 응답이 실패했을 실행할 익명함수 설정.
			//----------------------------------------------------------
			,error : function(){
				alert("수정 실패! 관리자에게 문의 바람니다.");
			}
		}
	);
}



function checktimeShareDelForm(){
	//----------------------------------------------
	var formObj    = $("[name='timeShareUpDelForm']");
	var pwdObj     = formObj.find(".pwd");
	//----------------------------------------------
	if( pwdObj.val().trim().length==0 ){
		alert("암호를 입력하십시요");
		pwdObj.val("");
		return;
	}
	if( confirm("정말 삭제 하시겠습니까?")==false ){ return; }
	//-----------------------------------------------------
	// JQuery 객체의 [ajax 메소드]를 호출하여
	// WAS 에 "/buupDelProc.do" 주소로 접속하고 
	// 게시판 삭제 결과를 받아서
	// 성공했으면 경고하고 게시판 목록화면으로 이동하고
	// 실패했으면 경고하기
	//-----------------------------------------------------
	$.ajax(
		{ 
			//--------------------------------------
			// WAS 에 접속할 URL 주소 지정
			//--------------------------------------
			url    : "/timeShareDelProc.do"
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
				if(result==-1){
					alert("암호가 틀립니다.");
				}
				else if(result==0){
					alert("삭제된 글 입니다.")
					location.replace("/timeShare.do");
				}
				else{
					alert("게시글 삭제 성공입니다.")
					location.replace("/timeShare.do");
				}
			}
			//----------------------------------------------------------
			// WAS 의 응답이 실패했을 실행할 익명함수 설정.
			//----------------------------------------------------------
			,error : function(){
				alert("삭제 실패! 관리자에게 문의 바람니다.");
			}
		}
	);
}

	</script>
</head>

<body>
    <div id="container">    
  <%@ include file="header.jsp" %>

     <h1 style="text-align: center;">[프리랜서 수정/삭제 페이지]</h1>

    <center>
       <form name="timeShareUpDelForm">
          <table> 


           <tr>     
               <td>이름</td>
               <td>
					<!-------------------------------------------------------->
					<input type="text" name="name" class="name" size="10" maxlength="15" 
									value="${requestScope.boardDTO.name}">
					<!-------------------------------------------------------->
				</td>  
			</tr>   
          
                      
            <tr>     
               <td>휴대폰 번호</td>
               <td>
					<!-------------------------------------------------------->
					<input type="text" name="phone" class="phone" size="10" maxlength="15" 
									value="${requestScope.boardDTO.phone}">
					<!-------------------------------------------------------->
				</td>  
			</tr>
			
       		  <tr>     
                <td>경력</td>
               <td>
					<!-------------------------------------------------------->
					<input type="text" name="career" class="career" size="10" maxlength="15" 
									value="${requestScope.boardDTO.career}">
					<!-------------------------------------------------------->
				</td>  
			</tr>
			
				<tr>
			        <td>선호업무</td>
			        <td>
			         	<input type="text" name="preferred_work" class="preferred_work" size="10" maxlength="15"  
			             value="${requestScope.boardDTO.preferred_work}">
			         </td>
			    </tr>
			
		<!-- select값 꺼내오기 수정중 -->                  
  		 <tr> 
	        <td>근무시간</td>   
	         <td>    
	             
	         <select name="start_time" class="start_time" >
	          <% for (int i = 1; i <= 24; i++) { %>
				        <option value="<%= i %>"><%= String.format("%02d", i) %></option>
				    <% } %>
	        </select>
					  
			      
				</select>
				시~
				<select name="end_time" class="end_time"  value="${requestScope.boardDTO.end_time}">
				    <% for (int i = 1; i <= 24; i++) { %>
				        <option value="<%= i %>"><%= String.format("%02d", i) %></option>
				    <% } %>
				</select>
				시
                </td>
             </tr>   
   
   
          <tr>
            <td>주소</td>
            <td>
                <select name="addr1" id="sido1"></select>
                <select name="addr2" id="gugun1"></select> 
                <input type="text" name="addr3" id="detailadress" value="나머지 상세주소" onfocus="if(this.value=='나머지 상세주소') this.value='';">
            </td>
           </tr>

             
           <tr>
             <td>내용</td>
             <td>
              <div style="height: 100px;">
    				<textarea name="content"  style="width:80%; height:80%;"rows="4" cols="50">${requestScope.boardDTO.content}</textarea>

			  </div>
             </td>
             
                               
		     <tr>
			    <td>암호</td>
			    <td><input type="password" name="pwd" class="pwd"  size="8"  maxlength="4"> </td> 
			</tr> 
          </table>
          
               <input type="hidden" name="b_no" value="${requestScope.boardDTO.b_no}">
          
			      
              <center>
                 <span style= "cursor:pointer"  onClick="location.replace('/timeShare.do')">[목록화면]</span>
                 <input type="button" value="수정" onClick= "checktimeShareUpForm();">
                 <input type="button" value="삭제" onClick= "checktimeShareDelForm();">
     	     </center>
      </form>
  </div>
</body>


</body>
<%@ include file="footer.jsp" %>
</html>

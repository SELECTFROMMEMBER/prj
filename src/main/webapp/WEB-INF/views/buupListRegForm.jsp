<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<script>
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// 등록 버튼을 클릭하면 호출되는 함수
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	function checkbuupReg(){

		//----------------------------------------------
		// name='buupRegForm" 를 가진 form 태그 관리 JQuery 객체 메위주 얻기 
		//----------------------------------------------
		var formObj    = $("[name='buupRegForm']");
        

// 		   var name = $("#name").val();
//         var phone = $("#phone").val();
//         var addr1 = $("select[name='addr1']").val();
//         var addr2 = $("select[name='addr2']").val();
//         var addr3 = $("input[name='addr3']").val();
//         var career = $("#career").val();

//         var hope_work  = $("#hope_work").val();
//         var start_time = $("select[name='start_time']").val();
//         var end_time   = $("select[name='end_time']").val();
//         var content    = $("textarea[name='content']").val();
		
		/* 유효성 (추후 수정)
		//----------------------------------------------
		// 제목의 문자 패턴 검사하기
		//----------------------------------------------
		if( new RegExp(/^.{2,30}$/).test(subjectObj.val())==false ){
			alert("제목은 임의 문자 2~30자 입력해야합니다");
			subjectObj.val("");
			return;
		}
		
		//----------------------------------------------
		// 내용 문자 패턴 검사하기
		//----------------------------------------------
		if( 
				contentObj.val().trim().length==0 
				||
				contentObj.val().trim().length>500 
		){
			alert("내용은 임의 문자 1~500자 입력해야합니다.");
			return;
		}
		*/
		//----------------------------------------------
		// 정말 등록할 건지 확인하기
		//----------------------------------------------
		if( confirm("정말 등록하시겠습니까?")==false ){ return; }
		//-----------------------------------------------------
		// JQuery 객체의 [ajax 메소드]를 호출하여
		// WAS 에 비동기 방식으로 "/boardRegProc.do" 주소로 접속하고 
		// 게시판 입력 결과를 받아서
		// 성공했으면 경고하고 게시판 목록화면으로 이동하고
		// 실패했으면 경고하기
		//-----------------------------------------------------
		$.ajax(
			{ 
				//--------------------------------------
				// WAS 에 접속할 URL 주소 지정
				//--------------------------------------
				url    : "/buupListRegProc.do"
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
						alert("부업 등록 성공입니다.");
						location.replace('/buupList.do');
					}
					else{
						alert("부업 등록 실패입니다. 관리자에게 문의 바람!");
					}
				}
				//----------------------------------------------------------
				// WAS 의 응답이 실패했을 실행할 익명함수 설정.
				//----------------------------------------------------------
				,error : function(){
					alert("입력 실패! 관리자에게 문의 바람니다.");
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
       <h1 style="text-align: center;">부업 등록</h1>
     <form name= "buupRegForm">
      <center>
      
          <table>
              <tr>
                  <th>항목</th>
                  <th>등록 사항</th>
              </tr>
                
            <tr>
                <td>이름:</td>   
                 <td><input type="text" id="name" name="name" required></td>
            </tr> 

             <tr>
                <td>휴대폰 번호:</td>
                <td><input type="text" id="phone" name="phone" required></td>
            </tr> 
            
           <tr>
                <td>주소</td>
                <td><select name="addr1" id="sido1"></select>
                    <select name="addr2" id="gugun1"></select>&nbsp; 
                    <input type="text" name="addr3" id="detailadress" value="나머지 상세주소" 
                        onfocus="if(this.value=='나머지 상세주소') this.value='';"></td> 
            </tr>
             
        <tr>
            <td>경력</td>
            <td>
            <input type="text" name="career" id="career">
             <input type="button" class="addRowButton" onclick="addRow()" value="추가">
            </td>
        </tr> 
        
	     <tr>
	        <td>희망업무</td>
	        <td>
	            <input type="text" id="hope_work" name="hope_work" >
	        </td>
	     </tr>
     
       <tr> 
	        <td>희망근무시간</td>   
	         <td>        
                <select name="start_time" class="start_time">
				    <% for (int i = 1; i <= 24; i++) { %>
				        <option value="<%= i %>"><%= String.format("%02d", i) %></option>
				    <% } %>
			      
				</select>
				시~
				<select name="end_time" class="end_time">
				    <% for (int i = 1; i <= 24; i++) { %>
				        <option value="<%= i %>"><%= String.format("%02d", i) %></option>
				    <% } %>
				</select>
				시
                </td>
             </tr>   
    
    
            <tr>
               <td>내용</td>
               <td>
                  <textarea name="content" textarea style="width:100%; height:100%;" rows="4"></textarea>
               </td>
            <tr>  
            
            
	      <tr>
	        <td>암호</td>
	        <td>
	            <input type="password" id="pwd" name="pwd" >
	        </td>
	     </tr>
     
         </table>
          
          <input type="button" value="등록" onClick="checkbuupReg()">
     </center>
   </form>
 </div>
       
</body>
<%@include file="/WEB-INF/views/common.jsp" %>
 <%@ include file="footer.jsp" %>
</html>

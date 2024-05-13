<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html>

<head>
<script>
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	// 등록 버튼을 클릭하면 호출되는 함수
	//mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
	function checktimeShareReg(){

		var formObj    = $("[name='timeShareRegForm']");
// 	   	   var name = $("#name").val();
//         var phone = $("#phone").val();
//         var addr1 = $("select[name='addr1']").val();
//         var addr2 = $("select[name='addr2']").val();
//         var addr3 = $("input[name='addr3']").val();
//         var career = $("#career").val();

//         var hope_work  = $("#hope_work").val();
//         var start_time = $("select[name='start_time']").val();
//         var end_time   = $("select[name='end_time']").val();
//         var content    = $("textarea[name='content']").val();


		
// 		//----------------------------------------------
// 		// 내용 문자 패턴 검사하기
// 		//----------------------------------------------
// 		if( 
// 				contentObj.val().trim().length==0 
// 				||
// 				contentObj.val().trim().length>500 
// 		){
// 			alert("내용은 임의 문자 1~500자 입력해야합니다.");
// 			return;
// 		}
	
		if( confirm("정말 등록하시겠습니까?")==false ){ return; }
	
		$.ajax(
			{ 
			
				url    : "/timeShareRegProc.do"
				,type  : "post"				
				,data  : formObj.serialize( )
					
				,success : function(json){
					var result = json["result"];
					if(result==1){
						alert("프리랜서 등록 성공입니다.");
						
						location.replace('/timeShare.do');
					}
					else{
						alert("프리랜서 등록 실패입니다. 관리자에게 문의 바람!");
					}
				}
				
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
		<%@ include file="header.jsp"%>


		<center>
			<table align="center" border="1" cellpadding="7"
				style="border-collapse: collapse">
					<h1 style="text-align: center;">프리랜서 등록</h1>
					<form name="timeShareRegForm">
						<tr>
							<td>이름</td>
							<td><input type="text" id="name" name="name" required></td>
						</tr>

						<tr>
							<td>휴대폰번호</td>
							<td><input type="text" name="phone_number" id="phone_number">
						</tr>

						<tr>
							<td>주소</td>
							<td><select name="addr1" id="sido1"></select> <select
								name="addr2" id="gugun1"></select> <input type="text"
								name="addr3" id="detailadress" value="나머지 상세주소"
								onfocus="if(this.value=='나머지 상세주소') this.value='';"></td>
						</tr>

<!-- 						<tr> -->
<!-- 							<td>경력</td> -->
<!-- 							<td><input type="text" name="career" id="career1"> <input -->
<!-- 								type="button" class="addRowButton" onclick="addRow()" value="추가"> -->

<!-- 							</td> -->
<!-- 						</tr> -->

						<tr>
							<td>선호업무</td>
							<td><input type="text" id="Preferred_work"
								name="Preferred_work"></td>
						</tr>

						<tr>
							<td>희망근무시간</td>
							<td><select name="start_time" class="start_time">
									<% for (int i = 1; i <= 24; i++) { %>
									<option value="<%= i %>"><%= String.format("%02d", i) %></option>
									<% } %>

							</select> 시~ <select name="end_time" class="end_time">
									<% for (int i = 1; i <= 24; i++) { %>
									<option value="<%= i %>"><%= String.format("%02d", i) %></option>
									<% } %>
							</select> 시</td>
						</tr>

						<!--     <tr> -->
						<!--         <td>보유자격증</td> -->
						<!--         <td> -->
						<!--             <input type="text" id="license" name="license" > -->
						<!--             <input type="button" class="addRowButton" onclick="addRow()" value="추가"> -->
						<!--         </td> -->
						<!--     </tr> -->


						<tr>
							<td>내용</td>
							<td><textarea name="content" textarea
									style="width: 100%; height: 100%;" rows="4"></textarea></td>
						<tr>
						<tr>
							<td>암호</td>
							<td><input type="password" id="pwd" name="pwd"></td>
						</tr>
				</form>
				</table>
				</center>

				<span onClick="location.replace('/timeShare.do')">[목록으로]</span>
				<input type="button" onClick="checktimeShareReg()" value="등록">

</body>
<%@ include file="footer.jsp"%>
</html>

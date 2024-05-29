<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>12Wa~</title>

<script>
	function regCompany() {
		var formObj = $("[name='company_mem']");

		var cidObj = formObj.find(".cid");
		var pwdObj = formObj.find(".pwd");
		var business_noObj = formObj.find(".business_no");
		var callObj = formObj.find(".call");
		var ceo_nameObj = formObj.find(".ceo_name");
		var ceo_phoneObj = formObj.find(".ceo_phone");
		var nameObj = formObj.find(".name");
		var email1Obj = formObj.find(".email1");
		var email2Obj = formObj.find(".email2");

			 if(cidObj.val() == ''){
				   alert("아이디를 입력해주세요.");
				   return false;
			   }
			   if( new RegExp(/^[a-z][a-zA-Z0-9]{2,15}$/).test(cidObj.val())==false){
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
			   if(business_noObj.val() == ''){
				   alert("사업자 번호를 입력해주세요.");
				   return false;
			   }

			   if( new RegExp(/^[0-9]{5,15}$/).test(business_noObj.val())==false){
				   alert("사업자 번호를 잘못 입력하였습니다.");
				   return false;
			   }

			   if(callObj.val() == ''){
				   alert("회사 번호를 입력해주세요.");
				   return false;
			   }
			   if( new RegExp(/^[0-9]{8,15}$/).test(callObj.val())==false){
				   alert("회사 번호를 잘못 입력하였습니다.");
				   return false;
			   }
			   if( new RegExp(/^[가-힣]{2,15}$/).test(ceo_nameObj.val())==false ){
					alert("대표자 이름은 2~15자 한글이어야합니다.");
					ceo_nameObj.val("");
					return false;
				} 
		alert(11)
		if (ceo_phoneObj.val() == '') {
			alert("대표 번호를 입력해주세요.");
			return false;
		}
		if (new RegExp(/^[0-9]{8,15}$/).test(ceo_phoneObj.val()) == false) {
			alert("대표 번호를 잘못 입력하였습니다.");
			return false;
		}
		if (nameObj.val() == '') {
			alert("기업이름을 입력해주세요.");
			return false;
		}
		if (new RegExp(/^[a-z][a-zA-Z가-힣]{2,15}$/).test(nameObj.val()) == false) {
			alert("기업이름은 영어 또는 한글로 작성해주세요.");
			return false;
		}
		if (email1Obj.val() == '' || email2Obj.val() == '') {
			alert("이메일을 입력해 주세요")
			return false;
		}

		return;
		alert(formObj.serialize())
		$.ajax({

			url : "/comProc.do"

			,
			type : "post"

			,
			data : formObj.serialize()

			,
			success : function(json) {
				var result = json["result"];

				if (result == 1) {
					alert("회원가입 입력 성공입니다.");
					alert("로그인 후 기업정보등록 후 이용해주시기 바랍니다.")
					location.replace("loginForm.do")
				} else if (result == 2) {
					alert("아이디가 중복 됩니다. 재 입력 바람.")
					$(".cid").val("");
				} else {
					alert("회원가입 실패.");
				}
			}
			//----------------------------------------------------------
			// WAS 의 응답이 실패했을 실행할 익명함수 설정.
			//----------------------------------------------------------
			,
			error : function() {
				alert("회원가입 실패! 관리자에게 문의 바람니다.");
			}
		});
	}
</script>
</head>

<body>

	<div id="container">
		<%@ include file="header.jsp"%>



		<br>
		<div class="container">
			<h1 style="text-align: center;">기업 회원가입</h1>
			<form action="submit.php" method="POST" name="company_mem">
				<center>
					<table>

						<tr>
							<th>항목</th>
							<th>등록 사항</th>
						</tr>
						<tr>
							<td>아이디:</td>
							<td><input type="text" id="cid" name="cid" class="cid"
								required></td>
						</tr>
						<tr>
							<td>패스워드:</td>
							<td><input type="password" id="pwd" name="pwd" class="pwd"
								required></td>
						</tr>
						<tr>
							<td>사업자 번호:</td>
							<td><input type="text" id="business_no" name="business_no"
								class="business_no" required></td>
						</tr>

						<tr>
							<td>회사 번호:</td>
							<td><input type="text" id="call" name="call" class="call"
								required></td>
						</tr>
						<tr>
							<td>대표 이름:</td>
							<td><input type="text" id="ceo_name" name="ceo_name"
								class="ceo_name" required></td>
						</tr>
						<tr>
							<td>대표 번호:</td>
							<td><input type="text" id="ceo_phone" name="ceo_phone"
								class="ceo_phone" required></td>
						</tr>


						<tr>
							<td>기업 이름:</td>
							<td><input type="text" id="name" name="name" class="name"
								required></td>
						</tr>
						<tr>
							<td>email:</td>
							<td><input type="text" id="email" name="email"
								class="email1" required> @ <select name="email2"
								class="email2">
									<option value="@naver.com">naver.com</option>
									<option value="@daum.net">daum.net</option>
									<option value="">직접입력</option></td>
						</tr>
					</table>

					<input type="button" value="가입하기" onClick="regCompany()">
				</center>
			</form>
		</div>
</body>
<%@include file="/WEB-INF/views/common.jsp"%>
<%@ include file="footer.jsp"%>
</html>

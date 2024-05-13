<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common.jsp"%>

<!DOCTYPE html>
<html>

<head>
<script>

function search(){
	//---------------------------------------------
	// 변수 boardSearchFormObj 선언하고 
	// name='boardSearchForm' 를 가진 form 태그 관리 JQuery 객체를 생성하고 저장하기
	//---------------------------------------------
	var boardSearchFormObj = $("[name='boardSearchForm']");
	var searchWithIndustry = boardSearchFormObj.find("select").val()
	// 검색 함수 호출
	var keywordObj        = boardSearchFormObj.find(".keyword");
	var keyword             = keywordObj.val();
		if( typeof(keyword)!='string' ){ keyword = ""; }
	keyword = $.trim(keyword);
	keywordObj.val(keyword);
	boardSearchFormObj.find(".rowCntPerPage").val( 
			$("select").filter(".rowCntPerPage").val()
	)
	
	//-----------------------------------------------------
	// JQuery 객체의 [ajax 메소드]를 호출하여
	// WAS 에 "/boardList.do" 주소로 접속하고 
	// boardList.jsp 페이지의 실행 결과인 HTML 코드를 문자로 받아서
	// <div class='boardListDiv'> 태그 내부의 게시판 관련 검색 결과 목록 부분을
	// 현화면의 <div class='boardListDiv'> 태그 내부에 덮어쓰기
	//-----------------------------------------------------
	$.ajax(
		{
			//-------------------------------
			// WAS 로 접속할 주소 설정
			//-------------------------------
			url      : "/companyList.do"
			//-------------------------------
			// WAS 로 접속하는 방법 설정. get 또는 post
			//-------------------------------
			,type    : "post"
			//--------------------------------------
			// WAS 에 보낼 파명과 파값을 설정하기. "파명=파값&파명=파값~"
			//--------------------------------------
			,data    : boardSearchFormObj.serialize( )
			//----------------------------------------------------------
			// WAS 의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			// 이때 익명함수의 매개변수로 WAS 의 응답물이 들어 온다.
			// "/boardList.do" 주소의 응답물은  boardList.jsp 페이지의
			// 실행결과인 HTML 문서 문자열이이다.
			//----------------------------------------------------------
			,success : function(responseHtml){

				//-----------------------------------
				// 매개변수로 들어오는 HTML 문자열을 관리하는 
				// JQuery 객체 생성하여 변수 obj 에 저장하기
				//-----------------------------------
				var obj = $(responseHtml);
				
				//-----------------------------------
				// 매개변수로 받은 HTML 문자열 중에 
				// <div class='boardListDiv'> 태그 안의 html 문자열을
				// 현 화면의 <div class='boardListDiv'> 태그 안에  덮어쓰기
				//-----------------------------------boardListDiv pagingNos
				$(".boardListDiv").html( 
						obj.find(".boardListDiv").html() 
				);
				$(".pagingNos").html( 
						obj.find(".pagingNos").html() 
				);
			

				
				
// 				$("body").append(
// 					"<textarea class=xxx cols=100 rows=100>"
// 					+ obj.filter(".boardListDiv").html()
// 					+"</textarea>"
				//)
				
			}
			,error   : function(){
				alert("검색 실패! 관리자에게 문의 바람니다.");
			}
		}
	);
}
///////////////////////search()종료부분
function searchReset(){
	var boardSearchFormObj = $("[name='boardSearchForm']");
	boardSearchFormObj.find(".keyword").val("");
 	$("[name='boardSearchForm']").find("[name='sort']").val("");
 	$("[name='boardSearchForm']").find("[name='selectedIndustry']").val("");
    $(".searchBtn").click();
}


function searchWithSort(sort){
 
 	$("[name='boardSearchForm']").find("[name='sort']").val(sort);
	
	
 	$(".searchBtn").click();

}
function searchWithIndustry(selectedIndustry){
 	$("[name='boardSearchForm']").find("[name='selectedIndustry']").val(selectedIndustry);
   $(".searchBtn").click();
}



function gocompanyListDetailForm(c_no){
		$("[name='companyListDetailForm']").find("[name='c_no']").val(c_no);
	
 		document.companyListDetailForm.submit();
	
}




</script>

</head>
<body>
	<div id="container">

		<%@ include file="header.jsp"%>


		<div class="container">
			<h1 style="text-align: center;">기업 정보</h1>

			<form name="boardSearchForm" onsubmit="return false">
				<div style="text-align: center; margin-bottom: 20px;">
					<input type="text" name="keyword" class="keyword"> <input
						type="button" value="검색" class="searchBtn" onclick="search()"></input>
				</div>


				<p align="right">
					업종<select name="selectedIndustry" class="selectedIndustry"
						onChange="search()">
						<option value="">업종을 선택해주세요.</option>
						<option value="화장품 및 뷰티 제품 제조업">화장품 및 뷰티 제품 제조업
						<option value="식품 및 음료 소매업">식품 및 음료 소매업
						<option value="건설/건축 서비스">건설/건축 서비스
						<option value="의료/보건 서비스">의료/보건 서비스
						<option value="여행/관광 업종">여행/관광 업종
						<option value="환경 보호/재활용 산업">환경 보호/재활용 산업
						<option value="생활용품/가전제품 도매업">생활용품/가전제품 도매업
						<option value="금융 및 보험 서비스">금융 및 보험 서비스
						<option value="자동차 부품 제조업">자동차 부품 제조업
						<option value="출판/인쇄 업종">출판/인쇄 업종
						<option value="교육 기술 서비스">교육 기술 서비스
						<option value="농업 및 농산물 가공 산업">농업 및 농산물 가공 산업
						<option value="전자상거래/온라인 판매">전자상거래/온라인 판매
						<option value="음악/예술 엔터테인먼트 산업">음악/예술 엔터테인먼트 산업
						<option value="생명 공학/의료 기기 산업">생명 공학/의료 기기 산업
						<option value="통신/네트워크 서비스">통신/네트워크 서비스
						<option value="스포츠/운동 기술 산업">스포츠/운동 기술 산업
						<option value="에너지/청정 기술 산업">에너지/청정 기술 산업
						<option value="인테리어 디자인/가구 제조업">인테리어 디자인/가구 제조업
						<option value="컴퓨터/소프트웨어 서비스">컴퓨터/소프트웨어 서비스
						<option value="식물/원예 관련 서비스">식물/원예 관련 서비스
						<option value="코스메틱/미용 서비스">코스메틱/미용 서비스
						<option value="공예품/수공예품 제조업">공예품/수공예품 제조업
						<option value="동물 의료 서비스">동물 의료 서비스
						<option value="부동산 개발/투자">부동산 개발/투자
						<option value="국제 무역/물류 서비스">국제 무역/물류 서비스
						<option value="자원 관리/환경 컨설팅">자원 관리/환경 컨설팅
						<option value="자료/정보 서비스">자료/정보 서비스
						<option value="패션/의류 디자인 업종">패션/의류 디자인 업종
					</select>
				</p>
				<input type="hidden" name="sort" class="sort" value="">
			
			<br>

			<c:if
				test="${param.sort!='sal_avg asc' and param.sort!='sal_avg desc'}">
				<p style="cursor: pointer" onClick="searchWithSort('sal_avg desc')">연봉</p>
			</c:if>

			<c:if test="${param.sort=='sal_avg desc'}">
				<p style="cursor: pointer" onClick="searchWithSort('sal_avg asc')">연봉▼</p>
			</c:if>

			<c:if test="${param.sort=='sal_avg asc'}">
				<p style="cursor: pointer" onClick="searchWithSort('')">연봉▲</p>
			</c:if>

			<c:if test="${param.sort!='sales asc' and param.sort!='sales desc'}">
				<p style="cursor: pointer" onClick="searchWithSort('sales desc')">매출</p>
			</c:if>

			<c:if test="${param.sort=='sales desc'}">
				<p style="cursor: pointer" onClick="searchWithSort('sales asc')">매출▼</p>
			</c:if>

			<c:if test="${param.sort=='sales asc'}">
				<p style="cursor: pointer" onClick="searchWithSort('')">매출▲</p>
			</c:if>

			<c:if
				test="${param.sort!='AVG(r.star) asc' and param.sort!='AVG(r.star) desc'}">
				<p style="cursor: pointer"
					onClick="searchWithSort('AVG(r.star) desc')">별점</p>
			</c:if>
			<c:if test="${param.sort=='AVG(r.star) desc'}">
				<p style="cursor: pointer"
					onClick="searchWithSort('AVG(r.star) asc')">별점▼</p>
			</c:if>
			<c:if test="${param.sort=='AVG(r.star) asc'}">
				<p style="cursor: pointer" onClick="searchWithSort('')">별점▲</p>
			</c:if>
</form>

			<br>

			<div class="boardListDiv" id="container">
				<form action="submit.php" method="POST">
					<table
						style="border: 1px solid black; margin-left: auto; margin-right: auto;">


						<c:forEach var="board" items="${requestScope.companyList }"
							varStatus="status">
							<tr style="cursor: pointer"
								onClick="gocompanyListDetailForm(${board.c_no});">
								<td>
									<div style="display: flex; align-items: center;">
										<img width="80" src="images/photo-1.jpg"
											style="margin-right: 10px;"> &lt기업 이름&gt ${board.name}<br>
										&lt업종&gt ${board.indus}<br> &lt매출&gt ${board.sales}<br>
										&lt연봉&gt ${board.sal_avg}<br>
									</div>
									<div
										style="text-align: right; margin-top: auto; margin-bottom: auto;">평균별점
										${board.star_avg}</div>

								</td>
							</tr>
						</c:forEach>

					</table>
					<c:if test="${empty requestScope.companyList}">
						<center>
							<b> 조회할 데이터가 없습니다. </b>
						</center>
					</c:if>
				</form>
			</div>
			<form name="companyListDetailForm" action="/companyListDetail.do"
				method="post">
				<!-- 클릭한 행의 게시판 고유번호가 저장될 히든태그 선언 -->
				<input type="hidden" name="c_no">
			</form>
</body>
<%@ include file="footer.jsp"%>
</html>

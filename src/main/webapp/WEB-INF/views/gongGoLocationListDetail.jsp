<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common.jsp"%>  
    
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>12Wa~</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">


 <style>
       .table-container {
          display: flex;
          justify-content: space-between;
          margin: 0 auto; /* 가운데 정렬을 위해 추가 */
      }
      .table-container table {
          border-collapse: collapse;
          border: 1px solid gray;
          padding: 7px;
      }
      
      #links {
  float: left;
}
	    .circle {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid blue;
            overflow: hidden;
        }
        img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
	
  </style>
	
</head>
  
<body>
 <div id="container">    
 <%@ include file="header.jsp" %>
        
        <br><br>
         기업이름<!-- <td>${requestScope.boardDTO.writer}</td> -->
       
		<input type="button" value="입사지원"></input>
        
        
        <div class="table-container">
            <table align="center" bordercolor="gray" border="1" cellpadding="7" style="border-collapse:collapse">
                <tr>
                    <td> 경력 :</td>
                    <!-- <td>${requestScope.boardDTO.writer}</td> -->
                </tr>
                <tr>
                    <td> 학력 :</td>
                </tr>
                <tr>
                    <td> 필수조건 :</td>
                </tr>
                <tr>
                    <td> 우대사항 :</td>
                </tr>
                
                
            </table>
            <table align="center" bordercolor="gray" border="1" cellpadding="7" style="border-collapse:collapse">
                <tr>
                    <td> 급여 :</td>
                    <!-- <td>${requestScope.boardDTO.writer}</td> -->
                </tr>
                
                <tr>
                    <td> 근무형태 :</td>
                </tr>
                <tr>
                    <td> 근무일시 :</td>
                </tr>
                <tr>
                    <td> 근무지역 :</td>
                </tr>
            </table>
        </div>
        
        <br>
         채용부문
         <table align="center" bordercolor="gray" border="1" cellpadding="7">
           <tr>
        <th colspan="1">구문</th>
        <th colspan="2">상세내용</th>
    </tr>
    <tr>
        <th rowspan="4">백앤드<br>웹 개발자</th>
    </tr>
    <tr>
        <td>담당업무</td>
        <td>Android 기기 개발 프로젝트 업무<br>Android 기기 개발 프로젝트 업무</td>
    </tr>
    <tr>
        <td>자격조건</td>
        <td>경력:3-15년<br>기본 영어 의사소통 능력</td>
    </tr> 
    <tr>
        <td>우대사항</td>
        <td>우대갈비 잘 먹는사람<br>삼겹살도 가능</td>
    </tr> 
            </table>
    <br>
    채용절차        
    <table align="center">
    
    <div class="container mx-auto px-4 py-10">
        <div class="grid grid-cols-3 gap-8">
            <div class="text-center">
                <div class="circle">
                    <img src="https://source.unsplash.com/random/200x200?sig=1" alt="Image 1">
                </div>
                <p class="mt-2">설명1</p>
            </div>
            <div class="text-center">
                <div class="circle">
                    <img src="https://source.unsplash.com/random/200x200?sig=2" alt="Image 2">
                </div>
                <p class="mt-2">설명2</p>
            </div>
            <div class="text-center">
                <div class="circle">
                    <img src="https://source.unsplash.com/random/200x200?sig=3" alt="Image 3">
                </div>
                <p class="mt-2">설명3</p>
            </div>
        </div>
    </div>
                <tr>
                    <td> 근무형태 :</td>
                </tr>
                <tr>
                    <td> 근무시간 :</td>
                </tr>
                <tr>
                    <td> 근무지역 :</td>
                </tr>
      
    </table>
    
    <br>
    <br>
    
    접수기간 및 방법
  	<table>
			  	 
			    <tr>
			        <td rowspan="4" >남은기간<br>시작일<br>마감일</td>
                	<!-- 마감날 - sysdate 추후에 추가해서 남은 시간 넣기 -->
                	
			    </tr>
  				<tr>
                    <td>지원방법</td>
                </tr>
  	
  	</table>
  
  
     
  </div> 
  

  <script src="js/slideshow.js"></script>
</body>
<%@ include file="footer.jsp" %>
</html>
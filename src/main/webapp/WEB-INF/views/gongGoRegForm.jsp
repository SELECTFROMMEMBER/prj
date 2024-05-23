<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common.jsp"%>  
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>12Wa~</title>
  <style>
  .center-table {
    margin-left: auto;
    margin-right: auto;
  }
</style>
  
    <script>
   function add_row() {
       var my_tbody = document.getElementById('my-tbody');
       var row = my_tbody.insertRow(my_tbody.rows.length); // 하단에 추가

       var cell1 = row.insertCell(0);
       var cell2 = row.insertCell(1);

       cell1.innerHTML = '';
       
       var selectTag = document.createElement("select");
       selectTag.name = "tag";
       selectTag.className = "tag";
       selectTag.innerHTML = `
          <option value=""> </option>
           <option value="1">기획부</option>
           <option value="2">관리부</option>
           <option value="3">회계부</option>
           <option value="4">전산부</option>
           <option value="5">영업부</option>
           <option value="6">자재부</option>
           <option value="7">생산부</option>
           <option value="8">기술연구소</option>
       `;
       cell2.appendChild(selectTag);
       
       cell2.appendChild(document.createTextNode(' ')); // 공백 추가

       var selectPosition = document.createElement("select");
       selectPosition.name = "position_code";
       selectposition.classname = "position_code";
       selectPosition.innerHTML = `
          <option value=""> </option>
           <option value="1">사원</option>
           <option value="2">대리</option>
           <option value="3">과장</option>
           <option value="4">차장</option>
           <option value="5">부장</option>
           <option value="6">이사</option>
           <option value="7">상무</option>
           <option value="8">사장</option>
           <option value="9">인턴</option>
        `;
       cell2.appendChild(selectPosition);
       
       cell2.appendChild(document.createTextNode(' ')); // 공백 추가

       var roleInput = document.createElement("input");
       roleInput.type = "text";
       roleinput.name = "role";
       roleInput.placeholder = "담당업무";
       roleInput.size = "15";
       cell2.appendChild(roleInput);
       
       cell2.appendChild(document.createTextNode(' ')); // 공백 추가

       var sangseaInput = document.createElement("input");
       sangseaInput.type = "text";
       sangseaInput.name = "sangsea";
       sangseaInput.placeholder = "상세내용";
       sangseaInput.size = "15";
       cell2.appendChild(sangseaInput);
       
       cell2.appendChild(document.createTextNode(' ')); // 공백 추가

       var addButton = document.createElement("input");
       addButton.type = "button";
       addButton.value = "추가";
       addButton.onclick = add_row; // 이 부분은 이전 행을 복제하지 않고 새로운 행을 추가하는 데 사용됩니다.
       cell2.appendChild(addButton);
       
       cell2.appendChild(document.createTextNode(' ')); // 공백 추가
       
       var deleteButton = document.createElement("input");
       deleteButton.type = "button";
       deleteButton.value = "삭제";
       deleteButton.onclick = delete_row; // 삭제
       cell2.appendChild(deleteButton);

   }

   function delete_row(event) {
       var row = event.target.parentNode.parentNode;
       row.parentNode.removeChild(row);
   }
      function delete_row() {
       var my_tbody = document.getElementById('my-tbody');
       if (my_tbody.rows.length < 1) return;
       // my_tbody.deleteRow(0); // 상단부터 삭제
       my_tbody.deleteRow( my_tbody.rows.length-1 ); // 하단부터 삭제
     } 
     
      function add_row_plisu() {
           var my_tbody = document.getElementById('benefit_row'); // 'benefit_row' 요소에 접근
           if (my_tbody) { // 요소가 존재하는지 확인
               var row = my_tbody.insertRow(my_tbody.rows.length); // 존재하면 행 추가

               var cell1 = row.insertCell(0);
               cell1.innerHTML = '';

               var cell2 = row.insertCell(1);

               var radio1 = document.createElement("input");
               radio1.type = "radio";
               radio1.name = "choice" + my_tbody.rows.length; // 각 행에 대해 고유한 그룹 생성
               radio1.value = "필수"; // 변경된 부분
               cell2.appendChild(radio1);
               cell2.appendChild(document.createTextNode(' 필수 '));

               var radio2 = document.createElement("input");
               radio2.type = "radio";
               radio2.name = "choice" + my_tbody.rows.length; // 각 행에 대해 고유한 그룹 생성
               radio2.value = "우대"; // 변경된 부분
               cell2.appendChild(radio2);
               cell2.appendChild(document.createTextNode(' 우대 '));

               var select = document.createElement("select");
               select.name = "benefit_code"; // 변경된 부분
               var options = ["운전면허", "지게차운전기능사", "요양보호사자격증", "사회복지사자격증", "간호조무사자격증", "영양사자격증", "보육교사자격증", "건축기사자격증", "전기기능사자격증", "전기산업기사자격증", "용접기능사자격증", "전산회계1급자격증", "전산세무2급자격증", "직업상담사2급자격증", "정보처리기사자격증"];
               options.forEach(function(optionText, index) {
                   var option = document.createElement("option");
                   option.text = optionText;
                   option.value = (index + 1).toString(); // 변경된 부분
                   select.appendChild(option);
               });
               cell2.appendChild(select);

               cell2.appendChild(document.createTextNode(' ')); //공백

               var addButton = document.createElement("input");
               addButton.type = "button";
               addButton.value = "추가";
               addButton.onclick = function() { 
                   var selectedValue = select.options[select.selectedIndex].value;
                   row.querySelector('[name="benefit_code"]').value = selectedValue;
                   add_row_plisu();
               }; // 새로운 행을 추가하는 이벤트 핸들러 연결
               cell2.appendChild(addButton);

               cell2.appendChild(document.createTextNode(' ')); // 공백 추가

               var deleteButton = document.createElement("input");
               deleteButton.type = "button";
               deleteButton.value = "삭제";
               deleteButton.onclick = delete_row_pilsu; // 삭제
               cell2.appendChild(deleteButton);

           } else {
               console.error("Element with id 'benefit_row' not found."); // 요소를 찾을 수 없는 경우 오류 메시지 출력
           }
       }




     function delete_row_pilsu(event) {
           var row = event.target.parentNode.parentNode;
           row.parentNode.removeChild(row);
       } 

     //////////////////////////////////////////

     function add_row_seorew() {
          var table = document.getElementById("benefit_row_seorew"); // 테이블 요소 가져오기
          /* if (table.rows.length >= 4) { // 최대 3개의 행까지만 추가 가능하도록 제한
              alert("최대 5개의 전형방법을 설정 할수 있습니다.");
              return;
          } */
          var newRow = table.insertRow(table.rows.length); // 마지막에 새로운 행 삽입

          
          var cell1 = newRow.insertCell(0); // 첫 번째 셀 생성
          var cell2 = newRow.insertCell(1); // 두 번째 셀 생성

          // 셀에 내용 추가
          cell1.innerHTML = ''; // 첫 번째 셀에 내용 추가

          var selectProcess = document.createElement("select"); // 새로운 select 요소 생성
          selectProcess.name = "PROCESS_CODE"; // 이름 설정
          selectProcess.className = "PROCESS_CODE"; // 클래스 설정
          selectProcess.innerHTML = `
              <option value="1myenjub">1차면접</option>
              <option value="2myenjub">2차면접</option>
              <option value="3myenjub">3차면접</option>
              <option value="AI면접">AI면접</option>
              <option value="injeock">인적성 검사</option>
              <option value="codingtest">코딩테스트</option>
              <option value="cheayong">채용검진</option>
              <option value="noni">처우협의</option>
          `; // 기본적으로는 1차면접만 선택 가능하도록 설정
          cell2.appendChild(selectProcess); // 두 번째 셀에 select 요소 추가
         
          cell2.appendChild(document.createTextNode(' ')); //공백
          
          var addButton = document.createElement("input"); // 새로운 input 요소 생성
          addButton.type = "button"; // 타입 설정
          addButton.value = "추가"; // 값 설정
          addButton.onclick = function() { add_row_seorew(); }; // 클릭 이벤트 핸들러 설정
          cell2.appendChild(addButton); // 두 번째 셀에 input 요소 추가
          
          cell2.appendChild(document.createTextNode(' ')); //공백
          
          var deleteButton = document.createElement("input");
          deleteButton.type = "button";
          deleteButton.value = "삭제";
          deleteButton.onclick = delete_row_seorew; // 삭제
          cell2.appendChild(deleteButton);
      }

        function delete_row_seorew(event) {
          var row = event.target.parentNode.parentNode;
          row.parentNode.removeChild(row);
      }

      

     
   </script>
<script>

 
function gonGoRegForm(){
   var formObj = $("[name='gongGo']");
   alert(formObj.serialize())
   
   $.ajax(
         { 
            
            url    : "/gongGoReg.do"
            
            ,type  : "post"
            
            ,data  : formObj.serialize( )
            
            ,success : function(json){
               var result = json["result"];
               
               
               if(result==1){
                  alert("공고등록 성공입니다.");
                  location.replace("gongGoRegForm.do")
               }
               else {
                  alert("공고등록 실패")
               
               }
            }
            //----------------------------------------------------------
            // WAS 의 응답이 실패했을 실행할 익명함수 설정.
            //----------------------------------------------------------
            ,error : function(){
               alert("공고등록 실패! 관리자에게 문의 바람니다.");
            }
         }
      );
   }
   
   

</script>


</head>
  
<body>

 <div id="container">    
   <%@ include file="header.jsp" %>
  
    <br>

    <form name="gongGo">
    <div class="container">
      <h1 style="text-align: center; font-size:2em;">모집공고</h1><br>
      <form action="submit.php" method="POST" name='gongGo'>
          
    <table class="center-table"  bordercolor="gray" border=1 cellpadding=7 style="border-collpase:collpase" id="myTable">
              
              <tr>
                  <td>담당자성함</td>
                  <td><input type="text" id="manager_name" name="manager_name" required></td>
              </tr>
                 
              <tr>
                  <td>회사번호</td>
                  <td></td>
              </tr>  
             
               <tr>
                  <td>이메일 주소</td>
                  <td>
                  </td>
              </tr>
              
              <tr>
                <td>모집분야</td>
                <td>
                  <select name='tag' class="tag">
                    <option value=""> </option>
                    <option value="1">기획부</option>
                    <option value="2">관리부</option>
                    <option value="3">회계부</option>
                    <option value="4">전산부</option>
                    <option value="5">영업부</option>
                    <option value="6">자재부</option>
                    <option value="7">생산부</option>
                    <option value="8">기술연구소</option>
                  </select>
                  <select name='position_code' class="position_code">
                    <option value=""> </option>
                    <option value="1">사원</option>
                    <option value="2">대리</option>
                    <option value="3">과장</option>
                    <option value="4">차장</option>
                    <option value="5">부장</option>
                    <option value="6">이사</option>
                    <option value="7">상무</option>
                    <option value="8">사장</option>
                    <option value="9">인턴</option>
                  </select>
                  <input type="text" name="role" placeholder="담당업무" size="15">
                  <input type="text" name="sangsea" placeholder="상세내용" size="15">
                  <input type="button" onclick="add_row()" value="추가">
                </td>
           </tr>
           <thead>
           <tbody id="my-tbody"></tbody>
           </thead>

              <tr>
                <td>주소</td>
                <td>
                  <select name="work_place1" id="sido1"></select>
                  <select name="work_place2" id="gugun1"></select>&nbsp;
                  <input type="text" name="work_place3" id="detailadress" value="나머지 상세주소" onfocus="if(this.value=='나머지 상세주소') this.value='';">
                  </td>
          </tr>
              
                
            <tr>
                  <td>경력여부</td>
                  <td>
                  <input type="radio" name="career" value="신입"> 신입
                  <input type="radio" name="career" value="경력"> 경력
                  <input type="radio" name="career" value="경력무관"> 경력무관
                  </td>
              </tr>
              
                   <tbody id="benefit_row">
                <tr>
                    <td>필수/우대 조건</td>
                    <td>
                   
                        <input type="radio" name="choice" value="필수" class="choice" id="choice"> 필수
                        <input type="radio" name="choice" value="우대" class="choice" id="choice"> 우대
                        <select name="benefit_code" id="benefit_code" class="benefit_code"> 
                            <option value="1">운전면허</option>
                            <option value="2">지게차운전기능사</option>
                            <option value="3">요양보호사자격증</option>
                            <option value="4">사회복지사자격증</option>
                            <option value="5">간호조무사자격증</option>
                            <option value="6">영양사자격증</option>
                            <option value="7">보육교사자격증</option>
                            <option value="8">건축기사자격증</option>
                            <option value="9">전기기능사자격증</option>
                            <option value="10">전기산업기사자격증</option>
                            <option value="11">용접기능사자격증</option>
                            <option value="12">전산회계1급자격증</option>
                            <option value="13">전산세무2급자격증</option>
                            <option value="14">직업상담사2급자격증</option>
                            <option value="15">정보처리기사자격증</option>
                        </select>
                         <input type="button" onclick="add_row_plisu()" value="추가"> 
                    </td>
                </tr>
            </tbody>

                <tr>
                <td>최종 학력</td>
                <td>
                    <select id="graduation" name="graduation" class="graduation" >
                        <option value="none">최종 학력 선택</option>
                        <option value="primary">초등학교 졸업</option>
                        <option value="middle">중학교 졸업</option>
                        <option value="high">고등학교 졸업</option>
                        <option value="university">대학교 졸업 (4년 이상)</option>
                    </select>
                    <input type="checkbox" id="graduating_student" name="graduating_student">
             <label for="graduating_student">졸업예정자 지원가능</label>
                </td>
                </tr>
                
                <tr>
                    <td>지원자 성별</td>
                    <td>
                    <input type="radio" name="seeker_sex" value="남"> 남
                    <input type="radio" name="seeker_sex" value="여"> 여
                    <input type="radio" name="seeker_sex" value="성별무관"> 성별무관
                     </td>
                </tr>
                
                <tr>
                    <td>나이</td>
                    <td>
                    <input type="text" name="seeker_age" class="seeker_age" size="7" >
                    ~
                    <input type="text" name="seeker_age" class="seeker_age" size="7">
                    <input type="checkbox" name="gender" value="성별무관"> 나이무관
                     </td>
              </tr>
                <tr>
                   <td>연봉</td>
                   <td>
                   <select id="salary" name="salary" class="salary">
                           <option value="1000">2000만원 이하</option>
                           <option value="2000">2000~3000만원</option>  
                           <option value="3000">3000~4000만원</option>                        
                           <option value="4000">4000~5000만원</option>     
                           <option value="5000">5000~6000만원</option>
                           <option value="6000">6000~7000만원</option>
                           <option value="7000">7000~8000만원</option>
                           <option value="8000">8000~9000만원</option>
                           <option value="10000">1억 이상</option>
                           <option value="aftermoney">면접 후 결정</option>
                       </select>
                       <input type="text" id="other_salary" name="other_salary" placeholder="(선택) 직접기입" class="shadow border rounded py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline flex-grow">
                   </td>
                 </tr>
            
             <tr>
                <td>근무시간</td>
                <td>        
                <select name='attendencetime' class="attendencetime">
                <% for (int i = 1; i <= 24; i++) { %>
                    <option value="<%= i %>"><%= String.format("%02d", i) %></option>
                <% } %>
            </select>
            ~
            <select name='leaveworktime' class="leaveworktime">
                <% for (int i = 1; i <= 24; i++) { %>
                    <option value="<%= i %>"><%= String.format("%02d", i) %></option>
                <% } %>
            </select>
                </td>
             </tr>
             
             <tbody id="benefit_row_seorew">   
                <tr>
                    <td>전형방법</td>
                    <td>
                        <select id="process_code" name="process_code" class="process_code" disabled>
                            <option value="seorew" selected>서류제출</option>
                            <option value="1myenjub">1차면접</option>
                            <option value="2myenjub">2차면접</option>
                            <option value="end_myenjub">최종합격</option>
                        </select>
                        <input type="button" onclick="add_row_seorew()" value="추가">
                    </td>
                </tr>
            </tbody>
            
         <tr>
             <td>시작/마감일</td>
              <td>
                <label for="opendate">공고시작날짜:</label> 
                  <input type="date" id="opendate" class="opendate" name="opendate"/>
                   <label for="closedate">공고마지막날짜:</label> 
                  <input type="date" id="closedate" name="closedate"/>
                </td>

         </tr>
            
         <tr>
            <td>제출서류</td>
            <td>
            <input type="file" name="file">
            </td>            
         </tr>
         
         <tr>
            <td>상세글</td>
            <td>
            <textarea name="content" style="width: 500px; height: 150px;"></textarea>
            </td>
         </tr>
            
          </table>
          
          <br>
          <input type="submit" name="gongGoGO" value="등록하기" onClick="gonGoRegForm()" size="20">
       <br><br>
      </form>
  </div>
 </form>

    
     
</body>
   <%@ include file="footer.jsp" %>
</html>
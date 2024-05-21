<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
    <style>
        .container {
            text-align: center;
        }
        table {
            border: 1px solid black;
            margin-left: auto;
            margin-right: auto;
        }
        .tab-content {
            display: none;
        }
        .tab-content.active {
            display: block;
        }
    </style>
</head>
<body>
    <div id="container">
        <%@ include file="header.jsp" %>

        <div class="container">
            <h1>로그인</h1>
            <table>
                <tr>
                    <th>
                        <input type="radio" id="tab1" name="tab" checked>
                        <label for="tab1">개인 회원</label>
                    </th>
                    <th>
                        <input type="radio" id="tab2" name="tab">
                        <label for="tab2">기업 회원</label>
                    </th>
                </tr>
            </table>

            <div id="tabContent"></div>
        </div>

        <!-- 개인 회원 로그인 폼 -->
        <div id="personalTabContent" class="tab-content center">    
            <form id="personalLoginForm" action="/loginProc.do" method="POST">
            	<input type="hidden" name="board" value="person_mem">
                <label for="pid">개인회원 아이디</label>
                <input type="text" id="mid" name="mid" required><br>
                <label for="pwd">비밀번호</label>
                <input type="password" id="pwd" name="pwd" required><br>
                <input type="submit" value="로그인">
                <input type="button" value="회원가입" onclick="location.replace('/memberRegForm.do')">
                <section class="login-join">
                    <a href="/findUsername" target="_new">아이디 찾기</a> |
                    <a href="/findPassword" target="_new">비밀번호 찾기</a>
                </section>
            </form>
        </div>

        <!-- 기업 회원 로그인 폼 -->
        <div id="companyTabContent" class="tab-content center">
            <form id="companyLoginForm" action="/loginProc.do" method="POST">
            	<input type="hidden" name="board" value="company_mem">
                <label for="companyUsername">기업회원 아이디</label>
                <input type="text" id="mid" name="mid" required><br>
                <label for="companyPassword">비밀번호</label>
                <input type="password" id="pwd" name="pwd" required><br>
                <input type="submit" value="로그인">
                <input type="button" value="회원가입" onclick="location.replace('/companyRegForm.do')">
                <section class="login-join">
                    <a href="/findUsername" target="_new">아이디 찾기</a> |
                    <a href="/findPassword" target="_new">비밀번호 찾기</a>
                </section>
            </form>
        </div>
    </div>

    <script>
        function loadTabContent(tabId) {
            var tabContent = document.getElementById(tabId);
            document.querySelectorAll('.tab-content').forEach(function(content) {
                content.classList.remove('active');
            });
            tabContent.classList.add('active');
        }

        document.getElementById('tab1').addEventListener('change', function() {
            loadTabContent('personalTabContent');
        });

        document.getElementById('tab2').addEventListener('change', function() {
            loadTabContent('companyTabContent');
        });

        loadTabContent('personalTabContent');


        // AJAX 요청을 처리하는 JavaScript 코드
        function handleLoginFormSubmit(event, formId) {
            event.preventDefault(); // 기본 동작(페이지 새로고침) 방지

            var formData = new FormData(document.getElementById(formId));

            fetch('/loginProc.do', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                if (data == 1) {
                    alert('로그인 성공(개인회원)');
                    location.replace('/12Wa.do');
                } 
                else if (data == 2) {
                    alert('로그인 성공(기업회원)');
                    location.replace('/12Wa.do');                
                }
                else {
                    alert('로그인 실패');
                }
            })
            .catch(error => {
                alert('웹서버 접속 실패! 관리자에게 문의 바람.');
                console.error(error);
            });
        }

        document.getElementById('personalLoginForm').addEventListener('submit', function(event) {
            handleLoginFormSubmit(event, 'personalLoginForm');
        });

        document.getElementById('companyLoginForm').addEventListener('submit', function(event) {
            handleLoginFormSubmit(event, 'companyLoginForm');
        });
    </script>
    
    <%@ include file="/WEB-INF/views/common.jsp" %>
    <%@ include file="footer.jsp" %>
</body>
</html>

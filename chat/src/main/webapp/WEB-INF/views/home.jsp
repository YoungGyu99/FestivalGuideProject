<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="register.css">
    <style>
        /* 이미지 스타일 */
        #img {
            position: absolute;
            top: 0;
            left: 0;
        }

        /* 나머지 스타일은 여기에 계속해서 추가하십시오. */
        #container {
            width: 600px;
            margin: 0 auto;
            margin-top: 150px;
        }

        h2 {
            text-align: center;
            text-transform: uppercase;
            color: #000;
        }

        .divider-custom {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .divider-custom-line {
            flex-grow: 1;
            height: 1px;
            background-color: #000;
        }

        .divider-custom-icon {
            margin: 0 10px;
            font-size: 1.5em;
            color: #000;
        }

        .row {
            justify-content: center;
        }

        .col-lg-8 {
            max-width: 100%;
        }

        .form-floating {
            margin-bottom: 1rem;
        }

        .form-control {
            width: 100%;
            height: 35px;
            border: 1px solid #aaa;
            border-radius: 5px;
            padding: 5px;
        }

        label {
            font-weight: bold;
        }

        .form-check-input {
            margin-right: 5px;
        }

        .btn-primary {
            width: 100%;
            height: 50px;
            margin-top: 20px;
            border: 1px solid #ccc;
            background: #eee;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div id="container">
        <h2>로그인</h2>
        <form method="post" action="<c:url value="/loginDo" />">
            <div class="form-floating mb-3">
                <input class="form-control" name="memId" type="text" value="${cookie.rememberId.value }" placeholder="아이디를 입력해주세요 ">
                <label for="memId">아이디</label>
            </div>
            <div class="form-floating mb-3">
                <input class="form-control" name="memPw" type="password" placeholder="비밀번호를 입력해주세요 ">
                <label for="memPw">비밀번호</label>
            </div>
            <!-- 아이디 기억하기 -->
            
            <button id="loginButton" class="btn btn-primary btn-xl" type="submit">로그인</button>
            
            <!-- 가입하기 버튼 추가 -->
            <a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath }/registView">회원가입</a>
            
        </form>
    </div>
    <!-- 이미지를 왼쪽 상단에 표시 -->
    <div style="text-align: center; margin-top: 20px;">
        <img class="img-fluid" src="resources/img/img2.png" width="200px" height="100px">
    </div>
    

    <script>
        function openRegistration() {
            // 가입하기 버튼을 클릭하면 가입 페이지로 이동
            window.location.href = 'registView'; // 가입 페이지의 URL로 변경해야 합니다.
        }
        
        
    </script>
    
    
    
    
</body>
</html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            margin-top: 200px;
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
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
		<!-- Contact Section-->
        <section class="page-section" id="contact" style="margin-top: 150px">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원가입</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">
                        <form method="post" action="<c:url value="/registDo" />" >
                        	<div class="form-floating mb-3">
                        		<input class="form-control" name="id" type="text" 
                        		   placeholder="아이디를 입력해주세요 ">
                        		<label>아이디</label>
                        	</div>
                        	<div class="form-floating mb-3">
                        		<input class="form-control" name="pw" type="password" 
                        		   placeholder="비밀번호를 입력해주세요 ">
                        		<label>비밀번호</label>
                        	</div>
                        	<div class="form-floating mb-3">
                        		<input class="form-control" name="nm" type="text" 
                        		   placeholder="이름을 입력해주세요">
                        		<label>이름</label>
                        	</div>
                        	<button class="btn btn-primary btn-xl" type="submit">가입하기</button>
                        </form>
                    </div>
                </div>
            </div>
            <script>
            function fn_save() {
                const userId = document.getElementById('user-id').value;
                const userPw = document.getElementById('user-pw').value;
                const userPw2 = document.getElementById('user-pw2').value;

                
                if (userPw !== userPw2) {
                    alert('비밀번호가 일치하지 않습니다.');
                    return;
                }
                if (userId.length < 4 || userId.length > 15) {
                    alert('아이디는 4~15자리로 입력해주세요.');
                    return;
                }
                if (userPw.length < 8) {
                    alert('비밀번호는 8자리 이상으로 입력해주세요.');
                    return;
                }

            
                if (localStorage.getItem(userId) !== null) {
                    alert('이미 존재하는 아이디입니다. 다른 아이디를 사용해주세요.');
                    return;
                }

                
                localStorage.setItem(userId, userPw);
                alert('회원가입이 완료되었습니다.');
                closeRegistration();
            }

            function closeRegistration() {
                window.close();
        
            }
            
        </script>
        </section>
            <div style="text-align: center; margin-top: 20px;">
        <img class="img-fluid" src="resources/img/img2.png" width="200px" height="100px">
    </div>
</body>
</html>
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
<head>
<meta charset="UTF-8">
<title>error page</title>
</head>
<body>
		<%@include file="/WEB-INF/inc/top.jsp" %>
		<header class="masthead bg-primary text-white text-center">
			<div class="container d-flex align-items-center flex-column">
			<img alt="" src="assets/img/avataaars.svg"
			            class="masthead-avatar md-5">
			<h1 class="masthead-hearding text-uppercase mb-0">에러 페이지</h1>
		    <div class="divider-custom">
                   <div class="divider-custom-line"></div>
                   <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                   <div class="divider-custom-line"></div>
             </div>
			<p class="masthead-subheading font-weight-light mb-0">
			        의도치 않은 에러가 발생했습니다.</p>
			</div>
		</header>
</body>
</html>
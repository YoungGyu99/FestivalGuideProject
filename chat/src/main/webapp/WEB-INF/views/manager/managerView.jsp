<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/inc/top.jsp" %>
<html lang="en">
<style>
        /* 전체 페이지 스타일링 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        
        /* 헤더 스타일링 */
        header {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 5px 0; /* 헤더의 상단 및 하단 패딩을 20px로 늘립니다. */
        }
        
        /* 네비게이션 스타일링 */
        nav ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        nav li {
            margin-right: 20px;
        }

        nav a {
            text-decoration: none;
            color: white;
            font-weight: bold;
        }
        
        /* 메인 채팅 컨테이너 스타일링 */
        #chat-container {
            width: 400px;
            height: 600px;
            margin: 20px auto;
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: flex;
            flex-direction: column;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        
        /* 채팅 메시지 스타일링 */
        .message {
            border-top: 1px solid #ccc;
            padding: 10px;
            margin-top: 5px;
            background-color: #e6e6e6;
            border-radius: 5px;
        }
        
        /* 채팅 입력 및 전송 버튼 스타일링 */
        #user-input {
            display: flex;
            padding: 10px;
            background-color: #f0f0f0;
            border-top: 1px solid #ccc;
            border-bottom-left-radius: 5px;
            border-bottom-right-radius: 5px;
        }

        #user-input input {
            flex: 1;
            padding: 10px;
            outline: none;
            border: none;
            border-radius: 3px;
        }

        #user-input button {
            border: none;
            background-color: #1e88e5;
            color: white;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 3px;
            margin-left: 10px;
        }
    </style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>담당자연락처</title>
</head>
<body>
    
<p style="text-align: center; margin-top: 100px; font-size: 24px;"> 담당자 : 이영규 </p>
<p style="text-align: center; margin-top: 60px; font-size: 20px;"> P. 010-1234-1234 </p>

  
</body>


<footer style="margin-top: 20px;">
    <div style="text-align: center;">
        <img class="img-fluid" src="resources/img/img2.png" width="200px" height="100px">
    </div>
    <p style="text-align: center;">&copy; 30119 세종특별자치시 갈매로 388 정부세종청사 15동
        대표전화: 044-203-2000(월~금 09:00~18:00, 공휴일 제외)  팩스: 044-203-3447
        Copyright ⓒ Ministry of Culture, Sports and Tourism</p>
</footer>

</html>
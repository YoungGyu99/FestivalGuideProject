<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@include file="/WEB-INF/inc/top.jsp" %>
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

    footer {
        text-align: center;
        position: relative;
        color: black;
        padding: 400px 0;
        transition: all 0.3s ease; /* 부드럽게 이동하도록 트랜지션 추가 */
    }
</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>축제기획안</title>
</head>
<body>

<p style="text-align: center; margin-top: 100px;">
    축제 이름/ 축제 장소 / 기본 계획 / 담당자 이름, 연락처 / 축제 기간 / 총 예산 등을 입력해 주세요
</p>

<p style="text-align: center; margin-top: 60px;">
    (출력까지 다소 시간이 걸릴 수 있습니다.)
</p>

<p style="text-align: center;">
    <a href="${pageContext.request.contextPath}/js/plan.docx" download="plan.docx">기획서 양식 다운로드</a>
</p>

<div id="chat-container">
    <div id="chat-messages"></div>
    <div id="user-input">
        <input type="text" placeholder="양식에 맞게 입력해 주세요" />
        <button>전송</button>
    </div>
</div>

<!-- 이미지 추가 -->

<script src="${pageContext.request.contextPath}/js/chatbot_con.js"></script>
<script>
    // 메시지 창이 내려갈 때 푸터도 함께 이동하는 함수
    function moveFooter() {
        const chatContainer = document.getElementById('chat-container');
        const footer = document.querySelector('footer');
        
        // chatContainer의 스크롤 높이와 채팅창의 전체 높이를 비교
        if (chatContainer.scrollHeight > chatContainer.clientHeight) {
            // 스크롤 높이가 채팅창의 높이보다 크면 푸터 이동
            const scrollDiff = chatContainer.scrollHeight - chatContainer.clientHeight;
            footer.style.transform = `translateY(${scrollDiff}px)`;
        }
    }

    // 채팅창에 새로운 메시지가 추가될 때마다 푸터 이동 함수 호출
    const chatMessages = document.getElementById('chat-messages');
    chatMessages.addEventListener('DOMNodeInserted', moveFooter);
</script>

<footer>
    <div style="text-align: center;">
        <img class="img-fluid" src="resources/img/img2.png" width="200px" height="100px">
    </div>
    <p style="text-align: center;">&copy; 30119 세종특별자치시 갈매로 388 정부세종청사 15동
        대표전화: 044-203-2000(월~금 09:00~18:00, 공휴일 제외)  팩스: 044-203-3447
        Copyright ⓒ Ministry of Culture, Sports and Tourism</p>
</footer>
</body>
</html>

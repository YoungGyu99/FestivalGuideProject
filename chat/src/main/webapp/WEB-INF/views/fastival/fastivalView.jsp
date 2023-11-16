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
    <title>지역축제 정보</title>
</head>
<body>
    <h1>지역축제 정보</h1>
    <button id="fetchData">데이터 불러오기</button>
    <div id="result"></div>

    <script>
        // API 엔드포인트 및 서비스 키 설정
        const apiUrl = "http://api.kcisa.kr/openapi/service/rest/meta4/getKCPG0504";
        const serviceKey = "36144933-747b-4b5c-a2de-748f05fb4082";

        // HTML 요소 참조
        const fetchDataButton = document.getElementById("fetchData");
        const resultDiv = document.getElementById("result");

        // 버튼 클릭 이벤트 핸들러
        fetchDataButton.addEventListener("click", () => {
            // API 호출
            fetch(`${apiUrl}?serviceKey=${serviceKey}`)
                .then((response) => response.json())
                .then((data) => {
                    // API 응답 데이터를 화면에 출력
                    displayData(data);
                })
                .catch((error) => {
                    console.error("API 호출 중 오류 발생:", error);
                });
        });

        // API 응답 데이터를 화면에 출력하는 함수
        function displayData(data) {
            // 결과 코드 및 메시지 확인
            const resultCode = data.header.resultCode;
            const resultMsg = data.header.resultMsg;

            if (resultCode === "00") {
                // API 요청이 성공한 경우
                const items = data.body.items.item;

                // 각 아이템을 순회하며 정보를 출력
                let outputHTML = "<ul>";
                items.forEach((item) => {
                    outputHTML += `<li>${item.title} (${item.creator})</li>`;
                    
                    // 이미지 URL이 있는 경우 이미지를 표시
                    if (item.referenceIdentifier) {
                        outputHTML += `<img src="${item.referenceIdentifier}" alt="${item.title}" />`;
                    }
                });
                outputHTML += "</ul>";

                resultDiv.innerHTML = outputHTML;
            } else {
                // API 요청이 실패한 경우
                resultDiv.innerHTML = `<p>API 요청 실패: ${resultMsg}</p>`;
            }
        }
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

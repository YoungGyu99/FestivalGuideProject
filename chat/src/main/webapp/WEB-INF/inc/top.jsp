<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background-color: #333;
    color: white;
    text-align: center;
    padding: 10px 0;
}
/* Reduce spacing between menu items */
nav li {
    margin-right: 200px !important; /* Adjust the margin-right as needed */
}

/* 네비게이션 스타일링 */
nav ul {
    list-style-type: none;
    padding: 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

nav li {
    margin-right: 20px;
}

nav a {
    text-decoration: none;
    color: white;
    font-weight: bold;
}

/* 로그아웃 메뉴 스타일링 */
#logout-menu a {
    text-decoration: none;
    color: white;
    font-weight: bold;
    margin-right: 10px;
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

/* 통계 데이터 테이블 스타일 */
.stats-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.stats-table th, .stats-table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

.stats-table th {
    background-color: #f2f2f2;
}

.stats-table tr:nth-child(even) {
    background-color: #f2f2f2;
}

/* 알림 섹션 스타일 */
.media_title {
    background-color: #007bff;
    color: #fff;
    padding: 10px 15px;
    margin: 0;
    cursor: pointer;
    bottom: -10px;
}

/* 알림 섹션 타이틀 링크 스타일 */
.media_title a {
    text-decoration: none;
    color: #fff;
}

/* 알림 목록 스타일 */
.allimlist ul {
    list-style: none;
    padding: 0;
}

.allimlist li {
    border-bottom: 1px solid #ddd;
    padding: 10px 0;
}

/* 알림 목록 링크 스타일 */
.allimlist a {
    text-decoration: none;
    color: #333;
}

/* 알림 목록 링크 호버 스타일 */
.allimlist a:hover {
    color: #007bff;
}

/* "더보기" 링크 스타일 */
.m_more a {
    text-decoration: none;
    color: #007bff;
}

/* "더보기" 링크 호버 스타일 */
.m_more a:hover {
    text-decoration: underline;
}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
    crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
    rel="stylesheet" type="text/css" />
<link
    href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
    rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<!-- Navigation-->
<header>
    <!-- 네비게이션 -->
<!-- 네비게이션 -->
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <ul class="navbar-nav mx-auto"> <!-- Center-align the menu -->
        <li class="nav-item"><a class="nav-link py-3 px-2 px-lg-3 rounded" href="loginView">홈</a></li>
        <li class="nav-item"><a class="nav-link py-3 px-2 px-lg-3 rounded" href="${pageContext.request.contextPath}/chat">축제길잡이</a></li>
        <li class="nav-item"><a class="nav-link py-3 px-2 px-lg-3 rounded" href="${pageContext.request.contextPath}/chat1">축제기획서</a></li>
        <li class="nav-item"><a class="nav-link py-3 px-2 px-lg-3 rounded" href="${pageContext.request.contextPath}/fastival">축제종류</a></li>
        <li class="nav-item"><a class="nav-link py-3 px-2 px-lg-3 rounded" href="${pageContext.request.contextPath}/manager">담당자연락처</a></li>
   <c:if test="${sessionScope.login != null}">
    <ul class="navbar-nav ml-auto"> <!-- Push the logout menu to the right -->
        <li class="nav-item">
            <a class="nav-link py-3 px-2 px-lg-3 rounded" href="${pageContext.request.contextPath}/logoutDo">로그아웃</a>
        </li>
    </ul>
</c:if>
 
   
   
   
    </ul>

</nav>


</header>

















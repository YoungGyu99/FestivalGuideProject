<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>축제기획공유방</title>
    <style>
        /* 스타일 시트는 위에 있는 것을 그대로 사용 */
        table {
            border-collapse: collapse;
            border-spacing: 0;
        }
        section.notice {
            padding: 80px 0;
        }
        .page-title {
            margin-bottom: 60px;
        }
        .page-title h3 {
            font-size: 28px;
            color: #333333;
            font-weight: 400;
            text-align: center;
        }
        #board-search .search-window {
            padding: 15px 0;
            background-color: #f9f7f9;
        }
        #board-search .search-window .search-wrap {
            position: relative;
            width: 80%;
            max-width: 564px;
            margin: 0 auto;
        }
        #board-search .search-window .search-wrap input {
            height: 40px;
            width: 100%;
            font-size: 14px;
            padding: 7px 14px;
            border: 1px solid #ccc;
        }
        #board-search .search-window .search-wrap input:focus {
            border-color: #333;
            outline: 0;
            border-width: 1px;
        }
        #board-search .search-window .search-wrap .btn {
            position: absolute;
            right: 0;
            top: 0;
            bottom: 0;
            width: 108px;
            padding: 0;
            font-size: 16px;
        }
        #write-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 800;
        }
        .board-table {
            font-size: 13px;
            width: 100%;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }
        .board-table a {
            color: #333;
            display: inline-block;
            line-height: 1.4;
            word-break: break-all;
            vertical-align: middle;
        }
        .board-table a:hover {
            text-decoration: underline;
        }
        .board-table th {
            text-align: center;
        }
        .board-table .th-num {
            width: 100px;
            text-align: center;
        }
        .board-table .th-date {
            width: 200px;
        }
        .board-table th, .board-table td {
            padding: 14px 0;
        }
        .board-table tbody td {
            border-top: 1px solid #e7e7e7;
            text-align: center;
        }
        .board-table tbody th {
            padding-left: 28px;
            padding-right: 14px;
            border-top: 1px solid #e7e7e7;
            text-align: left;
        }
        .board-table tbody th p{
            display: none;
        }
        .btn {
            display: inline-block;
            padding: 0 30px;
            font-size: 15px;
            font-weight: 400;
            background: transparent;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            border: 1px solid transparent;
            text-transform: uppercase;
            -webkit-border-radius: 0;
            -moz-border-radius: 0;
            border-radius: 0;
            -webkit-transition: all 0.3s;
            -moz-transition: all 0.3s;
            -ms-transition: all 0.3s;
            -o-transition: all 0.3s;
            transition: all 0.3s;
        }
        .btn-dark {
            background: #555;
            color: #fff;
        }
        .btn-dark:hover, .btn-dark:focus {
            background: #373737;
            border-color: #373737;
            color: #fff;
        }
        .btn-dark {
            background: #555;
            color: #fff;
        }
        .btn-dark:hover, .btn-dark:focus {
            background: #373737;
            border-color: #373737;
            color: #fff;
        }
        /* reset */
        * {
            list-style: none;
            text-decoration: none;
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        .clearfix:after {
            content: '';
            display: block;
            clear: both;
        }
        .container {
            width: 1100px;
            margin: 0 auto;
        }
        .blind {
            position: absolute;
            overflow: hidden;
            clip: rect(0 0 0 0);
            margin: -1px;
            width: 1px;
            height: 1px;
        }
        .center-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
    </style>
</head>
<body>
    <%@include file="/WEB-INF/inc/top.jsp"%>
    <section class="page-section notice" id="contact">
        <div class="container text-center">
            <div class="page-title">
                <h3>기획서 게시판</h3>
            </div>
            <div id="board-search" class="search-window">
                <div class="search-wrap">
                    <form class="d-flex" action="<c:url value="/searchBoard" />" method="post">
                        <select class="form-select me-1" name="searchOption" aria-label="Default select example" style="width: 100px">
                            <option value="title" selected>제목</option>
                            <option value="content">내용</option>
                            <option value="name">작성자</option>
                        </select> 
                        <input class="form-control me-1" type="text" value="" name="keyword" style="width: 200px">
                        <button class="btn btn-primary" type="submit">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                            </svg>
                        </button>
                    </form>
                </div>
            </div>
            <div class="table-responsive">
                <table class="board-table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${boardList}" var="board">
                            <tr>
                                <td>${board.boardNo}</td>
                                <td>
                                    <a href="<c:url value="/boardDetailView?boardNo=${board.boardNo}"/>">
                                        ${board.boardTitle}
                                    </a>
                                </td>
                                <td>${board.memNm}</td>
                                <td>${board.boardDate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div id="write-button">
<a href="<c:url value="/boardWriteView" />">
    <button type="button" class="btn btn-primary">글쓰기</button>
</a>
            </div>
        </div>
    </section>
    
    <script>
        $(document).ready(function(){
            $("#mainSelect").on('change', function(){
                let code = $(this).val();
                if(code === ""){
                  $("#subSelect").empty().append("<option value=''>--선택하세요--</option>");
                  return;
                }
                $.ajax({
                     url : '<c:url value="/api/getSubCodes" />'
                    ,type:'get'
                    ,data:{commParent : code}
                    ,dataType:'json'
                    ,success :function(res){
                        $("#subSelect").empty().append("<option value=''>--선택하세요--</option>");
                        $.each(res, function(idx, item){
                            $("#subSelect").append('<option value="'+item.commCd+'">'
                                      +item.commNm + "</option>");
                        });
                    },error:function(e){
                        console.log(e);
                    }
                });
            });
        });
    </script>
            
</body>
<footer>
    <div style="text-align: center;">
        <img class="img-fluid" src="resources/img/img2.png" width="200px" height="100px">
    </div>
    <p style="text-align: center;">&copy; 30119 세종특별자치시 갈매로 388 정부세종청사 15동
        대표전화: 044-203-2000(월~금 09:00~18:00, 공휴일 제외)  팩스: 044-203-3447
        Copyright ⓒ Ministry of Culture, Sports and Tourism</p>
</footer>
</html>

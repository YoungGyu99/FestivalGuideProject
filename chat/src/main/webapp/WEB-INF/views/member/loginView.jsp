
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<%@include file="/WEB-INF/inc/top.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 화면</title>
	
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
            padding: 20px 0;
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
            margin: 0 auto; /* 가운데로 정렬 */
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
     margin-top: 30px;  
}

/* 알림 섹션 타이틀 링크 스타일 */
.media_title a {
    text-decoration: none;
    color: #fff;
    display: inline-block; /* 이 부분 추가 */
    margin-top: 80px; 
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

		/* 나머지 스타일링 */
		#tab1c3 {
		    margin-top: 20px; /* 다른 섹션과의 여백을 조절 */
		}
		        .centered-image {
            text-align: center;
            margin-top: 20px;
        }

        .centered-image img {
            display: block; /* 이미지를 블록 레벨 요소로 설정하여 중앙 정렬 적용 */
            margin: 0 auto; /* 수평 가운데 정렬 */
        }
    </style>
    
</head>
<body id="page-top">

<div class="media">
					<h2 id="tab1m1" class="media_title"><a href="javascript:void(0);" class="on">알림</a></h2>
					<!-- 알림세부리스트-->
					<div id="tab1c1" class="allimlist" style="display: block;">
						<ul>
						
							<li>
								<span class="ndate">2023.09.06.</span>
								<p class="title">
									<a href="https://www.mcst.go.kr/kor/s_notice/notice/noticeView.jsp?pSeq=17603" title="2023년 체육대회개최 유공 정부포상 후보자 공개검증">
										
										<span class="text">2023년 체육대회개최 유공 정부포상 후보자 공개검증</span>
									</a>
								</p>
							</li>
						
							<li>
								<span class="ndate">2023.09.05.</span>
								<p class="title">
									<a href="https://www.mcst.go.kr/kor/s_notice/notice/noticeView.jsp?pSeq=17601" title="2023년 문화영향평가 우수사례 및 아이디어 공모전">
										
										<span class="text">2023년 문화영향평가 우수사례 및 아이디어 공모전</span>
									</a>
								</p>
							</li>
						
							<li>
								<span class="ndate">2023.09.05.</span>
								<p class="title">
									<a href="https://www.mcst.go.kr/kor/s_notice/notice/noticeView.jsp?pSeq=17599" title="당인리 문화창작발전소 조성 건축공사 안전점검 수행기관 지정 공고">
										
										<span class="text">당인리 문화창작발전소 조성 건축공사 안전점검 수행기관 지정 공고</span>
									</a>
								</p>
							</li>
						
							<li>
								<span class="ndate">2023.09.04.</span>
								<p class="title">
									<a href="https://www.mcst.go.kr/kor/s_notice/notice/noticeView.jsp?pSeq=17594&pMenuCD=0301000000&pCurrentPage=1&pFlagJob=N&pTypeDept=&pSearchType=01&pSearchWord=" title="2023년 하반기 퇴직공무원(일반) 정부포상 추천후보자 공개검증">
										
										<span class="text">2023년 하반기 퇴직공무원(일반) 정부포상 추천후보자 공개검증</span>
									</a>
								</p>
							</li>
						
							<li>
								<span class="ndate">2023.09.04.</span>
								<p class="title">
									<a href="https://www.mcst.go.kr/kor/s_notice/notice/noticeView.jsp?pSeq=17599	" title="민간자격 등록폐지 공고">
										
										<span class="text">민간자격 등록폐지 공고</span>
									</a>
								</p>
							</li>
						
						</ul>
						
					</div>

					<form name="recruitFrm" method="post" target="hiddenPopFrame">
						<input type="hidden" name="pSeq" value="">				
						<input type="hidden" name="pAction" value="UPDATECNT">				
					</form>
					<div id="tab1c2" class="allimlist" style="display: none;">
						<ul>
						
							<li>
								<span class="ndate">2023.09.15.</span>
								<p class="title">
									<a href="https://www.mcst.go.kr/kor/s_notice/notice/jobView.jsp?pSeq=17616" title="2023년도 국립중앙박물관 어린이박물관과 기간제근로자(전시보조_휴직대체) 채용 최종합격자 공고 새 창 열림" target="_blank" onclick="updateCnt('http://www.museum.go.kr/site/main/archive/post/article_19296','11632');return false;">
										
										<span class="mark_new"><em class="hidden" data-brl-use="PH/S">새글</em></span>
										
										<span class="text">2023년도 국립중앙박물관 어린이박물관과 기간제근로자(전시보조_휴직대체) 채용 최종합격자 공고</span>
										
										<img class="ml5" src="/kor/images/common/new_window.png" alt="새 창 열림">
										
									</a>
								</p>
							</li>
						
							<li>
								<span class="ndate">2023.09.15.</span>
								<p class="title">
									<a href="https://www.mmca.go.kr/pr/employmentDetail.do?menuId=01H000803000000&bdCId=202309140009011&searchBmCid=102';return false;">
										
										<span class="mark_new"><em class="hidden" data-brl-use="PH/S">새글</em></span>
										
										<span class="text">23년 3차 국립현대미술관 행정지원과 공무직 근로자 (영선 주임, 기계·방재·영선 기사, 청소원) 채용 변경 공고</span>
										
										<img class="ml5" src="https://www.mmca.go.kr/pr/employmentDetail.do?menuId=01H000803000000&bdCId=202309150009014&searchBmCid=102" alt="새 창 열림">
										
									</a>
								</p>
							</li>
						
							<li>
								<span class="ndate">2023.09.15.</span>
								<p class="title">
									<a href="https://www.mmca.go.kr/pr/employmentDetail.do?menuId=01H000803000000&amp;bdCId=202309150009014&amp;searchBmCid=102" title="국립현대미술관 미술품수장센터 공무직근로자(전시운영보조)  서류전형 합격자 공고 새 창 열림" target="_blank" onclick="updateCnt('https://www.mmca.go.kr/pr/employmentDetail.do?menuId=01H000803000000&amp;bdCId=202309150009014&amp;searchBmCid=102','11633');return false;">
										
										<span class="mark_new"><em class="hidden" data-brl-use="PH/S">새글</em></span>
										
										<span class="text">국립현대미술관 미술품수장센터 공무직근로자(전시운영보조)  서류전형 합격자 공고</span>
										
										<img class="ml5" src="https://www.gugak.go.kr/site/program/board/basicboard/view?menuid=001005006006&boardtypeid=98&boardid=44880" alt="새 창 열림">
										
									</a>
								</p>
							</li>
						
							<li>
								<span class="ndate">2023.09.14.</span>
								<p class="title">
									<a href="https://www.sports.or.kr/home/010210/0000/view.do?T_IDX=2424521" title="대한당구연맹 직원 채용 공고 새 창 열림" target="_blank" onclick="updateCnt('https://www.sports.or.kr/home/010210/0000/view.do?T_IDX=2424521','11629');return false;">
										
										<span class="mark_new"><em class="hidden" data-brl-use="PH/S">새글</em></span>
										
										<span class="text">대한당구연맹 직원 채용 공고</span>
										
										<img class="ml5" src="/kor/images/common/new_window.png" alt="새 창 열림">
										
									</a>
								</p>
							</li>
						
							<li>
								<span class="ndate">2023.09.14.</span>
								<p class="title">
									<a href="https://www.gugak.go.kr/site/program/board/basicboard/view?menuid=001005006006&amp;boardtypeid=98&amp;boardid=44879" title="2023년 국립국악원 무대과 공무직 근로자 채용 관련 재공고 예정 안내 새 창 열림" target="_blank" onclick="updateCnt('https://www.gugak.go.kr/site/program/board/basicboard/view?menuid=001005006006&amp;boardtypeid=98&amp;boardid=44879','11630');return false;">
										
										<span class="mark_new"><em class="hidden" data-brl-use="PH/S">새글</em></span>
										
										<span class="text">2023년 국립국악원 무대과 공무직 근로자 채용 관련 재공고 예정 안내</span>
										
										<img class="ml5" src="/kor/images/common/new_window.png" alt="새 창 열림">
										
									</a>
								</p>
							</li>
							
						</ul>
						<span class="m_more"><a href="/kor/s_notice/notice/jobList.jsp" title="채용정보 더보기"><img src="/kor/images/main/btn_main_more.png" alt="채용정보 더보기"></a></span>
					</div>

					<div id="tab1c3" class="allimlist" style="display:none;">
						<ul>
						
							<li>
								<span class="ndate">2023.09.15.</span>
								<p class="title">
									<a href="/kor/s_notice/notice/bidView.jsp?pSeq=11883" title="여주시청 대왕님표 여주쌀 TV-CF 및 라디오 광고영상물 제작">
										
										<span class="mark_new"><em class="hidden" data-brl-use="PH/S">새글</em></span>
										
										<span class="text">여주시청 대왕님표 여주쌀 TV-CF 및 라디오 광고영상물 제작</span>
									</a>
								</p>
							</li>
						
							<li>
								<span class="ndate">2023.09.15.</span>
								<p class="title">
									<a href="/kor/s_notice/notice/bidView.jsp?pSeq=11881" title="2023 ACC 포커스《가이아의 도시》운송·설치 및 철수·반송 용역">
										
										<span class="mark_new"><em class="hidden" data-brl-use="PH/S">새글</em></span>
										
										<span class="text">2023 ACC 포커스《가이아의 도시》운송·설치 및 철수·반송 용역</span>
									</a>
								</p>
							</li>
						
							<li>
								<span class="ndate">2023.09.14.</span>
								<p class="title">
									<a href="/kor/s_notice/notice/bidView.jsp?pSeq=11880" title="국립민속박물관 권역별 자유주제 민속조사보고서 발간(22년 내부과제)">
										
										<span class="mark_new"><em class="hidden" data-brl-use="PH/S">새글</em></span>
										
										<span class="text">국립민속박물관 권역별 자유주제 민속조사보고서 발간(22년 내부과제)</span>
									</a>
								</p>
							</li>
						
							<li>
								<span class="ndate">2023.09.14.</span>
								<p class="title">
									<a href="/kor/s_notice/notice/bidView.jsp?pSeq=11879" title="2024년도 한국예술종합학교 정보시스템 운영 및 유지관리">
										
										<span class="mark_new"><em class="hidden" data-brl-use="PH/S">새글</em></span>
										
										<span class="text">2024년도 한국예술종합학교 정보시스템 운영 및 유지관리</span>
									</a>
								</p>
							</li>
						
							<li>
								<span class="ndate">2023.09.14.</span>
								<p  class="title">
									<a href="/kor/s_notice/notice/bidView.jsp?pSeq=11878" title="2024학년도 국립전통예술중학교 소규모 테마형 교육여행 위탁용역 입찰공고">
										
										<span class="mark_new"><em class="hidden" data-brl-use="PH/S">새글</em></span>
										
										<span class="text">2024학년도 국립전통예술중학교 소규모 테마형 교육여행 위탁용역 입찰공고</span>
									</a>
								</p>
							</li>
						
						</ul>
						
					</div>
					<!-- 입찰정보세부리스트//-->
				</div>



    
    
<footer style="margin-top: 20px;">
    <div style="text-align: center;">
        <img class="img-fluid" src="resources/img/img2.png" width="200px" height="100px">
    </div>
    <p style="text-align: center;">&copy; 30119 세종특별자치시 갈매로 388 정부세종청사 15동
        대표전화: 044-203-2000(월~금 09:00~18:00, 공휴일 제외)  팩스: 044-203-3447
        Copyright ⓒ Ministry of Culture, Sports and Tourism</p>
</footer>




</body>
</html>

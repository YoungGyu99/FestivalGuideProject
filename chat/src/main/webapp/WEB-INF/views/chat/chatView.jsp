<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/inc/top.jsp" %>
<html lang="ko">
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
            padding: 0px 0;
        }

        /* 네비게이션 스타일링 */
        nav ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            justify-content: center;
            margin-top: 20px; /* 20px 아래로 내립니다. */
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
            margin: 20px auto 20px auto; /* 위 아래 모두 20px 아래로 내립니다. */
            /* 왼쪽으로 10px 이동 */
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: flex;
            flex-direction: column;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
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

        /* 지도 스타일링 */
        #map-container {
            float: right; /* 오른쪽으로 띄움 */
            width: 400px; /* 지도의 너비를 조절하세요 */
            margin-top: 20px; /* 20px 아래로 내립니다. */
        }

        /* 지도 스타일링 */
        #mapid {
            height: 300px;
            width: 100%;
        }


footer {
    text-align: center;
    margin-top: 600px; /* 원하는 만큼 아래로 내립니다. */
    position: relative; /* 변경: relative로 수정 */
    color: black;
    padding: 300px 0;
}
    </style>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>축제길잡이</title>

    
</head>
<p style="text-align: center; margin-top: 100px;"> 축제를 개최할 장소를 자세히 기재해 주세요.(출력까지 다소 시간이 걸릴 수 있습니다.) </p>
<body>



<!-- 지도 컨테이너 -->
<div id="map-container">
    <div id="mapid"></div>
</div>

<div id="chat-container">
    <div id="chat-messages"></div>
    <div id="user-input">
        <input type="text" placeholder="지역을입력해주세요" />
        <button>전송</button>
    </div>
</div>

<!-- Leaflet 스크립트 추가 -->
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
      integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
      crossorigin=""/>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
        integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
        crossorigin=""></script>

<!-- jQuery 스크립트 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    // 색 랜덤함수
    function getRandomColor() {
        var letters = '0123456789ABCDEF';
        var color = '#';
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    let gu_data;

    $.getJSON('${pageContext.request.contextPath}/js/map.json', function (jd) {
        gu_data = jd;
    });

    function get_data(code) {
        let select_data = {};
        // 깊은 복사
        Object.assign(select_data, gu_data);
        console.log(select_data);
        let properties = [];
        $.each(select_data.features, function (i, v) {
            if (v['properties']['SIG_CD'].substr(0, 2) == code) {
                console.log(v);
                properties.push(v);
            }
        });
        select_data.features = properties;
        return select_data;
    }

    // Leaflet.js에서 지도의 확대 수준을 조정하려면 setView 함수에서 줌 레벨을 조절하면 됩니다.
    // 줌 레벨은 0부터 시작하여 숫자가 커질수록 더 많이 확대되는 방식으로 작동합니다.
    // 해당 좌표 중심으로 지도를 보여줌
    var map = L.map('mapid').setView([36.321655, 127.378953], 6);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors'
    }).addTo(map);

    // 행정구역 geoJson (다른 데이터를 쓰면 더욱 상세하게 가능 각 국가별로 제공함 )
    let detailedGeojsonLayer;
    $.getJSON('${pageContext.request.contextPath}/js/map.json', function (data) {
        L.geoJson(data, {
            // 영역색
            style: function (feature) {
                return {color: getRandomColor()};
            },
            // 이벤트
            onEachFeature: function (feature, layer) {
                layer.bindTooltip(feature.properties.CTP_KOR_NM);
                layer.on({
                    click: function (e) {
                        alert("You've clicked on: " + feature.properties.CTP_KOR_NM);
                        map.flyTo(e.latlng, 9);
                        var detailedGeojsonData = get_data(feature.properties.CTPRVN_CD);
                        console.log(detailedGeojsonData);
                        if (map.hasLayer(detailedGeojsonLayer)) {
                            map.removeLayer(detailedGeojsonLayer);
                        }
                        detailedGeojsonLayer = L.geoJson(detailedGeojsonData, {
                            style: function (feature) {
                                return {color: getRandomColor()};
                            },
                            onEachFeature: function (detailedFeature, detailedLayer) {
                                detailedLayer.bindTooltip(detailedFeature.properties.SIG_KOR_NM);
                                detailedLayer.on('click', function () {
                                    alert('You clicked ' + detailedFeature.properties.SIG_KOR_NM);
                                });
                            }
                        }).addTo(map);
                    }
                });
            }
        }).addTo(map);
    });
</script>
<script src="${pageContext.request.contextPath}/js/chatbot_gil.js"></script>
<footer>
    <div style="text-align: center;">
        <img class="img-fluid" src="resources/img/img2.png" width="200px" height="100px">
    </div>
    <p style="text-align: center;">&copy; 30119 세종특별자치시 갈매로 388 정부세종청사 15동
        대표전화: 044-203-2000(월~금 09:00~18:00, 공휴일 제외)  팩스: 044-203-3447
        Copyright ⓒ Ministry of Culture, Sports and Tourism</p>
</footer>
</html>

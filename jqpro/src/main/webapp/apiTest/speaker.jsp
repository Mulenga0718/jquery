<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=uhaf2smrg5"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<img alt="스피커1.jpg" src="../images/스피커1.jpg">

<iframe width="560" height="315" src="https://www.youtube.com/embed/7AK3RoN_DNA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<iframe width="560" height="315" src="https://www.youtube.com/embed/qcphnSqneE0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<div id="map" style="width:50%;height:400px;"></div>
 <!-- 네이버 로그인 버튼 노출 영역 -->
  <hr>
  <div id="naver_id_login">로그인</div>
  <br><br>
  <!-- //네이버 로그인 버튼 노출 영역 -->
  
<script>


var HOME_PATH = window.HOME_PATH || '.';

var cityhall = new naver.maps.LatLng(36.325117, 127.408829),
    map = new naver.maps.Map('map', {
        center: cityhall.destinationPoint(0, 500),
        zoom: 18
    }),
    marker = new naver.maps.Marker({
        map: map,
        position: cityhall
    });

var contentString = [
        '<div class="iw_inner">',
        '   <h3>대덕인재개발원</h3>',
        '   <p>대전 중구 계룡로 846 3층<br />',
        '   교육기관<br />',
        '       <a href="http://www.ddit.or.kr/" target="_blank">www.ddit.or.kr</a>',
        '   </p>',
        '</div>'
    ].join('');

var infowindow = new naver.maps.InfoWindow({
    content: contentString
});

naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});

infowindow.open(map, marker);


	var naver_id_login = new naver_id_login("aPTKLX7anguAkb2vYRsN", "http://localhost/jqpro/apiTest/speaker.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost/jqpro/apiTest/speaker.jsp");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  	
    var naver_id_login = new naver_id_login("aPTKLX7anguAkb2vYRsN", "http://localhost/jqpro/apiTest/speaker.jsp");
    // 접근 토큰 값 출력
    alert(naver_id_login.oauthParams.access_token);
    // 네이버 사용자 프로필 조회
    naver_id_login.get_naver_userprofile("naverSignInCallback()");
    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
    function naverSignInCallback() {
      alert(naver_id_login.getProfileData('email'));
      alert(naver_id_login.getProfileData('nickname'));
      alert(naver_id_login.getProfileData('age'));
    }
  </script>


</body>
</html>



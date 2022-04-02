<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Insert title here</title>
</head>
<body>
  <ul>
  	<li onclick="kakaoLogin();">
        <a href="javascript:void(0)">
            <span>카카오 로그인</span>
        </a>
  	</li>
  	<li onclick="kakaoLogout();">
        <a href="javascript:void(0)">
            <span>카카오 로그아웃</span>
        </a>
  	</li>
  </ul>
  <a id="custom-login-btn" href="javascript:loginWithKakao()">
  <img
    src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
    width="222"
    alt="카카오 로그인 버튼"
  />
</a>
<p id="token-result"></p>
</body>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

  Kakao.init('0e12b6db2ad99c94114a12f9e4e5909d'); //발급받은 키 중 javascript키를 사용해준다.
  console.log(Kakao.isInitialized()); // sdk초기화여부판단
  //카카오로그인
  function kakaoLogin() {
      Kakao.Auth.login({
        success: function (response) {
          Kakao.API.request({
            url: '/v2/user/me',
            success: function (response) {
          	  console.log(response)
            },
            fail: function (error) {
              console.log(error)
            },
          })
        },
        fail: function (error) {
          console.log(error)
        },
      })
    }
  //카카오로그아웃  
  function kakaoLogout() {
      if (Kakao.Auth.getAccessToken()) {
        Kakao.API.request({
          url: '/v1/user/unlink',
          success: function (response) {
          	console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
        Kakao.Auth.setAccessToken(undefined)
      }
    }  

</script>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>유상형채널</title>

<!-- 부트스트랩 -->
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/bit.css"
	rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
	function popupOpen() {
		var popUrl = "profile.do";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl, "", popOption);
	}
</script>
</head>
<body>




	<div
		style="margin-left: auto; margin-right: auto; width: 1140px; height: 150px; background-color: grey;">

		<div
			style='display: inline; float: left; width: 200px; height: 150px; position: relative;'>

			
				<img src="${pageContext.request.contextPath}/assets/images/test.png"
					style="width: 200px; height: 150px; position: absolute;">

				<button type="button"
					onclick="location.href='javascript:popupOpen();'"
					style="position: absolute; top:50%; left:25%">이미지
					업로드</button>
			


		</div>

		<div
			style='display: inline; float: right; width: 940px; height: 150px; position: relative;'>
			<a href="http://www.naver.com"
				style="position: absolute; clear: left; left: 0; bottom: 0px;">채널이름설정</a>
			<input class="form-control" type="button" value="이미지 업로드"
				style="width: 150px; height: 30px; position: absolute; right: 0; bottom: 0px;">
		</div>
	</div>

	<div class="container">
		<h3>녹화된영상</h3>
		<hr>
		<div class="row">
			<div class="col-sm-3">
				<div class="thumbnail">
					<a href="main.do"> <img
						src="${pageContext.request.contextPath}/assets/images/battleground.jpg"
						class="img-responsive" alt="썸네일 "></a>
					<div class="caption">
						<h4>[RickyTV] 사녹에서 치킨먹기</h4>
						<p>RickyOffical</p>
						조회수 5만회
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7분전
						<!--            <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<button type="button" onclick="location.href='javascript:popupOpen();'">아이폰</button>
</body>

</html>
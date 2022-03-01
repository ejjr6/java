<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/css/main.css" />

</head>
<body>

	<script>
		$(function() {
			var $topMenu = $('.top_menu'), $header = $('header');

			$topMenu.mouseenter(function() {
				$header.stop().animate({
					height : 350
				}, 300);
				$header.css({
					backgroundColor : 'rgba(255, 255, 255, 1)'
				});
			}).mouseleave(function() {
				$header.stop().animate({
					height : 80
				}, 300);
				$header.css({
					backgroundColor : 'rgba(255, 255, 255, 0)'
				});
			});

		});
	</script>
	<div class="wrap">
		<header>
			<div class="in_header">

				<!-- 로고 -->
				<div class="logo">
					<a href="${path}"> <img src="${path}/resources/img/logo.png" alt="로고" />
					</a>
				</div>

				<!-- 메뉴 -->
				<nav>
					<ul class="menu_wrap">
						<li class="top_menu"><a href="">브랜드</a>
							<ul class="sub_menu">
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">디자인</a></li>
								<li><a href="">품질/안전</a></li>
								<li><a href="">친환경/미래기술</a></li>
								<li><a href="">회사 소개</a></li>
							</ul></li>

						<li class="top_menu"><a href="">전체모델</a>
							<ul class="sub_menu">
								<li class="in_sub">
									<ul class="model">
										트럭
										<li><a href="">뉴파워트럭</a></li>
										<li><a href="">엑시언트</a></li>
										<li><a href="">엑시언트 수소전기트럭</a></li>
									</ul>
								</li>
								<li class="in_sub">
									<ul class="model">
										버스
										<li><a href="">쏠라티</a></li>
										<li><a href="">유니버스 모바일 오피스</a></li>
										<li><a href="">일렉시티 수소전기버스</a></li>
									</ul>
								</li>
							</ul></li>

						<li class="top_menu"><a href="">구매가이드</a>
							<ul class="sub_menu">
								<li><a href="${path}/car/carSelect">구매상담신청</a></li>
							</ul></li>

						<li class="top_menu"><a href="">고객서비스</a>
							<ul class="sub_menu">
								<li><a href="">문의하기(Q&A)</a></li>
								<!-- 
								<li><a href=""></a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
								 -->
							</ul></li>
<!-- 
						<li class="top_menu"><a href="">마이페이지</a>
							<ul class="sub_menu">
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
								<li><a href="">현대 브랜드 스토리</a></li>
							</ul></li>
 -->							
							
					</ul>
				</nav>
				
				<ul class="login">
					<!-- 익명사용자 -->
					<sec:authorize access="isAnonymous()">
						<li><a href="${path}/user/login">로그인</a>	
					</sec:authorize>
					
					<!-- 인가 완료 사용자 -->
					<sec:authorize access="isAuthenticated()">
						<sec:authentication var="userInfo" property="principal.userInfo"/>					
							<span><a href="">${userInfo.u_name}</a></span>
							<span class="block"></span>
							<span><a href="${path}/user/logout">로그아웃</a></span>
					</sec:authorize>
				</ul>
				
			</div>
		</header>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>CSS</title>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <!-- jquery cdn 삽입 -->
    <script src="/resources/js/jquery-3.6.0.js"></script>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
	<!-- 호버 갤러리 시작 -->
	<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/colors/palette-gradient.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/gallery.min.css">
	<!-- 호버 갤러리 끝 -->
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/join.css">
    <style>
        body {
            padding: 0px;
            margin: 0px;
        }

        .jb-box {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 100px auto;
            position: relative;
        }

        video {
            width: 100%;
            height: auto;
            position: relative
        }

        .jb-text {
            position: absolute;
            top: 50%;
            width: 100%;
        }

        .jb-text p {
            margin-top: -24px;
            text-align: center;
            font-size: 48px;
            color: #ffffff;
        }
        .swiper-slide{
        	background-color: white;
        	width: 15%
        }
        img{
        width: 100%;
        }
        .swiper-pagination{
        margin-top: 200px;
        }
       
        .grid-hover figure figcaption{
        	color : #484C61;
        }
        
    </style>


</head>


<!-- /horizontal menu content-->
<video muted autoplay loop>
    <source src="/resources/video/balanty%20portada.mp4" type="video/mp4">
    <strong>Your browser does not support the video tag.</strong>
</video>
<div class="jb-text">
    <p>IPMS </p>
    <br>
    <br>
    <P>Cooperation</P>
</div>

<script type="text/javascript">
var swiper1 = new Swiper(".mySwiper1", {
    slidesPerView: 3,
    spaceBetween: 15,
    slidesPerGroup: 3,
    loop: true,
    loopFillGroupWithBlank: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
var swiper2 = new Swiper(".mySwiper2", {
    slidesPerView: 3,
    spaceBetween: 15,
    slidesPerGroup: 3,
    loop: true,
    
    loopFillGroupWithBlank: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });
  
  $(".swiper-pagination swiper-pagination-clickable swiper-pagination-bullets swiper-pagination-horizontal").css("margin-bottom","7%")
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INU Kurly</title>
    <link rel="stylesheet" href="/resources/mainCss/css/reset.css">
    <link rel="stylesheet" href="/resources/mainCss/css/common.css">
    <!-- common.css : header, footer 메인 페이지 -->
    <link rel="stylesheet" href="/resources/mainCss/css/reset.css">
    <!-- visual.css : header 바로 밑 이미지 슬라이드 파트 -->
    <link rel="stylesheet" href="/resources/mainCss/css/contents.css">
    <!-- header와 footer를 제외한 콘텐츠 메인 페이지 -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script defer src="/resources/mainCss/js/common.js"></script>
    <script defer src="/resources/mainCssjs/contents.js"></script>
    <script defer src="/resources/mainCssjs/visual.js"></script>
    <link rel="shortcut icon" href="/resources/mainCss/img/favicon.png">
    <link rel="icon" href="/resources/mainCss/img/favicon.png">

</head>
<body>



    <div id="visual">
        <h2 class="blind">마켓컬리 메인</h2>
        <div class="swipe">
            <ul class="promotions">
                <li data-index="1" class="slide_list">
                    <a href="#" class="thumb" style="background-image: url('/resources/images/IPMSlogo.png');" ></a> <!--이미지 오류. bg color로 대체-->
                </li>
                <li data-index="2" class="slide_list">
                    <a href="#" class="thumb" style="background-image: url('/resources/images/IPMSlogo.png');" ></a>
                </li>
                <li data-index="3" class="slide_list">
                    <a href="#" class="thumb" style="background-image: url('/resources/images/IPMSlogo.png');" ></a>
                </li>
                <li data-index="4" class="slide_list">
                    <a href="#" class="thumb" style="background-image: url('/resources/images/IPMSlogo.png');" ></a>
                </li>
                <li data-index="4" class="slide_list">
                    <a href="#" class="thumb" style="background-image: url('/resources/images/IPMSlogo.png');" ></a>
                </li>
            </ul>

            <div class="controls_direction" style="display: none;">
                <!-- bg url 처리 -->
                <a href="prev">이전으로</a>
                <a href="next">다음으로</a>
            </div>
        </div>

    </div>
    <!-- id="visual" -->
    <div id="main">
        <div id="contents" class="page_aticle">


            <div class="top_btn">
                <button id="go-top" alt="맨 위로가기"></button>
            </div>

            <!-- 우선은 bg color 있는 것과 없는 2가지 types만 추가  -->
            <!-- class = "main_type1은 bg 없음" -->

            <!-- class="main_type1" 끝 -->

            <!-- class ="main_type2" -->
            <div class="main_type2 bg">
                <div class="main_event">
                    <div class="tit_goods">
                        <h3 class="tit">
                                <span class="ico" style="float:left;font-weight: bold"><strong>전체 프로젝트</strong></span>
                            </a>
                        </h3>
                    </div>
                    <div class="list_goods">
                        <ul data-title="이벤트 소식" data-section="event" class="list_goods_ul" >
                            <li>
                            <li data-index="1">
                                <a class="thumb_goods">
                                    <img src="/resources/images/IPMSlogo.png" alt="상품이미지" class="thumb">
                                    <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                </a>
                                <div class="info_goods">
                                    <div class="inner_info">
                                                <span class="name">
                                                    <a class="txt">화장지 최대 40% 할인</a>
                                                </span>
                                        <span class="desc">
                                                    <a class="txt">미리미리 쟁여두세요!</a>
                                                </span>
                                    </div>
                                </div>
                            </li>
                            </li>
                            <li>
                            <li data-index="2">
                                <a class="thumb_goods">
                                    <img src="/resources/images/IPMSlogo.png" alt="상품이미지" class="thumb">
                                    <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                </a>
                                <div class="info_goods">
                                    <div class="inner_info">
                                                <span class="name">
                                                    <a class="txt">종근당건강 최대 27% 할인</a>
                                                </span>
                                        <span class="desc">
                                                    <a class="txt">국민 유산균, 락토핏</a>
                                                </span>
                                    </div>
                                </div>
                            </li>
                            </li>
                            <li>
                            <li data-index="3">
                                <a class="thumb_goods">
                                    <img src="/resources/images/IPMSlogo.png" alt="상품이미지" class="thumb">
                                    <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                </a>
                                <div class="info_goods">
                                    <div class="inner_info">
                                                <span class="name">
                                                    <a class="txt">바스용품 최대 35% 할인</a>
                                                </span>
                                        <span class="desc">
                                                    <a class="txt">나만의 힐링타임</a>
                                                </span>
                                    </div>
                                </div>
                            </li>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- class ="main_type2" 끝 -->

            <!-- .main_type1 반복 -->
            <div class="main_type1">
                <!-- type1:  -->
                <div class="product_list" style="background-color: #dcdcdc	">
                    <!-- 상품 추천 -->
                    <div class="tit_goods" style="background-color: #F4FFFF">
                        <h3 class="tit">
                                    <span class="ico" style="float:left;float:left;">프로젝트 나왔어요!
                                    </span>
                            <br>
                            <!-- 아이콘 없는 버전, h3에 링크 없음 -->
                        </h3>
                    </div>
                    <!-- list_goods는 마켓컬리와 똑같이 html 파일에서 스타일함 -->
                    <div class="list_goods">
                        <div class="bx_wrapper" style="max-width: 1054px; margin: 0 auto;">
                            <div class="vx-viewport" style="width: 100%; height: 506px; position: relative; overflow: hidden;">
                                <!-- overflow: hidden 임시로 삭제 -->
                                <ul data-title="이 상품 어때요?" data-section="today_recommendation" class="list_goods_ul"
                                    style="width: 2215%; position: relative; transition-duration: 0.5s; transform: translate3d(0, 0, 0);">
                                    <!--width: 2215%는 아직 뭔지 모르겠음  -->
                                    <!-- data-section과 data-name은 임시값 -->

                                    <!-- list data  -->
                                    <li data-index="1" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_10.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                 style="background-image: url('https://img-cf.kurly.com/shop/data/goods/1466488979157l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [버크셔세상] 버크셔K 흑돼지 앞다리살 500g(냉장)
                                                    </a>
                                                </span>
                                            <span class="price">10,800원</span>
                                            <span class="cost">12,000원</span>
                                        </div>
                                    </li>
                                    <li data-index="2" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_15.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                 style="background-image: url('https://img-cf.kurly.com/shop/data/goods/1514257155111l0.jpg')">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        이스라엘산 스위티 1개
                                                    </a>
                                                </span>
                                            <span class="price">1,870원</span>
                                            <span class="cost">2,200원</span>
                                        </div>
                                    </li>
                                    <li data-index="3" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249x; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_15.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                 style="background-image: url('https://img-cf.kurly.com/shop/data/goods/1510134053904l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [어부네] 생관자 2종(냉장)
                                                    </a>
                                                </span>
                                            <span class="price">7,310원</span>
                                            <span class="cost">8,600원</span>
                                        </div>
                                    </li>
                                    <li data-index="4" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                 style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [퀸즈프레시] 프리미엄 샐러드 3종
                                                    </a>
                                                </span>
                                            <span class="price">6,555원</span>
                                            <span class="cost">6,900원</span>
                                        </div>
                                    </li>
                                    <li data-index="5" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                 style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [퀸즈프레시] 프리미엄 샐러드 3종
                                                    </a>
                                                </span>
                                            <span class="price">6,555원</span>
                                            <span class="cost">6,900원</span>
                                        </div>
                                    </li>
                                    <li data-index="6" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                            <img src="/resources/images/IPMSlogo.png" alt="상품이미지" class="thumb"
                                                 style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [퀸즈프레시] 프리미엄 샐러드 3종
                                                    </a>
                                                </span>
                                            <span class="price">6,555원</span>
                                            <span class="cost">6,900원</span>
                                        </div>
                                    </li>
                                    <li data-index="7" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                 style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [퀸즈프레시] 프리미엄 샐러드 3종
                                                    </a>
                                                </span>
                                            <span class="price">6,555원</span>
                                            <span class="cost">6,900원</span>
                                        </div>
                                    </li>
                                    <li data-index="8" data-name="today_recommendation" class="list_item"
                                        style="float: left; position: relative; width: 249px; margin-right: 18px;">
                                        <a class="thumb_goods">
                                            <img src="https://img-cf.kurly.com/shop/data/my_icon/icon_save_5.png" alt="SALE" class="ico">
                                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAG0AAACRCAQAAABjof6/AAAANUlEQVR4Ae3BgQAAAADDoPtTT+AI1QAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIAnfAsAAe7+tYwAAAAASUVORK5CYII=" alt="상품이미지" class="thumb"
                                                 style="background-image: url('https://img-cf.kurly.com/shop/data/goods/160868697126l0.jpg');">
                                            <!-- 상품 이미지 임시값임. src는 데이터로 받아오기 -->
                                        </a>
                                        <div class="info_goods">
                                                <span class="name">
                                                    <a class="txt">
                                                        [퀸즈프레시] 프리미엄 샐러드 3종
                                                    </a>
                                                </span>
                                            <span class="price">6,555원</span>
                                            <span class="cost">6,900원</span>
                                        </div>
                                    </li>
                                </ul>

                            </div>
                            <!-- bx-viewport 끝 -->
                            <div class="bx_controls_direction">
                                <!-- 버튼을 누르면 오른쪽으로 1068px 만큼 이동, 끝에 닿으면 버튼 사라짐 -->
                                <a class="bx-prev"><span class="blind">이전으로</span></a>
                                <a class="bx-next"><span class="blind">이후로</span></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- .main_type1 반복 끝-->

            <!-- .main_type2 반복-->

            <!-- 인스타그램 고객 후기 -->
            <div class="main_type3">
                <div class="tit_goods">
                    <h3 class="tit" style="float: left">진행 프로젝트</h3>
                    <br>
                </div>

                <div class="list_goods">
                    <div class="bx-wrapper"
                         style="max-width: 1056px; margin: 0 auto;">
                        <div class="bx-viewport"
                             style="width: 100%; height: 176px; overflow: hidden; position: relative;">
                            <ul data-title="인스타그램 고객 후기" data-section="instagram" class="list_goods_ul"
                                style="width: 2715%; position: relative; transition-duration: 0.5s; transform: translate3d(0, 0, 0);">

                                <li data-index="1" data-name="instagram"
                                    style="float: left; position: relative; width: 175px;">
                                    <a target="_blank" class="thumb_goods">
                                        <img src="/resources/images/IPMSlogo.png" alt="상품이미지" class="thumb">
                                    </a>
                                </li>
                                <li data-index="2" data-name="instagram"
                                    style="float: left; position: relative; width: 175px;">
                                    <a target="_blank" class="thumb_goods">
                                        <img src="/resources/images/IPMSlogo.png" alt="상품이미지" class="thumb">
                                    </a>
                                </li>
                                <li data-index="3" data-name="instagram"
                                    style="float: left; position: relative; width: 175px;">
                                    <a target="_blank" class="thumb_goods">
                                        <img src="/resources/images/IPMSlogo.png" alt="상품이미지" class="thumb">
                                    </a>
                                </li>
                                <li data-index="4" data-name="instagram"
                                    style="float: left; position: relative; width: 175px;">
                                    <a target="_blank" class="thumb_goods">
                                        <img src="/resources/images/IPMSlogo.png" alt="상품이미지" class="thumb">
                                    </a>
                                </li>
                                <li data-index="5" data-name="instagram"
                                    style="float: left; position: relative; width: 175px;">
                                    <a target="_blank" class="thumb_goods">
                                        <img src="/resources/images/IPMSlogo.png" alt="상품이미지" class="thumb">
                                    </a>
                                </li>
                                <li data-index="6" data-name="instagram"
                                    style="float: left; position: relative; width: 175px;">
                                    <a target="_blank" class="thumb_goods">
                                        <img src="/resources/images/IPMSlogo.png" alt="상품이미지" class="thumb">
                                    </a>
                                </li>
                                <li data-index="7" data-name="instagram"
                                    style="float: left; position: relative; width: 175px;">
                                    <a target="_blank" class="thumb_goods">
                                        <img src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/133740249_1081468305645551_7425631588608142276_n.jpg?_nc_cat=107&ccb=2&_nc_sid=8ae9d6&_nc_ohc=1Qi4yQTV7-sAX8C3E3k&_nc_oc=AQlQUi3rwII9v6DDg73faC4_uBoOiSX5DealKSCqkYpXFyTasH431k2bHA2ORgywQEE&_nc_ht=scontent-nrt1-1.cdninstagram.com&oh=e17392cc8c4c5723a1de33248790d002&oe=60382B3A" alt="상품이미지" class="thumb">
                                    </a>
                                </li>
                                <li data-index="8" data-name="instagram"
                                    style="float: left; position: relative; width: 175px;">
                                    <a target="_blank" class="thumb_goods">
                                        <img src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/133740249_1081468305645551_7425631588608142276_n.jpg?_nc_cat=107&ccb=2&_nc_sid=8ae9d6&_nc_ohc=1Qi4yQTV7-sAX8C3E3k&_nc_oc=AQlQUi3rwII9v6DDg73faC4_uBoOiSX5DealKSCqkYpXFyTasH431k2bHA2ORgywQEE&_nc_ht=scontent-nrt1-1.cdninstagram.com&oh=e17392cc8c4c5723a1de33248790d002&oe=60382B3A" alt="상품이미지" class="thumb">
                                    </a>
                                </li>
                                <li data-index="9" data-name="instagram"
                                    style="float: left; position: relative; width: 175px;">
                                    <a target="_blank" class="thumb_goods">
                                        <img src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/133740249_1081468305645551_7425631588608142276_n.jpg?_nc_cat=107&ccb=2&_nc_sid=8ae9d6&_nc_ohc=1Qi4yQTV7-sAX8C3E3k&_nc_oc=AQlQUi3rwII9v6DDg73faC4_uBoOiSX5DealKSCqkYpXFyTasH431k2bHA2ORgywQEE&_nc_ht=scontent-nrt1-1.cdninstagram.com&oh=e17392cc8c4c5723a1de33248790d002&oe=60382B3A" alt="상품이미지" class="thumb">
                                    </a>
                                </li>
                                <li data-index="10" data-name="instagram"
                                    style="float: left; position: relative; width: 175px;">
                                    <a target="_blank" class="thumb_goods">
                                        <img src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/133740249_1081468305645551_7425631588608142276_n.jpg?_nc_cat=107&ccb=2&_nc_sid=8ae9d6&_nc_ohc=1Qi4yQTV7-sAX8C3E3k&_nc_oc=AQlQUi3rwII9v6DDg73faC4_uBoOiSX5DealKSCqkYpXFyTasH431k2bHA2ORgywQEE&_nc_ht=scontent-nrt1-1.cdninstagram.com&oh=e17392cc8c4c5723a1de33248790d002&oe=60382B3A" alt="상품이미지" class="thumb">
                                    </a>
                                </li>
                                <li data-index="11" data-name="instagram"
                                    style="float: left; position: relative; width: 175px;">
                                    <a target="_blank" class="thumb_goods">
                                        <img src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/133740249_1081468305645551_7425631588608142276_n.jpg?_nc_cat=107&ccb=2&_nc_sid=8ae9d6&_nc_ohc=1Qi4yQTV7-sAX8C3E3k&_nc_oc=AQlQUi3rwII9v6DDg73faC4_uBoOiSX5DealKSCqkYpXFyTasH431k2bHA2ORgywQEE&_nc_ht=scontent-nrt1-1.cdninstagram.com&oh=e17392cc8c4c5723a1de33248790d002&oe=60382B3A" alt="상품이미지" class="thumb">
                                    </a>
                                </li>
                                <li data-index="12" data-name="instagram"
                                    style="float: left; position: relative; width: 175px;">
                                    <a target="_blank" class="thumb_goods">
                                        <img src="https://scontent-nrt1-1.cdninstagram.com/v/t51.29350-15/133740249_1081468305645551_7425631588608142276_n.jpg?_nc_cat=107&ccb=2&_nc_sid=8ae9d6&_nc_ohc=1Qi4yQTV7-sAX8C3E3k&_nc_oc=AQlQUi3rwII9v6DDg73faC4_uBoOiSX5DealKSCqkYpXFyTasH431k2bHA2ORgywQEE&_nc_ht=scontent-nrt1-1.cdninstagram.com&oh=e17392cc8c4c5723a1de33248790d002&oe=60382B3A" alt="상품이미지" class="thumb">
                                    </a>
                                </li>

                            </ul>
                        </div>

                        <div class="bx_controls_direction">
                            <!-- 버튼을 누르면 오른쪽으로 1068px 만큼 이동, 끝에 닿으면 버튼 사라짐 -->
                            <a class="bx-prev"><span class="blind">이전으로</span></a>
                            <a class="bx-next"><span class="blind">이후로</span></a>
                        </div>
                    </div>
                </div>

                <div class="bnr">
                    <span class="txt">IPMS</span>
                    <a href="#" target="_blank">@IPMS_Co</a>
                </div>
            </div>
        </div>



</div>
</body>
</html>
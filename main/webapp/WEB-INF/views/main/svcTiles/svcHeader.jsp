<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">

<script type="text/javascript"
        src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<script>

    var socket = null;
    $(document).ready(function () {
        $("#ta0").on("click", function () {

        })
        $.ajax({
            url: "/main/boardList",
            type: "GET",
            dataType: "json",
            success: function (data) {
                var apd = "<div class='text-secondary'>"
                $.each(data, function (index, obj) {
                    let objAlamId = "'" + obj.alrmId + "'";
                    // apd += `<div id="ta\${index}" onclick="fn_alrm(\${objAlamId})">`+obj.alrmCts+`</div>`;
                    apd += '    <a href="javascript:void(0)">';
                    apd += '        <div  class="media">';
                    apd += '            <div class="media-left align-self-center">';
                    apd += '               <i class="feather icon-plus-square icon-bg-circle bg-cyan"></i>';
                    apd += '            </div>';
                    apd += '            <div  class="media-body">';
                    apd += '                <h6  class="media-heading">${obj.AlamId}</h6>';
                    apd += `<div style="font-family: noto sans, malgun gothic, AppleGothic, dotum;" id="ta\${index}" onclick="fn_alrm(\${objAlamId})" >` + obj.alrmCts + `</div>`;
                    apd += '          </div>';
                    apd += '      </div>';
                    apd += '  </a>';

                });
                apd += "</div>";
                $("#disp").html(apd);
            }
        });


        $.ajax({
            url: "/main/countAlrm",
            type: "GET",
            dataType: "json",
            success: function (data) {
                var result = data;
                var count = `<span class='badge badge-pill badge-danger badge-up'>\${data}</span>`
                $("#countAlrm").html(count);
            }
        });
    });


    function fn_alrm(Param) {

        $.ajax({
            url: "/main/deleteAlrm",
            type: "post",
            data: {"alrmId": Param},
            dataType: "json",
            beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (division) {
                if (division == 1) {
                    location.href = "/main/inviteAndApply";
                } else {
                    alert("실패");
                    location.href = "redirect:/main/page";
                }
            }
        });
    }
</script>
<!-- Topbar -->
<nav
        class="header-navbar navbar-expand-md navbar navbar-with-menu navbar-static-top navbar-light navbar-border navbar-brand-center fixed-top"
        data-nav="brand-center">

    <div class="navbar-container container center-layout">
        <div class="collapse navbar-collapse" id="navbar-mobile">
            <ul class="nav navbar-nav mr-auto float-left">
                <li class="nav-item d-none d-md-block"><a href="/main/page">
                    <img src="${pageContext.request.contextPath}/resources/logoImage/logo.jpg"
                         style="width: 120px;height: auto;margin-top: 10px" alt="">
                </a>
                </li>

                <li class="nav-item"><a class="navbar-brand" href="/main/wholeProject"
                                        style="margin-left: 250px;margin-top: 10px">
                    <button type="button" class="btn btn-outline-light btn-min-width mr-1 mb-1"
                            style="border: none;font-weight: bold;color: black">전체 프로젝트
                    </button>
                </a></li>

                <li class="nav-item"><a class="navbar-brand" href="/main/newProjectForm"
                                        style="margin-left: 100px;margin-top: 10px;">
                    <button type="button" class="btn btn-outline-light btn-min-width mr-1 mb-1"
                            style="border: none;font-weight: bold;color: black">프로젝트 생성
                    </button>
                </a></li>

                <li class="nav-item dropdown" style="margin-left: 80px;margin-top: 6px;position: relative;">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="true" aria-expanded="false"
                       style="border: none;font-weight: bold;color: black;font-family: noto sans,malgun gothic,AppleGothic,dotum;font-size: 1rem">
                        고객센터
                    </a>
                    <div class="dropdown-menu" x-placement="bottom-start"
                         style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(0px, 39px, 0px);">
                        <a class="dropdown-item" id="dropdownOption21-tab" href="/main/svcNotice" data-toggle="pill"
                           aria-expanded="true" style="font-family: noto sans,malgun gothic,AppleGothic,dotum;">공지사항</a>
                        <a class="dropdown-item" id="dropdownOption22-tab" href="/main/svcFaq" data-toggle="pill"
                           aria-expanded="true" style="font-family: noto sans,malgun gothic,AppleGothic,dotum;">자주 묻는
                            질문</a>
                        <a class="dropdown-item" id="dropdownOption22-tab" href="/main/svcQaA" data-toggle="pill"
                           aria-expanded="true" style="font-family: noto sans,malgun gothic,AppleGothic,dotum;">Q&A</a>
                    </div>
                </li>


            </ul>
            <ul class="nav navbar-nav float-right">
                <li class="dropdown dropdown-notification nav-item">
                    <a class="nav-link nav-link-label" href="#" data-toggle="dropdown">
                        <i class="ficon feather icon-bell"></i>
                        <div id="countAlrm"></div>
                        <%--                        <span class="badge badge-pill badge-danger badge-up">5</span>--%>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                        <li class="dropdown-menu-header">
                            <h6 class="dropdown-header m-0">
                                
                                <span
                                        class="notification-tag badge badge-danger float-right m-0"><div
                                        id="countAlrm"></div></span>
                            </h6>
                        </li>
                        <li class="scrollable-container media-list ps">
                            <a href="javascript:void(0)">
                                <div id="disp">
                            </a>
                            <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
                                <div class="ps__thumb-x" tabindex="0"
                                     style="left: 0px; width: 0px;"></div>
                            </div>
                        </li>
                        
                    </ul>
                </li>
                <li class="dropdown dropdown-user nav-item">
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="user-profile.html"><i
                                class="feather icon-user"></i> Edit Profile</a><a
                            class="dropdown-item" href="app-email.html"><i
                            class="feather icon-mail"></i> My Inbox</a><a class="dropdown-item"
                                                                          href="user-cards.html"><i
                            class="feather icon-check-square"></i>
                        Task</a><a class="dropdown-item" href="app-chat.html"><i
                            class="feather icon-message-square"></i> Chats</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="login-with-bg-image.html"><i
                                class="feather icon-power"></i> Logout</a>
                    </div>
                </li>
            </ul>
            <!-- 비로그인-->
            <sec:authorize access="isAnonymous()">
                <button type="button" id="loginBtn" class="btn btn-outline-secondary"><i class="fa fa-plug"></i>로그인
                </button>
                <button type="button" id="signUpBtn" class="btn btn-outline-secondary"><i class="fa fa-user-o"></i> 회원가입
                </button>
            </sec:authorize>

            <!--로그인 -->
            <sec:authorize access="hasRole('ROLE_MEMBER')">
                &nbsp;&nbsp;&nbsp;&nbsp;<strong>${mvo.member.memName}님</strong>&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" id="myPage" class="btn btn-outline-secondary"><i class="fa fa-plug"></i>마이페이지
                </button>
                <form action="/customLogout" method='post'>
                    <button class="btn btn-outline-secondary">로그아웃</button>
                    <sec:csrfInput/>
                </form>
            </sec:authorize>

            <sec:authorize access="hasRole('ROLE_ADMIN')">
                &nbsp;&nbsp;&nbsp;&nbsp;관리자님&nbsp;&nbsp;&nbsp;&nbsp;
                <%--                <p style="font-size: large"> <sec:authentication property="principal.member.memName"/></p>--%>
                <button type="button" id="myPage" class="btn btn-outline-secondary"><i class="fa fa-plug"></i>마이페이지
                </button>
                <form action="/customLogout" method='post'>
                    <button class="btn btn-outline-secondary">로그아웃</button>
                    <sec:csrfInput/>
                </form>
            </sec:authorize>


        </div>
    </div>
</nav>

<!-- End of Topbar -->

<script type="text/javascript">
    $("#loginBtn").on("click", function () {
        location.href = "/main/loginForm";
    });

    $("#myPage").on("click", function () {
        location.href = "/main/inforManagement";
    });


    $("#signUpBtn").on("click", function () {
        location.href = "/main/signUpForm";
    });

    $(".dropdown-item").on("click", function () {
        let url = $(this).attr("href");
//     	console.log("url", url);
        location.href = url;
    })
</script>
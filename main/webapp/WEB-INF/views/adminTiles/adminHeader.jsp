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

</script>
<!-- Topbar -->
<nav
        class="header-navbar navbar-expand-md navbar navbar-with-menu navbar-static-top navbar-light navbar-border navbar-brand-center fixed-top"
        data-nav="brand-center">

    <div class="navbar-container container center-layout">
        <div class="collapse navbar-collapse" id="navbar-mobile">
            <ul class="nav navbar-nav mr-auto float-left">
                <li class="nav-item d-none d-md-block"><a href="/main/adminMemberManagement">
                    <img src="${pageContext.request.contextPath}/resources/logoImage/logo.jpg"
                         style="width: 120px;height: auto;margin-top: 10px" alt="">
                </a>
                </li>

                <li class="nav-item"><a class="navbar-brand" href="/main/wholeProject" style="margin-left: 250px;margin-top: 10px">
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

            <!-- 비로그인-->
            <sec:authorize access="not hasAnyRole('ROLE_ADMIN')">
                <button type="button" id="loginBtn" class="btn btn-outline-secondary"><i class="fa fa-plug"></i>로그인
                </button>
                <button type="button" id="signUpBtn" class="btn btn-outline-secondary"><i class="fa fa-user-o"></i> 회원가입
                </button>
            </sec:authorize>

            <!--로그인 -->
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                관리자님
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
        location.href = "/main/adminSvcNotice";
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
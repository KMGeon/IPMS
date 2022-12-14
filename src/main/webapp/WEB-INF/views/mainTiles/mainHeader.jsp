<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>

<script type="text/javascript"
        src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

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

                <li class="nav-item"><a class="navbar-brand" href="/main/wholeProject" style="margin-left: 250px;margin-top: 10px">
                    <button type="button" class="btn btn-outline-light btn-min-width mr-1 mb-1"
                            style="border: none;font-weight: bold;color: black">전체 프로젝트
                    </button>
                </a></li>

                <li class="nav-item"><a class="navbar-brand" href="/main/newProjectForm" style="margin-left: 100px;margin-top: 10px;">
                    <button type="button" class="btn btn-outline-light btn-min-width mr-1 mb-1"
                            style="border: none;font-weight: bold;color: black">프로젝트 생성
                    </button>
                </a></li>

                <li class="nav-item"><a class="navbar-brand" href="/main/svcNotice"
                                        style="margin-left: 80px;margin-top: 10px;position: relative;">
                    <button type="button" class="btn btn-outline-light btn-min-width mr-1 mb-1"
                            style="border: none;font-weight: bold;color: black">고객센터
                    </button>
                </a></li>


            </ul>
            <ul class="nav navbar-nav float-right">
                <li class="dropdown dropdown-notification nav-item"><a
                        class="nav-link nav-link-label" href="#" data-toggle="dropdown"><i
                        class="ficon feather icon-bell"></i><span
                        class="badge badge-pill badge-danger badge-up">5</span></a>
                    <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                        <li class="dropdown-menu-header">
                            <h6 class="dropdown-header m-0">
                                <span class="grey darken-2">Notifications</span><span
                                    class="notification-tag badge badge-danger float-right m-0">5
										New</span>
                            </h6>
                        </li>
                        <li class="scrollable-container media-list ps"><a
                                href="javascript:void(0)">
                            <div class="media">
                                <div class="media-left align-self-center">
                                    <i class="feather icon-plus-square icon-bg-circle bg-cyan"></i>
                                </div>
                                <div class="media-body">
                                    <h6 class="media-heading">You have new order!</h6>
                                    <p class="notification-text font-small-3 text-muted">Lorem
                                        ipsum dolor sit amet, consectetuer elit.</p>
                                    <small>
                                        <time class="media-meta text-muted"
                                              datetime="2015-06-11T18:29:20+08:00">30 minutes ago
                                        </time>
                                    </small>
                                </div>
                            </div>
                        </a><a href="javascript:void(0)">
                            <div class="media">
                                <div class="media-left align-self-center">
                                    <i
                                            class="feather icon-download-cloud icon-bg-circle bg-red bg-darken-1"></i>
                                </div>
                                <div class="media-body">
                                    <h6 class="media-heading red darken-1">99% Server load</h6>
                                    <p class="notification-text font-small-3 text-muted">Aliquam
                                        tincidunt mauris eu risus.</p>
                                    <small>
                                        <time class="media-meta text-muted"
                                              datetime="2015-06-11T18:29:20+08:00">Five hour ago
                                        </time>
                                    </small>
                                </div>
                            </div>
                        </a><a href="javascript:void(0)">
                            <div class="media">
                                <div class="media-left align-self-center">
                                    <i
                                            class="feather icon-alert-triangle icon-bg-circle bg-yellow bg-darken-3"></i>
                                </div>
                                <div class="media-body">
                                    <h6 class="media-heading yellow darken-3">Warning
                                        notifixation</h6>
                                    <p class="notification-text font-small-3 text-muted">Vestibulum
                                        auctor dapibus neque.</p>
                                    <small>
                                        <time class="media-meta text-muted"
                                              datetime="2015-06-11T18:29:20+08:00">Today
                                        </time>
                                    </small>
                                </div>
                            </div>
                        </a><a href="javascript:void(0)">
                            <div class="media">
                                <div class="media-left align-self-center">
                                    <i class="feather icon-check-circle icon-bg-circle bg-cyan"></i>
                                </div>
                                <div class="media-body">
                                    <h6 class="media-heading">Complete the task</h6>
                                    <small>
                                        <time class="media-meta text-muted"
                                              datetime="2015-06-11T18:29:20+08:00">Last week
                                        </time>
                                    </small>
                                </div>
                            </div>
                        </a><a href="javascript:void(0)">
                            <div class="media">
                                <div class="media-left align-self-center">
                                    <i class="feather icon-file icon-bg-circle bg-teal"></i>
                                </div>
                                <div class="media-body">
                                    <h6 class="media-heading">Generate monthly report</h6>
                                    <small>
                                        <time class="media-meta text-muted"
                                              datetime="2015-06-11T18:29:20+08:00">Last month
                                        </time>
                                    </small>
                                </div>
                            </div>
                        </a>
                            <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
                                <div class="ps__thumb-x" tabindex="0"
                                     style="left: 0px; width: 0px;"></div>
                            </div>
                        </li>
                        <li class="dropdown-menu-footer"><a
                                class="dropdown-item text-muted text-center"
                                href="javascript:void(0)">Read all notifications</a></li>
                    </ul>
                </li>
                <li class="dropdown dropdown-notification nav-item">
                    <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                        <li class="dropdown-menu-header">
                            <h6 class="dropdown-header m-0">
                                <span class="grey darken-2">Messages</span><span
                                    class="notification-tag badge badge-warning float-right m-0">4
										New</span>
                            </h6>
                        </li>
                        <li class="scrollable-container media-list ps"><a
                                href="javascript:void(0)">
                            <div class="media">
                                <div class="media-left">
                                    <div class="avatar avatar-online avatar-sm rounded-circle">
                                        <img
                                                src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-1.png"
                                                alt="avatar"><i></i>
                                    </div>
                                </div>
                                <div class="media-body">
                                    <h6 class="media-heading">Margaret Govan</h6>
                                    <p class="notification-text font-small-3 text-muted">I
                                        like your portfolio, let's start.</p>
                                    <small>
                                        <time class="media-meta text-muted"
                                              datetime="2015-06-11T18:29:20+08:00">Today
                                        </time>
                                    </small>
                                </div>
                            </div>
                        </a><a href="javascript:void(0)">
                            <div class="media">
                                <div class="media-left">
											<span class="avatar avatar-sm avatar-busy rounded-circle"><img
                                                    src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-2.png"
                                                    alt="avatar"><i></i></span>
                                </div>
                                <div class="media-body">
                                    <h6 class="media-heading">Bret Lezama</h6>
                                    <p class="notification-text font-small-3 text-muted">I
                                        have seen your work, there is</p>
                                    <small>
                                        <time class="media-meta text-muted"
                                              datetime="2015-06-11T18:29:20+08:00">Tuesday
                                        </time>
                                    </small>
                                </div>
                            </div>
                        </a><a href="javascript:void(0)">
                            <div class="media">
                                <div class="media-left">
                                    <div class="avatar avatar-online avatar-sm rounded-circle">
                                        <img
                                                src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-3.png"
                                                alt="avatar"><i></i>
                                    </div>
                                </div>
                                <div class="media-body">
                                    <h6 class="media-heading">Carie Berra</h6>
                                    <p class="notification-text font-small-3 text-muted">Can
                                        we have call in this week ?</p>
                                    <small>
                                        <time class="media-meta text-muted"
                                              datetime="2015-06-11T18:29:20+08:00">Friday
                                        </time>
                                    </small>
                                </div>
                            </div>
                        </a><a href="javascript:void(0)">
                            <div class="media">
                                <div class="media-left">
											<span class="avatar avatar-sm avatar-away rounded-circle"><img
                                                    src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/portrait/small/avatar-s-6.png"
                                                    alt="avatar"><i></i></span>
                                </div>
                                <div class="media-body">
                                    <h6 class="media-heading">Eric Alsobrook</h6>
                                    <p class="notification-text font-small-3 text-muted">We
                                        have project party this saturday.</p>
                                    <small>
                                        <time class="media-meta text-muted"
                                              datetime="2015-06-11T18:29:20+08:00">last month
                                        </time>
                                    </small>
                                </div>
                            </div>
                        </a>
                            <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
                                <div class="ps__thumb-x" tabindex="0"
                                     style="left: 0px; width: 0px;"></div>
                            </div>
                            <div class="ps__rail-y" style="top: 0px; right: 0px;">
                                <div class="ps__thumb-y" tabindex="0"
                                     style="top: 0px; height: 0px;"></div>
                            </div>
                        </li>
                        <li class="dropdown-menu-footer"><a
                                class="dropdown-item text-muted text-center"
                                href="javascript:void(0)">Read all messages</a></li>
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
                <button type="button" id="loginBtn" class="btn btn-outline-secondary"><i class="fa fa-plug"></i>로그인</button>
                <button type="button" id="signUpBtn" class="btn btn-outline-secondary"><i class="fa fa-user-o"></i> 회원가입</button>
            </sec:authorize>

            <!--로그인 -->
            <sec:authorize access="isAuthenticated()">
                <p>mvo : ${mvo}<br /></p>
                <p style="font-size: large">${mvo.member.memName}님</p>
<%--                <sec:authentication property="principal" var="prc"/>--%>
<%--                ${prc.username }--%>
<%--                <c:forEach items="${prc.authorities  }" var="auth">--%>
<%--                    ${auth }--%>
<%--                </c:forEach>--%>
<%--                <sec:authentication property="principal.username"/>님--%>
                <button type="button" id="myPage"  class="btn btn-outline-secondary" ><i class="fa fa-plug"></i>마이페이지</button>
                <form action="/customLogout" method='post'>
                    <button  class="btn btn-outline-secondary" >로그아웃</button>
                    <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
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
</script>
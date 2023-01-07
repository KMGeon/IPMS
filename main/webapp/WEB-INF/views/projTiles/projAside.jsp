<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<link rel="stylesheet" type="text/css"
      href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/core/menu/menu-types/vertical-menu.css">
<script type="text/javascript"
        src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>

<!-- BEGIN: Main Menu-->
<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow"
     data-scroll-to-active="true">
    <div class="main-menu-content">
        <br/>
        <ul class="navigation navigation-main" id="main-menu-navigation"
            data-menu="menu-navigation">
            <li class=" navigation-header">
                <span>side menu</span>
                <i class=" feather icon-minus" data-toggle="tooltip" data-placement="right"
                   data-original-title="Apps"></i>
            </li>
            <li class=" nav-item">
                <a href="/proj/${projId}/dashboard">
                    <i class="fa fa-th-large"></i>
                    <span class="menu-title" data-i18n="Invoice">대시보드</span>
                </a>
            <li class=" nav-item">
                <a href="/proj/${projId}/work">
                    <i class="feather icon-file-plus"></i>
                    <span class="menu-title" data-i18n="Kanban Application">일감 관리</span>
                </a>
            </li>
            <li class=" nav-item">
                <a href="/proj/${projId}/issueboard">
                    <i class="feather icon-alert-circle"></i>
                    <span class="menu-title" data-i18n="Kanban Application">이슈</span>
                </a>
            </li>
            <li class=" nav-item">
                <a href="/proj/${projId}/schedule">
                    <i class="fa fa-calendar"></i>
                    <span class="menu-title" data-i18n="Kanban Application">캘린더</span>
                </a>
            </li>
            <li class=" nav-item">
                <a href="/proj/${projId}/gantt">
                    <i class="fa fa-tasks"></i>
                    <span class="menu-title" data-i18n="Kanban Application">간트차트</span>
                </a>
            </li>
            <li class=" nav-item">
                <a href="/proj/${projId}/erd">
                    <i class="fa fa-database"></i>
                    <span class="menu-title" data-i18n="Kanban Application">ERD그리기</span>
                </a>
            </li>
            <li class=" nav-item">
                <a href="/proj/${projId}/docs">
                    <i class="fa fa-download"></i>
                    <span class="menu-title" data-i18n="Kanban Application">문서함</span>
                </a>
            </li>
            <li class=" nav-item">
                <a href="/proj/${projId}/wiki">
                    <i class="fa fa-sitemap"></i>
                    <span class="menu-title" data-i18n="Kanban Application">위키</span>
                </a>
            </li>
            <li id="menuBtn" class="nav-item has-sub"><a><i class="fa fa-list-ul"></i><span class="menu-title"
                                                                                            data-i18n="Menu levels">&nbsp;프로젝트 게시판</span></a>
                <ul class="menu-content" style="">
                    <li class="is-shown" id="step1">
                        <a class="menu-item" href="/proj/${projId}/noticeBoard" data-i18n="Second level">프로젝트 공지사항</a>
                    </li>
                    <li class="is-shown" id="step2">
                        <a class="menu-item" href="/proj/${projId}/freeboard" data-i18n="Second level">자유게시판</a>
                    </li>
                </ul>
            </li>
            <li class=" nav-item">
                <a href="/proj/${projId}/projQuit">
                    <i class="feather icon-user-minus"></i>
                    <span class="menu-title" data-i18n="Kanban Application">프로젝트 하차</span>
                </a>
            </li>
<%--            <sec:authorize access="hasRole()">--%>
			<%String leaderCheck = (String)request.getAttribute("leaderCheck"); %>
			<%if(leaderCheck.equals("true")){ %>
			
                <li class=" nav-item">
                    <a href="/proj/${projId}/memManagement">
                        <i class="icon-users"></i>
                        <span class="menu-title" data-i18n="Kanban Application">프로젝트 멤버 관리</span>
                    </a>
                </li>
                <li class=" nav-item">
                    <a href="/proj/${projId}/settingManagement">
                        <i class="feather icon-settings"></i>
                        <span class="menu-title" data-i18n="Kanban Application">프로젝트 설정 관리</span>
                    </a>
                </li>
                <%} %>
<%--            </sec:authorize>--%>

        </ul>
    </div>
    <input type="hidden" name="projId" value="${projId}"/>
    <input type="text" name="memCode" value="${mvo.member.memCode}"/>
</div>

<!-- END: Main Menu-->

<!-- BEGIN: Content-->

<!-- END: Content-->

<div class="sidenav-overlay"></div>
<div class="drag-target"></div>
<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/core/app-menu.js"></script>

<script type="text/javascript">
    // $(function() {
    // 	var flag = false;
    // 	$('#menuBtn').on('click', function() {
    // 		if(!flag){
    // 			$("#menuBtn").attr("class","nav-item has-sub open");
    // 			$('.menu-content').css('height', '82.3935px');
    // 			flag = true;
    // 		}else if(flag == true){
    // 			$("#menuBtn").attr("class","nav-item has-sub");
    // 			$('.menu-content').css('height', 'auto');
    // 			flag = false;
    // 		}

    // 	});
    // });

</script>
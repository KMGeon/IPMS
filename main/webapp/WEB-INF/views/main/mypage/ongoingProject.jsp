<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css"
          href="/resources/stack-admin-v4.0/stack-admin/app-assets/vendors/css/forms/selects/select2.min.css">
    <script type="text/javascript"
            src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/resources/GatherCss.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/common.css">
    <link rel="stylesheet" href="/resources/css/join.css">


    <script src="/resources/js/jquery-3.6.0.js"></script>
    <script src="/resources/js/join.js"></script>
    <script src="/resources/js/common.js"></script>
    <style>
    .profile-card-with-cover{
    	height: 350px;
    }
    .scc{
    	padding-right: 90px;
    	padding-left: 14px;
    }
    </style>
    <div style="bottom:30px;" class="content-header-left col-md-6 col-12 mb-2">
			<h3 class="content-header-title mb-0"><b>onGoing Project</b></h3>
			<div class="row breadcrumbs-top">
				<div class="breadcrumb-wrapper col-12"></div>
			</div>
		</div>
<section  class="row mt-2 scc">
    <c:forEach var="item" items="${list}">
    <div class="col-xl-4 col-md-6 col-12">
        <div class="card profile-card-with-cover" >
            <!--<img class="card-img-top img-fluid" src="/resources/stack-admin-v4.0/stack-admin/app-assets/images/carousel/18.jpg" alt="Card cover image">-->
            <div class="card-img-top img-fluid bg-cover height-200" style="background: url('/resources/upload/img/${item.projImgRoute}');"></div>
            <div class="profile-card-with-cover-content text-center">
                <div class="card-body">
                    <h4 class="card-title"><a href="/proj/${item.projId}/dashboard">${item.projName}</a></h4>
                    <ul class="list-inline list-inline-pipe">
                        <li>&nbsp; ${item.memName}</li>
                        <br>
                    </ul>
                    <br>
                </div>

            </div>
        </div>
    </div>
    </c:forEach>
</section>

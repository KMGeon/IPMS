<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <div class="card-img-top img-fluid bg-cover height-200" style="background: url('/resources/stack-admin-v4.0/stack-admin/app-assets/images/carousel/18.jpg');"></div>
            <div class="profile-card-with-cover-content text-center">
                <div class="card-body">
                    <h4 class="card-title"><a href="/proj/${item.projId}/dashboard">${item.teamId}</a></h4>
                    <ul class="list-inline list-inline-pipe">
                        <li>${item.memName}</li>
                    </ul>
                    <h6 class="card-subtitle text-muted">Managing Director(${item.memEmail})</h6>
                </div>
                
            </div>
        </div>
    </div>
    </c:forEach>
</section>

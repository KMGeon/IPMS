<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="content-left offset-1" style="width: 12%">
<div class="card-head">
		<div class="form-group form-group-compose">
            <!-- compose button  -->
            <a href="/main/pwAuth" class="btn btn-info btn-glow btn-block my-2 compose-btn" style="background-color: #00b5b8 !important">
                <i class="fa fa-pencil-square-o"></i>
                	마이페이지
            </a>
        </div>
	<div class="media p-1">
	    <div class="media-left pr-1"></div>
	    <div class="media-body media-middle">
	        <h5 class="media-heading" style="padding-left: 37px">김효정님 </h5>
	        <h4 class="media-heading" style="font-size: 15px"></h4>	        
	    </div>
	</div>
</div>
	<div class="sidebar-menu-list">
		<!-- sidebar menu  -->
		<div class="list-group list-group-messages" >
			<a href="/main/inforManagement" class="list-group-item" id="inbox-menu">
				<div class="d-inline mr-25">
					<i class="feather icon-mail"></i>
				</div> 개인 정보 관리 
			</a> <a href="/main/inviteAndApply" class="list-group-item">
				<div class="d-inline mr-25">
					<i class="feather icon-play"></i>
				</div> 초대/신청 현황 조회
			</a> <a href="/main/ongoing" class="list-group-item">
				<div class="d-inline mr-25">
					<i class="feather icon-edit-1"></i>
				</div> 프로젝트 현황
			</a> <a href="/main/bookmark" class="list-group-item">
				<div class="d-inline mr-25">
					<i class="feather icon-star"></i>
				</div> 북마크 한 프로젝트
			</a> <a href="/main/portfolio" class="list-group-item">
				<div class="d-inline mr-25">
					<i class="feather icon-info"></i>
				</div> 포트폴리오 <span
				class="badge badge-warning badge-pill badge-round float-right">3</span>
			</a> <a href="#" class="list-group-item">
				<div class="d-inline mr-25">
					<i class="feather icon-trash-2"></i>
				</div> 문의내역
			</a>
			</a> <a href="/main/memDeleteAcc" class="list-group-item">
				<div class="d-inline mr-25">
					<i class="feather icon-trash-2"></i>
				</div> 회원탈퇴
			</a>
		</div>
		<!-- sidebar menu  end-->
	</div>
</div>
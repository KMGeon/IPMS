<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- BEGIN: Head-->
<head>

<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css"
	href="/resources/stack-admin-v4.0/stack-admin/app-assets/css/pages/app-invoice.css">
<!-- END: Page CSS-->

</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body>

	<!-- BEGIN: Content-->
	<div class="content-wrapper">
		<div class="content-header row">
			<div class="content-header-left col-md-6 col-12 mb-2">
				<h3 class="content-header-title mb-0">NOTICE DETAIL</h3>
			</div>
		</div>
		<div class="content-body">
			<!-- App invoice wrapper -->
			<section class="app-invoice-wrapper">
				<div class="row">
					<div style="width: 2000px;">
						<!-- using a bootstrap card -->
						<div class="card">
							<!-- card body -->
							<div class="card-body p-2">
								<!-- card-header -->
								<div class="card-header px-0">
									<div class="row">
										<div class="col-md-12 col-lg-7 col-xl-4 mb-50">
											<span class="invoice-id font-weight-bold">No. </span> <span>12345</span>
										</div>
										<div class="col-md-12 col-lg-5 col-xl-8">
											<div
												class="d-flex align-items-center justify-content-end justify-content-xs-start">
												<div class="issue-date pr-2">
													<span>2022/12/08 WED 10:05</span>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- invoice logo and title -->
								<div class="invoice-logo-title row py-2">
									<div
										class="col-6 d-flex flex-column justify-content-center align-items-start">
										<h2 class="text-primary"
											style="font-family: 'MICEGothic Bold';">공지사항입니당</h2>
										<span>김효정</span>
									</div>
								</div>
								<hr>

								<!-- 글 내용 -->
								<div class="row invoice-adress-info py-2">
									<div class="col-6 mt-1 from-info">
										<img src="/resources/images/imagesample.jpg"
											style="width: 400px;"> <br> 죽는 날까지 하늘을 우러러<br>
										한 점 부끄럼이 없기를<br> 잎새에 이는 바람에도<br> 나는 괴로워했다<br>
										별을 노래하는 마음으로<br> 모든 죽어가는 것을 사랑해야지<br> 그리고 나한테 주어진 길을
										걸어가야겠다<br> 오늘 밤에도 별이 바람에 스치운다
									</div>
								</div>
								<hr>
								<div><i class="feather icon-link"></i>첨부파일: ___________________________</div>
								<div style="float:right;">
									<button type="button"
										class="btn btn-secondary">
										<i class="feather icon-trash-2 mr-25 common-size"></i>삭제
									</button>
									<button type="button"
										class="btn btn-secondary">
										<i class="feather icon-edit mr-25 common-size"></i>수정
									</button>
									<a href="/proj/noticeBoard"
										class="btn btn-primary"><i
										class="fa fa-reply-all mr-25 common-size"></i>목록</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<!-- END: Content-->

	<!-- BEGIN: Page JS-->
	<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/pages/app-invoice.js"></script>
	<!-- END: Page JS-->

</body>
<!-- END: Body-->

</html>

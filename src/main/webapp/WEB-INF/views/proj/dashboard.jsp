<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="content-header row">
	<div class="content-header-left col-md-6 col-12 mb-2">
		<h3 class="content-header-title mb-0">Project Summary</h3>
		<div class="row breadcrumbs-top">
			<div class="breadcrumb-wrapper col-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item"><a href="#">Project</a></li>
					<li class="breadcrumb-item active">Project Summary</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="content-detached content-left">
	<div class="content-body">
		<section class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-head">
						<div class="card-header">
							<h4 class="card-title">iOS APP Development</h4>
							<a class="heading-elements-toggle"><i
								class="fa fa-ellipsis-v font-medium-3"></i></a>
							<div class="heading-elements">
								<span class="badge badge-warning">Mobile</span> <span
									class="badge badge-success">New</span> <span
									class="badge badge-info">iOS</span>
							</div>
						</div>
						<div class="px-1">
							<ul
								class="list-inline list-inline-pipe text-center p-1 border-bottom-grey border-bottom-lighten-3">
								<li>Project Owner: <span class="text-muted">Margaret
										Govan</span></li>
								<li>Start: <span class="text-muted">01/Feb/2016</span></li>
								<li>Due on: <span class="text-muted">01/Oct/2016</span></li>
								<li><a href="#" class="text-muted" data-toggle="tooltip"
									data-placement="bottom" title=""
									data-original-title="Export as PDF"><i
										class="fa fa-file-pdf-o"></i></a></li>
							</ul>
						</div>
					</div>
					<!-- project-info -->
					<div id="project-info" class="card-body row">
						<div class="project-info-count col-lg-4 col-md-12">
							<div class="project-info-icon">
								<h2>12</h2>
								<div class="project-info-sub-icon">
									<span class="fa fa-user-o"></span>
								</div>
							</div>
							<div class="project-info-text pt-1">
								<h5>Project Users</h5>
							</div>
						</div>
						<div class="project-info-count col-lg-4 col-md-12">
							<div class="project-info-icon">
								<h2>160</h2>
								<div class="project-info-sub-icon">
									<span class="fa fa-calendar-check-o"></span>
								</div>
							</div>
							<div class="project-info-text pt-1">
								<h5>Project Task</h5>
							</div>
						</div>
						<div class="project-info-count col-lg-4 col-md-12">
							<div class="project-info-icon">
								<h2>20</h2>
								<div class="project-info-sub-icon">
									<span class="fa fa-bug"></span>
								</div>
							</div>
							<div class="project-info-text pt-1">
								<h5>Project Bug</h5>
							</div>
						</div>
					</div>
					<!-- project-info -->
					<div class="card-body">
						<div
							class="card-subtitle line-on-side text-muted text-center font-small-3 mx-2 my-1">
							<span>Egal's Eye View Of Project Status</span>
						</div>
						<div class="row py-2">
							<div class="col-lg-6 col-md-12">
								<div class="insights px-2">
									<div>
										<span class="text-info h3">82%</span> <span
											class="float-right">Tasks</span>
									</div>
									<div class="progress progress-md mt-1 mb-0">
										<div class="progress-bar bg-info" role="progressbar"
											style="width: 82%" aria-valuenow="25" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-12">
								<div class="insights px-2">
									<div>
										<span class="text-success h3">78%</span> <span
											class="float-right">TaskLists</span>
									</div>
									<div class="progress progress-md mt-1 mb-0">
										<div class="progress-bar bg-success" role="progressbar"
											style="width: 78%" aria-valuenow="25" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="row py-2">
							<div class="col-lg-6 col-md-12">
								<div class="insights px-2">
									<div>
										<span class="text-warning h3">68%</span> <span
											class="float-right">Milestones</span>
									</div>
									<div class="progress progress-md mt-1 mb-0">
										<div class="progress-bar bg-warning" role="progressbar"
											style="width: 68%" aria-valuenow="25" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-12">
								<div class="insights px-2">
									<div>
										<span class="text-danger h3">62%</span> <span
											class="float-right">Bugs</span>
									</div>
									<div class="progress progress-md mt-1 mb-0">
										<div class="progress-bar bg-danger" role="progressbar"
											style="width: 62%" aria-valuenow="25" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Task Progress -->
		<section class="row">
			<div class="col-xl-6 col-lg-12 col-md-12">
				<div class="card">
					<div class="card-head">
						<div class="card-header">
							<h4 class="card-title">Task Progress</h4>
							<a class="heading-elements-toggle"><i
								class="fa fa-ellipsis-v font-medium-3"></i></a>
							<div class="heading-elements">
								<ul class="list-inline mb-0">
									<li><a data-action="reload"><i
											class="feather icon-rotate-cw"></i></a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="card-content">
						<div class="card-body" style="position: relative;">
							<div id="task-pie-chart" class="height-400"
								style="min-height: 350px;">
								<div id="apexcharts964n3idk"
									class="apexcharts-canvas apexcharts964n3idk light"
									style="width: 598px; height: 350px;">
									<svg id="SvgjsSvg1140" width="598" height="350"
										xmlns="http://www.w3.org/2000/svg" version="1.1"
										xmlns:xlink="http://www.w3.org/1999/xlink"
										xmlns:svgjs="http://svgjs.com/svgjs" class="apexcharts-svg"
										xmlns:data="ApexChartsNS" transform="translate(0, 0)"
										style="background: transparent;">
										<foreignObject x="0" y="0" width="598" height="350">
										<div class="apexcharts-legend center position-bottom"
											xmlns="http://www.w3.org/1999/xhtml"
											style="inset: auto 0px 10px; position: absolute;">
											<div class="apexcharts-legend-series" rel="1"
												data:collapsed="false" style="margin: 0px 5px;">
												<span class="apexcharts-legend-marker" rel="1"
													data:collapsed="false"
													style="background: rgb(0, 143, 251); color: rgb(0, 143, 251); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span
													class="apexcharts-legend-text" rel="1"
													data:collapsed="false"
													style="color: rgb(55, 61, 63); font-size: 12px; font-family: Helvetica, Arial, sans-serif;">Team A</span>
											</div>
											<div class="apexcharts-legend-series" rel="2"
												data:collapsed="false" style="margin: 0px 5px;">
												<span class="apexcharts-legend-marker" rel="2"
													data:collapsed="false"
													style="background: rgb(0, 227, 150); color: rgb(0, 227, 150); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span
													class="apexcharts-legend-text" rel="2"
													data:collapsed="false"
													style="color: rgb(55, 61, 63); font-size: 12px; font-family: Helvetica, Arial, sans-serif;">Team B</span>
											</div>
											<div class="apexcharts-legend-series" rel="3"
												data:collapsed="false" style="margin: 0px 5px;">
												<span class="apexcharts-legend-marker" rel="3"
													data:collapsed="false"
													style="background: rgb(254, 176, 25); color: rgb(254, 176, 25); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span
													class="apexcharts-legend-text" rel="3"
													data:collapsed="false"
													style="color: rgb(55, 61, 63); font-size: 12px; font-family: Helvetica, Arial, sans-serif;">Team C</span>
											</div>
											<div class="apexcharts-legend-series" rel="4"
												data:collapsed="false" style="margin: 0px 5px;">
												<span class="apexcharts-legend-marker" rel="4"
													data:collapsed="false"
													style="background: rgb(255, 69, 96); color: rgb(255, 69, 96); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span
													class="apexcharts-legend-text" rel="4"
													data:collapsed="false"
													style="color: rgb(55, 61, 63); font-size: 12px; font-family: Helvetica, Arial, sans-serif;">Team D</span>
											</div>
											<div class="apexcharts-legend-series" rel="5"
												data:collapsed="false" style="margin: 0px 5px;">
												<span class="apexcharts-legend-marker" rel="5"
													data:collapsed="false"
													style="background: rgb(119, 93, 208); color: rgb(119, 93, 208); height: 12px; width: 12px; left: 0px; top: 0px; border-width: 0px; border-color: rgb(255, 255, 255); border-radius: 12px;"></span><span
													class="apexcharts-legend-text" rel="5"
													data:collapsed="false"
													style="color: rgb(55, 61, 63); font-size: 12px; font-family: Helvetica, Arial, sans-serif;">Team E</span>
											</div>
										</div>
										<style type="text/css">
.apexcharts-legend {
	display: flex;
	overflow: auto;
	padding: 0 10px;
}

.apexcharts-legend.position-bottom, .apexcharts-legend.position-top {
	flex-wrap: wrap
}

.apexcharts-legend.position-right, .apexcharts-legend.position-left {
	flex-direction: column;
	bottom: 0;
}

.apexcharts-legend.position-bottom.left, .apexcharts-legend.position-top.left,
	.apexcharts-legend.position-right, .apexcharts-legend.position-left {
	justify-content: flex-start;
}

.apexcharts-legend.position-bottom.center, .apexcharts-legend.position-top.center
	{
	justify-content: center;
}

.apexcharts-legend.position-bottom.right, .apexcharts-legend.position-top.right
	{
	justify-content: flex-end;
}

.apexcharts-legend-series {
	cursor: pointer;
	line-height: normal;
}

.apexcharts-legend.position-bottom .apexcharts-legend-series,
	.apexcharts-legend.position-top .apexcharts-legend-series {
	display: flex;
	align-items: center;
}

.apexcharts-legend-text {
	position: relative;
	font-size: 14px;
}

.apexcharts-legend-text *, .apexcharts-legend-marker * {
	pointer-events: none;
}

.apexcharts-legend-marker {
	position: relative;
	display: inline-block;
	cursor: pointer;
	margin-right: 3px;
}

.apexcharts-legend.right .apexcharts-legend-series, .apexcharts-legend.left .apexcharts-legend-series
	{
	display: inline-block;
}

.apexcharts-legend-series.no-click {
	cursor: auto;
}

.apexcharts-legend .apexcharts-hidden-zero-series, .apexcharts-legend .apexcharts-hidden-null-series
	{
	display: none !important;
}

.inactive-legend {
	opacity: 0.45;
}
</style></foreignObject>
										<g id="SvgjsG1142"
											class="apexcharts-inner apexcharts-graphical"
											transform="translate(160.5, 0)">
										<defs id="SvgjsDefs1141">
										<clipPath id="gridRectMask964n3idk">
										<rect id="SvgjsRect1143" width="281" height="293" x="-1"
											y="-1" rx="0" ry="0" fill="#ffffff" opacity="1"
											stroke-width="0" stroke="none" stroke-dasharray="0"></rect></clipPath>
										<clipPath id="gridRectMarkerMask964n3idk">
										<rect id="SvgjsRect1144" width="281" height="293" x="-1"
											y="-1" rx="0" ry="0" fill="#ffffff" opacity="1"
											stroke-width="0" stroke="none" stroke-dasharray="0"></rect></clipPath>
										<filter id="SvgjsFilter1153" filterUnits="userSpaceOnUse">
										<feFlood id="SvgjsFeFlood1154" flood-color="#000000"
											flood-opacity="0.45" result="SvgjsFeFlood1154Out"
											in="SourceGraphic"></feFlood>
										<feComposite id="SvgjsFeComposite1155"
											in="SvgjsFeFlood1154Out" in2="SourceAlpha" operator="in"
											result="SvgjsFeComposite1155Out"></feComposite>
										<feOffset id="SvgjsFeOffset1156" dx="1" dy="1"
											result="SvgjsFeOffset1156Out" in="SvgjsFeComposite1155Out"></feOffset>
										<feGaussianBlur id="SvgjsFeGaussianBlur1157" stdDeviation="1 "
											result="SvgjsFeGaussianBlur1157Out" in="SvgjsFeOffset1156Out"></feGaussianBlur>
										<feMerge id="SvgjsFeMerge1158" result="SvgjsFeMerge1158Out"
											in="SourceGraphic">
										<feMergeNode id="SvgjsFeMergeNode1159"
											in="SvgjsFeGaussianBlur1157Out"></feMergeNode>
										<feMergeNode id="SvgjsFeMergeNode1160" in="[object Arguments]"></feMergeNode></feMerge>
										<feBlend id="SvgjsFeBlend1161" in="SourceGraphic"
											in2="SvgjsFeMerge1158Out" mode="normal"
											result="SvgjsFeBlend1161Out"></feBlend></filter>
										<filter id="SvgjsFilter1166" filterUnits="userSpaceOnUse">
										<feFlood id="SvgjsFeFlood1167" flood-color="#000000"
											flood-opacity="0.45" result="SvgjsFeFlood1167Out"
											in="SourceGraphic"></feFlood>
										<feComposite id="SvgjsFeComposite1168"
											in="SvgjsFeFlood1167Out" in2="SourceAlpha" operator="in"
											result="SvgjsFeComposite1168Out"></feComposite>
										<feOffset id="SvgjsFeOffset1169" dx="1" dy="1"
											result="SvgjsFeOffset1169Out" in="SvgjsFeComposite1168Out"></feOffset>
										<feGaussianBlur id="SvgjsFeGaussianBlur1170" stdDeviation="1 "
											result="SvgjsFeGaussianBlur1170Out" in="SvgjsFeOffset1169Out"></feGaussianBlur>
										<feMerge id="SvgjsFeMerge1171" result="SvgjsFeMerge1171Out"
											in="SourceGraphic">
										<feMergeNode id="SvgjsFeMergeNode1172"
											in="SvgjsFeGaussianBlur1170Out"></feMergeNode>
										<feMergeNode id="SvgjsFeMergeNode1173" in="[object Arguments]"></feMergeNode></feMerge>
										<feBlend id="SvgjsFeBlend1174" in="SourceGraphic"
											in2="SvgjsFeMerge1171Out" mode="normal"
											result="SvgjsFeBlend1174Out"></feBlend></filter>
										<filter id="SvgjsFilter1179" filterUnits="userSpaceOnUse">
										<feFlood id="SvgjsFeFlood1180" flood-color="#000000"
											flood-opacity="0.45" result="SvgjsFeFlood1180Out"
											in="SourceGraphic"></feFlood>
										<feComposite id="SvgjsFeComposite1181"
											in="SvgjsFeFlood1180Out" in2="SourceAlpha" operator="in"
											result="SvgjsFeComposite1181Out"></feComposite>
										<feOffset id="SvgjsFeOffset1182" dx="1" dy="1"
											result="SvgjsFeOffset1182Out" in="SvgjsFeComposite1181Out"></feOffset>
										<feGaussianBlur id="SvgjsFeGaussianBlur1183" stdDeviation="1 "
											result="SvgjsFeGaussianBlur1183Out" in="SvgjsFeOffset1182Out"></feGaussianBlur>
										<feMerge id="SvgjsFeMerge1184" result="SvgjsFeMerge1184Out"
											in="SourceGraphic">
										<feMergeNode id="SvgjsFeMergeNode1185"
											in="SvgjsFeGaussianBlur1183Out"></feMergeNode>
										<feMergeNode id="SvgjsFeMergeNode1186" in="[object Arguments]"></feMergeNode></feMerge>
										<feBlend id="SvgjsFeBlend1187" in="SourceGraphic"
											in2="SvgjsFeMerge1184Out" mode="normal"
											result="SvgjsFeBlend1187Out"></feBlend></filter>
										<filter id="SvgjsFilter1192" filterUnits="userSpaceOnUse">
										<feFlood id="SvgjsFeFlood1193" flood-color="#000000"
											flood-opacity="0.45" result="SvgjsFeFlood1193Out"
											in="SourceGraphic"></feFlood>
										<feComposite id="SvgjsFeComposite1194"
											in="SvgjsFeFlood1193Out" in2="SourceAlpha" operator="in"
											result="SvgjsFeComposite1194Out"></feComposite>
										<feOffset id="SvgjsFeOffset1195" dx="1" dy="1"
											result="SvgjsFeOffset1195Out" in="SvgjsFeComposite1194Out"></feOffset>
										<feGaussianBlur id="SvgjsFeGaussianBlur1196" stdDeviation="1 "
											result="SvgjsFeGaussianBlur1196Out" in="SvgjsFeOffset1195Out"></feGaussianBlur>
										<feMerge id="SvgjsFeMerge1197" result="SvgjsFeMerge1197Out"
											in="SourceGraphic">
										<feMergeNode id="SvgjsFeMergeNode1198"
											in="SvgjsFeGaussianBlur1196Out"></feMergeNode>
										<feMergeNode id="SvgjsFeMergeNode1199" in="[object Arguments]"></feMergeNode></feMerge>
										<feBlend id="SvgjsFeBlend1200" in="SourceGraphic"
											in2="SvgjsFeMerge1197Out" mode="normal"
											result="SvgjsFeBlend1200Out"></feBlend></filter>
										<filter id="SvgjsFilter1205" filterUnits="userSpaceOnUse">
										<feFlood id="SvgjsFeFlood1206" flood-color="#000000"
											flood-opacity="0.45" result="SvgjsFeFlood1206Out"
											in="SourceGraphic"></feFlood>
										<feComposite id="SvgjsFeComposite1207"
											in="SvgjsFeFlood1206Out" in2="SourceAlpha" operator="in"
											result="SvgjsFeComposite1207Out"></feComposite>
										<feOffset id="SvgjsFeOffset1208" dx="1" dy="1"
											result="SvgjsFeOffset1208Out" in="SvgjsFeComposite1207Out"></feOffset>
										<feGaussianBlur id="SvgjsFeGaussianBlur1209" stdDeviation="1 "
											result="SvgjsFeGaussianBlur1209Out" in="SvgjsFeOffset1208Out"></feGaussianBlur>
										<feMerge id="SvgjsFeMerge1210" result="SvgjsFeMerge1210Out"
											in="SourceGraphic">
										<feMergeNode id="SvgjsFeMergeNode1211"
											in="SvgjsFeGaussianBlur1209Out"></feMergeNode>
										<feMergeNode id="SvgjsFeMergeNode1212" in="[object Arguments]"></feMergeNode></feMerge>
										<feBlend id="SvgjsFeBlend1213" in="SourceGraphic"
											in2="SvgjsFeMerge1210Out" mode="normal"
											result="SvgjsFeBlend1213Out"></feBlend></filter></defs>
										<g id="SvgjsG1146" class="apexcharts-pie"
											data:innerTranslateX="0" data:innerTranslateY="-25">
										<g id="SvgjsG1147" transform="translate(0, -5) scale(1)">
										<g id="SvgjsG1148">
										<g id="apexcharts-series-0"
											class="apexcharts-series apexcharts-pie-series"
											seriesName="TeamxA" rel="1">
										<path id="apexcharts-pie-slice-0"
											d="M 139.5 9.84146341463412 A 147.65853658536588 147.65853658536588 0 0 1 287.15272199753235 156.18961331994836 L 139.5 157.5 L 139.5 9.84146341463412"
											fill="rgba(0,181,184,1)" fill-opacity="1" stroke="#ffffff"
											stroke-opacity="1" stroke-linecap="butt" stroke-width="2"
											stroke-dasharray="0" class="apexcharts-pie-area" index="0"
											j="0" data:angle="89.49152542372882" data:startAngle="0"
											data:strokeWidth="2" data:value="44"
											data:pathOrig="M 139.5 9.84146341463412 A 147.65853658536588 147.65853658536588 0 0 1 287.15272199753235 156.18961331994836 L 139.5 157.5 L 139.5 9.84146341463412"></path></g>
										<g id="apexcharts-series-1"
											class="apexcharts-series apexcharts-pie-series"
											seriesName="TeamxB" rel="2">
										<path id="apexcharts-pie-slice-1"
											d="M 287.15272199753235 156.18961331994836 A 147.65853658536588 147.65853658536588 0 0 1 85.72858237608324 295.01973703162093 L 139.5 157.5 L 287.15272199753235 156.18961331994836"
											fill="rgba(22,211,154,1)" fill-opacity="1" stroke="#ffffff"
											stroke-opacity="1" stroke-linecap="butt" stroke-width="2"
											stroke-dasharray="0" class="apexcharts-pie-area" index="0"
											j="1" data:angle="111.86440677966102"
											data:startAngle="89.49152542372882" data:strokeWidth="2"
											data:value="55"
											data:pathOrig="M 287.15272199753235 156.18961331994836 A 147.65853658536588 147.65853658536588 0 0 1 85.72858237608324 295.01973703162093 L 139.5 157.5 L 287.15272199753235 156.18961331994836"></path></g>
										<g id="apexcharts-series-2"
											class="apexcharts-series apexcharts-pie-series"
											seriesName="TeamxC" rel="3">
										<path id="apexcharts-pie-slice-2"
											d="M 85.72858237608324 295.01973703162093 A 147.65853658536588 147.65853658536588 0 0 1 30.119745776473536 256.6917507282161 L 139.5 157.5 L 85.72858237608324 295.01973703162093"
											fill="rgba(255,168,125,1)" fill-opacity="1" stroke="#ffffff"
											stroke-opacity="1" stroke-linecap="butt" stroke-width="2"
											stroke-dasharray="0" class="apexcharts-pie-area" index="0"
											j="2" data:angle="26.440677966101703"
											data:startAngle="201.35593220338984" data:strokeWidth="2"
											data:value="13"
											data:pathOrig="M 85.72858237608324 295.01973703162093 A 147.65853658536588 147.65853658536588 0 0 1 30.119745776473536 256.6917507282161 L 139.5 157.5 L 85.72858237608324 295.01973703162093"></path></g>
										<g id="apexcharts-series-3"
											class="apexcharts-series apexcharts-pie-series"
											seriesName="TeamxD" rel="4">
										<path id="apexcharts-pie-slice-3"
											d="M 30.119745776473536 256.6917507282161 A 147.65853658536588 147.65853658536588 0 0 1 35.55397158382041 52.62737915435403 L 139.5 157.5 L 30.119745776473536 256.6917507282161"
											fill="rgba(45,206,227,1)" fill-opacity="1" stroke="#ffffff"
											stroke-opacity="1" stroke-linecap="butt" stroke-width="2"
											stroke-dasharray="0" class="apexcharts-pie-area" index="0"
											j="3" data:angle="87.4576271186441"
											data:startAngle="227.79661016949154" data:strokeWidth="2"
											data:value="43"
											data:pathOrig="M 30.119745776473536 256.6917507282161 A 147.65853658536588 147.65853658536588 0 0 1 35.55397158382041 52.62737915435403 L 139.5 157.5 L 30.119745776473536 256.6917507282161"></path></g>
										<g id="apexcharts-series-4"
											class="apexcharts-series apexcharts-pie-series"
											seriesName="TeamxE" rel="5">
										<path id="apexcharts-pie-slice-4"
											d="M 35.55397158382041 52.62737915435403 A 147.65853658536588 147.65853658536588 0 0 1 139.47422872380992 9.841465663602236 L 139.5 157.5 L 35.55397158382041 52.62737915435403"
											fill="rgba(255,117,136,1)" fill-opacity="1" stroke="#ffffff"
											stroke-opacity="1" stroke-linecap="butt" stroke-width="2"
											stroke-dasharray="0" class="apexcharts-pie-area" index="0"
											j="4" data:angle="44.745762711864415"
											data:startAngle="315.25423728813564" data:strokeWidth="2"
											data:value="22"
											data:pathOrig="M 35.55397158382041 52.62737915435403 A 147.65853658536588 147.65853658536588 0 0 1 139.47422872380992 9.841465663602236 L 139.5 157.5 L 35.55397158382041 52.62737915435403"></path></g>
										<text id="SvgjsText1151"
											font-family="Helvetica, Arial, sans-serif"
											x="222.65682273294374" y="73.60190332348326"
											text-anchor="middle" dominant-baseline="auto"
											font-size="12px" fill="#ffffff"
											filter="url(#SvgjsFilter1153)" class="apexcharts-pie-label"
											style="font-family: Helvetica, Arial, sans-serif;">24.9%</text>
										<text id="SvgjsText1164"
											font-family="Helvetica, Arial, sans-serif"
											x="206.53730610421604" y="254.76226083774742"
											text-anchor="middle" dominant-baseline="auto"
											font-size="12px" fill="#ffffff"
											filter="url(#SvgjsFilter1166)" class="apexcharts-pie-label"
											style="font-family: Helvetica, Arial, sans-serif;">31.1%</text>
										<text id="SvgjsText1177"
											font-family="Helvetica, Arial, sans-serif"
											x="72.4626938957839" y="254.76226083774736"
											text-anchor="middle" dominant-baseline="auto"
											font-size="12px" fill="#ffffff"
											filter="url(#SvgjsFilter1179)" class="apexcharts-pie-label"
											style="font-family: Helvetica, Arial, sans-serif;">7.3%</text>
										<text id="SvgjsText1190"
											font-family="Helvetica, Arial, sans-serif"
											x="21.41503356602179" y="154.35540220908695"
											text-anchor="middle" dominant-baseline="auto"
											font-size="12px" fill="#ffffff"
											filter="url(#SvgjsFilter1192)" class="apexcharts-pie-label"
											style="font-family: Helvetica, Arial, sans-serif;">24.3%</text>
										<text id="SvgjsText1203"
											font-family="Helvetica, Arial, sans-serif"
											x="94.53706164551333" y="48.26501491046467"
											text-anchor="middle" dominant-baseline="auto"
											font-size="12px" fill="#ffffff"
											filter="url(#SvgjsFilter1205)" class="apexcharts-pie-label"
											style="font-family: Helvetica, Arial, sans-serif;">12.4%</text></g></g></g>
										<line id="SvgjsLine1214" x1="0" y1="0" x2="279" y2="0"
											stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1"
											class="apexcharts-ycrosshairs"></line>
										<line id="SvgjsLine1215" x1="0" y1="0" x2="279" y2="0"
											stroke-dasharray="0" stroke-width="0"
											class="apexcharts-ycrosshairs-hidden"></line></g></svg>
									<div class="apexcharts-tooltip dark">
										<div class="apexcharts-tooltip-series-group">
											<span class="apexcharts-tooltip-marker"
												style="background-color: rgb(0, 143, 251);"></span>
											<div class="apexcharts-tooltip-text"
												style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
												<div class="apexcharts-tooltip-y-group">
													<span class="apexcharts-tooltip-text-label"></span><span
														class="apexcharts-tooltip-text-value"></span>
												</div>
												<div class="apexcharts-tooltip-z-group">
													<span class="apexcharts-tooltip-text-z-label"></span><span
														class="apexcharts-tooltip-text-z-value"></span>
												</div>
											</div>
										</div>
										<div class="apexcharts-tooltip-series-group">
											<span class="apexcharts-tooltip-marker"
												style="background-color: rgb(0, 227, 150);"></span>
											<div class="apexcharts-tooltip-text"
												style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
												<div class="apexcharts-tooltip-y-group">
													<span class="apexcharts-tooltip-text-label"></span><span
														class="apexcharts-tooltip-text-value"></span>
												</div>
												<div class="apexcharts-tooltip-z-group">
													<span class="apexcharts-tooltip-text-z-label"></span><span
														class="apexcharts-tooltip-text-z-value"></span>
												</div>
											</div>
										</div>
										<div class="apexcharts-tooltip-series-group">
											<span class="apexcharts-tooltip-marker"
												style="background-color: rgb(254, 176, 25);"></span>
											<div class="apexcharts-tooltip-text"
												style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
												<div class="apexcharts-tooltip-y-group">
													<span class="apexcharts-tooltip-text-label"></span><span
														class="apexcharts-tooltip-text-value"></span>
												</div>
												<div class="apexcharts-tooltip-z-group">
													<span class="apexcharts-tooltip-text-z-label"></span><span
														class="apexcharts-tooltip-text-z-value"></span>
												</div>
											</div>
										</div>
										<div class="apexcharts-tooltip-series-group">
											<span class="apexcharts-tooltip-marker"
												style="background-color: rgb(255, 69, 96);"></span>
											<div class="apexcharts-tooltip-text"
												style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
												<div class="apexcharts-tooltip-y-group">
													<span class="apexcharts-tooltip-text-label"></span><span
														class="apexcharts-tooltip-text-value"></span>
												</div>
												<div class="apexcharts-tooltip-z-group">
													<span class="apexcharts-tooltip-text-z-label"></span><span
														class="apexcharts-tooltip-text-z-value"></span>
												</div>
											</div>
										</div>
										<div class="apexcharts-tooltip-series-group">
											<span class="apexcharts-tooltip-marker"
												style="background-color: rgb(119, 93, 208);"></span>
											<div class="apexcharts-tooltip-text"
												style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
												<div class="apexcharts-tooltip-y-group">
													<span class="apexcharts-tooltip-text-label"></span><span
														class="apexcharts-tooltip-text-value"></span>
												</div>
												<div class="apexcharts-tooltip-z-group">
													<span class="apexcharts-tooltip-text-z-label"></span><span
														class="apexcharts-tooltip-text-z-value"></span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="resize-triggers">
								<div class="expand-trigger">
									<div style="width: 641px; height: 443px;"></div>
								</div>
								<div class="contract-trigger"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ Task Progress -->
			<!-- Bug Progress -->
			<div class="col-xl-6 col-lg-12 col-md-12">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">Bug Progress</h4>
						<a class="heading-elements-toggle"><i
							class="fa fa-ellipsis-v font-medium-3"></i></a>
						<div class="heading-elements">
							<ul class="list-inline mb-0">
								<li><a data-action="reload"><i
										class="feather icon-rotate-cw"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="card-content">
						<div class="card-body" style="position: relative;">
							<div id="bug-pie-chart" class="height-400"
								style="min-height: 350px;">
								<div id="apexcharts4y2qgmjll"
									class="apexcharts-canvas apexcharts4y2qgmjll light"
									style="width: 598px; height: 350px;">
									<svg id="SvgjsSvg1218" width="598" height="350"
										xmlns="http://www.w3.org/2000/svg" version="1.1"
										xmlns:xlink="http://www.w3.org/1999/xlink"
										xmlns:svgjs="http://svgjs.com/svgjs" class="apexcharts-svg"
										xmlns:data="ApexChartsNS" transform="translate(0, 0)"
										style="background: transparent;">
										<g id="SvgjsG1220"
											class="apexcharts-inner apexcharts-graphical"
											transform="translate(153.5, 0)">
										<defs id="SvgjsDefs1219">
										<clipPath id="gridRectMask4y2qgmjll">
										<rect id="SvgjsRect1221" width="295" height="317" x="-1"
											y="-1" rx="0" ry="0" fill="#ffffff" opacity="1"
											stroke-width="0" stroke="none" stroke-dasharray="0"></rect></clipPath>
										<clipPath id="gridRectMarkerMask4y2qgmjll">
										<rect id="SvgjsRect1222" width="295" height="317" x="-1"
											y="-1" rx="0" ry="0" fill="#ffffff" opacity="1"
											stroke-width="0" stroke="none" stroke-dasharray="0"></rect></clipPath></defs>
										<g id="SvgjsG1224" class="apexcharts-radialbar">
										<g id="SvgjsG1225">
										<g id="SvgjsG1226">
										<g id="apexcharts-track-0"
											class="apexcharts-radialbar-track apexcharts-track" rel="1">
										<path id="apexcharts-radialbarTrack-0"
											d="M 146.5 29.490243902439005 A 128.009756097561 128.009756097561 0 1 1 146.47765808292763 29.490245852139083"
											fill="none" fill-opacity="1" stroke="rgba(242,242,242,0.85)"
											stroke-opacity="1" stroke-linecap="butt"
											stroke-width="9.47287804878049" stroke-dasharray="0"
											class="apexcharts-radialbar-area"
											data:pathOrig="M 146.5 29.490243902439005 A 128.009756097561 128.009756097561 0 1 1 146.47765808292763 29.490245852139083"></path></g>
										<g id="apexcharts-track-1"
											class="apexcharts-radialbar-track apexcharts-track" rel="2">
										<path id="apexcharts-radialbarTrack-1"
											d="M 146.5 44.25609756097559 A 113.24390243902441 113.24390243902441 0 1 1 146.48023521054665 44.256099285778845"
											fill="none" fill-opacity="1" stroke="rgba(242,242,242,0.85)"
											stroke-opacity="1" stroke-linecap="butt"
											stroke-width="9.47287804878049" stroke-dasharray="0"
											class="apexcharts-radialbar-area"
											data:pathOrig="M 146.5 44.25609756097559 A 113.24390243902441 113.24390243902441 0 1 1 146.48023521054665 44.256099285778845"></path></g>
										<g id="apexcharts-track-2"
											class="apexcharts-radialbar-track apexcharts-track" rel="3">
										<path id="apexcharts-radialbarTrack-2"
											d="M 146.5 59.021951219512175 A 98.47804878048782 98.47804878048782 0 1 1 146.48281233816564 59.02195271941862"
											fill="none" fill-opacity="1" stroke="rgba(242,242,242,0.85)"
											stroke-opacity="1" stroke-linecap="butt"
											stroke-width="9.47287804878049" stroke-dasharray="0"
											class="apexcharts-radialbar-area"
											data:pathOrig="M 146.5 59.021951219512175 A 98.47804878048782 98.47804878048782 0 1 1 146.48281233816564 59.02195271941862"></path></g>
										<g id="apexcharts-track-3"
											class="apexcharts-radialbar-track apexcharts-track" rel="4">
										<path id="apexcharts-radialbarTrack-3"
											d="M 146.5 73.78780487804876 A 83.71219512195124 83.71219512195124 0 1 1 146.48538946578466 73.7878061530584"
											fill="none" fill-opacity="1" stroke="rgba(242,242,242,0.85)"
											stroke-opacity="1" stroke-linecap="butt"
											stroke-width="9.47287804878049" stroke-dasharray="0"
											class="apexcharts-radialbar-area"
											data:pathOrig="M 146.5 73.78780487804876 A 83.71219512195124 83.71219512195124 0 1 1 146.48538946578466 73.7878061530584"></path></g></g>
										<g id="SvgjsG1235">
										<g id="apexcharts-series-0"
											class="apexcharts-series apexcharts-radial-series"
											seriesName="Critical" rel="1">
										<path id="apexcharts-radialbar-slice-0"
											d="M 146.5 29.490243902439005 A 128.009756097561 128.009756097561 0 1 1 64.21691486149184 59.438837676447704"
											fill="none" fill-opacity="0.85" stroke="rgba(0,181,184,0.85)"
											stroke-opacity="1" stroke-linecap="butt"
											stroke-width="9.765853658536589" stroke-dasharray="0"
											class="apexcharts-radialbar-area" data:angle="320"
											data:value="89" index="0" j="0"
											data:pathOrig="M 146.5 29.490243902439005 A 128.009756097561 128.009756097561 0 1 1 64.21691486149184 59.438837676447704"></path></g>
										<g id="apexcharts-series-1"
											class="apexcharts-series apexcharts-radial-series"
											seriesName="High" rel="2">
										<path id="apexcharts-radialbar-slice-1"
											d="M 146.5 44.25609756097559 A 113.24390243902441 113.24390243902441 0 1 1 35.33670700615842 135.8920447430903"
											fill="none" fill-opacity="0.85"
											stroke="rgba(22,211,154,0.85)" stroke-opacity="1"
											stroke-linecap="butt" stroke-width="9.765853658536589"
											stroke-dasharray="0" class="apexcharts-radialbar-area"
											data:angle="281" data:value="78" index="0" j="1"
											data:pathOrig="M 146.5 44.25609756097559 A 113.24390243902441 113.24390243902441 0 1 1 35.33670700615842 135.8920447430903"></path></g>
										<g id="apexcharts-series-2"
											class="apexcharts-series apexcharts-radial-series"
											seriesName="Medium" rel="3">
										<path id="apexcharts-radialbar-slice-2"
											d="M 146.5 59.021951219512175 A 98.47804878048782 98.47804878048782 0 1 1 60.369157815950615 205.24310543186857"
											fill="none" fill-opacity="0.85"
											stroke="rgba(255,168,125,0.85)" stroke-opacity="1"
											stroke-linecap="butt" stroke-width="9.765853658536589"
											stroke-dasharray="0" class="apexcharts-radialbar-area"
											data:angle="241" data:value="67" index="0" j="2"
											data:pathOrig="M 146.5 59.021951219512175 A 98.47804878048782 98.47804878048782 0 1 1 60.369157815950615 205.24310543186857"></path></g>
										<g id="apexcharts-series-3"
											class="apexcharts-series apexcharts-radial-series"
											seriesName="Low" rel="4">
										<path id="apexcharts-radialbar-slice-3"
											d="M 146.5 73.78780487804876 A 83.71219512195124 83.71219512195124 0 0 1 177.85914024200227 235.11659574741776"
											fill="none" fill-opacity="0.85"
											stroke="rgba(45,206,227,0.85)" stroke-opacity="1"
											stroke-linecap="butt" stroke-width="9.765853658536589"
											stroke-dasharray="0" class="apexcharts-radialbar-area"
											data:angle="158" data:value="44" index="0" j="3"
											data:pathOrig="M 146.5 73.78780487804876 A 83.71219512195124 83.71219512195124 0 0 1 177.85914024200227 235.11659574741776"></path></g>
										<circle id="SvgjsCircle1236" r="73.97575609756099" cx="146.5"
											cy="157.5" class="apexcharts-radialbar-hollow"
											fill="transparent"></circle>
										<g id="SvgjsG1237" class="apexcharts-datalabels-group"
											transform="translate(0, 0)" style="opacity: 1;">
										<text id="SvgjsText1238"
											font-family="Helvetica, Arial, sans-serif" x="146.5"
											y="157.5" text-anchor="middle" dominant-baseline="auto"
											font-size="22px" fill="#373d3f"
											class="apexcharts-datalabel-label"
											style="font-family: Helvetica, Arial, sans-serif;">Total</text>
										<text id="SvgjsText1239"
											font-family="Helvetica, Arial, sans-serif" x="146.5"
											y="189.5" text-anchor="middle" dominant-baseline="auto"
											font-size="16px" fill="#373d3f"
											class="apexcharts-datalabel-value"
											style="font-family: Helvetica, Arial, sans-serif;">249</text></g></g></g></g>
										<line id="SvgjsLine1248" x1="0" y1="0" x2="293" y2="0"
											stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1"
											class="apexcharts-ycrosshairs"></line>
										<line id="SvgjsLine1249" x1="0" y1="0" x2="293" y2="0"
											stroke-dasharray="0" stroke-width="0"
											class="apexcharts-ycrosshairs-hidden"></line></g></svg>
									<div class="apexcharts-legend"></div>
								</div>
							</div>
							<div class="resize-triggers">
								<div class="expand-trigger">
									<div style="width: 641px; height: 443px;"></div>
								</div>
								<div class="contract-trigger"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ Bug Progress -->
		</section>
	</div>
</div>
<div class="sidebar-detached sidebar-right">
	<div class="sidebar">
		<div class="project-sidebar-content">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">Project Details</h4>
					<a class="heading-elements-toggle"><i
						class="fa fa-ellipsis-v font-medium-3"></i></a>
					<div class="heading-elements">
						<ul class="list-inline mb-0">
							<li><a data-action="collapse"><i
									class="feather icon-minus"></i></a></li>
							<li><a data-action="reload"><i
									class="feather icon-rotate-cw"></i></a></li>
							<li><a data-action="close"><i class="feather icon-x"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="card-content collapse show">
					<!-- project search -->
					<div class="card-body border-top-blue-grey border-top-lighten-5">
						<div class="project-search">
							<div class="project-search-content">
								<form action="#">
									<div class="position-relative">
										<input type="search" class="form-control"
											placeholder="Search project task, bug, users...">
										<div class="form-control-position">
											<i class="fa fa-search text-size-base text-muted"></i>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- /project search -->

					<!-- project progress -->
					<div class="card-body">
						<div class="insights">
							<p>
								Project Overall Progress <span
									class="float-right text-warning h3">72%</span>
							</p>
							<div class="progress progress-sm mt-1 mb-0">
								<div class="progress-bar bg-warning" role="progressbar"
									style="width: 72%" aria-valuenow="25" aria-valuemin="0"
									aria-valuemax="100"></div>
							</div>
						</div>
					</div>
					<!-- project progress -->
				</div>
			</div>
			<!-- Project Overview -->
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">Project Overview</h4>
					<a class="heading-elements-toggle"><i
						class="fa fa-ellipsis-v font-medium-3"></i></a>
					<div class="heading-elements">
						<ul class="list-inline mb-0">
							<li><a data-action="collapse"><i
									class="feather icon-minus"></i></a></li>
							<li><a data-action="close"><i class="feather icon-x"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="card-content collapse show">
					<div class="card-body">
						<p>
							<strong>Pellentesque habitant morbi tristique</strong> senectus
							et netus et malesuada fames ac turpis egestas. Vestibulum tortor
							quam, feugiat vitae. <em>Aenean ultricies mi vitae est.</em>
							Mauris placerat eleifend leo. Quisque sit amet est et sapien
							ullamcorper pharetra. Vestibulum erat wisi, condimentum sed,
							<code>commodo vitae</code>
							, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt
							condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim
							ac dui. <a href="#">Donec non enim</a>.
						</p>
						<p>
							<strong>Lorem ipsum dolor sit</strong>
						</p>
						<ol>
							<li>Consectetuer adipiscing</li>
							<li>Aliquam tincidunt mauris</li>
							<li>Consectetur adipiscing</li>
							<li>Vivamus pretium ornare</li>
							<li>Curabitur massa</li>
						</ol>
					</div>
				</div>
			</div>
			<!--/ Project Overview -->
			<!-- Project Users -->
			<div class="card">
				<div class="card-header mb-0">
					<h4 class="card-title">Project Users</h4>
					<a class="heading-elements-toggle"><i
						class="fa fa-ellipsis-v font-medium-3"></i></a>
					<div class="heading-elements">
						<ul class="list-inline mb-0">
							<li><a data-action="collapse"><i
									class="feather icon-minus"></i></a></li>
							<li><a data-action="reload"><i
									class="feather icon-rotate-cw"></i></a></li>
							<li><a data-action="close"><i class="feather icon-x"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="card-content collapse show">
					<div class="card-content">
						<div class="card-body  py-0 px-0">
							<div class="list-group">
								<a href="javascript:void(0)" class="list-group-item">
									<div class="media">
										<div class="media-left pr-1">
											<span class="avatar avatar-sm avatar-online rounded-circle"><img
												src="../../../app-assets/images/portrait/small/avatar-s-1.png"
												alt="avatar"><i></i></span>
										</div>
										<div class="media-body w-100">
											<h6 class="media-heading mb-0">Margaret Govan</h6>
											<p class="font-small-2 mb-0 text-muted">Project Owner</p>
										</div>
									</div>
								</a> <a href="javascript:void(0)" class="list-group-item">
									<div class="media">
										<div class="media-left pr-1">
											<span class="avatar avatar-sm avatar-busy rounded-circle"><img
												src="../../../app-assets/images/portrait/small/avatar-s-2.png"
												alt="avatar"><i></i></span>
										</div>
										<div class="media-body w-100">
											<h6 class="media-heading mb-0">Bret Lezama</h6>
											<p class="font-small-2 mb-0 text-muted">Project Manager</p>
										</div>
									</div>
								</a> <a href="javascript:void(0)" class="list-group-item">
									<div class="media">
										<div class="media-left pr-1">
											<span class="avatar avatar-sm avatar-online rounded-circle"><img
												src="../../../app-assets/images/portrait/small/avatar-s-3.png"
												alt="avatar"><i></i></span>
										</div>
										<div class="media-body w-100">
											<h6 class="media-heading mb-0">Carie Berra</h6>
											<p class="font-small-2 mb-0 text-muted">Senior Developer</p>
										</div>
									</div>
								</a> <a href="javascript:void(0)" class="list-group-item">
									<div class="media">
										<div class="media-left pr-1">
											<span class="avatar avatar-sm avatar-away rounded-circle"><img
												src="../../../app-assets/images/portrait/small/avatar-s-6.png"
												alt="avatar"><i></i></span>
										</div>
										<div class="media-body w-100">
											<h6 class="media-heading mb-0">Eric Alsobrook</h6>
											<p class="font-small-2 mb-0 text-muted">UI Developer</p>
										</div>
									</div>
								</a> <a href="javascript:void(0)" class="list-group-item">
									<div class="media">
										<div class="media-left pr-1">
											<span class="avatar avatar-sm avatar-busy rounded-circle"><img
												src="../../../app-assets/images/portrait/small/avatar-s-7.png"
												alt="avatar"><i></i></span>
										</div>
										<div class="media-body w-100">
											<h6 class="media-heading mb-0">Berra Eric</h6>
											<p class="font-small-2 mb-0 text-muted">UI Developer</p>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ Project Users -->
		</div>

	</div>
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mvo" value="${SPRING_SECURITY_CONTEXT.authentication.principal}"/>
<c:set var="auth" value="${SPRING_SECURITY_CONTEXT.authentication.authorities}"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="/resources/gantt/codebase/dhtmlxgantt.js"></script>
<link rel="stylesheet" href="/resources/gantt/codebase/dhtmlxgantt.css">
<script src="/resources/gantt/samples/common/testdata.js"></script>
<style>
	.weekend{ background: #f4f7f4 !important;}
</style>
</head>

<div style="padding-bottom:15px;">
<span class="fc-daygrid-event-dot" style="background-color: #8299D8; border-color: #8299D8; color: white;">상위 일감</span>
<span class="fc-daygrid-event-dot" style="background-color: #3DB9D3; border-color: #3DB9D3; color: white;">하위 일감</span>
</div>
<div id= "mygantt" class="mygantt" style='width:95%; height:95%;position: absolute;'></div>

<script>
//데이터 형태 id,text= title, duration = 며칠동안인지 ,progress 0.1 = 10% 
// ,"memCode":"${mvo.member.memCode}"

// 테스크 담을 오브젝트
let taskHighObj = new Object();
let taskArr = new Array(); 
let linksArr = new Array(); 

$(function(){
	let projId = "${projId}";
	// console.log(projId);
	var data = {"projId":projId};
	
	$.ajax({
		beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		url: "/proj/" + projId + "/ganttSelectData",
		data: data,
		type: "post",
		dataType: "json",
		contentType:  "application/json;charset=utf-8",
		success: function(resp){
			
			// console.log("resp : ", resp);

			for(let i = 0; i < resp.length; i ++){
				
				let taskObj = new Object();
				taskObj.id = parseInt(resp[i].taskId);
				taskObj.text = resp[i].taskTitle;
				taskObj.start_date = resp[i].taskStrtDate;
				taskObj.end_date = resp[i].taskEndDate;
				// taskObj.start_date = "28-03-2018";

				let linksObj = new Object();
				linksObj.id = i+"";
				linksObj.target = "1";
				
				if(resp[i].highTaskId != null){
					taskObj.parent = resp[i].highTaskId;
					linksObj.source = resp[i].highTaskId;
					linksObj.target = taskObj.id;
				}else{
					taskObj.color = "#8299D8";
					linksObj.source = taskObj.id;
				}
				linksObj.target = taskObj.id;

				linksObj.type = "1";

				// if(i != 0 && resp[i-1].highTaskId != resp[i].highTaskId){
				// 	linksObj.source = i++;
				// }

				// taskObj.duration = "10";
				taskObj.progress = resp[i].taskPgres;
				taskObj.open = true;
				// taskObj.text = resp[i].taskCts;
				taskObj.parent = resp[i].highTaskId;


				taskArr.push(taskObj);
				linksArr.push(linksObj);

				taskHighObj.data = taskArr;
				taskHighObj.links = linksArr;

			}

			gantt.i18n.setLocale("kr");
			gantt.config.readonly = true;
			// 간트 헤더 년월일 추가
			gantt.config.work_time = true;
			gantt.config.scale_height = 90;

			function getWeekOfMonthNumber(date){
				let adjustedDate = date.getDate()+date.getDay();
				let prefixes = ['0', '1', '2', '3', '4', '5'];
				return (parseInt(prefixes[0 | adjustedDate / 7])+1);
			} 


			gantt.config.scales = [
				{unit: "month", step: 1, format: "%Y년, %F"},
				{unit: "week", step: 1, format: function(date){
						return getWeekOfMonthNumber(date) + "주";
					}},
				{unit: "day", step:1, format: "%j %D"}
			];

			gantt.config.inherit_scale_class = true;
			// gantt.config.work_time = true;  
			
			// 주말 및 일정 표시된 연도 표시
			gantt.templates.scale_cell_class = function (date) {
				if (date.getDay() == 0 || date.getDay() == 6) {
					return "weekend";
				}
			};
			gantt.templates.timeline_cell_class = function (task, date) {
				if (date.getDay() == 0 || date.getDay() == 6) {
					return "weekend";
				}
			};
			
			// 일감 검색
			var filterValue = "";
			gantt.$doFilter = function(value){
				filterValue = value;
				gantt.refreshData();
			}

			gantt.attachEvent("onBeforeTaskDisplay", function (id, task) {
				if (!filterValue) return true;

				var normalizedText = task.text.toLowerCase();
				var normalizedValue = filterValue.toLowerCase();
				return normalizedText.indexOf(normalizedValue) > -1;
			});
			gantt.attachEvent("onGanttRender", function(){
				gantt.$root.querySelector("[data-text-filter]").value = filterValue;
			})

			// 간트 헤더 명 추가, 일감 검색 추가
			// var textEditor = {type: "text", map_to: "text"};
			// var startDateEditor = {type: "date", map_to: "start_date"};
			// var endDateEditor = {type: "end_date", map_to: "end_date"};
			// var durationEditor = {type: "number", map_to: "duration", min:0, max: 100};
			var textFilter = "<div class='searchEl'>일감 명 <input data-text-filter id='search' type='text' placeholder='검색어를 입력하세요.' style='width:150px; height: 30px' oninput='gantt.$doFilter(this.value)'></div>";
			gantt.config.columns = [
				{name:"text", label:textFilter, width:250, tree:true }                        
				// {name: "text", label: "일감명", tree: true, width: 300, editor: textEditor, resize: true},
				// {name: "start_date", label: "시작일", width:100, align: "center", editor: startDateEditor, resize: true},
				// {name: "end_date", label: "종료일", width:100, align: "center", editor: endDateEditor, resize: true}
			];
					
			// 클릭 시 정보창
			// 수직 마커
			gantt.plugins({
				quick_info: true,
				marker: true 
			});

			// 수직 마커 설정
			var dateToStr = gantt.date.date_to_str(gantt.config.task_date);
 
			var id = gantt.addMarker({ 
				start_date: new Date(), 
				css: "today", 
				text: "오늘", 
				title:dateToStr(new Date())
			});
			setInterval(function(){
				var today = gantt.getMarker(id);
				today.start_date = new Date();
				today.title = date_to_str(today.start_date);
				gantt.updateMarker(id);
			}, 1000*60);


			console.log("taskHighObj : ", taskHighObj);
			console.log("demo_tasks2 : ", demo_tasks2);
			gantt.init("mygantt");
			gantt.parse(taskHighObj);
		}
	});
});


// function dataRander(resp){
// }

// data 정보
// 일감 아이디(id), 일감 제목(text), 일감 시작 날짜(start_date), 기간(duration), 상위 일감 아이디(parent), 진척도(progress), 게시 여부(open)
// links정보
// 링크 ID(id), 종속성이 시작될 작업의 ID(source),  종속성이 끝나는 작업의 ID(target), 종속성 유형(type) "0" - '완료_시작', "1" - '시작_시작', "2" - '완료_완료', "3" - '시작_종료'
var demo_tasks2 = {
		"data":[
			{"id":11, "text":"최상위 일감", "start_date":"28-03-2018", "duration":"11", "progress": 1, "open": true},
				{"id":12, "text":"Task #1", "start_date":"03-04-2018", "duration":"5", "parent":"11", "progress": 1, "open": true},
				{"id":13, "text":"Task #2", "start_date":"02-04-2018", "duration":"7", "parent":"11", "progress": 0.5, "open": true},
					{"id":17, "text":"Task #2.1", "start_date":"03-04-2018", "duration":"2", "parent":"13", "progress": 1, "open": true},
					{"id":18, "text":"Task #2.2", "start_date":"06-04-2018", "duration":"3", "parent":"13", "progress": 0.8, "open": true},
					{"id":19, "text":"Task #2.3", "start_date":"10-04-2018", "duration":"4", "parent":"13", "progress": 0.2, "open": true},
					{"id":20, "text":"Task #2.4", "start_date":"10-04-2018", "duration":"4", "parent":"13", "progress": 0, "open": true},
				{"id":14, "text":"Task #3", "start_date":"02-04-2018", "duration":"6", "parent":"11", "progress": 0.8, "open": true},
				{"id":15, "text":"Task #4", "start_date":"02-04-2018", "duration":"5", "parent":"11", "progress": 0.2, "open": true},
					{"id":21, "text":"Task #4.1", "start_date":"03-04-2018", "duration":"4", "parent":"15", "progress": 0.5, "open": true},
					{"id":22, "text":"Task #4.2", "start_date":"03-04-2018", "duration":"4", "parent":"15", "progress": 0.1, "open": true},
					{"id":23, "text":"Task #4.3", "start_date":"03-04-2018", "duration":"5", "parent":"15", "progress": 0, "open": true},
				{"id":16, "text":"Task #5", "start_date":"02-04-2018", "duration":"7", "parent":"11", "progress": 0, "open": true},

			{"id":1, "text":"Project #2", "start_date":"01-04-2018", "duration":"18", "progress": 0.4, "open": true},
				{"id":2, "text":"Task #1", "start_date":"02-04-2018", "duration":"8", "parent":"1", "progress":0.5, "open": true},
					{"id":5, "text":"Task #1.1", "start_date":"02-04-2018", "duration":"7", "parent":"2", "progress": 0.6, "open": true},	
					{"id":6, "text":"Task #1.2", "start_date":"03-04-2018", "duration":"7", "parent":"2", "progress": 0.6, "open": true},
				{"id":3, "text":"Task #2", "start_date":"11-04-2018", "duration":"8", "parent":"1", "progress": 0.6, "open": true},
					{"id":7, "text":"Task #2.1", "start_date":"11-04-2018", "duration":"8", "parent":"3", "progress": 0.6, "open": true},
				{"id":4, "text":"Task #3", "start_date":"13-04-2018", "duration":"6", "parent":"1", "progress": 0.5, "open": true},
					{"id":8, "text":"Task #3.1", "start_date":"14-04-2018", "duration":"5", "parent":"4", "progress": 0.5, "open": true},
					{"id":9, "text":"Task #3.2", "start_date":"14-04-2018", "duration":"4", "parent":"4", "progress": 0.5, "open": true},
					{"id":10, "text":"Task #3.3", "start_date":"14-04-2018", "duration":"3", "parent":"4", "progress": 0.5, "open": true}
			
			
		],
		"links":[
			{"id":"1","source":"1","target":"2","type":"1"},
			{"id":"2","source":"2","target":"3","type":"0"},
			{"id":"3","source":"3","target":"4","type":"0"},
			{"id":"4","source":"2","target":"5","type":"2"},
			{"id":"5","source":"2","target":"6","type":"2"},
			{"id":"6","source":"3","target":"7","type":"2"},
			{"id":"7","source":"4","target":"8","type":"2"},
			{"id":"8","source":"4","target":"9","type":"2"}, 
			{"id":"9","source":"4","target":"10","type":"2"},
			{"id":"10","source":"11","target":"12","type":"1"},
			{"id":"11","source":"11","target":"13","type":"1"},
			{"id":"12","source":"11","target":"14","type":"1"},
			{"id":"13","source":"11","target":"15","type":"1"},
			{"id":"14","source":"11","target":"16","type":"1"},
			{"id":"15","source":"13","target":"17","type":"1"},
			{"id":"16","source":"17","target":"18","type":"0"},
			{"id":"17","source":"18","target":"19","type":"0"},
			{"id":"18","source":"19","target":"20","type":"0"},
			{"id":"19","source":"15","target":"21","type":"2"},
			{"id":"20","source":"15","target":"22","type":"2"},
			{"id":"21","source":"15","target":"23","type":"2"}
		]
	};

	
	
	
</script>
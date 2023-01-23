<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
<link href="/resources/fullcalendar/lib/main.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/join.css">
<script src="/resources/fullcalendar/lib/main.js"></script>
<script src="/resources/fullcalendar/lib/locales/ko.js"></script>
<head>
<style>
input[type="text"]:disabled {
	background-color: #E6F7FF;
}

textarea:disabled {
	background-color: E6F7FF;
}

/*month/week/day*/
  .fc-button-active{
	border-color: #02b5b8 		!important;
	background-color: #02b5b8 	!important;
	color: #000 				!important;
	font-weight: bold 			!important;
}

.fc-day-today {
    background: #FFF0F5 !important;
    border: none !important;
} 

.popover-content {
	text-size:15px;
}
</style>

<script>
var today = new Date();
var month = today.getMonth() + 1;	//getMonth()는 9월이 8으로 나옴
var date = today.getDate();
var g_arg;	//이벤트 글로벌 변수(모달창에서 호출하는 함수에서 참조하기 위함)
var calendar;	//달력 변수
var todayStr = today.getFullYear() + '-' + stringFormat(month) + '-' + stringFormat(date);

// stringFormat date.getMonth() 또는 getDate()가 한 자리 수라면 0 추가
function stringFormat(p_val){
	if(p_val < 10)
		return p_val = '0' + p_val;
	else
		return p_val;
}

	document.addEventListener("DOMContentLoaded", function() {
		var calendarEl = document.querySelector("#calendar");

		calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			locale : 'ko',
			slotMinTime : '06:00',
			slotMaxTime : '23:00',
			initialDate : todayStr,
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : function(arg) {
				modalOpen(arg); //일자 클릭 시 모달 호출
			},
			eventClick : function(arg) {
				modalOpen(arg); //이벤트 클릭 시 모달 호출
			},
			eventChange : function(arg) {
				//allDay true로 바꾸면 end가 없어서 만듦
				if (arg.event.end == null) {
					var end = new Date();
					end.setDate(arg.event.start.getDate()+1);
					arg.event.setEnd(end);
				}
			},
			eventDrop : function(arg) {
				modalOpen(arg); //이벤트 드래그드랍 시 모달 호출
			},
			eventResize : function(arg) {
				modalOpen(arg); //이벤트 사이즈 변경시(일정변경) 모달 호출
			},
			
			editable : false,
			
			dayMaxEvents : true, // allow "more" link when too many events
			
			displayEventTime: true,	// 시간 안 뜨게
			
			events : loadEvent() // 데이터 형식을 맞추짜앙!!!!

		});
		calendar.render();
	});
	
	
	// 띄우기 - 일정 리스트 
	function loadEvent(){
		
// 		console.log("왔다");
		
		  let arr = [];
		  
	   	  $.ajax({
	   		  type:"post",
	   		  url :"/proj/${projId}/calList",
	   		  data:"{}",
	   		  dataType: "json",
	   		  contentType: "application/json; charset=utf-8",
	   		  async: false,
	   		  beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			  },
	   		  success:function(list){
	   			  
				for(var i=0;i<list.length;i++){
	   				  arr.push({
	   					writer:list[i]['writer'],				// 작성자(회원코드)
	   					indvSchdNum:list[i]['indvSchdNum'],		// 일정 번호
	   					title:list[i]['indvSchdTitle'],			// 제목
	   					start:list[i]['indvSchdStrtDate'],		// 시작일
	   					end:list[i]['indvSchdEndDate'],			// 종료일
	   					indvSchdCts:list[i]['indvSchdCts'],		// 내용
	   					color: '#02b5b8'
		   			  	});//end arr
		   			  	
		   			  	
	   			  }//end for
	   			console.log("arr : " ,JSON.stringify(arr));
	   			  
	   		  } // success end
	   	  }) // ajax end
	   	  
	  	let arrT = loadEvent2();
	  	let arrT2 = loadEvent3();
	   	  
	   	return [...arr,...arrT,...arrT2];	// **spread operator(펼침 연산자!) ... 배열을 합쳐줍니당
	}
	
	// 띄우기 - 일감(task) 리스트
	function loadEvent2() {
		
// 		console.log("일감 왔다");
		
		  let arr2 = [];
 			
			  $.ajax({
				 type:"post",
				 url: "/proj/${projId}/calList2",
				 data:"{}",
				 dataType: "json",
				 contentType: "applecation/json; charset=utf-8",
				 async: false,
			 beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		  	},
		  	success:function(list){
		  		
		  		let changeC="";
		  		let changeF="";
		  		
		  		for(var j=0;j<list.length;j++){
		  			
		  			// 상위/하위 일감 컬러 구분
		  			if(list[j]['highTaskId']==null) {
		  				changeC = '#8299D8'
		  				changeF = '#FFFFFF';
		  			} else {
		  				changeC = '#CFE4F2'
		  				changeF = '#135C94';
		  			}
		  			
		  			arr2.push({
		  				taskId:list[j]['taskId'],
		  				highTaskId:list[j]['highTaskId'],
		  				title:list[j]['taskTitle'],
		  				taskCts:list[j]['taskCts'],
		  				start:list[j]['taskStrtDate'],
		  				end:list[j]['taskEndDate'],
		  				taskPgres:list[j]['taskPgres'],
		  				color: changeC,
		  				textColor: changeF
		  			})
		  		}
		  		
		  		console.log("arr2 : " ,JSON.stringify(arr2));
		  	}
		});
			  
		return arr2;
	}

	// 띄우기 - 모든 상위 일감(task) 리스트
	function loadEvent3() {
		
// 		console.log("상위 일감");
		
		  let arr3 = [];
 			
			  $.ajax({
				 type:"post",
				 url: "/proj/${projId}/calList3",
				 data:"{}",
				 dataType: "json",
				 contentType: "applecation/json; charset=utf-8",
				 async: false,
			 beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		  	},
		  	success:function(list){
		  		
		  		let changeC="";
		  		let changeF="";
		  		
		  		for(var j=0;j<list.length;j++){
		  			
		  			// 상위/하위 일감 컬러 구분
		  			if(list[j]['highTaskId']==null) {
		  				changeC = '#8299D8'
		  				changeF = '#FFFFFF';
		  			} else {
		  				changeC = '#CFE4F2'
		  				changeF = '#135C94';
		  			}
		  			
		  			arr3.push({
		  				taskId:list[j]['taskId'],
		  				highTaskId:list[j]['highTaskId'],
		  				title:list[j]['taskTitle'],
		  				taskCts:list[j]['taskCts'],
		  				start:list[j]['taskStrtDate'],
		  				end:list[j]['taskEndDate'],
		  				taskPgres:list[j]['taskPgres'],
		  				color: changeC,
		  				textColor: changeF
		  			})
		  		}
		  		
		  		console.log("arr3 : " ,JSON.stringify(arr3));
		  	}
		});
			  
		return arr3;
	}
</script>
</head>
<body>
		<div>
			<button type="button" style="padding-bottom:30px; outline:none;" data-toggle="popover" data-placement="right" data-container="body" 
			data-original-title="캘린더 이용 안내" data-content="개인의 프로젝트 상·하위 일감 및 일정을 확인할 수 있습니다. 프로젝트 일감은 조회만 가능합니다. 개인 일정은 시간 관리가 가능하며, 클릭 또는 드래그하여 날짜를 선택할 수 있습니다.">
			<i class="fa fa-question-circle"></i></button>
			<span class="fc-daygrid-event-dot" style="background-color: #8299D8; border-color: #8299D8; color: white;">상위 일감</span>
			<span class="fc-daygrid-event-dot" style="background-color: #CFE4F2; border-color: #CFE4F2; color: #135C94">하위 일감</span>
			<span class="fc-daygrid-event-dot" style="background-color: rgb(2, 181, 184); border-color: rgb(2, 181, 184); color: white;">개인 일정</span>
		</div>
	<div class="row" id="calendar"
		style="width: 1000px; margin: auto; background-color: white;"></div>

	<!-- 일정 등록 모달 창 시작 -->
	<!-- insertModal -->
	<div class="modal fade insertModal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" id="modalTitle" style="font-family: 'MICEGothic Bold';">일정 등록</h4>
					<button type="button" class="close"
						onclick="initModal('insertModal', g_arg)">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="form-group" id="mTitle">
						<label for="indvSchdTitle">일정 제목</label> <input type="text"
						class="form-control" placeholder="제목을 입력하세요." id="indvSchdTitle" name="indvSchdTitle">
					</div>
					<div class="row">
					<div class="col-3">
						<div class="form-group mDt" style="width:110px;">
							<label for="indvSchdStrtDate">시작 일자</label>
							<input type="text" class="form-control" id="indvDt" name="indvDt" value="" disabled>
						</div>
					</div>
					<div class="col-3">
					<div class="form-group mStart">
						<label for="indvSchdStrtDate">시작 시간</label>
						<select class="form-control" id="indvSchdStrtDate" onchange="startChange()">
							<option value="06:00">06:00</option>
							<option value="06:30">06:30</option>
							<option value="07:00">07:00</option>
							<option value="07:30">07:30</option>
							<option value="08:00">08:00</option>
							<option value="08:30">08:30</option>
							<option value="09:00">09:00</option>
							<option value="09:30">09:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00">18:00</option>
							<option value="18:30">18:30</option>
							<option value="19:00">19:00</option>
							<option value="19:30">19:30</option>
							<option value="20:00">20:00</option>
							<option value="20:30">20:30</option>
							<option value="21:00">21:00</option>
							<option value="21:30">21:30</option>
							<option value="22:00">22:00</option>
							<option value="22:30">22:30</option>
							<option value="23:00">23:00</option>
							<option value="23:30">23:30</option>
						</select>
					</div>
					</div>
					<div class="col-3">
					<div class="form-group mDt2" style="width:110px;">
						<label for="indvSchdEndDate">종료 일자</label>
						<input type="text" class="form-control" id="indvDt2" name="indvDt2" value="" disabled>
					</div>
					</div>
					<div class="col-3">
					<div class="form-group mEnd">
						<label for="indvSchdEndDate">종료 시간</label>
						<select class="form-control" id="indvSchdEndDate">
							<option value="06:30">06:30</option>
							<option value="07:00">07:00</option>
							<option value="07:30">07:30</option>
							<option value="08:00">08:00</option>
							<option value="08:30">08:30</option>
							<option value="09:00">09:00</option>
							<option value="09:30">09:30</option>
							<option value="10:00">10:00</option>
							<option value="10:30">10:30</option>
							<option value="11:00">11:00</option>
							<option value="11:30">11:30</option>
							<option value="12:00">12:00</option>
							<option value="12:30">12:30</option>
							<option value="13:00">13:00</option>
							<option value="13:30">13:30</option>
							<option value="14:00">14:00</option>
							<option value="14:30">14:30</option>
							<option value="15:00">15:00</option>
							<option value="15:30">15:30</option>
							<option value="16:00">16:00</option>
							<option value="16:30">16:30</option>
							<option value="17:00">17:00</option>
							<option value="17:30">17:30</option>
							<option value="18:00">18:00</option>
							<option value="18:30">18:30</option>
							<option value="19:00">19:00</option>
							<option value="19:30">19:30</option>
							<option value="20:00">20:00</option>
							<option value="20:30">20:30</option>
							<option value="21:00">21:00</option>
							<option value="21:30">21:30</option>
							<option value="22:00">22:00</option>
							<option value="22:30">22:30</option>
							<option value="23:00">23:00</option>
							<option value="23:30">23:30</option>
						</select>
					</div>
					</div>
				</div>

					<div class="form-group" id="mCts">
						<label for="indvSchdCts">내용</label>
						<div>
							<textarea class="form-control" rows="5" placeholder="일정 내용을 입력하세요."
							id="indvSchdCts" name="indvSchdCts" style="resize:none;"></textarea>
						</div>
					</div>
				</div>
				<input type="hidden" class="form-control" id="taskId" name="taskId">
				<input type="hidden" class="form-control" id="writer" name="writer">
				<input type="hidden" class="form-control" id="projId" name="projId">
				<!-- Modal footer. 버튼 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary float-right insertBtn"
						onclick="insertSchd('insertModal', g_arg)" id="insertBtn">저장</button>
					<button type="button" class="btn btn-danger  float-right deleteBtn"
						onclick="deleteSchd('insertModal', g_arg)">삭제</button>
					<button type="button" class="btn btn-secondary float-right closeBtn" id="closeBtn" onclick="initModal('insertModal', g_arg)">닫기</button>
				</div>
			</div>
		</div>
	</div>

                                                    
                                                    
	<!-- 일정 등록 모달 창 끝 -->

	<script type="text/javascript">

	// 시작 시간 선택 시 종료 시간 자동 설정
	function startChange(){
		
		  var startT = $('#indvSchdStrtDate').val();
		  var endT  = $('#indvSchdEndDate').val();

		  let tmp;
		  
		  console.log("startT : " + startT + ", endT : " + endT);

		  //만약 시작 시간으로 09:00를 클릭하면 종료 시간이 09:30으로 잡힘(기본 30분 단위) 
		  if(startT.substring(3, 5) == '00'){

		  	endT = startT.substring(0, 2) + ':30';
			console.log("종료 시간 몇 시야 : " + endT);

		  }else{

			tmp = (parseInt(startT.substring(0, 2))+1);
			console.log("tmp화긴: " + tmp);

			if(tmp < 10){
			  	endT = '0' + tmp + ':00';				
			}else{
				endT = tmp + ':00';
			}
			console.log("종료 시간 몇 시야2 : " + endT);
		  }
		  
		  $('#indvSchdEndDate').val(endT);
	  }
	
	// 모달 내용 초기화
	function initModal(modal, arg){
		$('.'+modal+' #indvSchdTitle').val('');
//		$('.'+modal+' #regid').val('');
		$('.'+modal+' #indvSchdNum').val('');
		$('.'+modal+' #indvSchdCts').val('');
		$('.'+modal+' #indvSchdStrtDate').val('06:00');	// 시작 시간 추가
		$('.'+modal+' #indvSchdEndDate').val('06:30'); // 종료 시간 추가
		$('.'+modal).modal('hide');
		g_arg = null;
	  }

	/* 일정 insert 창 오픈~~ */
	function modalOpen(arg) {
		//console.log("혹시 필요한값이:",arg.event.extendedProps.indvSchdNum);
		g_arg = arg;
		
		// 이미 등록된 일정을 클릭할 경우 - (일감: only 조회 / 개인 일정: 조회,수정(저장),삭제 가능
		console.log("g_arg: ",g_arg);
		if(g_arg.event != undefined) {
// 			alert("일정 이미 있음");

			console.log("일정 있음 event:",g_arg.event);
			console.log("일정 제목",$('.insertModal #taskId').val());
			console.log("정확:",g_arg.event.setExtendedProp.taskId);

			// *일감인지 개인 일정인지 구분
			// taskId 정보가 없으면 일감
			if(g_arg.event.extendedProps.taskId != undefined) {

// 				alert("이것은 일감!")

				$('#modalTitle').html("<h4 class='modal-title' id='modalTitle'>일감 조회</h4>");
				$('#mTitle').html("<label for='taskTitle'>일감 제목</label><input type='text' class='form-control' id='taskTitle' name='taskTitle' disabled>");
				$('#mCts').html("<label for='taskCts'>내용</label><div><textarea class='form-control' rows='5' id='taskCts' name='taskCts' style='resize:none;' disabled></textarea></div>");

				$('.insertModal #taskId').val(g_arg.event.extendedProps.taskId);
				$('.insertModal #highTaskId').val(g_arg.event.extendedProps.highTaskId);
				$('.insertModal #taskTitle').val(g_arg.event.title);
				$('.insertModal #taskCts').val(g_arg.event.extendedProps.taskCts);

				$('.insertModal .insertBtn').css('display', 'none');
				$('.insertModal .deleteBtn').css('display', 'none');
				$('.insertModal .closeBtn').css('display', 'inline');

				$('.insertModal .mDt').css('display', 'none');
				$('.insertModal .mDt2').css('display', 'none');
				$('.insertModal .mStart').css('display', 'none');
				$('.insertModal .mEnd').css('display', 'none');
				
			// taskId가 없으면 개인 일정으로 인식
			} else {
// 				alert("개인 일정");
				console.log("else문",$('.insertModal #taskId').val());

				$('#modalTitle').html("<h4 class='modal-title' id='modalTitle'>일정 조회");
				$('#mTitle').html("<label for='indvSchdTitle'>일정 제목</label><input type='text' class='form-control' id='indvSchdTitle' name='indvSchdTitle'>");
				$('#mCts').html("<label for='indvSchdCts'>내용</label><div><textarea class='form-control' rows='5' id='indvSchdCts' name='indvSchdCts' style='resize:none;'></textarea></div>");

				$('.insertModal .insertBtn').css('display', 'inline');
				$('.insertModal .deleteBtn').css('display', 'inline');
				$('.insertModal .closeBtn').css('display', 'none');

				$('.insertModal .mDt').css('display', 'block');
				$('.insertModal .mDt2').css('display', 'block');
				$('.insertModal .mStart').css('display', 'block');
				$('.insertModal .mEnd').css('display', 'block');

				$('.insertModal #indvDt').val(arg.event.startStr.substr(0, 10)); // 클릭한 일정 시작일 알려주기용~
				$('.insertModal #indvDt2').val(arg.event.endStr.substr(0, 10)); // 클릭한 일정 종료일 알려주기용~

				$('.insertModal #indvSchdNum').val(g_arg.event.extendedProps.indvSchdNum);
				$('.insertModal #indvSchdTitle').val(g_arg.event.title);
				$('.insertModal #indvSchdCts').val(g_arg.event.extendedProps.indvSchdCts);
				// $('.insertModal #indvSchdStrtDate').val(g_arg.event.start);
				// $('.insertModal #indvSchdEndDate').val(g_arg.event.end);
				$('.insertModal #indvSchdStrtDate').val(stringFormat(g_arg.event.start.getHours())+':'+stringFormat(g_arg.event.start.getMinutes()));
				$('.insertModal #indvSchdEndDate').val(stringFormat(g_arg.event.end.getHours())+':'+stringFormat(g_arg.event.end.getMinutes()));

	//			$('.insertModal #writer').val(g_arg.event.writer);
			}

		// 새 일정(빈 곳 클릭)을 추가하는 경우 - 일정 새로 추가 가능	
		} else {
// 			alert("일정 새로 추가");

			let indvDt = g_arg.startStr.substr(0, 10); // 클릭한 날짜 시작일 띄우기!!! (ex) 26일 누르면 2022-12-26
			let indvDt2 = g_arg.endStr.substr(0, 10); // 클릭한 날짜 종료일 띄우기!!!


			// 01일 02일 처럼 10 미만의 한 자리 일(또는 월)일 경우 0을 붙여서 보여주기

			let imsiDate = new Date(indvDt2);
			console.log(imsiDate);

			imsiDate.setDate(imsiDate.getDate() - 1);
			// console.log(imsiDate.getFullYear());
			// console.log(imsiDate.getMonth());
			// console.log(imsiDate.getDate());

			console.log("indvDt: " + indvDt);
			console.log("indvDt2: " + indvDt2);

			let monthPlus = imsiDate.getMonth()+1;
			let dayPlus = imsiDate.getDate();
			
			if(monthPlus < 10) {
				monthPlus = 0 + "" + monthPlus;
				// console.log("월 확인: " + monthPlus);
			}

			if(dayPlus < 10) {
				dayPlus = 0 + "" + dayPlus;
				// console.log("일 확인: " + dayPlus);
			}
			
			// indvDt2 = imsiDate.getFullYear() + "-" + (imsiDate.getMonth()+1) + "-" + imsiDate.getDate(); // 자릿수 맞추기 문자열 더하기 필용!
			 indvDt2 = imsiDate.getFullYear() + "-" + monthPlus + "-" + dayPlus; // 자릿수 맞추기 문자열 더하기 필용!
			 console.log("과연------>>>>: " + indvDt2);

			/*
			let parts = indvDt2.split("-");
			parts[2] = parts[2]-1;  // 1일은 어쩔 것인강? 푸하하하
			indvDt2 = parts[0] + "-" + parts[1] + "-" + parts[2];
			*/
			
			$('#modalTitle').html("<h4 class='modal-title' id='modalTitle'>일정 등록</h4>");
			$('#mTitle').html("<label for='indvSchdTitle'>일정 제목</label><input type='text' class='form-control' id='indvSchdTitle' name='indvSchdTitle'>");
			$('#mCts').html("<label for='indvSchdCts'>내용</label><div><textarea class='form-control' rows='5' id='indvSchdCts' name='indvSchdCts' style='resize:none;'></textarea></div>");

			//month 외 week, day는 시간 값까지 받아와서 값 바인딩 ex)09:00
			if(g_arg.startStr.length > 10) {
				$('.insertModal #indvSchdStrtDate').val(g_arg.startStr.substr(11, 5));
				$('.insertModal #indvSchdEndDate').val(g_arg.endStr.substr(11, 5));
			}

			console.log(indvDt2);
			$('.insertModal #indvDt').val(indvDt);	// 클릭한 날짜 시작일 띄우기!!!
			$('.insertModal #indvDt2').val(indvDt2);	// 클릭한 날짜 종료일 띄우기!!!

		// 등록 버튼 외 숨김
		$('.insertModal .insertBtn').css('display', 'inline');
		$('.insertModal .deleteBtn').css('display', 'none');
		$('.insertModal .closeBtn').css('display', 'none');
		$('.insertModal .mDt').css('display', 'block');
		$('.insertModal .mDt2').css('display', 'block');
		$('.insertModal .mStart').css('display', 'block');
		$('.insertModal .mEnd').css('display', 'block');
	}
	
	// 모달창 show
	$('.insertModal').modal({backdrop: 'static'});	// 모달 밖 영역 눌렀을 때 창 꺼짐 방지. esc 방지
	console.log(arg);
	
	$('.insertModal #indvSchdTitle').focus();
	
}

	/* 일정 삭제 */
	function deleteSchd(modal, arg) {
		
		console.log("요건뭐얌:",arg);
		
		if(confirm('일정을 삭제하시겠습니까?')){
			
			var data = {
<%-- 			writer: '<%=sessionId%>', --%>
	//			indvSchdNum: $('.'+modal+' #indvSchdNum').val()		// 내가 따로 추가한 항목이니까 extendedProps어쩌구로 써야 먹히나봄 이거 때문에 삭제가 안 된 거였음!!!
			    indvSchdNum: arg.event.extendedProps.indvSchdNum,
			    deleteYn: arg.event.extendedProps.deleteYn
			}
			
			console.log("확인 메롱: ",data)
			
			$.ajax({
				url: "/proj/${projId}/deleteSchd",
				type: "POST",
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify(data),
				dataType: "JSON",
				traditional: true,
			//	async: false,
				beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			  },
				success: function(data, status, xhr){
					console.log(data);
					
					arg.event.setExtendedProp('deleteYn', 'y');	// 삭제 여부 Y/N만 조정하여 delete처리
	//				arg.event.remove();
					
					initModal(modal, arg);
					
					alert('일정을 삭제하였습니다.');
					location.reload();
				},
				error: function(xhr, status, error) {
					alert('일정 삭제 실패. 새로고침 후 재시도 해주세요.');
				}
					
			}); // ajax end
		}
	}
	
	
	/* 일정 등록 */
	function insertSchd(modal, arg) {
		// modal - 값을 받는 변수명

		if($('.'+modal+' #indvSchdTitle').val() == '') {
			alert("일정 제목을 입력해주세요.");
			
			return;
		}
		
		if($('.'+modal+' #indvSchdTitle').val().length > 30) {
			alert("제목은 30자 미만으로 입력해주세요.");
			
			return;
		}
		
		/* 수정(이미 등록된 일정을 새로 다시 저장) */
		if(arg.event != undefined) {

			if($('.'+modal+' #indvSchdStrtDate').val() == null){
					alert('시작시간을 입력해주세요');
					return;
				}
				if($('.'+modal+' #indvSchdEndDate').val() == null){
					alert('종료시간을 입력해주세요');
					return;
				}
			
			// 시간 설정 제한
			if(arg.event.startStr.substring(0, 10) == arg.event.endStr.substring(0, 10)){
				if($('.insertModal #indvSchdEndDate').val() <= $('.insertModal #indvSchdStrtDate').val()){
					alert('종료 시간을 시작 시간보다 크게 선택해주세요');
					$('.insertModal #indvSchdEndDate').focus();
					return;
				}
		  	}

			var data; 
			
			// 시작일자
			var m_start = new Date(arg.event.startStr.substr(0, 4), arg.event.startStr.substr(5, 2)-1, arg.event.startStr.substr(8, 2));
			
			// 종료일자 ex) 2022.12.19
			var m_end = new Date(arg.event.endStr.substr(0, 4), arg.event.endStr.substr(5, 2)-1, arg.event.endStr.substr(8, 2));
			
			// if(!arg.event.endStr){  // 일단 하루짜리 일정에 대해서 이야깅! -> 망할 1899년도 처리..추후 맘이 찝찝함 일단 통과!
			// 	m_end = m_start;
			// }else {
			// 	m_end = new Date(arg.event.endStr.substr(0, 4), arg.event.endStr.substr(5, 2)-1, arg.event.endStr.substr(8, 2));				
			// }
			
		//	console.log("m_end 날짜:", m_end, m_end.getFullYear());
			var m_month = m_end.getMonth()+1; // 문자열 생성에 사용
		
			var m_date; // 종료일자 일
			var m_end_dt; // 종료일자 문자열
			
			//m_end.setDate(m_end.getDate());	// 이게 맞나?
			
			var m_end_com = new Date(arg.event.endStr.substr(0, 4), arg.event.endStr.substr(5, 2)-1, arg.event.endStr.substr(8, 2));
			var m_first = new Date(m_end.getFullYear(),  m_end.getMonth()+1, 1);
			
			if(m_end_com.getFullYear()+''+stringFormat(m_end_com.getMonth())+''+stringFormat(m_end_com.getDate())
					== m_first.getFullYear()+''+stringFormat(m_first.getMonth())+''+stringFormat(m_first.getDate())){
				m_month = m_end.getMonth()+1;
			}
			
			m_date = m_end.getDate(); // 종료일자의 일 달력
			m_end_dt = m_end.getFullYear() + '-' + stringFormat(m_month) + '-' + stringFormat(m_date); // 종료일자 문자열 생성
			
			data = { 
					writer: $("#writer").val(),
					projId: $("#projId").val(),
// 			  		indvSchdNum : $('.'+modal+' #indvSchdNum').val(),
			  		indvSchdNum : arg.event.extendedProps.indvSchdNum,
			  //		title : $('.'+modal+' #indvSchdTitle').val(),
			  		indvSchdTitle : $('.'+modal+' #indvSchdTitle').val(),
			  		indvSchdCts : $("#indvSchdCts").val(),
			  		// startdt : arg.event.startStr.substr(0, 10),
			  		// enddt : m_end_dt,
					indvSchdStrtDate : arg.event.startStr.substr(0, 10)+'T'+$('.'+modal+' #indvSchdStrtDate').val(),
					indvSchdEndDate : m_end_dt+'T'+$('.'+modal+' #indvSchdEndDate').val(),
			  		deleteYn: arg.event.extendedProps.deleteYn
			  	}
			
			console.log("hyojung222",data);

			if(data.startdt >= data.enddt){
			alert('종료 시간을 시작 시간보다 크게 선택해주세요');

			return;
		}
			//data : {"indvSchdNum":11,"title":"ㅋㅋㄴ","indvSchdCts":"ㅎㅎㄴ","indvSchdStrtDate":"2022-12-28T06:00","indvSchdEndDate":"2022-12-28T06:30"}
			console.log("data : " + JSON.stringify(data));
			
			$.ajax({
				  url: "/proj/${projId}/updateSchd",
				  type: "POST",
				  contentType: 'application/json; charset=utf-8',
				  data: JSON.stringify(data),
				  dataType: "JSON",
				  traditional: true,
				  beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				  },
				  success : function(data, status, xhr){

						arg.event.setProp('title', $('.'+modal+' #indvSchdTitle').val());
						arg.event.setExtendedProp('indvSchdCts', $("#indvSchdCts").val());
						arg.event.setExtendedProp('writer', $("#writer").val());
						arg.event.setExtendedProp('projId', $("#projId").val());
						arg.event.setStart(new Date(arg.event.startStr.substr(0, 10)+'T'+$('.'+modal+' #indvSchdStrtDate').val()));
						arg.event.setEnd(new Date(m_end_dt+'T'+$('.'+modal+' #indvSchdEndDate').val()));
						// arg.event.setStart(arg.event.startStr);
						// arg.event.setEnd(m_end_dt);

				  initModal(modal, arg);
				  
				  alert('일정을 수정하였습니다!');
					location.reload();
			  },
				  error : function(xhr, status, error){
					    //alert(xhr.responseText);
					  alert('일정 수정 실패. 새로고침 후 재시도 해주세요');
			  }
		});
	
 		/* 일정 새로 등록 */
 		} else {
			
			if(arg.startStr.substring(0, 10) == arg.endStr.substring(0, 10)){
				  if($('.insertModal #indvSchdEndDate').val() <= $('.insertModal #indvSchdStrtDate').val()){
					  alert('종료시간을 시작시간보다 크게 선택해주세요');
					  $('.insertModal #indvSchdEndDate').focus();
					  return;
				  }
		  		}

			var data;
			
			var m_start = new Date(arg.startStr.substr(0, 4), arg.startStr.substr(5, 2)-1, arg.startStr.substr(8, 2));
			var m_end = new Date(arg.endStr.substr(0, 4), arg.endStr.substr(5, 2)-1, arg.endStr.substr(8, 2));
			var m_month = m_end.getMonth()+1;
			
			var daySt = m_start.getTime();
			var dayEnd = m_end.getTime();
			// 시작일과 종료일 차이 일 수 구하기 -> 2일 이상 일정에 적용
			var dayMinus = Math.abs((daySt-dayEnd) / (1000*60*60*24));	// 밀리세컨 * 초 * 분 * 시 = 일
			
			console.log("시작일: " + daySt);
			console.log("종료일: " + dayEnd);
			console.log("일 수 차이:" + dayMinus);

			
			if(dayMinus>=2){
					m_end.setDate(m_end.getDate()-1);
				} else {
					m_end.setDate(m_start.getDate()); // 하루에 끝나는 일정이면 종료일을 시작일로 세팅
				}
			
//  //			week나 day에서 추가할때(시간 존재)
// 			if(arg.endStr.length > 10){
// 				m_end.setDate(m_end.getDate());
// 			//month에선 2022.09.30 클릭 시 endstr이 2022.10.01로 잡히기 때문에, 시작일로 맞춰주기
// 			}else{
// 				m_end.setDate(m_start.getDate());	
// 			}
			
			// 말일에 대한 로직
			var m_end_com = new Date(arg.endStr.substr(0, 4), arg.endStr.substr(5, 2)-1, arg.endStr.substr(8, 2));
			var m_first = new Date(m_end.getFullYear(),  m_end.getMonth()+1, 1);

			if(m_end_com.getFullYear()+''+stringFormat(m_end_com.getMonth())+''+stringFormat(m_end_com.getDate())
					== m_first.getFullYear()+''+stringFormat(m_first.getMonth())+''+stringFormat(m_first.getDate())){
				m_month = m_end.getMonth()+1;
			}
							
			var m_date = m_end.getDate();
			arg.endStr = m_end.getFullYear() + '-' + stringFormat(m_month) + '-' + stringFormat(m_date);
			
			if(arg.startStr.length > 10){
				//일자만 추출
				arg.startStr = arg.startStr.substr(0, 10);
			}
			
			data = {
					writer: $("#writer").val(),
					projId: $("#projId").val(),
					indvSchdTitle: $('.'+modal+' #indvSchdTitle').val(),
					indvSchdStrtDate: arg.startStr+'T'+$('.'+modal+' #indvSchdStrtDate').val(),
					indvSchdEndDate: arg.endStr+'T'+$('.'+modal+' #indvSchdEndDate').val(),
					indvSchdCts: $("#indvSchdCts").val()
					// indvSchdStrtDate: arg.startStr,
					// indvSchdEndDate: arg.endStr,
			}

		
			if(data.indvSchdStrtDate >= data.indvSchdEndDate) {
				console.log(data.indvSchdStrtDate+" 시작");
				console.log(data.indvSchdEndDate+" 종료");
				console.log(data);
				
				alert('종료 시간을 시작 시간보다 크게 선택해주세요.');
				return;
		}

			console.log(data);
		
		$.ajax({
			url: "/proj/${projId}/insertSchd",
			type: "POST",
			data: JSON.stringify(data),
			dataType: "JSON",
			contentType : "application/json; charset=utf-8",
			traditional: true,
			beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		  },
			success: function(data, status, xhr) {
				
				var writer;
				
				calendar.addEvent({
					writer: $("#writer").val(),
					projId: $("#projId").val(),
					title: $('.'+modal+' #indvSchdTitle').val(),
					indvSchdCts: $("#indvSchdCts").val(),
					start: arg.startStr+'T'+$('.'+modal+' #indvSchdStrtDate').val(),
					end: arg.endStr+'T'+$('.'+modal+' #indvSchdEndDate').val(),
					// start: arg.startStr,
					// end: arg.endStr

				});

		initModal(modal, arg);

		alert('일정을 등록하였습니다!');			
		

	//	location.href='/proj/schedule';
		location.reload();
		
		},
		
		error: function(xhr, status, error) {
			alert('일정 등록 실패 \n새로고침 후 재시도 해주세요.');
			}
		});
 	}
}

</script>

	<!-- BEGIN: Page JS-->
	<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/modal/components-modal.js"></script>
	<script src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/popover/popover.js"></script>
	<!-- END: Page JS-->
<script>
  $( function () {
    $( '[data-toggle="popover"]' ).popover()
  } );
</script>
</body>

</html>


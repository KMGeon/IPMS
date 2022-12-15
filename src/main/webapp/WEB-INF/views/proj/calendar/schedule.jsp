<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link href="/resources/fullcalendar/lib/main.css" rel="stylesheet" />
<script type="text/javascript"
	src="/resources/stack-admin-v4.0/stack-admin/src/js/core/libraries/jquery.min.js"></script>
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
	border-color: #FFE1E6 		!important;
	background-color: #FFE1E6 	!important;
	color: #000 				!important;
	font-weight: bold 			!important;
}

.fc-day-today {
    background: #FFF0F5 !important;
    border: none !important;
} 
</style>

<script>
var today = new Date();
var month = today.getMonth()+1;	//getMonth()는 9월이 8으로 나옴
var date = today.getDate();
var g_arg;	//이벤트 글로벌 변수(모달창에서 호출하는 함수에서 참조하기 위함)
var calendar;	//달력 변수
var todayStr = today.getFullYear() + '-' + stringFormat(month) + '-' + stringFormat(date);

function stringFormat(p_val){
	if(p_val < 10)
		return p_val = '0'+p_val;
	else
		return p_val;
}

	document.addEventListener("DOMContentLoaded", function() {
		var calendarEl = document.querySelector("#calendar");

		calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next',
				center : 'title',
				right : 'today'
			},
			locale : 'ko',
// 			slotMinTime : '09:00',
// 			slotMaxTime : '21:00',
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
			
			displayEventTime: false,	// 시간 안 뜨게
			
			events : loadEvent() // 데이터 형식을 맞추짜앙!!!!

		});
		calendar.render();
	});
	
	// 띄우기 
	function loadEvent(){
		
		console.log("왔다");
		
		  let arr = [];
		  
	   	  $.ajax({
	   		  type:"post",
	   		  url :"/proj/calList",
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
	   					indvSchdCts:list[i]['indvSchdCts']		// 내용
	   				  
		   			  	});//end arr
		   			  	
	   			  }//end for
	   			console.log("arr : " ,JSON.stringify(arr));
	   		  }
	   	  })
	   	return arr;
	}
</script>
</head>
<body>
	<div id="calendar"
		style="width: 1000px; margin: auto; background-color: white;"></div>

	<!-- 일정 등록 모달 창 시작 -->
	<!-- insertModal -->
	<div class="modal fade insertModal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title" id="modalTitle">일정 등록</h4>
					<button type="button" class="close"
						onclick="initModal('insertModal', g_arg)">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="form-group">
						<label for="indvSchdTitle">일정 제목</label> <input type="text"
							class="form-control" placeholder="제목을 입력하세요." id="indvSchdTitle" name="indvSchdTitle">
					</div>
					<div class="form-group">
						<label for="indvSchdCts">내용</label>
						<div>
							<textarea class="form-control" rows="5" placeholder="일정 내용을 입력하세요."
								id="indvSchdCts" name="indvSchdCts" style="resize:none;"></textarea>
						</div>
					</div>
				</div>
				<!-- Modal footer. 버튼 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-info float-right insertBtn"
						onclick="insertSchd('insertModal', g_arg)" id="insertBtn">저장</button>
					<button type="button" class="btn btn-secondary  float-right deleteBtn"
						onclick="deleteSchd('insertModal', g_arg)">삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 일정 등록 모달 창 끝 -->

	<script type="text/javascript">

// 	// 시작일자 변경
// 	function startChange(){
// 		  var start = $('#start').val();
// 		  var end  = $('#end').val();
// 		  if(start.substring(3, 5) == '00')
// 			  end = start.substring(0, 2) + ':30';
// 		  else
// 			  end = (parseInt(start.substring(0, 2))+1) + ':00';
		  
// 		  $('#end').val(end);
// 	  }
	
	// 모달 내용 초기화
	function initModal(modal, arg){
		$('.'+modal+' #indvSchdTitle').val('');
//		$('.'+modal+' #regid').val('');
		$('.'+modal+' #indvSchdNum').val('');
		$('.'+modal+' #indvSchdCts').val('');
		$('.'+modal).modal('hide');
		g_arg = null;
	  }

	/* 일정 insert 창 오픈~~ */
	function modalOpen(arg) {
		//console.log("혹시 필요한값이:",arg.event.extendedProps.indvSchdNum);
		g_arg = arg;
		
		// 이미 등록된 일정을 클릭할 경우 - 조회 및 수정,삭제 가능
		if(g_arg.event != undefined) {
			$('.insertModal .deleteBtn').css('display', 'inline');
			$('.insertModal #indvSchdNum').val(g_arg.event.extendedProps.indvSchdNum);
			$('.insertModal #indvSchdTitle').val(g_arg.event.title);
			$('.insertModal #indvSchdCts').val(g_arg.event.extendedProps.indvSchdCts);
//			$('.insertModal #writer').val(g_arg.event.writer);
			$('#modalTitle').html("<h4 class='modal-title' id='modalTitle'>일정 조회</h4>");
			
		} else {	// 새 일정(빈 곳 클릭)을 추가하는 경우 - 일정 추가 가능
			$('#modalTitle').html("<h4 class='modal-title' id='modalTitle'>일정 등록</h4>");
			
		// 등록 버튼 외 숨김
		$('.insertModal .insertBtn').css('display', 'inline');
		$('.insertModal .deleteBtn').css('display', 'none');
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
	//			indvSchdNum: $('.'+modal+' #indvSchdNum').val()		// 내가 따로 추가한 항목이니까 extendedProps어쩌구로 써야 먹히나봄
			    indvSchdNum: arg.event.extendedProps.indvSchdNum	// 이거 때문에 삭제가 안 된 거였음!!!
			}
			
			console.log("확인 메롱: ",data)
			
			$.ajax({
				url: "/proj/deleteSchd",
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
					//alert(xhr.status);
					console.log(data);
					
					arg.event.remove();
					initModal(modal, arg);
					alert('일정을 삭제하였습니다.');
					location.href='/proj/schedule';
				},
				error: function(xhr, status, error) {
					alert('일정 삭제 실패<br> 새로고침 후 재시도 해주세요.');
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
		
		/* 수정 */
		if(arg.event != undefined) {
			
			var data;
			
			var m_start = new Date(arg.event.startStr.substr(0, 4), arg.event.startStr.substr(5, 2)-1, arg.event.startStr.substr(8, 2));
			
			var m_end;
			
			if(!arg.event.endStr){  // 일단 하루짜리 일정에 대해서 이야깅! -> 망할 1899년도 처리..추후 맘이 찝찝함 일단 통과!
				m_end = m_start;
			}else {
				m_end = new Date(arg.event.endStr.substr(0, 4), arg.event.endStr.substr(5, 2)-1, arg.event.endStr.substr(8, 2));				
			}
			
		//	console.log("m_end 날짜:", m_end, m_end.getFullYear());
			var m_month = m_end.getMonth()+1;
		//	var be_allday = arg.event.allDay;
		
			var m_date;
			var m_end_dt;
			
			//m_end.setDate(m_end.getDate());	// 이게 맞나?
			
			var m_end_com = new Date(arg.event.endStr.substr(0, 4), arg.event.endStr.substr(5, 2)-1, arg.event.endStr.substr(8, 2));
			var m_first = new Date(m_end.getFullYear(),  m_end.getMonth()+1, 1);
			
			if(m_end_com.getFullYear()+''+stringFormat(m_end_com.getMonth())+''+stringFormat(m_end_com.getDate())
					== m_first.getFullYear()+''+stringFormat(m_first.getMonth())+''+stringFormat(m_first.getDate())){
				m_month = m_end.getMonth()+1;
			}
			
			m_date = m_end.getDate();
			m_end_dt = m_end.getFullYear() + '-' + stringFormat(m_month) + '-' + stringFormat(m_date);
			
			data = { 
<%-- 					id : '<%=sessionId%>', //등록한 사람 id --%>
<%-- 			  		regid : '<%=sessionId%>', --%>
// 			  		indvSchdNum : $('.'+modal+' #indvSchdNum').val(),
			  		indvSchdNum : arg.event.extendedProps.indvSchdNum,
			  		title : $('.'+modal+' #indvSchdTitle').val(),
			  		indvSchdCts : $("#indvSchdCts").val(),
			  		startdt : arg.event.startStr.substr(0, 10),
			  		enddt : m_end_dt
			  	}
			
			console.log("hyojung222",data);
			
			$.ajax({
				  url: "/proj/updateSchd",
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
						arg.event.setStart(arg.event.startStr);
						arg.event.setEnd(m_end_dt);	
					//	arg.event.setAllDay(true);
					//	arg.event.setExtendedProp('allowyn', '0');
				  
				  initModal(modal, arg);
				  alert('일정을 수정하였습니다!');
					location.href='/proj/schedule';
			  },
				  error : function(xhr, status, error){
					    //alert(xhr.responseText);
					  alert('일정 수정 실패\n새로고침 후 재시도 해주세요');
			  }
		});
	
 		/* 새로 등록 */
 		} else {
			
			var data;
			
			var m_start = new Date(arg.startStr.substr(0, 4), arg.startStr.substr(5, 2)-1, arg.startStr.substr(8, 2));
			var m_end = new Date(arg.endStr.substr(0, 4), arg.endStr.substr(5, 2)-1, arg.endStr.substr(8, 2));
			var m_month = m_end.getMonth()+1;
			
			//week나 day에서 추가할때(시간 존재)
			if(arg.endStr.length > 10){
				m_end.setDate(m_end.getDate());
				//month에선 2021.09.30 클릭 시 endstr이 2021.10.01로 잡히기 떄문에 일-1
			}else{
				m_end.setDate(m_end.getDate()-1);	
			}
			
			// 말일에 대한 로직
			var m_end_com = new Date(arg.endStr.substr(0,4), arg.endStr.substr(5,2)-1, arg.endStr.substr(8,2));
			var m_first = new Date(m_end.getFullYear(), m_end.getMonth()+1, 1);
			
			if(m_end_com.getFullYear() + '' + stringFormat(m_end_com.getMonth()) + '' + stringFormat(m_end_com.getDate())
					== m_first.getFullYear() + '' + stringFormat(m_first.getMonth()) + '' + stringFormat(m_first.getDate())) {
				
				m_month = m_end.getMonth()+1;
			}
			
			var m_date = m_end.getDate();
			arg.endStr = m_end.getFullYear() + '-' + stringFormat(m_month) + '-' + stringFormat(m_date);
			
			if(arg.startStr.length > 10) {
				// 일자만 추출
				arg.startStr = arg.startStr.substr(0, 10);
			}
			
			data = {
					indvSchdTitle: $('.'+modal+' #indvSchdTitle').val(),
					indvSchdStrtDate: arg.startStr,
					indvSchdEndDate: arg.endStr,
					indvSchdCts: $("#indvSchdCts").val()
			}
		
// 		if(data.startdt > data.enddt) {
// 			console.log(data.startdt+" 시작");
// 			console.log(data.enddt+" 종료");
// 			console.log(data);
			
// 			alert('종료 시간을 시작 시간보다 크게 선택해주세요.');
// 			return;
// 	}
		console.log(data);
		
		$.ajax({
			url: "/proj/insertSchd",
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
					writer: writer,
					title: $('.'+modal+' #indvSchdTitle').val(),
					indvSchdCts: $("#indvSchdCts").val(),
					start: arg.startStr,
					end: arg.endStr
				});
		
		initModal(modal, arg);
		alert('일정을 등록하였습니다!');
		location.href='/proj/schedule';
		
		},
		
		error: function(xhr, status, error) {
			alert('일정 등록 실패 \n새로고침 후 재시도 해주세요.');
			}
		});
 	}
}

</script>

	<!-- BEGIN: Page JS-->
	<script
		src="/resources/stack-admin-v4.0/stack-admin/app-assets/js/scripts/modal/components-modal.js"></script>
	<!-- END: Page JS-->
</body>

</html>

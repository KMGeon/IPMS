
var currentURL = window.location.href
let projId = currentURL.split('/');
console.log("currentURL : " + currentURL);
console.log("projId : " + projId[4]);


console.log("auth: ", auth);
console.log("mvo: ", mvo);
var taskId = null;
var objdata = null;
var data;
var kbval;
var kanbanArray = new Array();
var unapprovedArray = new Array();
var modalCts = "";


$(document).on("click", ".kanban-title-board", function (e) {
  dispNone(); // 모든 속성 readonly and display none;
  
  // alert("상위일감 정보 조회");

  $("#mbmodifybtn").css("display", "none");
  $("#taskPgresdiv").css("display", "none");
  $("#taskTitle").attr("readonly", true);
  $("#taskStrtDate").attr("readonly", true);
  $("#taskEndDate").attr("readonly", true);
  $("#taskCts").attr("readonly", true);
  $("#classification").text("상위일감 정보");
  $("#cardtitle").text("상위일감 제목");
  $("#taskb").text("상위일감 내용");



  let taskTitle = $(this).text();
  let prid = $(this).parents("div").eq(0).attr("data-id")
  let taskStusCode = $("#taskStusCode").val();

  taskId = {
    "taskId": prid
  }

  $(".kanban-overlay").addClass("show");
  $(".kanban-sidebar").addClass("show");

  $.ajax({

    type: 'POST',
    url: '/proj/' + projId[4] + '/workDetail',
    contentType: "application/json;  charset=utf-8",
    data: JSON.stringify(taskId),
    beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
      xhr.setRequestHeader(header, token);
    },
    dataType: 'json',
    success: function (result) {
      console.log("result : ", result);

      $("#taskId").val(result.taskId);
      $("#taskStrtDate").val(result.taskStrtDate);
      $("#taskEndDate").val(result.taskEndDate);
      $("#taskTitle").val(result.taskTitle);
      $("#taskCts").html(result.taskCts);
     
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.log(errorThrown, textStatus);
    }
  });


});


$.ajax({
  url: "/proj/" + projId[4] + "/workmove",
  dataType: "json",
  async: false,
  success: function (data) {
    objdata = data;

    //상위 일감만 push
    for (let i = 0; i < data.fjson.length; i++) {
      if (data.fjson[i].highTaskId == null) {

        kanbanArray.push({ id: data.fjson[i].taskId
                          , title: data.fjson[i].taskTitle + "<div style='font-size: 10px;' id=pjdate"+data.fjson[i].taskId+">(" + data.fjson[i].taskStrtDate + " ~ " + data.fjson[i].taskEndDate + ")</div>"  , item: [] })
        console.log(" 상위일감 갯수 : " + i);
      }
    };

    // 상위 일감 id에 맞는 하위 일감 상위일감 item push
    for (let i = 0; i < kanbanArray.length; i++) {
      for (let j = 0; j < data.fjson.length; j++) {
        if (kanbanArray[i].id == data.fjson[j].highTaskId && data.fjson[j].aprovWhth == 'y') {
          kanbanArray[i].item.push({ id: data.fjson[j].taskId , title: data.fjson[j].taskTitle , border: data.fjson[j].taskStusCode, dueDate: data.fjson[j].taskEndDate });
        }
      }
    }

    //마지막 미승인 일감(상위)push
    kanbanArray.push({ id: "99", title: "미승인 일감", item: [] });

    console.log("kanbanArray : " + kanbanArray);

    //미승인 일감 item push
    for (let a = 0; a < data.fjson.length; a++) {
      if (data.fjson[a].aprovWhth == 'n') {
        kanbanArray[kanbanArray.length - 1].item.push({ id: data.fjson[a].taskId, title: data.fjson[a].taskTitle, border: data.fjson[a].taskStusCode, dueDate: data.fjson[a].taskEndDate });

      }
    }
    console.log("first item:", kanbanArray)


    console.log("dataArray: ", kanbanArray);
  }, error: function (request, status, error) {
    alert("에러");
  }
});


console.log("jsondata", (kbval))
var kanban_curr_el, kanban_curr_item_id, kanban_item_title, kanban_data, kanban_item, kanban_users, kanban_item_percent;

// Kanban Board and Item Data passed by json
var kanban_board_data = kanbanArray;


// Kanban Board
var KanbanExample = new jKanban({
  element: "#kanban-wrapper", // selector of the kanban container
  buttonContent: " + 하위일감 등록", // text or html content of the board button
  
  // Add new Item 클릭 시 아래 이벤트
  click: function (el) {




    // kanban-overlay and sidebar display block on click of kanban-item
    $(".kanban-overlay").addClass("show");
    $(".kanban-sidebar").addClass("show");

    // Set el to var kanban_curr_el, use this variable when updating title
    kanban_curr_el = el;

    // Extract  the kan ban item & id and set it to respective vars
    kanban_item_title = $(el).contents()[0].data;
    kanban_curr_item_id = $(el).attr("data-eid");

    // set edit title
    $(".edit-kanban-item .edit-kanban-item-title").val(kanban_item_title);
  },

  // add new Item 눌렀을때 텍스트박스 , 서브밋 , 캔슬 출력
  buttonClick: function (el, boardId) {
    // alert("하위일감 등록");
    dispNone(); // 모든 속성 readonly and display none;
  $(".kanban-overlay").addClass("show");
  $(".kanban-sidebar").addClass("show");

  $("#taskTitle").attr("readonly", false);
  $("#taskStrtDate").attr("readonly", false);
  $("#taskEndDate").attr("readonly", false);
  $("#taskCts").attr("readonly", false);
  $("#btnsave").css("display", "block");
  
  $("#cardtitle").text("하위일감 제목");
  $("#taskb").html("하위일감 내용");
  $("#classification").html("하위일감 등록");
  $("#imbtn").css("display","block");

    // $("#taskTitle").attr("readonly",false);
    // $("#taskStrtDate").attr("readonly",false);
    // $("#taskEndDate").attr("readonly",false);
    // $("#taskCts").attr("readonly",false);

    // $("#taskPgresdiv").css("display", "none")
    // $("#tdiv").css("display", "block");
    // $("#btnsave").css("display", "block");
    // $("#btndel").css("display", "none");
    // $("#totaldiv").css("display", "none");
    $("#taskCts").html('');
    $("#taskTitle").val('');
    $("#taskStrtDate").val('');
    $("#taskEndDate").val('');
    $("#taskCts").val('');

    console.log(boardId); /* insert data ajax */

    data = {
      "boardId": boardId
    };

    
  },
  addItemButton: true, // add a button to board for easy item creation
  boards: kanban_board_data // data passed from defined variable
});

// Add html for Custom Data-attribute to Kanban item
var board_item_id, board_item_el;
// Kanban board loop

for (kanban_data in kanban_board_data) {
  // Kanban board items loop
  for (kanban_item in kanban_board_data[kanban_data].item) {
    var board_item_details = kanban_board_data[kanban_data].item[kanban_item]; // set item details
    board_item_id = $(board_item_details).attr("id"); // set 'id' attribute of kanban-item

    (board_item_el = KanbanExample.findElement(board_item_id)), // find element of kanban-item by ID
      (board_item_users = board_item_dueDate = board_item_comment = board_item_attachment = board_item_image = board_item_badge = board_item_percent =
        " ");



    // check if users are defined or not and loop it for getting value from user's array
    if (typeof $(board_item_el).attr("data-users") !== "undefined") {
      for (kanban_users in kanban_board_data[kanban_data].item[kanban_item].users) {
        board_item_users +=
          '<li class="avatar pull-up my-0">' +
          '<img class="media-object" src=" ' +
          kanban_board_data[kanban_data].item[kanban_item].users[kanban_users] +
          '" alt="Avatar" height="18" width="18">' +
          "</li>";
      }
    }
    // check if dueDate is defined or not
    if (typeof $(board_item_el).attr("data-dueDate") !== "undefined") {
      board_item_dueDate =
        '<div class="kanban-due-date mr-50">' +
        '<i class="feather icon-clock font-size-small mr-25"></i>' +
        '<span class="font-size-small">' +
        $(board_item_el).attr("data-dueDate") +
        "</span>" +
        "</div>";
    }
    // check if comment is defined or not
    if (typeof $(board_item_el).attr("data-comment") !== "undefined") {
      board_item_comment =
        '<div class="kanban-comment mr-50">' +
        '<i class="feather icon-message-square font-size-small mr-25"></i>' +
        '<span class="font-size-small">' +
        $(board_item_el).attr("data-comment") +
        "</span>" +
        "</div>";
    }
    // check if attachment is defined or not
    if (typeof $(board_item_el).attr("data-attachment") !== "undefined") {
      board_item_attachment =
        '<div class="kanban-attachment">' +
        '<i class="feather icon-link font-size-small mr-25"></i>' +
        '<span class="font-size-small">' +
        $(board_item_el).attr("data-attachment") +
        "</span>" +
        "</div>";
    }
    // check if Image is defined or not
    if (typeof $(board_item_el).attr("data-image") !== "undefined") {
      board_item_image =
        '<div class="kanban-image mb-1">' +
        '<img class="img-fluid" src=" ' +
        kanban_board_data[kanban_data].item[kanban_item].image +
        '" alt="kanban-image">';
      ("</div>");
    }


    // check if Badge is defined or not
    if (typeof $(board_item_el).attr("data-badgeContent") !== "undefined") {
      board_item_badge =
        '<div class="kanban-badge">' +
        '<div class="avatar bg-' +
        kanban_board_data[kanban_data].item[kanban_item].badgeColor +
        ' font-size-small font-weight-bold">' +
        kanban_board_data[kanban_data].item[kanban_item].badgeContent +
        "</div>";
      ("</div>");
    }
    // add custom 'kanban-footer'
    if (
      typeof (
        $(board_item_el).attr("data-dueDate") ||
        $(board_item_el).attr("data-comment") ||
        $(board_item_el).attr("data-users") ||
        $(board_item_el).attr("data-attachment")
      ) !== "undefined"
    ) {
      // 메인페이지 -> 보드리스트 item 화면
      $(board_item_el).append(
        '<div class="kanban-footer d-flex justify-content-between mt-1">' +
        '<div class="kanban-footer-left d-flex">' +
        board_item_dueDate +
        board_item_comment +
        board_item_attachment +
        "</div>" +
        '<div class="kanban-footer-right">' +
        '<div class="kanban-users">' +
        board_item_badge +
        '<ul class="list-unstyled users-list cursor-pointer m-0 d-flex align-items-center">' +
        board_item_users +
        "</ul>" +
        "</div>" +
        "</div>" +
        "</div>"
      );
    }
    // add Image prepend to 'kanban-Item'
    if (typeof $(board_item_el).attr("data-image") !== "undefined") {
      $(board_item_el).prepend(board_item_image);
    }
  }
}

// Add new kanban board
//---------------------
var addBoardDefault = document.getElementById("add-kanban");


var i = 1;
addBoardDefault.addEventListener("click", function () {
  dispNone(); // 모든 속성 readonly and display none;
  // alert("에드뉴보드");
  
  $("#classification").text("상위일감 등록");
  $("#taskb").text("상위일감 내용");
  $("#cardtitle").text("상위일감 제목");
 
  
  $("#taskTitle").val('');
  $("#taskStrtDate").val('');
  $("#taskEndDate").val('');
  $("#taskCts").html("");


  $("#taskTitle").removeAttr("readonly");                    //모달 일감제목 input
  $("#taskCts").removeAttr("readonly");                    //모달 일감제목 input
  $("#taskStrtDate").removeAttr("readonly");                 //모달 시작일 input
  $("#taskEndDate").removeAttr("readonly");                  //모달 종료일
  $("#btnsave").css("display","block");                      //모달 저장 버튼




  $(".kanban-overlay").addClass("show");
  $(".kanban-sidebar").addClass("show");

  //save 눌러서 디비에 넣어놓고 데이터 불러오자

  // KanbanExample.addBoards([{
  //   id: "kanban-" + i, // generate random id for each new kanban
  //   title: "Default Title"
  // }]);
  var kanbanNewBoard = KanbanExample.findBoard("kanban-" + i)

  if (kanbanNewBoard) {
    // $(".kanban-title-board").on("mouseenter", function () {
    //   $(this).attr("contenteditable", "true");
    //   $(this).addClass("line-ellipsis");
    // });
    kanbanNewBoardData =
      'zz<div class="dropdown">' +
      '<div class="dropdown-toggle cursor-pointer" role="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="feather icon-more-vertical"></i></div>' +
      '<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton"> ' +
      '<a class="dropdown-item" href="#"><i class="feather icon-link mr-50"></i>Copy Link</a>' +
      '<a class="dropdown-item kanban-delete" id="kanban-delete" href="#"><i class="feather icon-trash-2 mr-50"></i>Delete</a>' +
      "</div>" + "</div>";
    var kanbanNewDropdown = $(kanbanNewBoard).find("header");
    $(kanbanNewDropdown).append(kanbanNewBoardData);
  }
  i++;

  
});



// Kanban board dropdown
// ---------------------

var kanban_dropdown = document.createElement("div");
kanban_dropdown.setAttribute("class", "dropdown");

dropdown();

function dropdown() {

  kanban_dropdown.innerHTML = '<i id="iconid" onclick="highWorkdel(event)" class="feather icon-x-square"></i>';
  if (!$(".kanban-board-header div").hasClass("dropdown")) {
    $(".kanban-board-header").append(kanban_dropdown);

  }
}

// Kanban-overlay and sidebar hide
// --------------------------------------------
$(
  ".kanban-sidebar .delete-kanban-item, .kanban-sidebar .close-icon, .kanban-sidebar .update-kanban-item, .kanban-overlay"
).on("click", function () {
  $("#referCtsId").remove();

  $(".kanban-overlay").removeClass("show");
  $(".kanban-sidebar").removeClass("show");
});

// Updating Data Values to Fields
// -------------------------------
$("#btnsave").on("click", function (e) {



  $("#taskTitle").attr("readonly", true);
  $("#taskStrtDate").attr("readonly", true);
  $("#taskEndDate").attr("readonly", true);
  $("#taskCts").attr("readonly", true);

  // alert("save버튼");
  // console.log("data boardId : " + data.boardId);
  if ($("#classification").html() == "상위일감 등록") {
    insertData = {
      "classification": $("#classification").html(),
      "taskTitle": $("#taskTitle").val(),
      "taskCts": $("#taskCts").val(),
      "taskStrtDate": $("#taskStrtDate").val(),
      "taskEndDate": $("#taskEndDate").val(),
      "taskStusCode": $("#taskStusCode").val(),
      "taskPgres": $("#taskPgres").val()
    };
  } else {
    insertData = {
      "highTaskId": data.boardId,
      "classification": $("#classification").html(),
      "taskTitle": $("#taskTitle").val(),
      "taskCts": $("#taskCts").val(),
      "taskStrtDate": $("#taskStrtDate").val(),
      "taskEndDate": $("#taskEndDate").val(),
      "taskStusCode": $("#taskStusCode").val(),
      "taskPgres": $("#taskPgres").val()

    };
  }
  console.log(" insertData : ", insertData);
  console.log(typeof (insertData.taskEndDate));
  console.log(typeof (insertData.taskStrtDate));



  $.ajax({

    type: 'POST',
    url: '/proj/' + projId[4] + '/taskInsert',
    contentType: "application/json;  charset=utf-8",
    data: JSON.stringify(insertData),
    beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
      xhr.setRequestHeader(header, token);
    },
    async: false,
    dataType: 'text',
    success: function (data) {
      console.log("data : ", data);
      if (data == 1) {
        location.reload();
      } else if (data == -1) {
        alert("권한이 없습니다.")
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.log(errorThrown, textStatus);
    }
  });

  dispNone(); // 모든 속성 readonly and display none;
});

// Delete Kanban Item
// -------------------
$(".delete-kanban-item").on("click", function () {
  $delete_item = kanban_curr_item_id;
  addEventListener("click", function () {
    KanbanExample.removeElement($delete_item);
  });
});

// Kanban Quill Editor
// -------------------
var composeMailEditor = new Quill(".snow-container .compose-editor", {
  modules: {
    toolbar: ".compose-quill-toolbar"
  },
  placeholder: "Write a Comment... ",
  theme: "snow"
});



// kanban Item - Pick-a-Date
$(".edit-kanban-item-date").pickadate();

// Perfect Scrollbar - card-content on kanban-sidebar
if ($(".kanban-sidebar .edit-kanban-item .card-content").length > 0) {
  var kanbanSidebar = new PerfectScrollbar(".kanban-sidebar .edit-kanban-item .card-content", {
    wheelPropagation: false
  });
}

// // select default bg color as selected option
//  $("select").addClass($(":selected", this).attr("class"));

//  // change bg color of select form-control
//  $("select").change(function () {
//   alert("드랍");
//    $(this)
//      .removeClass($(this).attr("class"))
//      .addClass($(":selected", this).attr("class") + " form-control text-white");
//  });

$(".kanban-item").on("click", function (e) { // 디테일
  dispNone(); // 모든 속성 readonly and display none;
  // alert("하위 아이템 클릭");

  
  console.log("modalCts " , modalCts);
  
  let lowWork = e.target.dataset.eid;
  taskId = { "taskId": lowWork };
  console.log(taskId);
  
  $.ajax({

    type: 'POST',
    url: '/proj/' + projId[4] + '/workDetail',
    contentType: "application/json;  charset=utf-8",
    data: JSON.stringify(taskId),
    beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
      xhr.setRequestHeader(header, token);
    },
    dataType: 'json',
    success: function (result) {
      $("#cardtitle").text("하위일감 제목");
      $("#taskb").text("하위일감 내용");
      $("#classification").text("하위일감 정보");
      console.log("result : " , JSON.stringify(result));
      console.log(" taskCts : " + result.taskCts);
      console.log(" result.memCode : " + result.memCode);
      
      $("#taskId").val(result.taskId);
      $("#taskStrtDate").val(result.taskStrtDate);
      $("#taskEndDate").val(result.taskEndDate);
      $("#taskTitle").val(result.taskTitle);
      $("#taskCts").html(result.taskCts);
      $("#writer").val(result.memCode);
      
      modalCts = $("#taskCts").val();


      
      if(result.taskStusCode == 'primary'){
        // $('#taskStusCode option[value='+result.taskStusCode+']').attr('selected', 'selected');
        $("#nomal").attr('selected', 'selected')
        $("#taskStusCode").attr("class","form-control text-white bg-primary");
      }else if(result.taskStusCode == 'danger'){
        $("#high").attr('selected','selected');
        $("#taskStusCode").attr("class","form-control text-white bg-danger");
      }else{
        $("#low").attr('selected', 'selected');
        $("#taskStusCode").attr("class","form-control text-white bg-secondary");
      }
      
      console.log("taskStusCode" , result.taskStusCode);


      if (result.referCts != null) {
        $("#modalresult").append(`
                <div id="referCtsId" class="form-group">
                    <label>반려 사유</label>
                    <textarea readonly="readonly" rows="4" cols="78" style="resize: none;">${result.referCts}</textarea>
                </div>
              `)
      }
      console.log("result : " + result.aprovWhth);

      //진척도 처리
      console.log(" result.taskPgres : ", result.taskPgres);
      $("#taskPgres").val(result.taskPgres);
      $("#value").text(result.taskPgres + "%");

      if (result.aprovWhth == 'y') { // 승인된 일감
          $("#writerdiv").css("display","block");
          $("#writer").attr("readonly",true);
          $("#taskTitle").attr("readonly", true);
          $("#taskPgresdiv").css("display", "block");
          $("#imbtn").css("display", "block");
          $("#taskPgres").css("display", "block");
          $("#taskPgres").attr("readonly", "readonly");
          $("#taskStrtDate").attr("readonly", true);
          $("#taskEndDate").attr("readonly", true);
          $("#taskCts").attr("readonly", true);

          if(authCheck == 'true'){
            $("#btndel").css("display", "block");
          }
          
        } else { // 미승인 일감
          
          if(authCheck === "true"){ // 미승인 일감이면서 리더 
            $("#writerdiv").css("display","block");
            $("#writer").attr("readonly",true);
            $("#imbtn").css("display", "block");
            $("#taskTitle").attr("readonly",true);                    //모달 일감제목 input
            $("#taskCts").attr("readonly",true);                    //모달 일감제목 input
            $("#taskStrtDate").attr("readonly",true);                 //모달 시작일 input
            $("#taskEndDate").attr("readonly",true);                  //모달 종료일 input
            $("#approbtn").css("display","block");                     //모달 반려 버튼
            $("#cpnbtn").css("display","block");                       //모달 승인 버튼
            $("#btndel").css("display", "block");                     
            
            
          }else if(authCheck === "false"){ // 미승인일감이면서 팀원
            $("#imbtn").css("display", "block");
          $("#taskTitle").attr("readonly",true);                    //모달 일감제목 input
          $("#taskCts").attr("readonly",true);                    //모달 일감제목 input
          $("#taskStrtDate").attr("readonly",true);                 //모달 시작일 input
          $("#taskEndDate").attr("readonly",true);                     //모달 종료일 input
          $("#approbtn").css("display","none");                     //모달 반려 버튼
          $("#cpnbtn").css("display","none");
          $("#mbmodimode").css("display","block");

        }

      }

    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.log(errorThrown, textStatus);
    }
  });
  
})

var slider = document.getElementById("taskPgres");
var output = document.getElementById("value");
output.innerHTML = slider.value + '%';

// 진척도 스크롤바
$("#taskPgres").on("change", function () {
  output.innerHTML = this.value + "%";
  console.log("output.innerHTML : ", output.innerHTML);

  let taskId = $("#taskId").val();

  let data = {
    "taskId": taskId,
    "taskPgres": this.value
  };

  $.ajax({

    type: 'POST',
    url: '/proj/' + projId[4] + '/taskPgresUpdate',
    contentType: "application/json;  charset=utf-8",
    data: JSON.stringify(data),
    beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
      xhr.setRequestHeader(header, token);
    },
    success: function (result) {
      // alert("진척도 수정완료");

      setTimeout(function () {
        workpage();
      }, 300);

      $(".kanban-overlay").removeClass("show");
      $(".kanban-sidebar").removeClass("show");


    },
    error: function (jqXHR, textStatus, errorThrown) {
      alert("실패");
      console.log(errorThrown, textStatus);
    }
  });

})


$("#cpnbtn").on("click", function () {
  let result = confirm("승인 하시겠습니까?");
  if (result) {

    $.ajax({

      type: 'POST',
      url: '/proj/' + projId[4] + '/taskApproval',
      contentType: "application/json;  charset=utf-8",
      data: JSON.stringify(taskId),
      beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
        xhr.setRequestHeader(header, token);
      },
      success: function (result) {
        console.log(JSON.stringify(result));
        $(".kanban-overlay").removeClass("show");
        $(".kanban-sidebar").removeClass("show");
        if (result == 1 || result == '1') {
          alert("승인 완료");
        }
        location.reload();

      },
      error: function (jqXHR, textStatus, errorThrown) {
        alert("실패");
        console.log(errorThrown, textStatus);
      }
    });
  } else {
    return;
  }
})

$("#approbtn").on("click", function () {

  let result = confirm("반려 하시겠습니까?");
  if (result) {
    $("#modal").css("display", "block");
  }

  // alert("반려버튼");
})

$("#mbmodifybtn").on("click", function () {
  console.log(" modalCts : " , modalCts);
  console.log(" taskCts : " , taskCts);

  if(modalCts == $("#taskCts").val()){
    // alert("내용수정하세요");
    return;
  }



  insertData = {
    "taskId": $("#taskId").val(),
    "taskCts": $("#taskCts").val(),
    "taskTitle": $("#taskTitle").val(),
    "taskStrtDate": $("#taskStrtDate").val(),
    "taskEndDate": $("#taskEndDate").val(),
    "taskStusCode": $("#taskStusCode").val(),
  };

  console.log("insertData : ", insertData);

  $.ajax({

    type: 'POST',
    url: '/proj/' + projId[4] + '/taskCtsUpdate',
    contentType: "application/json;  charset=utf-8",
    data: JSON.stringify(insertData),
    beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
      xhr.setRequestHeader(header, token);
    },
    success: function (result) {
      alert("수정 성공");


      $("div[data-eid=" + insertData.taskId + "]").find('span').text('반려(확인요망) → 수정완료').css("color", "deepskyblue");
      $("div[data-eid=" + insertData.taskId + "]").find('i').attr("class", "icon-check");



      $(".kanban-overlay").removeClass("show");
      $(".kanban-sidebar").removeClass("show");

      location.reload();


    },
    error: function (jqXHR, textStatus, errorThrown) {
      alert("실패");
      console.log(errorThrown, textStatus);
    }
  });

  dispNone(); // 모든 속성 readonly and display none;

})

$("#modalshow").on("click", function () {
  $("#modal").css("display", "block");
})

$(".modalclose").on("click", function () {
  $("#modal").css("display", "none");
})

//반려 버튼
$("#sendData").on("click", function (event) {
  // alert("클릭");
  let referCts = $("#referCts").val();
  taskIdval = taskId.taskId;
  console.log(taskIdval);

  data = {
    "referCts": referCts,
    "taskId": taskIdval
  }
  console.log("taskId: " + taskId);
  console.log("data : " + JSON.stringify(data));
  $.ajax({

    type: 'POST',
    url: '/proj/' + projId[4] + '/referCts',
    contentType: "application/json;  charset=utf-8",
    data: JSON.stringify(data),
    beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
      xhr.setRequestHeader(header, token);
    },
    success: function (result) {
      $("#modal").css("display", "none");

      $(".kanban-overlay").removeClass("show");
      $(".kanban-sidebar").removeClass("show");

      location.reload();
    },
    error: function (jqXHR, textStatus, errorThrown) {
      alert("실패");
      console.log(errorThrown, textStatus);
    }
  });
});

// 원래 사용하던 코드는 아래 주석처리 해놨고 정상작동하는지 확인
for (let i = 0; i < objdata.fjson.length; i++) {
  console.log("referCts 내용: ", objdata.fjson[i].referCts);
  if (objdata.fjson[i].referCts !== null) { // 받아온 List<TaskVO>에 반려내용이 있을 경우 
    console.log(typeof (objdata.fjson[i].taskId));
    $("div[data-eid=" + objdata.fjson[i].taskId + "]").find('span').text('반려(확인요망)').css("color", "red");
    $("div[data-eid=" + objdata.fjson[i].taskId + "]").find('i').attr("class", "feather icon-x-square");
  }

  if (objdata.fjson[i].workUpdateNum > 0) { // 받아온 List<TaskVO>에 반려내용이 있을 경우 
    $("div[data-eid=" + objdata.fjson[i].taskId + "]").find('span').text('반려(확인요망) → 수정완료').css("color", "deepskyblue");
    $("div[data-eid=" + objdata.fjson[i].taskId + "]").find('i').attr("class", "feather icon-circle");
    // objdata.fjson[i].referCts != 'null'  || objdata.fjson[i].referCts != '' || objdata.fjson[i].referCts != null 
  }

  if (objdata.fjson[i].taskPgres == 100) {
    $("div[data-eid=" + objdata.fjson[i].taskId + "]").find('span').text('완료일감').css("color", "forestgreen");
    $("div[data-eid=" + objdata.fjson[i].taskId + "]").find('i').attr("class", "fa fa-check");
  }

  if (objdata.fjson[i].taskPgres > 10) {
    $("div[data-eid=" + objdata.fjson[i].taskId + "]").append("<div style='font-size: 12px;'>&nbsp&nbsp<i class='fa fa-caret-right'></i>&nbsp;진행률 : " + objdata.fjson[i].taskPgres + "%</div>");
  }

  if(objdata.fjson[i].highTaskId == null){
    
    
    
    
    
    
    
    
    
    
    // let headerarr =  [];
    // headerarr = $(".kanban-board-header");
    
    // console.log(" headerarr : " , headerarr.length);
    // console.log(" i : " , i);
    // console.log("objdata.fjson[i].highTaskId : " , objdata.fjson[i].highTaskId);

    // headerarr[i].append("<div>zz</div>");
    // console.log("숫자");
  }
}

//   for(let i=0; i<objdata.fjson.length; i++){
//      console.log("referCts 내용: " ,objdata.fjson[i].referCts);
//       if(objdata.fjson[i].referCts !== null ){ // 받아온 List<TaskVO>에 반려내용이 있을 경우 
//         console.log(typeof(objdata.fjson[i].taskId));
//         $("div[data-eid="+objdata.fjson[i].taskId+"]").find('span').text('반려(확인요망)').css("color", "red");
//         $("div[data-eid="+objdata.fjson[i].taskId+"]").find('i').attr("class","feather icon-x-square");
//         // objdata.fjson[i].referCts != 'null'  || objdata.fjson[i].referCts != '' || objdata.fjson[i].referCts != null 
//       }
//   }

//   for(let i=0; i<objdata.fjson.length; i++){
//       if(objdata.fjson[i].workUpdateNum > 0 ){ // 받아온 List<TaskVO>에 반려내용이 있을 경우 
//         $("div[data-eid="+objdata.fjson[i].taskId+"]").find('span').text('반려(확인요망) → 수정완료').css("color", "deepskyblue");
//         $("div[data-eid="+objdata.fjson[i].taskId+"]").find('i').attr("class","feather icon-circle");
//         // objdata.fjson[i].referCts != 'null'  || objdata.fjson[i].referCts != '' || objdata.fjson[i].referCts != null 
//       }
//     }

//     for(let i=0; i<objdata.fjson.length; i++){
//       if(objdata.fjson[i].taskPgres == 100){
//         $("div[data-eid="+objdata.fjson[i].taskId+"]").find('span').text('완료일감').css("color", "forestgreen");
//         $("div[data-eid="+objdata.fjson[i].taskId+"]").find('i').attr("class","fa fa-check");
//     }
//   }

//   for(let i=0; i<objdata.fjson.length; i++){
//     if(objdata.fjson[i].taskPgres > 10){
//       $("div[data-eid="+objdata.fjson[i].taskId+"]").append("<div style='font-size: 12px;'>&nbsp&nbsp<i class='fa fa-caret-right'></i>&nbsp;진행률 : "+objdata.fjson[i].taskPgres+"%</div>");
//   }
// }


//상위일감 클릭시 모달
//     $(".kanban-board-header").on("click",function(event){
//       let prid = $(this).parents("div").eq(0).attr("data-id")
//       console.log(prid);
//       alert("상위일감 클릭");
//       $("#taskPgresdiv").css("display","none");
//       $("#cardtitle").html("상위일감 제목");
//       $("#taskb").html("상위일감 내용");
//       $("#classification").html("상위일감 정보");
//       $(".kanban-overlay").addClass("show");
//       $(".kanban-sidebar").addClass("show");

//       $("#sdiv").css("display","none");
//       $("#tdiv").css("display","none");
//       $("#fdiv").css("display","none");

//       taskId  ={
//         "taskId" : prid
//       } 
//     })


function chageLangSelect(e) {
  console.log(e);
  $("#taskStusCode").attr("class", "form-control text-white bg-" + e);
}

function workpage() {
  location.reload();
}

function highWorkdel(e) {
  let workNum = e.path[3].dataset.id;
  data = {
    "taskId": workNum
  }

  if (!confirm("상위일감 삭제 시 하위일감도 같이 삭제됩니다. 삭제하시겠습니까?")) {
    return false;
  } else {
    $.ajax({
      url: "/proj/" + projId[4] + "/highWorkdel",
      type: "post",
      contentType: "application/json;  charset=utf-8",
      data: JSON.stringify(data),
      async: false,
      beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
        xhr.setRequestHeader(header, token);
      },
      success: function (data) {
        if (data == -1) {
          alert("권한이 없습니다. 프로젝트 리더에게 문의하세요.");
        }

        location.reload();
      }, error: function (request, status, error) {
        alert("에러");
      }
    });
  }
}

//리더가 아이템 클릭 시 진척도 안나오게 하는 소스[안먹음]
console.log(" authCheck) : ", authCheck);
if (authCheck == "true") {
  document.getElementById("taskPgresdiv").style.display = "none";
  $("#taskPgresdiv").css("display", "none");
  $("#taskPgresdiv").css("display", "none");
  console.log("리더임");
} else {
  $("#writerdiv").css("display", "none");
  $("#add-kanban").css("display","none");
  document.getElementById("taskPgresdiv").style.display = "block";
  $("#taskPgresdiv").css("display", "block");
  $("#taskPgresdiv").css("display", "block");
}

$("#btndel").on("click",function(){ // 디테일 삭제버튼
    let taskId = $("#taskId").val();
    console.log(" taskId : " , taskId);

    data = {
      "taskId" : taskId
    }

    $.ajax({
        url: "/proj/" + projId[4] + "/lowWorkDel",
        type: "post",
        contentType: "application/json;  charset=utf-8",
        data: JSON.stringify(data),
        async: false,
        beforeSend: function (xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
          xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            location.reload();
          
        }, error: function (request, status, error) {
          alert("에러");
        }
    });
})


function dispNone(){                         // 모든 속성 readonly and display none;
  console.log("dispNone 호출")
  $("#taskTitle").attr("readonly","true");                    //모달 일감제목 input
  $("#taskCts").attr("readonly","true");                    //모달 일감제목 input
  $("#taskStrtDate").attr("readonly","true");                 //모달 시작일 input
  $("#taskEndDate").attr("readonly","true");                  //모달 종료일 input
  $("#approbtn").css("display","none");                     //모달 반려 버튼
  $("#cpnbtn").css("display","none");                       //모달 승인 버튼
  $("#mbmodifybtn").css("display","none");                  //모달 수정 버튼
  $("#btndel").css("display","none");                       //모달 삭제 버튼
  $("#btnsave").css("display","none");                      //모달 저장 버튼
  $("#taskPgresdiv").css("display","none");                 //모달 진척도 div 버튼
  $("#imbtn").css("display","none");                 //모달 진척도 div 버튼
  $("#writerdiv").css("display","none");
  $("#mbmodimode").css("display","none");
  $("#nomal").attr('selected', false);
  $("#low").attr('selected', false);
  $("#high").attr('selected', false);
} 

$("#mbmodimode").on("click",function(){
  $("#mbmodimode").css("display","none");
  $("#mbmodifybtn").css("display", "block");    
  $("#taskTitle").attr("readonly",false);                    //모달 일감제목 input
  $("#taskCts").attr("readonly",false);                    //모달 일감제목 input
  $("#taskStrtDate").attr("readonly",false);                 //모달 시작일 input
  $("#taskEndDate").attr("readonly",false);                    

})


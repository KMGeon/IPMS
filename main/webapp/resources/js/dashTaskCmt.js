
var currentURL = window.location.href
let projId = currentURL.split('/');
console.log("currentURL : " + currentURL);
console.log("projId : " + projId[4]);



$(function(){

  $("#repAdd").on("click", function(){
    // alert("댓글 등록 이벤트 IN")
    
        data = {
        "writer" : memCode,
        "taskCmtCts": $("#taskCmtCts").val(),
        "taskId" : $("#taskId").text(),
        }
  
        console.log("data : " , data)
  
            $.ajax({ 
                type : 'POST',
                url : '/proj/dashHighCmtInsert',
                contentType : "application/json;  charset=utf-8",
                async : false,
                data :  JSON.stringify(data) ,
                beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                  xhr.setRequestHeader(header, token);
                },
                success : function(result) {
                  location.reload();
              },
              error: function (jqXHR, textStatus, errorThrown)
              {
                  alert("실패다");
                    console.log(errorThrown,textStatus);
              }
            });
  
    
  });

  

})





function fn_replyreplyinput(param){
  let issueCmtId = param;
  console.log("누름");
  document.getElementById("taskCmtId"+param).style.display = "none";

  $("#taskCmtCts"+param).append(`
          <div class="row" style="padding-top:7px; padding-bottom:7px;">
            <div class="col-sm-10">
              <input type="text" class="form-control" id="lowtaskCmtCts${param}" name="taskCmtCts" placeholder="댓글을 입력하세요.">
            </div>
            <div class="col-sm-2">
              <button onclick="fn_replyAdd(${param})" type="button" class="btn btn-secondary" style="width: 450px;" id="repAdd${param}">댓글 작성</button>
            </div>
          </div>`);
}

function fn_replyAdd(param){
    console.log("param " , param);
    
    data = {
      "highCmtId" : param ,
      "taskCmtCts" : $("#lowtaskCmtCts"+param).val(),
      "writer" : memCode,
      "taskId" : $("#taskId").text()
    }
    console.log("data " , data);

    $.ajax({ 
      type : 'POST',
      url : '/proj/dashlowCmtInsert',
      contentType : "application/json;  charset=utf-8",
      async : false,
      data :  JSON.stringify(data) ,
      beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
        xhr.setRequestHeader(header, token);
      },
      success : function(result) {
        location.reload();
        // alert("하위댓글 인설트 성공");
    },
    error: function (jqXHR, textStatus, errorThrown)
    {
          console.log(errorThrown,textStatus);
    }
  });
}

// 하위 댓글 삭제
function fn_lowCmtdelete(param){
    // alert("삭제 펑션");
    console.log("param : " , param);

    data ={
      "issueId" : $("#issueId").text(),
      "issueCmtId" : param
    }

    console.log("수정데이터 : " , data);

    
    $.ajax({ 
      type : 'POST',
      url : '/proj/'+projId[4]+'/lowCmtDel',
      contentType : "application/json;  charset=utf-8",
      async : false,
      data :  JSON.stringify(data) ,
      beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
        xhr.setRequestHeader(header, token);
      },
      success : function(result) {
        // alert("하위댓글 삭제 성공");
        location.reload();
    },
    error: function (jqXHR, textStatus, errorThrown)
    {
        alert("하위댓글 삭제 실패");
          console.log(errorThrown,textStatus);
    }
  });
}

//상위 댓글 삭제
function fn_delete(param){
  
  
  data ={
    "issueId" : $("#issueId").text(),
    "issueCmtId" : param
  }
  
  console.log("param : " , param);
  console.log("수정데이터 : " , data);

  if (!confirm("상 하위 모든 댓글이 삭제됩니다. 삭제하시겠습니까?")) {
    return false;
  
  }else {
        $.ajax({ 
          type : 'POST',
          url : '/proj/'+projId[4]+'/highCmtDel',
          contentType : "application/json;  charset=utf-8",
          async : false,
          data :  JSON.stringify(data) ,
          beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
            xhr.setRequestHeader(header, token);
          },
          success : function(result) {
            // alert("댓글 수정성공");
            location.reload();
          },
          error: function (jqXHR, textStatus, errorThrown)
          {
            alert("실패다");
              console.log(errorThrown,textStatus);
          }
      });
  }
  
}
function fn_update(param){
  // alert("수정 버튼 클릭");
  console.log("param : " , param);
	$("#repContent"+param).html("");	
  //$("#repContent"+param).attr("contenteditable","true").css("border","1px solid").css("width","500px");
  $("#repInput"+param).attr("type","text");
  
  $("#cmtDelete"+param).remove();
  $("#replywrite"+param).css("display","none");
  $("#repInput"+param).val($("#taskCmtCts"+param).text());
  $("#cmtModify"+param).remove();
  $("#modidiv"+param).append('<a onclick="fn_replymodifiy('+param+')" style=" text-decoration: underline; width:33px; float:right;">수정</a>');
  $("#modidiv"+param).append('<a onclick="fn_replycancel('+param+')" style=" text-decoration: underline; width:33px; float:right;">취소</a>');
}

// 답글 수정
 function fn_replymodifiy(param){
  // alert("답글수정");
  console.log("수정 : " , param)

  data ={
    "issueCmtCts" :  $("#repInput"+param).val(),
    "issueId" : $("#issueId").text(),
    "issueCmtId" : param
  }

  console.log("수정데이터 : " , data);

  
  $.ajax({ 
    type : 'POST',
    url : '/proj/'+projId[4]+'/replymodify',
    contentType : "application/json;  charset=utf-8",
    async : false,
    data :  JSON.stringify(data) ,
    beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
      xhr.setRequestHeader(header, token);
    },
    success : function(result) {
      // alert("댓글 수정성공");
      location.reload();
  },
  error: function (jqXHR, textStatus, errorThrown)
  {
      alert("실패다");
        console.log(errorThrown,textStatus);
  }
});

}

function fn_replycancel(param){
  location.reload();
}

$("#issueupbtn").on("click", function(){
  location.href = '/proj/'+projId[4]+'/issueUpdate';
})

$("#comple").on("click",function(){ // 해결
  data ={
    "issueId" : $("#issueId").text() ,
    "issueStusCode" : $("#comple").text()
  }
  
  console.log("data : " , data);
  
  $.ajax({ 
    type : 'POST',
    url : '/proj/issueStatusCompl',
    contentType : "application/json;  charset=utf-8",
    async : false,
    data :  JSON.stringify(data) ,
    beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
      xhr.setRequestHeader(header, token);
    },
    success : function(result) {
      if(result == 1 )
        {
          $("#noncomple").removeAttr("active");
          $("#comple").attr("class","active");
        }
        
        location.reload();
      },
      error: function (jqXHR, textStatus, errorThrown)
    {
      alert("실패다");
          console.log(errorThrown,textStatus);
        }
      });
})


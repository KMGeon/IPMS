
var currentURL = window.location.href
let projId = currentURL.split('/');
console.log("currentURL : " + currentURL);
console.log("projId : " + projId[4]);



$(function(){

  $("#statuschange").on("change" , function(){
    data = {
      issueStusCode :  $("#statuschange").val()
    }


	$.ajax({ 
	    type : 'POST',
	    url : '/proj/'+projId[4]+'/IssueStusChange',
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
})

  $("#repAdd").on("click", function(){
    // alert("댓글 등록 이벤트 IN")
    
        data = {
            "writer" : memCode,
      "issueCmtCts": $("#issueCmtCts").val(),
            "issueId" : $("#issueId").text(),
        }
  
        console.log("data : " , data)
  
            $.ajax({ 
                type : 'POST',
                url : '/proj/'+projId[4]+'/IssueHighCmtInsert',
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

  

  data = {
    "issueId" : issueId
  };
  
  let highCmt="";
  let lowCmt;
  
  $.ajax({  //댓글 리스트 ajax
    type : 'POST',
    url : '/proj/'+projId[4]+'/getAllCmtList',
    contentType : "application/json;  charset=utf-8",
    async : false,
    data :  JSON.stringify(data) ,
    beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
      xhr.setRequestHeader(header, token);
    },
    success : function(result) {
      console.log("result[0] : " , result);
      console.log("result[0] : " , result.length);
      
      //조회해온 result가 없을경우
      if(result.length == '0' ){
        console.log("댓글없음")
        console.log("result.length : " , result.length);
        $("#repListAdd").html(`<div>등록된 댓글이 없습니다.</div>`);
        return false;
      }
      
      
      for(let i=0; i<result.length; i++){// first for start
        if(result[i].highCmtId == null){
            // highCmtId가 null인 상위아이디를 찾는다.
            console.log("상위 result[i].issueCmtCts : " , result[i].issueCmtCts);
  
            highCmt +=`<hr/>
            <form style="padding-bottom:10px;" class='form-horizontal' id='highmodifydiv${result[i].issueCmtId}'>
              <div class='user-block'>
                <div>
                    <div style='padding-bottom: 5px;'>
                        <div style='font-size:15px;'><i class='fa fa-user-o'></i>&nbsp;&nbsp;${result[i].writer}</div>
                      <span class='username'> 
                        <span style='font-size: 8px; color: grey;'>${result[i].issueCmtWriteDate}</span>
                      </span>
                  </div>
                  <div id='modidiv${result[i].issueCmtId}'  style='display:flex;'>
                        <div id='repContent${result[i].issueCmtId}'>${result[i].issueCmtCts}</div>&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;<input style='width:400px;' type='hidden' id='repInput${result[i].issueCmtId}' value='${result[i].issueCmtCts}'>
                          <div id='issueCmtId:${result[i].issueCmtId}'>
                          &nbsp;&nbsp;<a id='replywrite${result[i].issueCmtId}' style='font-size: 12px; text-decoration: underline;' onclick='fn_replyreplyinput(${result[i].issueCmtId})' type='button' >댓글작성</a> \t
                          &nbsp;&nbsp;`
                          if(result[i].writer == writer){
                            highCmt += 
                            `<a style=' color : red; font-size: 12px; text-decoration: underline;' id='cmtDelete${result[i].issueCmtId}' onclick='fn_delete(${result[i].issueCmtId})' type='button'>삭제</a> \t
                              <a style='color : grey; font-size: 12px; text-decoration: underline;' id='cmtModify${result[i].issueCmtId}' onclick='fn_update(${result[i].issueCmtId})' type='button'>수정</a>`
                          }
                    highCmt += `</div>
                    </div>
                  </div>
              </div>
          </form>`
          }
          
          
          for(let j=0; j<result.length; j++){ //second for start
            //하위 일감 찾기
            if(result[i].issueCmtId == result[j].highCmtId ){
              console.log(" 하위 result[i].issueCmtCts : " , result[j].issueCmtCts);
  
              highCmt +=`<form style='padding-left:10px;' class='form-horizontal' id='modifydiv${result[j].issueCmtId}' >
                            <div class='user-block'>
                              <div>
                                <div style='padding-bottom: 5px;' id='issueCmtId:${result[j].issueCmtId}'>
                                  <span class='username'> </span>
                                  <div style='font-size:15px;'> <i class='feather icon-corner-down-right'></i> ${result[j].writer}  <i class='feather icon-user'></i>  <span style='font-size: 8px; color: grey;'>${result[j].issueCmtWriteDate}</span> </div>
                                </div>
                                <div id='modidiv${result[j].issueCmtId}' style='display:flex;'>
                                  <div style='display:flex;' id='repContent${result[j].issueCmtId}'>&nbsp;&nbsp;&nbsp;&nbsp;${result[j].issueCmtCts} &nbsp;&nbsp;
                                  </div>
                                  &nbsp;&nbsp;&nbsp;&nbsp;<input style='width:400px;' type='hidden' id='repInput${result[j].issueCmtId}' value='${result[j].issueCmtCts}'>
                                  `
                                if(result[j].writer == writer){
                                  highCmt += 
                                  `<a style=' color : red;font-size: 12px; text-decoration: underline;' id='cmtDelete${result[j].issueCmtId}' onclick='fn_lowCmtdelete(${result[j].issueCmtId})' type='button'>삭제</a> &nbsp;
                                   <a style=' color : grey; font-size: 12px; text-decoration: underline;' id='cmtModify${result[j].issueCmtId}' onclick='fn_update(${result[j].issueCmtId})' type='button'>수정</a>`
                                }
                      highCmt +=`</div>
                              </div>
                              <br>
                            </div>
                        </form>`
            }
          
          } // second for end
      }// first for end
      $("#repListAdd").html(highCmt);
      console.log("highCmt , " , highCmt);
  
      return false;
  
  },
  error: function (jqXHR, textStatus, errorThrown)
  {
      alert("실패다");
        console.log(errorThrown,textStatus);
  }
  });
})


function fn_replyreplyinput(param){
  console.log(param);
  console.log($("#issueCmtId:"+param));
  let issueCmtId = param;

  document.getElementById("issueCmtId:"+param).style.display = "none";

  $("#repContent"+param).append(`
          <div class="row" style="padding-top:7px; padding-bottom:7px;">
            <div class="col-sm-10">
              <input type="text" class="form-control" id="replyCts${param}" name="issueCmtCts" placeholder="댓글을 입력하세요.">
            </div>
            <div class="col-sm-2">
              <button onclick="fn_replyAdd(${param})" type="button" class="btn btn-secondary" style="width: 300px;" id="repAdd${param}">댓글 작성</button>
            </div>
          </div>`);
}

function fn_replyAdd(param){
    console.log("param " , param);
    
    data = {
      "highCmtId" : param ,
      "issueCmtCts" : $("#replyCts"+param).val(),
      "issueId" : $("#issueId").text()
    }
    console.log("data " , data);

    $.ajax({ 
      type : 'POST',
      url : '/proj/'+projId[4]+'/lowCmtInsert',
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
    url : '/proj/'+projId[4]+'/issueStatusCompl',
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

$("#noncomple").on("click",function(){ // 미해결
  data ={
    "issueId" : $("#issueId").text(),
    "issueStusCode" : $("#noncomple").text()
  }

  console.log("data : " , data);

    $.ajax({ 
      type : 'POST',
      url : '/proj/'+projId[4]+'/issueStatusnonCompl',
      contentType : "application/json;  charset=utf-8",
      async : false,
      data :  JSON.stringify(data) ,
      beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
        xhr.setRequestHeader(header, token);
      },
      success : function(result) {
        if(result == 1 )
        {
          $("#noncomple").attr("class","active");
          $("#comple").removeAttr("active");
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

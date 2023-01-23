
var currentURL = window.location.href
let projId = currentURL.split('/');
console.log("currentURL : " + currentURL);
console.log("projId : " + projId[4]);



$(function(){

$.ajax({
        url : "/proj/"+projId[4]+"/taskListSelect",
        dataType : "json",
        type : "post",
        beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
                xhr.setRequestHeader(header, token);
              },
        success : function(data){
            var searchval;
            console.log("data : " + data.vo.taskId);
            console.log("data : " + data.vo.taskTitle);
            console.log("data : " + JSON.stringify(data));

            for(let i=0; i<data.vo.length; i++){
                searchval  = '<option value='+data.vo[i].taskId+'>'+data.vo[i].taskTitle+'</option>';
                $("#taskId").append(searchval);
            }
			console.log("searchval : " + searchval);

        },error:function(request,status,error){
            alert("에러");
         }
      });

$("#sendbtn").on("click",function(){
  var textareaVal = $("textarea[name=issueCts]").text();
  var issueCts = CKEDITOR.instances.issueCts.getData();
  let inputFile = $("#itgrnAttachFileNum");
  let files = inputFile[0].files;
  
  console.log("files : " , files);

  let formData = new FormData();

  for(let i=0; i<files.length; i++){
      formData.append("uploadFile",files[i]);
  }
  formData.append("issueTitle",$("#issueTitle").val());
  formData.append("taskId",$("#taskId").val());
  formData.append("issueCts",issueCts);
  formData.append("issueId",$("#taskId").val());
  formData.append("issueId",$("#taskId").val());
  formData.append("rgstId",memCode);
  

  console.log("formData : " , formData);
  console.log("$(#itgrnAttachFileNum) : " , files );


  $.ajax({
      url : "/proj/"+projId[4]+"/issueDataInsert",
      data : formData,
      contentType : false,
      processData: false,
      type : "post",
      beforeSend : function(xhr) {   // 데이터 전송 전 헤더에 csrf값 설정
              xhr.setRequestHeader(header, token);
            },
      success : function(data){
        location.href = "/proj/"+projId[4]+"/issueboard";





      },error:function(request,status,error){
          alert("에러");
       }
    });
});

  
  

 
});


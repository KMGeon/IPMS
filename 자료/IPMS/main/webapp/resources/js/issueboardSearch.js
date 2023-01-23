var currentURL = window.location.href
let projId = currentURL.split('/');
console.log("currentURL : " + currentURL);
console.log("projId : " + projId[4]);

$(function(){
  $("#searchbtn").on("click", function(){

    let cateval = $("#cate").val();
    let searchCts = $("#searchCts").val();


  })

})
$(function(){
  var search_list = $("#jpcity-search-result-latitude");
  function AppendJpcitiesName(jpcity){
  var html = `<div class="jpcity-name-stage-lat" data-jpcity__id="${jpcity.id}">
                <p class="jpcity-name" style="padding-left: 10px;">${jpcity.jpkanji}</p>             
              </div>` 
   search_list.append(html);
  } 
  $(function(){
    $(".clearfix_lat").on("keyup", function(){
    var input = $(".clearfix_lat").val();
    $.ajax({
      type: 'get',
      url: '/jpcities/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(jpcities) {
      $(search_list).empty();
      if(input != "") {
        $(search_list).show();
        jpcities.forEach(function(jpcity){
          AppendJpcitiesName(jpcity);
        });
      } else {
        $(search_list).empty();
        $(search_list).hide();
      }   
    })
  })
 })
})
$(function(){
  var search_list = $("#jpcity-search-result-climate");
  function AppendJpcitiesNameClimate(jpcity){
  var html = `<div class="jpcity-name-stage-cli" data-jpcity__id="${jpcity.id}">
               <p class="jpcity-name" style="padding-left: 10px;">${jpcity.jpkanji}</p>             
              </div>` 
  search_list.append(html);
  } 

  $(function(){
    $(".clearfix_cli").on("keyup", function(){
    var input = $(".clearfix_cli").val();
    $.ajax({
      type: 'get',
      url: '/jpcities/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(jpcities) {
      $(search_list).empty();
      if(input != "") {
        $(search_list).show();
        jpcities.forEach(function(jpcity){
        AppendJpcitiesNameClimate(jpcity);
        });
      } else {
        $(search_list).empty();
        $(search_list).hide(); 
       }   
     })
  })    
  })
 })

$(document).on("click", ".jpcity-name-stage-lat", function () {
    var jpcityId = $(this).data("jpcity__id");
    var jpcityName = $(this).text().trim();
    $(".search-form-lat").empty();
    $(".search-form-lat").val(jpcityName);
    $(".submit-stage_lat").val(jpcityId);
    $("#jpcity-search-result-latitude").empty();
    $("#jpcity-search-result-latitude").hide();
    console.log(jpcityId);
  })
$(document).on("click", ".jpcity-name-stage-cli", function () {
  var jpcityId_cl = $(this).data("jpcity__id");
  var jpcityName_cl = $(this).text().trim();
  $(".search-form-cli").empty();
  $(".search-form-cli").val(jpcityName_cl);
  $(".submit-stage_cli").val(jpcityId_cl);
  $("#jpcity-search-result-climate").empty();
  $("#jpcity-search-result-climate").hide();
})

function urlReplace(){
  location.href= '/';
}

$(document).on("click", ".submit_lat", function () {
  str = $(".search-form-lat").val();
  if(str != ""){
  location.href= './jpcities/search_result?utf8=✓&keyword='+str;
  }else{
  alert('都市名を先に入力お願いします！')
  }
})

$(document).on("click", ".submit_cli", function () {
  str = $(".search-form-cli").val();
  if(str != ""){
  location.href= './jpclimates/search_result?utf8=✓&keyword='+str;
  }else{
  alert('都市名を先に入力お願いします！')
  }
})

$(function(){
  var search_list = $("#chcity-search-result-latitude");
  function AppendChcitiesName(chcity){
  var html = `<div class="chcity-name-stage-lat" data-chcity__id="${chcity.id}">
                <p class="chcity-name" style="padding-left: 10px;">${chcity.simplified}</p>             
              </div>` 
   search_list.append(html);
  } 
  $(function(){
    $(".clearfix_lat_ch").on("keyup", function(){
    var input = $(".clearfix_lat_ch").val();
    if (input !== ""){
    $.ajax({
      type: 'get',
      url: '/chcities/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(chcities) {
      $(search_list).empty();
      if(input != "") {
        $(search_list).show();
        chcities.forEach(function(chcity){
          AppendChcitiesName(chcity);
        });
      } else {
        $(search_list).hide();
        $(search_list).empty(); 
      }   
    })
  }    
  })
})
})

$(function(){
  var search_list = $("#chcity-search-result-climate");
  function AppendChcitiesNameClimate(chcity){
  var html = `<div class="chcity-name-stage-cli" data-chcity__id="${chcity.id}">
                <p class="chcity-name" type="hidden" style="padding-left: 10px;">${chcity.simplified}</p>
                </div>` 
  search_list.append(html);
  } 

  $(function(){
    $(".clearfix_cli_ch").on("keyup", function(){
    var input = $(".clearfix_cli_ch").val();
    if (input !== preWord){
    $.ajax({
      type: 'get',
      url: '/chcities/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(chcities) {
      $(search_list).empty();
      if(input != "") {
        $(search_list).show();
        chcities.forEach(function(chcity){
        AppendChcitiesNameClimate(chcity);
        });
      } else {
        $(search_list).hide();
        $(search_list).empty(); 
      }   
    })
  }    
  })
 })
}) 

$(document).on("click", ".chcity-name-stage-lat", function () {
    var chcityId = $(this).data("chcity__id");
    var chcityName = $(this).text().trim();
    $(".search-form-lat").empty();
    $(".search-form-lat").val(chcityName);
    $(".submit").val(chcityId);
    $("#chcity-search-result-latitude").empty();
    console.log(chcityId);
  })
$(document).on("click", ".chcity-name-stage-cli", function () {
  var chcityId_cl = $(this).data("chcity__id");
  var chcityName_cl = $(this).text().trim();
  $(".search-form-cli").empty();
  $(".search-form-cli").val(chcityName_cl);
  $(".submit_stage_cli_ch").val(chcityId_cl);
  $("#chcity-search-result-climate").empty();
})

$(document).on("click", ".submit_lat_ch", function () {
  str = $(".search-form-lat").val();
  if(str != "") {
  location.href= 'search_result?utf8=✓&keyword='+str;
  }else{
  alert('请先输入城市名')
  }
})

$(document).on("click", ".submit_cli_ch", function () {
  str = $(".search-form-cli").val();
  if(str != "") {
  location.href= '../chclimates/search_result?utf8=✓&keyword='+str;
  }else{
  alert('请先输入城市名')
  }
})

function urlReplace_ch(){
  location.href= '/chcities/search';
}
function change_country_ch(){
  location.href= '/';
}


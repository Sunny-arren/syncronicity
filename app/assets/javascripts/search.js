// window.addEventListener('DOMContentLoaded', function(){
// $(function(){
//   $("body").click(function(){
//     alert("ok!!!");
//   })
// })
// // })

$(function(){
  var search_list = $("#jpcity-search-result-latitude");
  function AppendJpcitiesName(jpcity){
  var html = `<div class="jpcity-name-stage-lat">
                <p class="jpcity-name" type="hidden" style="padding-left: 10px;" data-jpcity__id="${jpcity.id}" data-jpcity__name=${jpcity.jpkanji}>${jpcity.jpkanji}</p>             
              </div>` 
   search_list.append(html);
  } 
  $(function(){
    $(".clearfix_lat").on("keyup", function(){
    var input = $(".clearfix_lat").val();
    var preWord;
    if (input !== preWord){
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
        $(search_list).hide();
        $(search_list).empty(); 
      }   
      preWord = input;
    })
  }    
  })
})
})

$(function(){
  var search_list = $("#jpcity-search-result-climate");
  function AppendJpcitiesName(jpcity){
  var html = `<div class="jpcity-name-stage-cli">
                <p class="jpcity-name" type="hidden" style="padding-left: 10px;" data-jpcity__id="${jpcity.id}" data-jpcity__name=${jpcity.jpkanji}>${jpcity.jpkanji}</p>
                </div>` 
  search_list.append(html);
  } 

  $(function(){
    $(".clearfix_cli").on("keyup", function(){
    var input = $(".clearfix_cli").val();
    var preWord;
    if (input !== preWord){
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
        $(search_list).hide();
        $(search_list).empty(); 
      }   
      preWord = input;
    })
  }    
  })
 })
  $(document).on("click", ".jpcity-name-stage-lat", function () {
      var jpcityId = $(this).data("jpcity__id");
      var jpcityName = $(this).text().trim();
      $(".search-form-lat").empty();
      $(".search-form-lat").val(jpcityName);
      // $(".").val(jpcityId);
      $("#jpcity-search-result-latitude").empty();
    });

  

  $(document).on("click", ".jpcity-name-stage-cli", function () {
    var jpcityId_cl = $(this).data("jpcity__id");
    var jpcityName_cl = $(this).text().trim();
    $(".search-form-cl").empty();
    $(".search-form-cl").val(jpcityName_cl);
    $(".jpcitiy-name__id").val(jpcityId_cl);
    $("#jpcity-search-result-climate").empty();
  });
})

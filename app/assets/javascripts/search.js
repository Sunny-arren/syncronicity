// window.addEventListener('DOMContentLoaded', function(){
// $(function(){
//   $("body").click(function(){
//     alert("ok!!!");
//   })
// })
// // })

$(function(){
  var search_list = $("#jpcity-search-result");
  function AppendJpcitiesName(jpcity){
  var html = `<div class="jpcity-name-stage">
                <p class="jpcity-name">${jpcity.jpkanji}</p>
                <a class="jpcitiy-name__id" data-jpcity__id="${jpcity.id}" </a>
              </div>` 
   search_list.append(html);
  }

  $(function(){
    $(".clearfix").on("keyup", function(){
    var input = $(".clearfix").val();
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
    })
    preWord = input; 
  }    
  })
})
})

$(document).on("click", ".jpcity-name-stage", function () {
  // var jpcityId = $(this).data("jpcity__id");
  var jpcityName = $(this).text();
  // $("#brands-search-form").empty();
  $(".search-form[clearfix]").value = jpcityName
  $(".jpcitiy-name__id").value;
  $("#jpcity-search-result").empty();
  console.log("hello")
});

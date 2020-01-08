// $(document).on("turbolinks:load",function(){



//   function buildHTML(jpcity){
//     var html =`
//     <div>
//     <p>
//     いえーーーい！
//     </p>
//     </div>

//     `
//     return html
//   }
function rotate(){
 var id = gon.jpcity_id
 $.ajax({
  type: 'get',
  url: './rotate',
  data: { id },
  dataType: 'json',
  })
  .done(function() {
    location.href = './id'
  })
  .fail(function(){
  alert('error');
  })
  console.log(id)
}

  // .done(function(data) {
  //   // $(body).empty()
  //   alert("don");
  //   // data.forEach(function(){
  //     // insertHTML = buildHTML(jpcity);
  //     // $("#test").append(insertHTML);
  //       })
  //  .fail(function(){
  //   alert('error');
  //  })
  //  .always(function(){
  //   alert('OK')
  //  });  
    
//     // var formData = new FormData(this)
//     // var url = $(this).attr('action')
//     // debugger;

//     // $(function(){
//     //   var all_cities = gon.ordered_chcities;
//     //   $('#rotate_city').click(all_cities, function (e) {
//     //     console.log(e.Array) 
//       //このやり方では、all_citiesを取得できなかった。
//       //「元のソースの取得中にエラーが発生しました: request failed with status 403
//       //ソース URL: <unknown></unknown>

  
//   // $.ajax({
//   //   type: 'get',
//   //   url: '/jpcities/search',
//   //   data: { keyword: input },
//   //   dataType: 'json'
//   // })
//   // .done(function(jpcities) {
//   //   $(search_list).empty();
//   //   if(input != "") {
//   //     $(search_list).show();
//   //     jpcities.forEach(function(jpcity){
//   //     AppendJpcitiesName(jpcity);
//   //     });
//   //   } else {
//   //     $(search_list).hide();
//   //     $(search_list).empty(); 
//   //   }   
//   //   preWord = input;

//   // })
//  })
// });
// return false
// });

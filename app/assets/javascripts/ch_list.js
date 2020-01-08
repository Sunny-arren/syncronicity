$(function(){
$('.detail').hide(); 
$('#jp1').show();
$('.s2').click(function(){
  $('.detail').hide();
  $('#jp2').show();
  return false;
});
})

$(function(){
$('.s3').click(function(){
  $('.detail').hide();
  $('#jp3').show();
  console.log("goodluck!")
  return false;
});
})

$(function(){
$(".s4").click(function(){
  $('.detail').hide();
  $('#jp4').show();
  console.log("goodnight!")
  return false;
});
})

function return_first_jp(){
  $('.detail').hide();
  $('#jp1').show();
  return false;
  }

function urlReplace_ch(){
  location.href= '/chcities/search';
}
function change_country_ch(){
  location.href= '/';
}

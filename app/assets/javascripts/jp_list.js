$(function(){
  $('.spec').hide();
  $('#ch1').show();
  $('.s02').click(function(){
    $('.spec').hide();
    $('#ch2').show();
    return false;
  });
  })
  
  $(function(){
  $('.s03').click(function(){
    $('.spec').hide();
    $('#ch3').show();
    return false;
  });
  })
  
  $(function(){
  $(".s04").click(function(){
    $('.spec').hide();
    $('#ch4').show();
    return false;
  });
  })
  
  function return_first_ch(){
    $('.spec').hide();
    $('#ch1').show();
    return false;
    }


  function urlReplace(){
    location.href= '/';
    }
  
  function change_country_jp(){
    location.href= '/chcities/search';
    }

$(function(){
$('#allmap2').hide();
$('.map_emerge2').click(function(){
  $('#allmap2').show();
  return false;
});
})

$(function(){
  $('#allmap3').hide();
  $('.map_emerge3').click(function(){
    $('#allmap3').show();
    return false;
  });
  })

$(function(){
  $('#allmap4').hide();
  $('.map_emerge4').click(function(){
    $('#allmap4').show();
    return false;
  });
  })

  
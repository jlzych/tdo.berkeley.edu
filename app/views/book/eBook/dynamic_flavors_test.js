$(document).ready(function(){
  $(".LIS").hide();
  $(".citation").hide();
  $(".typeless").hide();

  $("#LIS").live("click",function(){
    $(".LIS").fadeToggle("slow", "linear");
  });
  $("#typeless").live("click",function(){
    $(".typeless").fadeToggle();
  });
  $("#citation").live("click",function(){
    $(".citation").toggle();
  });
  
  $("#text_dec").live("click",function(){
    $("body").css("font-size",function(){
      pt = $("body").css("font-size");
      pt = parseFloat(pt);
      return (pt-2)
    });
  });

  $("#text_inc").live("click",function(){
    $("body").css("font-size",function(){
      pt = $("body").css("font-size");
      pt = parseFloat(pt);
      return (pt+2)
    });
  });
    
});
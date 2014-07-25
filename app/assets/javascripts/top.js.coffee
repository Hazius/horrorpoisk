# Поиск:

$(document).ready ->

  default_opacity = $("#div_search").css("opacity")
  default_width   = $("#field_input_of_search").css("width")

  $("#div_search").hover(
    ->  
      $(this).stop(true).animate({opacity: 1}, 1000)
      $("#field_input_of_search").animate({width: "760px"}, 1000)
    ->  
      $(this).stop(true).animate({opacity: default_opacity}, 1000)
      $("#field_input_of_search").stop(true).animate({width: default_width}, 1000)
  )
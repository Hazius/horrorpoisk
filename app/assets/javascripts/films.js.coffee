# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

	# Увеличение картинки почти во весь экран:
	lv_image_height_default = $("#image_at_show_film").css("height")
	$("#image_at_show_film").click ->
		if $(@).css("position") != "fixed"	
			$("#darkening_window").css("display","block")
			$(@).css({"position":"fixed", "height":"90%", "top":"30px"})	
		else		
			$("#darkening_window").css("display","none")
			$(@).css({"position":"static","height":lv_image_height_default,"top":"0"})

	# События для отображения полной информации в списке фильмов:
	lv_white = "#FFFFFF"
	lv_default_height = $(".div_top_of_description_of_film").css("height")

	$("div.div_top_of_description_of_film").click ->
      $(@).css("background-color", lv_white)
      $(@).css("position", "absolute")
      $(@).css("overflow", "auto")
      $(@).stop(true).animate({height: "300px"}, 300)
  
	$("div.div_top_of_description_of_film").hover(
		-> 
			"nil"
		->
      $(@).stop(true)
      $(@).css("background-color", "transparent")
      $(@).css("position", "static")
      $(@).css("overflow", "hidden")
      $(@).css("height", lv_default_height)
  )

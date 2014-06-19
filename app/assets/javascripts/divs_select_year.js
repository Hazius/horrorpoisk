var blackColor = "#000000";
var whiteColor = "#FFFFFF";
var smokyColor = "#F5F5F5";
var grayColor  = "#808080";
var speed = 800;

$(document).ready(function() 
{
	$(".div_select_year").hover(
	function() {			
		$(this).stop().animate({ "background-color": "#000000" }, speed);
	}, function() {	
		$(this).stop().animate({ backgroundColor: smokyColor }, speed);		
	});
});
$(document).ready(function() 
{

	$("#submit_up_for_comment").click(
	function()
	{	
		$("#fiels_liked_for_comment").val("true");
	});

	$("#submit_down_for_comment").click(
	function()
	{	
		$("#fiels_liked_for_comment").val("false");
	});

});


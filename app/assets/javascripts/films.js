// События для действий с картинкой:
$(document).ready(function() 
{
	var image_height_default = $("#image_at_show_film").css("height");
	$("#image_at_show_film").click(function(){
		if ($(this).css("position") != "fixed")
		{
			$("#darkening_window").css("display","block");
			$(this).css({"position":"fixed",
					"height":"90%",
					"top":"30px"					
					});
		}
		else
		{
			$("#darkening_window").css("display","none");
			$(this).css({"position":"static",
					"height":image_height_default,
					"top":"0"					
					});
		}		
	});
});

// События для формы ввода комментариев:
/*
var message = "Отзыв появится после проверки модератором.";
var name_text_area = "#text_area_for_comment";
$(document).ready(function() 
{
	$(name_text_area).hover(
      	function () {
      			if ( $(this).val() == "" )
      			{
      				$(this).css("color", "#8A8A8A");
      				$(this).blur(); //убираем фокус
        			$(this).val(message);
        		};
      	},
      	function () {
      		if ( $(this).val() == message )
      		{      			
      			$(this).val("");
        	};
      	}	
    );
    

    $(name_text_area).click(function () {
    	if ( $(this).val() == message )
    	{
    		$(this).css("color", "#000000");
    		$(this).val("");
    	};
    });
    
});
*/
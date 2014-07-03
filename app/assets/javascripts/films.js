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

// События для отображения полной информации в списке фильмов:
$(document).ready(function() 
{
  var lv_white = "#FFFFFF";
  var default_height = $(".div_top_of_description_of_film").css("height");

  $("div.div_top_of_description_of_film").click(function () {
      $(this).css("background-color", lv_white);
      $(this).css("position", "absolute");
      $(this).css("overflow", "auto");
      $(this).stop(true).animate({ height: "300px" 
                      }, 300);
    });
  $("div.div_top_of_description_of_film").hover(
    function () { },
    function () { 
      $(this).stop(true)
             .css("background-color", "transparent")
             .css("position", "static")
             .css("overflow", "hidden")
             .css("height", default_height);
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
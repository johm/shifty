$( document ).ready(function() {
    $(".colorpicker").minicolors({theme: "bootstrap"})
    $(".worker_draggable").each(function(){makedraggable($(this))});
    $( ".task-target" ).droppable({
	drop: function(event,ui){
	    //make an ajax call to add a shift here
	},
	over: function(event,ui){$(this).addClass("bg-success")},
	out: function(event,ui){$(this).removeClass("bg-success")}
    });
});


function makedraggable(div){
   div.draggable({
//       start: function(event,ui){makedraggable($(this).clone().insertBefore($(this)));false;},
       drag: function(event,ui){
	   $("#debug").html($(this).offset().left);
	   pos=$(this).offset().left;
	   $(".time-ticks .col-30min").each(function(){
	       if (pos >= $(this).offset().left && (pos < ($(this).offset().left + $(this).width()))){
		   $(this).addClass("bg-success");
	       }
	       else {
		   $(this).removeClass("bg-success");
	       }
	   });
       },
       revert: true
       
   });
    
}


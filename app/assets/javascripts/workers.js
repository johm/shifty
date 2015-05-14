$( document ).ready(function() {
    $(".colorpicker").minicolors({theme: "bootstrap"})
    $(".worker_draggable").each(function(){makedraggable($(this))});
    $( ".task-target" ).droppable({
	drop: function(event,ui){
	    worker_id=ui.draggable.data("worker");
	    target_id=ui.draggable.data("task-target");
	    day_of_week=ui.draggable.data("dayofweek-target");
	    $.post("/shifts",{shift: {worker_id: worker_id,
				      target_id: target_id,
				     day_of_week: day_of_week}},null,'script');
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


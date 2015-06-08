$(document).on('nested:fieldAdded', function(event){
    // this field was just inserted into your form
    $(".datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
  })


$( document ).ready(function() {
    $(".colorpicker").minicolors({theme: "bootstrap"});
    $(".datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
    $('[data-toggle="tooltip"]').tooltip()
    $(".mondaypicker").datepicker({ dateFormat: 'yy-mm-dd', beforeShowDay: function(date){ return [date.getDay() == 1,""]} });
    $(".worker_draggable").each(function(){makedraggable($(this))});
    $( ".task-target" ).droppable({
	accept: ".worker_draggable",
	drop: function(event,ui){
	    worker_id=ui.draggable.data("worker");
	    task_id=$(this).data("task-target");
	    day_of_week=$(this).data("dayofweek-target");
	    monday=$(this).data("monday-target");
	    shift_template_id=$(this).data("shift-template-target");
	    start_time=ui.draggable.data("start-time");

	    
	    $.post("/shifts",{shift: {worker_id: worker_id,
				      task_id: task_id,
				      day_of_week: day_of_week,
				      monday: monday,
				      shift_template_id: shift_template_id,
				      start_time: start_time
				     }},null,'script');
	},
	over: function(event,ui){$(this).addClass("bg-success")},
	out: function(event,ui){$(this).removeClass("bg-success")}
    });
});


function makedraggable(div){
   div.draggable({
       drag: function(event,ui){
	   $("#debug").html($(this).offset().left);
	   pos=$(this).offset().left;
	   the_draggable=$(this)
	   $(".time-ticks .col-30min").each(function(){
	       if (pos >= $(this).offset().left && (pos < ($(this).offset().left + $(this).width()))){
		   $(this).addClass("bg-success");
		   the_draggable.data("start-time",$(this).data("start-time"));
	       }
	       else {
		   $(this).removeClass("bg-success");
	       }
	   });
       },
       revert: true
       
   });
    
}


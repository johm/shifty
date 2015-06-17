$(document).ready(function(){
    $(".task").each(function(){
	$(this).find(".workgrouplabel").height($(this).height()+4);
    });

    $("#toggledescriptions").on("click",function(){
	if ($(this).hasClass("active")){
	    $(this).removeClass("active");
	    $(".shiftdescription").hide("fade");
	    
	}
	else {
	    $(this).addClass("active");
	    $(".shiftdescription").show("fade");
	}
    });
    
    $(".task-target").on("dblclick",function(event){
	
	if (! $(document.elementFromPoint(event.pageX,event.pageY)).hasClass("shift")) {
	    task_id=$(this).data("task-target");
	    monday=$(this).data("monday-target");
	    shift_template_id=$(this).data("shift-template-target");
	    day_of_week=$(this).data("dayofweek-target");
	    $(".time-ticks .col-30min").each(function(){
		if (event.pageX >= $(this).offset().left && (event.pageX < ($(this).offset().left + $(this).width()))){
		    start_time=$(this).data("start-time");
		    submit('/shifts/', 'POST', [
			{ name: 'shift[task_id]', value: task_id },
			{ name: 'shift[day_of_week]', value: day_of_week },
			{ name: 'shift[monday]', value: monday },
			{ name: 'shift[shift_template_id]', value: shift_template_id },
			{ name: 'shift[start_time]', value: start_time },
			{ name: 'authenticity_token', value: $("meta[name='csrf-token']").attr('content')}
		    ]);
		}
	    });
	}
    });
});


function submit(action, method, values) {
    var form = $('<form/>', {
        action: action,
        method: method
    });
    $.each(values, function() {
        form.append($('<input/>', {
            type: 'hidden',
            name: this.name,
            value: this.value
        }));    
    });
    form.appendTo('body').submit();
}

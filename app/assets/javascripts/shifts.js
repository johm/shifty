

$(document).ready(function(){
    $(".best_in_place").best_in_place();
    $(".timepicker").timepicker({ 'forceRoundTime': true });    
    $('.shift').on("ajax:success",".best_in_place.shiftworkerpicker", function () {
	shift_id=$(this).closest('.shift').data("shift-id");
	$.ajax({
	    method:"POST",
	    url: "/shifts/"+shift_id+"/colorfix",
	    dataType: 'script'});
	$(this).closest('.shift').effect('highlight'); 
    });
    

    
    $(".shift").each(function(){makeshiftdraggable($(this))});
    $(".shift").each(function(){makeshiftresizable($(this))});
    $("body").on("click",".shiftedit",function(){
	$(this).parent().find(".shiftdescription").toggle(); //doesn't work for new elements 
    });



//    $("body").on("click",".shift",function(event){
//
//    });

});


function makeshiftresizable(div){
    div.resizable(
	{containment: "parent",
	 handles: "e,w",
	 resize: function(event, ui) {
	     the_resizable=$(this);
	     left_pos=$(this).offset().left;
	     right_pos=$(this).offset().left+$(this).width();
	     
	     $(".time-ticks .col-30min").each(function(){
		 if (left_pos >= $(this).offset().left && (left_pos < ($(this).offset().left + $(this).width()))){
		     $(this).addClass("bg-success");
		     the_resizable.data("start-time",$(this).data("start-time"));
 		 }
		 else {
		     if (right_pos >= $(this).offset().left && (right_pos < ($(this).offset().left + $(this).width()))){
			 $(this).addClass("bg-success");
			 the_resizable.data("end-time",$(this).data("start-time"));
		     }
		     else {
			 $(this).removeClass("bg-success");
		     }
		 }
		 
	     });
	 },
	 stop: function(event,ui){
	     shift_id=$(this).data("shift-id");
	     start_time=$(this).data("start-time");
	     end_time=$(this).data("end-time");
	     $(".time-ticks .col-30min").each(function(){
		 $(this).removeClass("bg-success");
	     });
	     
	     $.ajax({
		 method:"PUT",
		 url: "/shifts/"+shift_id,
		 data: {_method:'PUT', shift: {
		     start_time: start_time,
		     end_time: end_time
		 } },
		 dataType: 'script'});
	     }
	}
    );
}


function makeshiftdraggable(div){
    div.draggable({
	axis:"x",
	containment: "parent",
	drag: function(event,ui){
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
	stop: function(event,ui){
	     shift_id=$(this).data("shift-id");
	     start_time=$(this).data("start-time");
	     $(".time-ticks .col-30min").each(function(){
		 $(this).removeClass("bg-success");
	     });
	     $.ajax({
		 method:"PUT",
		 url: "/shifts/"+shift_id,
		 data: {_method:'PUT', shift: {
		     start_time: start_time
		 } },
		 dataType: 'script'});
	     }
    });
}


$(document).ready(function(){
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

});

$(document).ready(function() {
    
    $(".workgrouprow").each(function(){
	if (! $(this).hasClass("active")){
	    $(this).slideToggle();
	}
    });

    $(".sidebar-nav").on("click",".workgroup_toggle",function(){
	workgroup_id=$(this).data("workgroup");
	$(".workgroup-row-"+workgroup_id).slideToggle();
	$(this).find("i").slideToggle();
    });
    $(".sidebar-nav").on("dblclick",".workgroup_toggle",function(){
	workgroup_id=$(this).data("workgroup");
	$(".workgrouprow").each(function(){
	    if (! $(this).hasClass("workgroup-row-"+workgroup_id)){
		$(this).slideToggle();
	    }
	});

    });

});

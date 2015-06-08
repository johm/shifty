$(document).ready(function() {
    $(".sidebar-nav").on("click",".workgroup_toggle",function(){
	workgroup_id=$(this).data("workgroup");
	$(".workgroup-row-"+workgroup_id).slideToggle();
	$(this).find("i").slideToggle();
	
    });
});

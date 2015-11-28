var whenReady = function(){
	$(".delete-user").on("ajax:complete", function(e){
		console.log(e.currentTarget);
		$(e.currentTarget).parent().hide()
	});
};

$(document).ready(whenReady);
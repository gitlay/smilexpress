var $track = $("#textarea");
var isClick = true;

$("#side").bind({
	mouseenter: function() {
		isClick = false;
	},
	mouseleave: function() {
		isClick = true;
	}
});
/*alert($track.val());*/
if($track.val() !== "") {
	var myHeight = $(".bannerWrap").height();
	$track.addClass("focus").blur();
	$("#side").removeClass("side-hide").height(myHeight);

	/*$("#yto_phone").addClass("black");*/
} else {
	$track.blur();
}
$("#textarea").bind({
	focusin: function() {
		console.log('1111111111')
		if($(this).val() == "" || isClick) {
			var myHeight = $(".bannerWrap").height();
			$(this).addClass("focus");
			$("#side").removeClass("side-hide").height(myHeight);
			/*$("#yto_phone").addClass("black");*/
		}
	},
	focusout: function() {
		if($(this).val() == "") {
			$(this).removeClass("focus");
			if(isClick) {
				$("#side").addClass("side-hide").height(90);
				/*$("#yto_phone").removeClass("black");*/
			}
		}
	}
});
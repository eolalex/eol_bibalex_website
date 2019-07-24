function ChangeStyle() {
	var locale = document.getElementsByName("locale")[0].value;
	// alert(locale);
	if (locale == "ar" || locale == "/ar") {
		$('link[href= "/assets/Suzan-en.css"]').prop('disabled', true);
		$('link[href= "/assets/responsive-en.css"]').prop('disabled', true);
		$('link[href= "/assets/Custom-en.css"]').prop('disabled', true);

		$('link[href= "/assets/main-ar.css"]').prop('disabled', false);
		$('link[href= "/assets/slider-ar.css"]').prop('disabled', false);
		$('link[href= "/assets/Suzan-ar.css"]').prop('disabled', false);
		$('link[href= "/assets/animate.min-ar.css"]').prop('disabled', false);
		$('link[href= "/assets/prettyPhoto-ar.css"]').prop('disabled', false);
		$('link[href= "/assets/Suzan.css"]').prop('disabled', false);

		$('link[href= "/assets/responsive-ar.css"]').prop('disabled', false);
		$('link[href= "/assets/responsive.css"]').prop('disabled', false);
		$('link[href= "/assets/Custom.css"]').prop('disabled', false);
		$('link[href= "/assets/Custom-ar.css"]').prop('disabled', false);
		$('link[href= "/assets/bootstrap.min.css"]').prop('disabled', false);
		$('link[href= "/assets/bootstrap.rtl.min.css"]').prop('disabled', false);
		//document.getElementById("header123").style["float"] = 'right';
	} else {
		$('link[href= "/assets/responsive-ar.css"]').prop('disabled', true);
		// $('link[href= "/assets/responsive.css"]').prop('disabled', true);
		$('link[href= "/assets/Custom-ar.css"]').prop('disabled', true);
		$('link[href= "/assets/main-ar.css"]').prop('disabled', true);
		$('link[href= "/assets/slider-ar.css"]').prop('disabled', true);
		$('link[href= "/assets/Suzan-ar.css"]').prop('disabled', true);
		$('link[href= "/assets/animate.min-ar.css"]').prop('disabled', true);
		$('link[href= "/assets/prettyPhoto-ar.css"]').prop('disabled', true);
		$('link[href= "/assets/bootstrap.rtl.min.css"]').prop('disabled', true);
		$('link[href= "/assets/font-awesome.min-ar.css"]').prop('disabled', true);

		$('link[href= "/assets/bootstrap.min.css"]').prop('disabled', false);
		$('link[href= "/assets/main.css"]').prop('disabled', false);
		$('link[href= "/assets/Custom.css"]').prop('disabled', false);
		$('link[href= "/assets/Suzan-en.css"]').prop('disabled', false);
		$('link[href= "/assets/responsive-en.css"]').prop('disabled', false);
                $('link[href= "/assets/custom-en.css"]').prop('disabled', false);
		$('link[href= "/assets/responsive.css"]').prop('disabled', false);
		//document.getElementById("header123").style["float"] = 'left';
	}
}

$(document).ready(ChangeStyle);
$(document).on('turbolinks:load', ChangeStyle);

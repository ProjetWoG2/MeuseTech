
	$("#connexion").click(function() {
		$("#champsconnexion").toggle();
	});

	$("#social-collapse").click(function() {
		$(this).parent().find('ul').toggle();				
	});

	$("#navbartop").slideToggle("slow");
	$("#bouton_off").hide();

	$("#bouton_on").click(function() {
		$("#navbartop").slideToggle("slow");
		$("#bouton_on").hide();
		$("#bouton_off").show();
	});

	$("#bouton_off").click(function() {
		$("#navbartop").slideToggle("slow");
		$("#bouton_on").show();
		$("#bouton_off").hide();
	});

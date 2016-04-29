
	$("#connexion").click(function() {
		$("#champsconnexion").toggle();
	});

	$("#social-collapse").click(function() {
		$(this).parent().find('ul').toggle();				
	});

	$("#navbartop").slideToggle("slow");

	$("#bouton").click(function() {
		$("#navbartop").slideToggle("slow");
		$(".glyphicon").toggleClass("glyphicon-menu-down");
		$(".glyphicon").toggleClass("glyphicon-menu-up");
	});



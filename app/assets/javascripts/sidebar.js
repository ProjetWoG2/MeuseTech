
	$("#connexion").click(function() {
		$("#champsconnexion").toggle();
	});

	$("#social-collapse").click(function() {
		$(this).parent().find('ul').toggle();				
	});

		$("#bouton").click(function() {
		$("#navbartop").slideToggle("slow");
		$(".glyphicon").toggleClass("glyphicon-menu-down");
		$(".glyphicon").toggleClass("glyphicon-menu-up");
	});



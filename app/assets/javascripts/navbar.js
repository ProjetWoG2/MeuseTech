$("#txtprojets").css("fill-opacity", "0");
$("#txtsondages").css("fill-opacity", "0");
$("#txtactualites").css("fill-opacity", "0");
$("#txtpourquoi").css("fill-opacity", "0");

$("#projets").hover(
	function() {
		$("#txtprojets").css("fill-opacity", "1");
  	},
  	function () {  
		$("#txtprojets").css("fill-opacity", "0");
  	}
);

$("#sondages").hover(
	function() {
		$("#txtsondages").css("fill-opacity", "1");
	}, 
	function() {
		$("#txtsondages").css("fill-opacity", "0");
	}
);

$("#actualites").hover(
	function() {
		$("#txtactualites").css("fill-opacity", "1");
	}, 
	function() {
		$("#txtactualites").css("fill-opacity", "0");
	}
);

$("#pourquoi").hover(
	function() {
		$("#txtpourquoi").css("fill-opacity", "1");
	}, 
	function() {
		$("#txtpourquoi").css("fill-opacity", "0");
	}
);

$("#retourmenu").hover(
	function() {
		$("#title").css("fill", "#22427C");
	}, 
	function() {
		$("#title").css("fill", "#000000");
	}
);
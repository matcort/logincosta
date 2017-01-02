$(document).ready(function() {
	$("#btn-mostrar-paises").click(function(){		
	/*		$.get("paises/listar_paises", function(data){
				alert(data);
				var result = JSON.parse(data);
				$.each(result, function(i, val){
					$("#resultado").append('<li>' + val.PAI_ID + " - " + val.PAI_NOMBRE+ '</li>');
				});				
			});
	*/
		 $.ajax({
      		url: "paises/listar_paises",
      		type: "POST",
  			dataType: "JSON",
      		success: function(data){
				$.each(data, function(i, val){
					$("#resultado").append('<li>' + val.PAI_ID + " - " + val.PAI_NOMBRE+ '</li>');
				});				
	      	},
			error:function(){
      			$("#result").html('Error al cargar Paises');
      		}   
    	}); 

	});
});


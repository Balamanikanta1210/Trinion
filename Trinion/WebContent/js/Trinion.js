$(document).ready(function() {
	$(".Home").click(function(event) {
		event.preventDefault();
		var url = $(this).attr("href");
		$('.content').load(url, function(data) {
			console.log(data);
		});
		console.log(url);
	});
	$(".Upload").click(function(event) {
		event.preventDefault();
		var url = $(this).attr("href");
		$('.content').load(url, function(data) {
			console.log(data);
		});
		console.log(url);
	});

	$(".pages").click(function(event) {
		event.preventDefault();
		var url = $(this).attr("href");
		$('.content').load(url, function(data) {
			console.log(data);
		});
		console.log(url);
	});
	
	$(".generate").click(function() {
	    var file = $(this).closest("tr")   // Finds the closest row <tr> 
	                       .find(".file")     // Gets a descendent with class="nr"
	                       .text();         // Retrieves the text within <td>

	    $.ajax({
	        url: 'HelloWorld.jsp',
	        type: "POST",
	        cache: false,
	        data: {filepath: file},
	        success: function (data) {
	             //or you can use console.log(info);
	        	alert(data);
	            $("#message").html(data);
	        }
	    });       
	});
	
	$(".uploadbtn").click(function() {
		var fd = new FormData();
		var files = $('#file')[0].files[0];
		fd.append('file', files);

		$.ajax({
			url : 'ActionFileupload.jsp',
			type : 'post',
			data : fd,
			datatype : 'html',
			contentType : false,
			processData : false,
			success : function(data) {
				// $("#message").load('HelloWorld.jsp');
				$("#message").text(data);
				$("#uploadFormId").hide();
				var interval=setInterval(function() {
					$(".content").load('UploadedFiles.jsp'); 															
				}, 3000);
				
				setInterval(function() {
					clearInterval(interval); 															
				}, 5000);
				
			}

		});
		
	});

});
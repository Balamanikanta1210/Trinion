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
	    var filePath = $(this).closest("tr")   // Finds the closest row <tr> 
	                       .find(".file")     // Gets a descendent with class="nr"
	                       .text();   
	    // Retrieves the text within <td>
	    var formData = new FormData();
	    formData.append("file", filePath);
	    $.ajax({
	        url: "http://localhost:8090/trinio/v1/template-set",
	        type: "post",
	        cache: false,
	        enctype: 'multipart/form-data',
	        data: {file:filePath},
	        async : true,
	        crossDomain : true,
	        contentType: false,
	        //contentType: 'application/json',
	        /*accepts: 'application/octet-stream',*/
	        //ContentType: 'text/plain',
       // ContentDisposition: 'attachment; filename=test.txt',
	        success: function (data,status) {
	             //or you can use console.log(info);
	        	debugger;
	        	console.log(data);
	        	alert(data);
	            $("#message").html(data);
	            
	        },
	        error:function(data,textStatus,xhr)
	        {
	        	alert(JSON.stringify(data));
	        	//alert(data);
	        },
//	        headers: {
//	            Accept: 'application/octet-stream;charset=utf-8',
//	            contentType: 'application/octet-stream;charset=utf-8',
//	            ContentType: 'application/octet-stream',
//		        ContentDisposition: 'attachment'
//	          }
	        
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
{{BEGIN page}}
<html>
<header>
<title>minicms</title>
<meta content="minicms-generator" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="author" content="Kalendarev Alexandre">

  <script src="js/jquery.min.js" type="text/javascript"></script>

  <script type="text/javascript" src="js/ajaxupload.js"></script>

<style type="text/css">
        .example { padding: 0 20px; float: left; width: 230px; }

		div.button {
			height: 29px;	
			width: 133px;
			background: url(img/button.png) 0 0;
			
			font-size: 14px; color: #C7D92C; text-align: center; padding-top: 15px;
		}
		/* 
		We can't use ":hover" preudo-class because we have
		invisible file input above, so we have to simulate
		hover effect with JavaScript. 
		 */
		div.button.hover {
			background: url(img/button.png) 0 56px;
			color: #95A226;	
		}

</style>  
{{BEGIN article}}
<script type="text/javascript">/*<![CDATA[*/

function gotoHome() {
   document.location.href = '/index.php';
}

	$(document).ready(function(){
		/* Example 1 */
		var button = $('#button1'), interval;
		
		new AjaxUpload(button, {
			action: 'upload.php?id={{id}}', 
			name: 'myfile',
			onSubmit : function(file, ext){
				// change button text, when user selects file			
				button.text('Uploading');
								
				// If you want to allow uploading only 1 file at time,
				// you can disable upload button
				this.disable();
				
				// Uploding -> Uploading. -> Uploading...
				interval = window.setInterval(function(){
					var text = button.text();
					if (text.length < 13){
						button.text(text + '.');					
					} else {
						button.text('Uploading');				
					}
				}, 200);
			},
			onComplete: function(file, response){
				button.text('Upload');
				var json =  JSON.parse( response);			
				window.clearInterval(interval);
				
				// enable upload button
				this.enable();
				if (json.error) {
				    alert("error: " + json.msg);
				    return;
				}
				
				// add file to the list
				$('<img></img>').appendTo('#example1 .files').attr('src', 'img/articles/'+json.name );						
			}
		});
});

/*]]>*/</script>


</header>
<body>

<form method="POST">

<p><input type="edit" style="width: 640px;" name="title" value="{{title}}"></input></p>
<p><textarea name="text" cols="120" rows="40">{{text}}</textarea></p>
<input type="hidden" name="id" value="{{id}}"/>
<input type="checkbox" name="publication" {{checked}}/>
<input type="submit" value="Сохранить" /> <span style="width:20px"> </span>
<input type="button" value="список" onclick="gotoHome()"/>
<span style="width:20px"> </span>
<input type="submit" value="Сгенерить" name="generate"/>
{{END}}

{{BEGIN image}}
<p><h6>img:{{id}}</h6>
<img src="img/articles/{{id}}.jpg" />
</p>
{{END}}

<li id="example1" class="example">

    <div class="wrapper">
			<div class="button" id="button1">Upload</div>
		</div>
		<p>Uploaded files:</p>
		<p class="files"></p>
		
		<div style="display: block; 
            position: absolute; overflow: hidden;
            margin: 0pt; padding: 0pt; opacity: 0; 
            direction: ltr; z-index: 2147483583; 
            left: 116.5px; top: 141.067px; width: 133px; height: 44px; 
            visibility: hidden;">
		    <input type="file" name="myfile" 
                    style="position: absolute; right: 0pt; margin: 0pt; padding: 0pt;
                    font-size: 480px; font-family: sans-serif; cursor: pointer;"/>
	   </div>
    </div>   
</li>

</form>
</body>
</html>
{{END}}
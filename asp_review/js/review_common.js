$(".f_showTextarea").click(function(){
	//alert("test");
	$(this).siblings(".prePart").hide();
	$(this).hide();
	$(this).siblings(".form-control").removeClass("none");
	
	//$('#textarea_question_cn').removeClass("none");
	//$( "p" ).siblings( ".selected" ).css( "background", "yellow" );
	});
$(".f_translate a").click(function(){
     var href = "http://translate.google.cn/#auto/zh-CN/";
     //content=$("#f_needTranslate2").val();
     //content=$('textarea[name=f_needTranslate]').val(str);
     //alert(content);
     var reg=new RegExp("\n","g");
     content=$(".f_translate textarea").val().replace(reg,'%0A');
     href += content;
     window.open(href);
});
$("#f_googleTranslate").click(function(){
     var href = "http://translate.google.cn/#auto/zh-CN/";
     content=$("#f_needTranslate").val();
     //content=$('textarea[name=f_needTranslate]').val(str);
     //alert(content);
     var reg=new RegExp("\n","g");
     content=$("#f_needTranslate").val().replace(reg,'%0A');
     href += content;
     window.open(href);
});
<%@Language="vbscript" Codepage="65001"%>
<!--#include file="../Connections/connReview.asp" -->
<!--#include file="review_edit_sql_inc_top.asp" -->
<!DOCTYPE html>

<!-- InstanceBegin template="/Templates/template.dwt.asp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- InstanceBeginEditable name="doctitle" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Review Edit</title>
<% 
getID=request.QueryString("id")
 %>
<!-- InstanceEndEditable -->
<!-- inc_head -->
<!--#include file="../inc/inc_head.asp" -->
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
</head>
<body>
<!-- inc_nav --> 
<!--#include file="../inc/inc_nav.asp" -->
<div class="container"><!-- InstanceBeginEditable name="EditRegion1" -->
	<div class="row">
		<div class="col-xs-4"> 
			<!--#include file="review_edit_inc_left.asp" --> 
		</div>
		<div class="col-xs-8">
			<div class="alert alert-info">DF View</div>
			<ul class="nav nav-pills">
				<li class="nav"><a href="https://online.uts.edu.au/bbcswebdav/pid-1184177-dt-content-rid-6275870_1/courses/31271/31271_DBF_finalExamInfo_Autumn2015.pdf" target="_blank" class="">Exam PDF</a></li>
				<li><a href="http://highered.mheducation.com/sites/0072942207/student_view0/index.html" target="_blank">Online Patraic</a></li>
			</ul>
			<% If request.QueryString("image")<>"" Then %>
			<div><img src="images/<%=request.QueryString("image")%>" class="img-thumbnail"></div>
			<% End If %>
			<form method="post" action="<%=MM_editAction%>" name="form1" class="<% If request.QueryString("id")="" Then %>none<% End If %>
">
				<table align="center" class="table-condensed">
					<% If rsID.Fields.Item("img").Value<>"" Then %>
					<tr valign="baseline">
						<td align="left" valign="top" nowrap>Image:</td>
						<td><img src="images/<%=(rsID.Fields.Item("img").Value)%>" class="img-thumbnail"></td>
					</tr>
					<% End If %>
					<tr valign="baseline">
						<td align="left" valign="top" nowrap>Question:</td>
						<td><% If rsID("question")<>"" Then %>
							<% inputQue=rsID.Fields.Item("question").Value %>
							<% inputQue=replace(inputQue, "“", Chr(34)) %>
							<% inputQue=replace(inputQue, "”", Chr(34)) %>
							<textarea name="question" class="form-control" id="f_needTranslate" cols="200" rows="5"><%=inputQue %>				</textarea>
							<% End If %></td>
					</tr>
					<tr>
						<td align="left" valign="top"></td>
						<td><!--#include file="review_main_inc_appendix.asp" --></td>
					</tr>
					<tr valign="baseline" class="f_translate">
						<td align="left" valign="top" nowrap><a target="_blank">Full Answer: <br/>
							(Answer)</a></td>
						<td><textarea name="answer" cols="200" class="form-control" rows="5"><%=(rsID.Fields.Item("answer").Value)%></textarea></td>
					</tr>
					<tr valign="baseline" class="admin">
						<td align="left" valign="top" nowrap>Short Answer:<br/>
							(Answer_simple)</td>
						<td><textarea name="answer_simple" class="form-control" rows="5"><%=(rsID.Fields.Item("answer_simple").Value)%></textarea></td>
					</tr>
					<tr valign="baseline" class="admin">
						<td align="left" valign="top" nowrap>Answer_cn:</td>
						<td><textarea name="answer_cn" rows="5" class="form-control"><%=(rsID.Fields.Item("answer_cn").Value)%></textarea></td>
					</tr>
					<tr valign="baseline" class="admin">
						<td align="left" valign="top" nowrap><a id="f_googleTranslate" target="_blank">Question_cn:</a></td>
						<td><textarea name="question_cn" rows="1" class="form-control"><%=(rsID.Fields.Item("question_cn").Value)%></textarea></td>
					</tr>
					<tr valign="baseline" class="admin none">
						<td align="left" valign="top" nowrap>Image:</td>
						<td><input name="img" type="text" class="form-control" value="<%=(rsID.Fields.Item("img").Value)%>" size="200"></td>
					</tr>
					<tr valign="baseline" class="admin none">
						<td align="left" valign="top" nowrap>Answer_draft:</td>
						<td><textarea name="answer_draft" rows="1" class="form-control"><%=(rsID.Fields.Item("answer_draft").Value)%></textarea></td>
					</tr>
					<tr valign="baseline" class="none admin">
						<td align="left" valign="top" nowrap>Category:</td>
						<td><input type="text" name="category" value="<%=(rsID.Fields.Item("category").Value)%>"  class="form-control"></td>
					</tr>
					<tr valign="baseline" class="none admin">
						<td align="left" valign="top" nowrap>Complete:</td>
						<td><input type="checkbox" name="complete" value=1 ></td>
					</tr>
					<tr valign="baseline" class="none admin">
						<td align="left" valign="top" nowrap>Num:</td>
						<td><input type="text" name="num" value="<%=(rsID.Fields.Item("num").Value)%>"  class="form-control"></td>
					</tr>
					<tr valign="baseline" class="admin">
						<td align="left" valign="top" nowrap>Status:</td>
						<td><select name="status" class="form-control" id="status">
								<option value="<%=(rsID.Fields.Item("status").Value)%>"><%=(rsID.Fields.Item("status").Value)%></option>
								<!--#include file="review_inc_select_status.asp" -->
							</select></td>
					</tr>
					<tr valign="baseline" class="none">
						<td align="left" valign="top" nowrap>&nbsp;</td>
						<td><input type="submit" value="Update" accesskey="s"></td>
					</tr>
				</table>
				<input type="hidden" name="MM_update" value="form1">
				<input type="hidden" name="MM_recordId" value="<%= rsID.Fields.Item("ID").Value %>">
			</form>
			<div class="fl_r"> 
				<!--#include file="review_edit_sql_inc_jump.asp" --> 
			</div>
			<!--include file="review_inc_listInsert.asp" --> 
			
		</div>
	</div>
	<!-- InstanceEndEditable --></div>
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
</body>
<!-- InstanceEnd -->
</html><%
rsCategory.Close()
Set rsCategory = Nothing
%>
<%
rsID.Close()
Set rsID = Nothing
%>
<script>
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
</script>
<script>
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
</script>
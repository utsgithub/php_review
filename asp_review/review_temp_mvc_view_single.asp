<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/connReview.asp" -->
<!--#include file="review_temp_dsa_inc_data_list_single.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Page:<%= MM_index+1 %></title>
<!--#include file="../inc/inc_head.asp" -->
<script type="text/javascript" src="scripts/shCore.js"></script>
<script type="text/javascript" src="scripts/shBrushCpp.js"></script>
<script type="text/javascript" src="scripts/shBrushCSharp.js"></script>
<link type="text/css" rel="stylesheet" href="styles/shCoreDefault.css"/>
<script type="text/javascript">SyntaxHighlighter.all();</script>
</head>

<body>
<style>
img { width:100%;}
</style>
<div class="container"> <%=(Recordset1.Fields.Item("question").Value)%> 
<% 
	outputAnswer="null" 
	outputAnswer=Recordset1.Fields.Item("answer").Value
	outputAnswer=replace(outputAnswer, "<img src=""", "<img src=""mvc/")
	
%>
<%=outputAnswer_simple%> 
<% 
	outputAnswer_simple="null" 
	outputAnswer_simple=Recordset1.Fields.Item("Answer_simple").Value
	response.Write("<pre class=""brush: csharp;"">"&outputAnswer_simple&"</pre>")
	'outputAnswer_simple=replace(outputAnswer_simple, "<pre>", "<pre class=""brush: csharp;"">")
	
%></div>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>

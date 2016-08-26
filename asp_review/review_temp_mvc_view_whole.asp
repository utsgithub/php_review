<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/connReview.asp" -->
<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "75"
If (Request.QueryString("cid") <> "") Then 
  Recordset1__MMColParam = Request.QueryString("cid")
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_connReview_STRING
Recordset1_cmd.CommandText = "SELECT * FROM review_list WHERE cid = ? ORDER BY num ASC" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 5, 1, -1, Recordset1__MMColParam) ' adDouble

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
Recordset1_numRows = Recordset1_numRows + Repeat1__numRows
%>
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
<div class="container">
 <!--#include file="review_temp_mvc_view_inc_nav.asp" -->   
  <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) 
%>
   <!--#include file="review_temp_mvc_view_inc_body.asp" -->   
  <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset1.MoveNext()
Wend
%>
</div>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>

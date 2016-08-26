<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/connReview.asp" -->
<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "1"
If (Request.QueryString("ID") <> "") Then 
  Recordset1__MMColParam = Request.QueryString("ID")
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_connReview_STRING
Recordset1_cmd.CommandText = "SELECT * FROM review_list WHERE ID = ?" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 5, 1, -1, Recordset1__MMColParam) ' adDouble

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
请教一个关于“数据库理论”的英文题目。“<%= left(Recordset1.Fields.Item("question").Value,40) %>”...<br />

题目是：<br />
<%=(replace(Recordset1.Fields.Item("question").Value, CHR(10), "<br/>"))%><br />
答案是：<br />
<%=(Recordset1.Fields.Item("answer").Value)%>
<br /><br />
能不能简单的解释一下答案。
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>

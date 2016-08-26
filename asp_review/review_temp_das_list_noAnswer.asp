<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/connReview.asp" -->
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_connReview_STRING
Recordset1_cmd.CommandText = "SELECT * FROM review_list where cid = 60 and answer_simple='' order by num asc" 
Recordset1_cmd.Prepared = true

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
<title>DSA: No Answer</title>
<!--#include file="../inc/inc_head.asp" -->
</head>

<body>
<div class="container"> 
  <!--#include file="review_temp_dsa_inc_nav.asp" -->
  <table class="table table-bordered">
    <tr>
      <td>ID</td>
      <td>question</td>
      <td nowrap="nowrap">Type</td>
    </tr>
    <% While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) %>
      <tr>
        <td><%=(Recordset1.Fields.Item("ID").Value)%></td>
        <td><a href="review_temp_dsa_jump.asp?id=<%=(Recordset1.Fields.Item("ID").Value)%>&amp;type=<%=(Recordset1.Fields.Item("question_cn").Value)%>" target="_blank"><%=(Recordset1.Fields.Item("question").Value)%></a></td>
        <td nowrap="nowrap"><a href="review_temp_dsa_list2.asp?question_cn=<%=(Recordset1.Fields.Item("question_cn").Value)%>"><%=(Recordset1.Fields.Item("question_cn").Value)%></a></td>
      </tr>
      <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset1.MoveNext()
Wend
%>
  </table>
</div>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>

<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../Connections/connReview.asp" -->
<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "1"
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
<!DOCTYPE html>
<html lang="en">
<!-- InstanceBegin template="/Templates/template.dwt.asp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- InstanceBeginEditable name="doctitle" -->
<title><%= Request.QueryString("categoryname") %></title>
<% 
title=request.QueryString("categoryname")
cid=request.QueryString("cid")
pid=request.QueryString("pid")
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
    <div class="col-md-6">
      <h2><%= request.QueryString("categoryname") %></h2>
      <% If request.QueryString("image")<>"" Then %>
      <div><img src="images/<%=request.QueryString("image")%>" class="img-thumbnail"></div>
      <% End If %>
      <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) 
%>
        <% if Recordset1.Fields.Item("answer_simple").Value<>"" Then %>
        <div class="mtm">
          <div class="none"><strong>[<%=(Recordset1.Fields.Item("num").Value)%>:]</strong></div>
          <div><strong><em><span class="none"><%=(Recordset1.Fields.Item("num").Value)%>:</span><%=(Recordset1.Fields.Item("question").Value)%></em></strong></div>
          <div> <%=(replace(Recordset1.Fields.Item("answer_simple").Value, CHR(10), "<br/>"))%> </div>
        </div>
        <% End If %>
        <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset1.MoveNext()
Wend
%>
      <ul class="list-inline mtm">
        <li><a href="review_page_simple2.asp?cid=<%=request.QueryString("cid") %>" class="btn btn-primary">Extra Simple</a> </li>
        <li class="none"><a href="http://localhost:8080/online/asp_review/review_cateList.asp?pid=<%= pid %>&title=<%= title %>" class="btn btn-primary">Back</a></li>
      </ul>
    </div>
    <div class="col-md-6"><!--#include file="review_inc_note.asp" --> 
    </div>
  </div>
  <!-- InstanceEndEditable --></div>
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
</body>
<!-- InstanceEnd -->
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>

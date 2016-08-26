<%@Language="vbscript" Codepage="65001"%> 
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
Recordset1_cmd.CommandText = "SELECT * FROM review_list WHERE cid = ? order by num asc" 
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
<title>Review List</title>
<%
	pid=request.QueryString("cid")
	cid=request.QueryString("cid")
	title=request.QueryString("title")
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
    
    <h1><%= Request("title") %></h1>
    <table class="table table-bordered table-condensed table-hover size1of1">
        <tr>
            <td width="10" nowrap>ID</td>
            <td>Status</td>
            <td>question</td>
            <td>answer</td>
            <td></td>
        </tr>
        <% While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) %>
            <tr class="<%=(Recordset1.Fields.Item("status").Value)%>">
                <td><%=(Recordset1.Fields.Item("ID").Value)%></td>
                <td><a href="review_list_spry_status.asp?cid=<%=request.QueryString("cid")%>&status=<%=(Recordset1.Fields.Item("status").Value)%>"><%=(Recordset1.Fields.Item("status").Value)%></a></td>
                <td><a href="review_edit2.asp?id=<%=(Recordset1.Fields.Item("ID").Value)%>&cid=<%=(Recordset1.Fields.Item("cid").Value)%>"><%=(Recordset1.Fields.Item("question").Value)%></a></td>
                <td><%=(Recordset1.Fields.Item("answer").Value)%></td>
                <td><a href="#">Simple</a></td>
            </tr>
            <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset1.MoveNext()
Wend
%>
    </table>
	<nav class="navbar navbar-default" >
        <div class="pam"> 
            <!--#include file="review_inc_insertQuestion.asp" --> 
        </div>
    </nav>
    <a class="btn btn-primary" href="review_list_sort.asp?cid=<%= request.QueryString("cid") %>">Sort</a>
    <a href="review_whole.asp?pid=<%= pid %>&title=<%= title %>" class="btn-danger btn-large btn">Whole Page</a>
	<a href="action_category_back.asp?cid=<%=cid%>&pagename=review_cateList" class="btn btn-default">Back</a>
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

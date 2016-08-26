<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/connReview.asp" -->
<% 
pid=request.QueryString("pid")
title=request.QueryString("title")
Session("pid")=pid
Session("title")=title

 %>
<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "0"
If (Request.QueryString("pid") <> "") Then 
  Recordset1__MMColParam = Request.QueryString("pid")
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_connReview_STRING
Recordset1_cmd.CommandText = "SELECT * FROM review_category WHERE parentID = ? order by sort asc" 
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
<html>
<!-- InstanceBegin template="/Templates/template.dwt.asp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Review Category List</title>
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
  <table border="1" cellpadding="1" cellspacing="1" class=" table-bordered table-hover table">
    <tr>
      <td width="10" nowrap>ID</td>
      <td width="20" nowrap>Status</td>
      <td>Category</td>
      <td class="none">parentID</td>
      <td class="admin">page</td>
    </tr>
    <% While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) %>
      <% IDRS1=Recordset1.Fields.Item("ID").Value %>
      <tr class="<%=(Recordset1.Fields.Item("status").Value)%> text-<%=(Recordset1.Fields.Item("status").Value)%>">
        <td><%=IDRS1%></td>
        <td><a class="btn-xs btn btn-<%=(Recordset1.Fields.Item("status").Value)%>" href="review_cateEdit.asp?id=<%=IDRS1%>"><%=(Recordset1.Fields.Item("status").Value)%></a></td>
          </td>
        <td><ul class="list-inline mbn">
            <li class="admin"><a href="review_cateEdit.asp?id=<%=IDRS1%>&pid=<%= pid %>&title=<%= title %>">[Edit]</a></li>
            <li class="admin"><a href="review_list.asp?cid=<%=IDRS1%>&title=<%= title %>" target="_blank">[List]</a></li>
            <% If Recordset1__MMColParam=0 Then %>
            <li><a href="review_cateList.asp?pid=<%=IDRS1%>&title=<%=(Recordset1.Fields.Item("categoryName").Value)%>"><%=(Recordset1.Fields.Item("categoryName").Value)%></a></li>
            <% Else %>
            <li><a href="review_edit2.asp?cid=<%=IDRS1%>&title=<%=(Recordset1.Fields.Item("categoryName").Value)%>"><%=(Recordset1.Fields.Item("categoryName").Value)%></a></li>
            <% End If %>
          </ul></td>
        <td class="none"><%=IDRS1%></td>
        <td class="admin"><ul class="list-inline mbn">
            <li><a href="review_edit2.asp?cid=<%=IDRS1%>" target="_blank">View</a></li>
            <li><a target="_blank" href="review_page_simple.asp?cid=<%=(Recordset1.Fields.Item("id").Value)%>&categoryName=<%=(Recordset1.Fields.Item("categoryName").Value)%>&image=<%=Recordset1.Fields.Item("image").Value%>">Simple</a></li>
            <li><a target="_blank" href="review_page_answer.asp?cid=<%=(Recordset1.Fields.Item("id").Value)%>&categoryName=<%=(Recordset1.Fields.Item("categoryName").Value)%>">Answer</a></li>
            <li><a target="_blank" href="review_temp_mvc_view_whole.asp?cid=<%=(Recordset1.Fields.Item("id").Value)%>&categoryName=<%=(Recordset1.Fields.Item("categoryName").Value)%>">MVC</a></li>
            <li class="none"><a href="review_page_online.asp?cid=<%=(Recordset1.Fields.Item("id").Value)%>&categoryName=<%=(Recordset1.Fields.Item("categoryName").Value)%>">Online</a></li>
          </ul></td>
      </tr>
      <% 
			  Repeat1__index=Repeat1__index+1
			  Repeat1__numRows=Repeat1__numRows-1
			  Recordset1.MoveNext()
			Wend
			%>
  </table>
  <%if pid<>"" then %>
  <a href="review_whole.asp?pid=<%= pid %>&title=<%= title %>" class="btn-danger btn-large btn">Whole Page</a>
  <% End If %>
  <form class="form-inline admin" role="form" action="review_inc_insertCate.asp?page=review_cateList&pid=<%= request.QueryString("pid") %>" method="post" name="form_inc_insertCate">
    <div class="form-group">
      <label for="categoryName" class="">Category Name:</label>
      <input type="text" class="form-control" name="categoryName" id="categoryName" value="">
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
	<input type="hidden" name="sort" value="<%=Repeat1__index %>">
    <input type="hidden" name="parentID" value="<%= Recordset1__MMColParam %>" size="32">
    <input type="hidden" name="MM_insert" value="form_inc_insertCate">
  </form>
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

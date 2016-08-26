<style>
.mbs-group a {
	margin-bottom: 5px;
}
</style>
<!-- Page: review_inc_cateInfoStatus -->
<%
' IIf implementation
Function MM_IIf(condition, ifTrue, ifFalse)
  If condition = "" Then
    MM_IIf = ifFalse
  Else
    MM_IIf = ifTrue
  End If
End Function
%>
<%
If (CStr(Request("MM_update")) = "formCateInfoStatus") Then
  If (Not MM_abortEdit) Then
    ' execute the update
    'Dim MM_editCmd

   	Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_connReview_STRING
    MM_editCmd.CommandText = "UPDATE review_category SET status = ? WHERE ID = ?" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 202, 1, 255, Request.Form("status")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 5, 1, -1, MM_IIF(Request.Form("MM_recordId"), Request.Form("MM_recordId"), null)) ' adDouble
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close
  End If
End If
%>
<%
Dim rsCateInfoStatus__MMColParam
rsCateInfoStatus__MMColParam = "1"
If (Request.QueryString("cid") <> "") Then 
  rsCateInfoStatus__MMColParam = Request.QueryString("cid")
End If
%>
<%
Dim rsCateInfoStatus
Dim rsCateInfoStatus_cmd
Dim rsCateInfoStatus_numRows

Set rsCateInfoStatus_cmd = Server.CreateObject ("ADODB.Command")
rsCateInfoStatus_cmd.ActiveConnection = MM_connReview_STRING
rsCateInfoStatus_cmd.CommandText = "SELECT * FROM review_category WHERE ID = ?" 
rsCateInfoStatus_cmd.Prepared = true
rsCateInfoStatus_cmd.Parameters.Append rsCateInfoStatus_cmd.CreateParameter("param1", 5, 1, -1, rsCateInfoStatus__MMColParam) ' adDouble

Set rsCateInfoStatus = rsCateInfoStatus_cmd.Execute
rsCateInfoStatus_numRows = 0
%>
<% getDBStatus=rsCateInfoStatus.Fields.Item("status").Value %>
<div class="panel panel-default panel-<%=getDBStatus%>">
	<div class="panel-heading"><%=(rsCateInfoStatus.Fields.Item("categoryName").Value)%></div>
	<div class="panel-body">
		<% If rsCateInfoStatus("appendix")<>"" Then %>
		<div class="alert alert-warning" style="overflow:hidden;"><a href="files/<%=(rsCateInfoStatus.Fields.Item("appendix").Value)%>" target="_blank"><%=(rsCateInfoStatus.Fields.Item("appendix").Value)%></a></div>
		<% End If 'rsCateInfoStatus("appendix")<>""%>
		<form method="post" action="<%=MM_editAction%>" name="formCateInfoStatus" class="form-inline" role="form">
			<div class="form-group">
				<label class="sr-only" for="status">Status:</label>
				<select name="status" class="form-control mbs" id="status">
					<%
While (NOT rsCateInfoStatus.EOF)
%>
					<option value="<%=getDBStatus%>" <%If (Not isNullgetDBStatus) Then If (CStrgetDBStatus = CStrgetDBStatus) Then Response.Write("selected='selected'") : Response.Write("")%> ><%=getDBStatus%></option>
					<%
  rsCateInfoStatus.MoveNext()
Wend
If (rsCateInfoStatus.CursorType > 0) Then
  rsCateInfoStatus.MoveFirst
Else
  rsCateInfoStatus.Requery
End If
%>
					<!--#include file="review_inc_select_status.asp" -->
				</select>
			</div>
			<input type="submit" value="Update" class="btn btn-<%=getDBStatus%> mbs"/>
			<a href="review_cateEdit.asp?id=<%= request.QueryString("cid") %>" target="_blank"  class="mbs btn btn-<%=getDBStatus%>">Edit</a>
			<input type="hidden" name="MM_update" value="formCateInfoStatus">
			<input type="hidden" name="MM_recordId" value="<%= rsCateInfoStatus.Fields.Item("ID").Value %>">
		</form>
	</div>
	<div class="panel-footer bg-<%=getDBStatus%> text-right">
		<div class="btn-toolbar" role="toolbar">
			<div class="btn-group mbs-group"><a href="?cid=<%=cint(rsCateInfoStatus.Fields.Item("ID").Value)-1%>" class="btn btn-<%=getDBStatus%>">Left</a> <a href="action_category_back.asp?cid=<%=cid%>&pagename=review_cateList" class="btn btn-<%=getDBStatus%>">Back</a> <a href="review_list.asp?cid=<%= request.QueryString("cid") %>" class="btn btn-<%=getDBStatus%>">List</a><!----> 
				<a href="review_list_sort.asp?cid=<%= request.QueryString("cid") %>" class="admin btn btn-<%=getDBStatus%>">Sort</a><!----> 
				<a href="?cid=<%=cint(rsCateInfoStatus.Fields.Item("ID").Value)+1%>" class="btn btn-<%=getDBStatus%>">Right</a><!----> 
			</div>
		</div>
	</div>
</div>
<%
rsCateInfoStatus.Close()
Set rsCateInfoStatus = Nothing
%>

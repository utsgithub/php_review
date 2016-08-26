<%
Dim MM_editAction
MM_editAction = CStr(Request.ServerVariables("SCRIPT_NAME"))
If (Request.QueryString <> "") Then
  MM_editAction = MM_editAction & "?" & Server.HTMLEncode(Request.QueryString)
End If

' boolean to abort record edit
Dim MM_abortEdit
MM_abortEdit = false
%>
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
If (CStr(Request("MM_update")) = "form1") Then
  If (Not MM_abortEdit) Then
    ' execute the update
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_connReview_STRING
	'response.Write("UPDATE review_category SET note = "&Request.Form("note")&" WHERE ID = " &request.QueryString("cid"))
    MM_editCmd.CommandText = "UPDATE review_category SET [note] = '"&Request.Form("note")&"' WHERE ID = " &request.QueryString("cid")
    'MM_editCmd.Prepared = true
    'MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 203, 1, 536870910, Request.Form("note")) ' adLongVarWChar
    'MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 5, 1, -1, MM_IIF(Request.Form("ID"), Request.Form("ID"), null)) ' adDouble
    'MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 5, 1, -1, MM_IIF(Request.Form("MM_recordId"), Request.Form("MM_recordId"), null)) ' adDouble
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close
  End If
End If
%>
<%
Dim rsNote__MMColParam
rsNote__MMColParam = "1"
If (Request.QueryString("cid") <> "") Then 
  rsNote__MMColParam = Request.QueryString("cid")
End If
%>
<%
Dim rsNote
Dim rsNote_cmd
Dim rsNote_numRows

Set rsNote_cmd = Server.CreateObject ("ADODB.Command")
rsNote_cmd.ActiveConnection = MM_connReview_STRING
rsNote_cmd.CommandText = "SELECT * FROM review_category WHERE ID = ?" 
rsNote_cmd.Prepared = true
rsNote_cmd.Parameters.Append rsNote_cmd.CreateParameter("param1", 5, 1, -1, rsNote__MMColParam) ' adDouble

Set rsNote = rsNote_cmd.Execute
rsNote_numRows = 0
%>

<form method="post" action="<%=MM_editAction%>" name="form1" role="form" class="form">
  <textarea name="note" class="form-control" rows="20"><%=(rsNote.Fields.Item("note").Value)%></textarea>
  <input type="submit" value="Update record" class="btn btn-block mtl btn-primary">
  <input type="hidden" name="ID" value="<%=(rsNote.Fields.Item("ID").Value)%>" >
  <input type="hidden" name="MM_update" value="form1">
  <input type="hidden" name="MM_recordId" value="<%= rsNote.Fields.Item("ID").Value %>">
</form>
<p>&nbsp;</p>
<%
rsNote.Close()
Set rsNote = Nothing
%>

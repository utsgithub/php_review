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
    MM_editCmd.ActiveConnection = MM_conn_STRING
    MM_editCmd.CommandText = "UPDATE review_category SET categoryName = ?, status = ? WHERE ID = ?" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 202, 1, 255, Request.Form("categoryName")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 202, 1, 255, Request.Form("status")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 5, 1, -1, MM_IIF(Request.Form("MM_recordId"), Request.Form("MM_recordId"), null)) ' adDouble
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close
  End If
End If
%>

<--#include file="../Connections/conn.asp" -->
<%
Dim rsCateEdit__MMColParam
rsCateEdit__MMColParam = "1"
If (Request.QueryString("CID") <> "") Then 
  rsCateEdit__MMColParam = Request.QueryString("CID")
End If
%>
<%
Dim rsCateEdit
Dim rsCateEdit_cmd
Dim rsCateEdit_numRows

Set rsCateEdit_cmd = Server.CreateObject ("ADODB.Command")
rsCateEdit_cmd.ActiveConnection = MM_connReview_STRING
rsCateEdit_cmd.CommandText = "SELECT * FROM review_category WHERE ID = ?" 
rsCateEdit_cmd.Prepared = true
rsCateEdit_cmd.Parameters.Append rsCateEdit_cmd.CreateParameter("param1", 5, 1, -1, rsCateEdit__MMColParam) ' adDouble

Set rsCateEdit = rsCateEdit_cmd.Execute
rsCateEdit_numRows = 0
%>
<form method="post" action="<%=MM_editAction%>" name="form1">
    <table align="center">
        <tr valign="baseline">
            <td nowrap align="right">CategoryName:</td>
            <td><input type="text" name="categoryName" value="<%=(rsCateEdit.Fields.Item("categoryName").Value)%>" size="32"></td>
        </tr>
        <tr valign="baseline">
            <td nowrap align="right">Status:</td>
            <td><input type="text" name="status" value="<%=(rsCateEdit.Fields.Item("status").Value)%>" size="32"></td>
        </tr>
        <tr valign="baseline">
            <td nowrap align="right">&nbsp;</td>
            <td><input type="submit" value="Update Record"></td>
        </tr>
    </table>
    <input type="hidden" name="MM_update" value="form1">
    <input type="hidden" name="MM_recordId" value="<%= rsCateEdit.Fields.Item("ID").Value %>">
</form>
<p>&nbsp;</p>
<%
rsCateEdit.Close()
Set rsCateEdit = Nothing
%>

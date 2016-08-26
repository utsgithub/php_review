<%
cid=request.QueryString("cid")
%>
<%
If (Request.QueryString("cid") <> "") Then 
  'rsCategory__MMColParam = Request.QueryString("cid")
else
	response.Write("Miss 'CID'")
	response.End()
End If
%>
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
    MM_editCmd.CommandText = "UPDATE review_list SET answer = ?, answer_cn = ?, answer_draft = ?, answer_simple = ?, category = ?, complete = ?, num = ?, question = ?, question_cn = ?, status = ?, img = ? WHERE ID = ?" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 203, 1, 536870910, Request.Form("answer")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 203, 1, 536870910, Request.Form("answer_cn")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 203, 1, 536870910, Request.Form("answer_draft")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param4", 203, 1, 536870910, Request.Form("answer_simple")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param5", 202, 1, 255, Request.Form("category")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param6", 5, 1, -1, MM_IIF(Request.Form("complete"), 1, 0)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param8", 5, 1, -1, MM_IIF(Request.Form("num"), Request.Form("num"), null)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param9", 203, 1, 536870910, Request.Form("question")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param10", 203, 1, 536870910, Request.Form("question_cn")) ' adLongVarWChar
	MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param12", 203, 1, 536870910, Request.Form("status")) ' adLongVarWChar
	MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("paramImg", 203, 1, 536870910, Request.Form("img")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param11", 5, 1, -1, MM_IIF(Request.Form("MM_recordId"), Request.Form("MM_recordId"), null)) ' adDouble
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close
  End If
End If
%>
<%
Dim rsCategory__MMColParam
rsCategory__MMColParam = "1"
If (Request.QueryString("cid") <> "") Then 
  rsCategory__MMColParam = Request.QueryString("cid")
End If
%>
<%
Dim rsCategory
Dim rsCategory_cmd
Dim rsCategory_numRows

Set rsCategory_cmd = Server.CreateObject ("ADODB.Command")
rsCategory_cmd.ActiveConnection = MM_connReview_STRING
rsCategory_cmd.CommandText = "SELECT * FROM review_list WHERE cid = ? ORDER BY num ASC" 
rsCategory_cmd.Prepared = true
rsCategory_cmd.Parameters.Append rsCategory_cmd.CreateParameter("param1", 5, 1, -1, rsCategory__MMColParam) ' adDouble

Set rsCategory = rsCategory_cmd.Execute
rsCategory_numRows = 0
%>
<%
Dim rsID__MMColParam
rsID__MMColParam = "1"
If (Request.QueryString("ID") <> "") Then 
  rsID__MMColParam = Request.QueryString("ID")
End If
%>
<%
Dim rsID
Dim rsID_cmd
Dim rsID_numRows

Set rsID_cmd = Server.CreateObject ("ADODB.Command")
rsID_cmd.ActiveConnection = MM_connReview_STRING
rsID_cmd.CommandText = "SELECT * FROM review_list WHERE ID = ?" 
rsID_cmd.Prepared = true
rsID_cmd.Parameters.Append rsID_cmd.CreateParameter("param1", 5, 1, -1, rsID__MMColParam) ' adDouble

Set rsID = rsID_cmd.Execute
rsID_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
rsCategory_numRows = rsCategory_numRows + Repeat1__numRows
%>
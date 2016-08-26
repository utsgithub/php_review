<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/connReview.asp" -->
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
If (CStr(Request("MM_insert")) = "form1") Then
  If (Not MM_abortEdit) Then
    ' execute the insert
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_conn_STRING
    MM_editCmd.CommandText = "INSERT INTO review_list (answer, answer_cn, answer_draft, answer_simple, category, question, question_cn) VALUES (?, ?, ?, ?, ?, ?, ?)" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 202, 1, -1, Request.Form("answer")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 202, 1, -1, Request.Form("answer_cn")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 202, 1, -1, Request.Form("answer_draft")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param4", 202, 1, -1, Request.Form("answer_simple")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param5", 202, 1, -1, Request.Form("category")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param6", 202, 1, -1, Request.Form("question")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param7", 202, 1, -1, Request.Form("question_cn")) ' adVarWChar
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "review_list.asp"
    If (Request.QueryString <> "") Then
      If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0) Then
        MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
      Else
        MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
      End If
    End If
    Response.Redirect(MM_editRedirectUrl)
  End If
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<form action="<%=MM_editAction%>" method="post" name="form1" id="form1">
    <table align="center">
        <tr valign="baseline">
            <td nowrap="nowrap" align="right">Answer:</td>
            <td><input type="text" name="answer" value="" size="32" /></td>
        </tr>
        <tr valign="baseline">
            <td nowrap="nowrap" align="right">Answer_cn:</td>
            <td><input type="text" name="answer_cn" value="" size="32" /></td>
        </tr>
        <tr valign="baseline">
            <td nowrap="nowrap" align="right">Answer_draft:</td>
            <td><input type="text" name="answer_draft" value="" size="32" /></td>
        </tr>
        <tr valign="baseline">
            <td nowrap="nowrap" align="right">Answer_simple:</td>
            <td><input type="text" name="answer_simple" value="" size="32" /></td>
        </tr>
        <tr valign="baseline">
            <td nowrap="nowrap" align="right">Category:</td>
            <td><input type="text" name="category" value="" size="32" /></td>
        </tr>
        <tr valign="baseline">
            <td nowrap="nowrap" align="right">Question:</td>
            <td><input type="text" name="question" value="" size="32" /></td>
        </tr>
        <tr valign="baseline">
            <td nowrap="nowrap" align="right">Question_cn:</td>
            <td><input type="text" name="question_cn" value="" size="32" /></td>
        </tr>
        <tr valign="baseline">
            <td nowrap="nowrap" align="right">&nbsp;</td>
            <td><input type="submit" value="插入记录" /></td>
        </tr>
    </table>
    <input type="hidden" name="MM_insert" value="form1" />
</form>
<p>&nbsp;</p>

</body>
</html>

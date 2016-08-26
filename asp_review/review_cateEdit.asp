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
	MM_editSql="UPDATE review_category SET categoryName = '"&Request.Form("categoryName")&"'"
	MM_editSql=MM_editSql+", status = '"&Request.Form("status")&"'"
	MM_editSql=MM_editSql+" WHERE ID = "&Request.Form("MM_recordId")&"" 
	'response.Write(MM_editSql)
	'response.End()
    MM_editCmd.CommandText = MM_editSql
    'MM_editCmd.Prepared = true
    'MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 202, 1, 255, Request.Form("categoryName")) ' adVarWChar
    'MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 202, 1, 255, Request.Form("status")) ' adVarWChar
    'MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 5, 1, -1, MM_IIF(Request.Form("MM_recordId"), Request.Form("MM_recordId"), null)) ' adDouble
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "review_cateList.asp"
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
Recordset1_cmd.CommandText = "SELECT * FROM review_category WHERE ID = ?" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 5, 1, -1, Recordset1__MMColParam) ' adDouble

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<!DOCTYPE html>
<html lang="en">
<!-- InstanceBegin template="/Templates/template.dwt.asp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- InstanceBeginEditable name="doctitle" -->
<title>[<%=(Recordset1.Fields.Item("status").Value)%>]&nbsp;<%=(Recordset1.Fields.Item("categoryName").Value)%></title>
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
    <form method="POST" action="<%=MM_editAction%>" name="form1">
        <table align="center" class="table-condensed table table-nobordered">
            <tr valign="baseline">
                <td align="right" valign="middle" nowrap class="col-md-3">CategoryName:</td>
                <td class="col-md-9"><input type="text" name="categoryName" class="form-control size1of1"  value="<%=(Recordset1.Fields.Item("categoryName").Value)%>"></td>
            </tr>
            <tr valign="baseline">
                <td align="right" valign="middle" nowrap>Status:</td>
                <td><select name="status" class="form-control" >
                    <option value="active"  <%If (Not isNull(Recordset1.Fields.Item("status").Value)) Then If ("active" = CStr(Recordset1.Fields.Item("status").Value)) Then Response.Write("selected=""selected""") : Response.Write("")%>>active</option>
                    <option value="success"  <%If (Not isNull(Recordset1.Fields.Item("status").Value)) Then If ("success" = CStr(Recordset1.Fields.Item("status").Value)) Then Response.Write("selected=""selected""") : Response.Write("")%>>success</option>
                    <option value="warning"  <%If (Not isNull(Recordset1.Fields.Item("status").Value)) Then If ("warning" = CStr(Recordset1.Fields.Item("status").Value)) Then Response.Write("selected=""selected""") : Response.Write("")%>>warning</option>
                    <option value="danger" <%If (Not isNull(Recordset1.Fields.Item("status").Value)) Then If ("danger" = CStr(Recordset1.Fields.Item("status").Value)) Then Response.Write("selected=""selected""") : Response.Write("")%>>danger</option>
                    <option value="info" <%If (Not isNull(Recordset1.Fields.Item("status").Value)) Then If ("info" = CStr(Recordset1.Fields.Item("status").Value)) Then Response.Write("selected=""selected""") : Response.Write("")%>>info</option>
                    <option value="" <%If (isNull(Recordset1.Fields.Item("status").Value) or Recordset1.Fields.Item("status").Value="") Then Response.Write("selected=""selected""")%>>null</option>
                </select></td>
            </tr>
            <tr valign="baseline">
                <td align="right" valign="middle" nowrap>&nbsp;</td>
                <td><input type="submit" value="Update"></td>
            </tr>
        </table>
        <input type="hidden" name="MM_update" value="form1">
        <input type="hidden" name="MM_recordId" value="<%= Recordset1.Fields.Item("ID").Value %>">
    </form>
    <p>&nbsp;</p>
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

<%@LANGUAGE="VBSCRIPT"%>
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
    MM_editCmd.CommandText = "UPDATE review_list SET answer_cn = ?, answer_draft = ?, answer_simple = ?, category = ?, cid = ?, [complete] = ?, [image] = ?, img = ?, mark = ?, num = ?, question = ?, question_cn = ?, status = ? WHERE ID = ?" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 203, 1, 536870910, Request.Form("answer_cn")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 203, 1, 536870910, Request.Form("answer_draft")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 203, 1, 536870910, Request.Form("answer_simple")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param4", 202, 1, 255, Request.Form("category")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param5", 5, 1, -1, MM_IIF(Request.Form("cid"), Request.Form("cid"), null)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param6", 5, 1, -1, MM_IIF(Request.Form("complete"), 1, 0)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param7", 202, 1, 255, Request.Form("image")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param8", 202, 1, 255, Request.Form("img")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param9", 5, 1, -1, MM_IIF(Request.Form("mark"), 1, 0)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param10", 5, 1, -1, MM_IIF(Request.Form("num"), Request.Form("num"), null)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param11", 203, 1, 536870910, Request.Form("question")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param12", 203, 1, 536870910, Request.Form("question_cn")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param13", 202, 1, 255, Request.Form("status")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param14", 5, 1, -1, MM_IIF(Request.Form("MM_recordId"), Request.Form("MM_recordId"), null)) ' adDouble
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close
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
Recordset1_cmd.CommandText = "SELECT * FROM review_list WHERE ID = ?" 
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
<title><%=(Recordset1.Fields.Item("question").Value)%></title>
<!-- InstanceEndEditable -->
<!-- inc_head -->
<!--#include file="../inc/inc_head.asp" -->
<!-- InstanceBeginEditable name="head" -->
<link href="asset/dp.SyntaxHighlighter/Styles/SyntaxHighlighter.css" rel="stylesheet" type="text/css" />
<!--<script src="asset/dp.SyntaxHighlighter/Scripts/shCore.js"></script>
<script src="asset/dp.SyntaxHighlighter/Scripts/shBrushCpp.js"></script>
<script language="javascript">
window.onload = function () {
dp.SyntaxHighlighter.ClipboardSwf = 'asset/dp.SyntaxHighlighter/Scripts/clipboard.swf';
dp.SyntaxHighlighter.HighlightAll('code');
}
</script>-->
<script type="text/javascript" src="scripts/shCore.js"></script>
<script type="text/javascript" src="scripts/shBrushCpp.js"></script>
<link type="text/css" rel="stylesheet" href="styles/shCoreDefault.css"/>
<script type="text/javascript">SyntaxHighlighter.all();</script>
<!-- InstanceEndEditable -->
</head>
<body>
<!-- inc_nav --> 
<!--#include file="../inc/inc_nav.asp" -->
<div class="container"><!-- InstanceBeginEditable name="EditRegion1" -->
  <div><%=replace(Recordset1.Fields.Item("question").Value, chr(13), "<br/>")%></div>
  <div class="row">
    <div class="col-md-6">
    <% outAnswer=Recordset1.Fields.Item("answer").Value %>
    <% outAnswer=replace(outAnswer, "<", "&lt;") %>
      <pre class="brush: cpp;">
<%=outAnswer%>
</pre>
    </div>
    <div class="col-md-6">
      <form method="post" action="<%=MM_editAction%>" name="form1">
        <table class="table table-bordered mtl">
          <tr valign="baseline">
            <td nowrap align="right">Answer_cn:</td>
            <td><textarea name="answer_cn" rows="5" class="form-control"><%=(Recordset1.Fields.Item("answer_cn").Value)%></textarea></td>
          </tr>
          <tr valign="baseline">
            <td nowrap align="right">Answer_draft:</td>
            <td><textarea name="answer_draft" rows="5" class="form-control" ><%=(Recordset1.Fields.Item("answer_draft").Value)%></textarea></td>
          </tr>
          <tr valign="baseline">
            <td nowrap align="right">Answer_simple:</td>
            <td><textarea name="answer_simple" rows="5" class="form-control" ><%=(Recordset1.Fields.Item("answer_simple").Value)%></textarea></td>
          </tr>
          <tr valign="baseline" class="none">
            <td nowrap align="right">Category:</td>
            <td><input type="text" name="category" value="<%=(Recordset1.Fields.Item("category").Value)%>" size="32"></td>
          </tr>
          <tr valign="baseline" class="none">
            <td nowrap align="right">Cid:</td>
            <td><input type="text" name="cid" value="<%=(Recordset1.Fields.Item("cid").Value)%>" size="32"></td>
          </tr>
          <tr valign="baseline" class="none">
            <td nowrap align="right">Complete:</td>
            <td><input type="checkbox" name="complete" value=1 ></td>
          </tr>
          <tr valign="baseline" class="none">
            <td nowrap align="right">Image:</td>
            <td><input type="text" name="image" value="<%=(Recordset1.Fields.Item("image").Value)%>" size="32"></td>
          </tr>
          <tr valign="baseline" class="none">
            <td nowrap align="right">Img:</td>
            <td><input type="text" name="img" value="<%=(Recordset1.Fields.Item("img").Value)%>" size="32"></td>
          </tr>
          <tr valign="baseline" class="none">
            <td nowrap align="right">Mark:</td>
            <td><input type="checkbox" name="mark" value=1 ></td>
          </tr>
          <tr valign="baseline" class="none">
            <td nowrap align="right">Num:</td>
            <td><input type="text" name="num" value="<%=(Recordset1.Fields.Item("num").Value)%>" size="32"></td>
          </tr>
          <!--          <tr valign="baseline" class="none">
            <td nowrap align="right">Question:</td>
            <td><input type="text" name="question" value="<%=(Recordset1.Fields.Item("question").Value)%>" size="32"></td>
          </tr>-->
          <tr valign="baseline" class="none">
            <td nowrap align="right">Question_cn:</td>
            <td><input type="text" name="question_cn" value="<%=(Recordset1.Fields.Item("question_cn").Value)%>" size="32"></td>
          </tr>
          <tr valign="baseline" class="none">
            <td nowrap align="right">Status:</td>
            <td><input type="text" name="status" value="<%=(Recordset1.Fields.Item("status").Value)%>" size="32"></td>
          </tr>
          <tr valign="baseline">
            <td nowrap align="right">&nbsp;</td>
            <td><input type="submit" value="Update record"></td>
          </tr>
        </table>
        <input type="hidden" name="MM_update" value="form1">
        <input type="hidden" name="MM_recordId" value="<%= Recordset1.Fields.Item("ID").Value %>">
      </form>
      <p>&nbsp;</p>
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

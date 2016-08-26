<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../Connections/connReview.asp" -->
<%
Dim Recordset1__MMCid
Recordset1__MMCid = "0"
If (Request.QueryString("cid") <> "") Then 
  Recordset1__MMCid = Request.QueryString("cid")
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_connReview_STRING
Recordset1_cmd.CommandText = "SELECT * FROM review_list WHERE cid = ? and question<>"" and answer<>"" order by num asc" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 5, 1, -1, Recordset1__MMCid) ' adDouble

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
<title>Bootstrap Template</title>
<link href="../SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
<% If noshow=true Then %>
<link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<% End If %>
<!-- InstanceEndEditable -->
<!-- inc_head -->
<!--#include file="../inc/inc_head.asp" -->
<!-- InstanceBeginEditable name="head" -->
<script src="../SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<!-- InstanceEndEditable -->
</head>
<body>
<!-- inc_nav --> 
<!--#include file="../inc/inc_nav.asp" -->
<div class="container"><!-- InstanceBeginEditable name="EditRegion1" -->
  <table class="table table-condense table-bordered table-hover">
    <tr>
      <td>question</td>
      <td>answer</td>
      <td>question_cn</td>
      <td>answer_cn</td>
      <td>answer_simple</td>
      <td>answer_draft</td>
    </tr>
    <% While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) %>
      <tr>
        <td><%=(Recordset1.Fields.Item("question").Value)%></td>
        <td><%=(Recordset1.Fields.Item("answer").Value)%></td>
        <td><%=(Recordset1.Fields.Item("question_cn").Value)%></td>
        <td><%=(Recordset1.Fields.Item("answer_cn").Value)%></td>
        <td><%=(Recordset1.Fields.Item("answer_simple").Value)%></td>
        <td><%=(Recordset1.Fields.Item("answer_draft").Value)%></td>
      </tr>
      <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset1.MoveNext()
Wend
%>
  </table>
  <form action="review_asp_export.asp" method="get" class="form-inline" role="form">
    <div class="form-group"> <span id="sprytextfield1">
      <input name="categoryId" class="form-control" value="1846"/>
      <span class="textfieldRequiredMsg">A value is required.</span><span class="textfieldInvalidFormatMsg">Invalid format.</span></span> </div>
    <input type="submit" class="btn btn-primary">
    <input name="cid" type="hidden" value="<%= request.QueryString("cid") %>">
    <input name="export" type="hidden" value="csv" >
  </form>
  <script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1", "integer");
</script> 
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

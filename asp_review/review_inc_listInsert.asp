<%
If (CStr(Request("MM_insert")) = "formIncListInsert") Then
  If (Not MM_abortEdit) Then
    ' execute the insert
'    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_connReview_STRING
    MM_editCmd.CommandText = "INSERT INTO review_list (answer, cid, question) VALUES (?, ?, ?)" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 203, 1, 536870910, Request.Form("answer")) ' adLongVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 5, 1, -1, MM_IIF(Request.Form("cid"), Request.Form("cid"), null)) ' adDouble
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 203, 1, 536870910, Request.Form("question")) ' adLongVarWChar
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close
  End If
End If
%>
<link href="../assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

<form action="<%=MM_editAction%>" method="post" name="formIncListInsert" id="formIncListInsert">
    <table align="center" class="table">
        <tr valign="baseline">
            <td nowrap="nowrap" align="right">Question:</td>
            <td><input type="text" name="question" value="" class="form-control" /></td>
        </tr>
        <tr valign="baseline">
            <td nowrap="nowrap" align="right">Answer:</td>
            <td><input type="text" name="answer" value="" class="form-control"/></td>
        </tr>
        <tr valign="baseline">
            <td nowrap="nowrap" align="right">&nbsp;</td>
            <td><input type="submit" value="Insert Record" class="btn btn-primary"/></td>
        </tr>
    </table>
    <input type="hidden" name="cid" value="<%= request.QueryString("pid") %>" />
    <input type="hidden" name="MM_insert" value="formIncListInsert" />
</form>
<p>&nbsp;</p>

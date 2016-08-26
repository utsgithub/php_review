<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html>
<html lang="en">
<!-- InstanceBegin template="/Templates/template.dwt.asp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Insert Success</title>
<%
	getSort=request.Form("sort")
%>
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
If (CStr(Request("MM_insert")) = "form_inc_insertCate") Then
  If (Not MM_abortEdit) Then
    ' execute the insert
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_connReview_STRING
    MM_editCmd.CommandText = "INSERT INTO review_category (categoryName, parentID, sort) VALUES (?, ?, "&getSort&")" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 202, 1, 255, Request.Form("categoryName")) ' adVarWChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 5, 1, -1, MM_IIF(Request.Form("parentID"), Request.Form("parentID"), null)) ' adDouble
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close
  End If
End If
%>
<% 
If (CStr(Request("MM_insert")) = "form_inc_insertCate") Then
	page = request.QueryString("page")
	pid=request.QueryString("pid")
	if page<>"" and pid<>"" then response.Redirect(page&".asp?pid="&pid)
End if
 %>
    <div class="bs-example-modal">
        <div class="modal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-primary">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">Information</h4>
                    </div>
                    <div class="modal-body">
                        <p>Press <kbd><kbd>Ctrl</kbd> + <kbd>W</kbd></kbd></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
                <!-- /.modal-content --> 
            </div>
            <!-- /.modal-dialog --> 
        </div>
        <!-- /.modal --> 
    </div>
    <!-- /example -->
    <form method="post" action="<%=MM_editAction%>" name="form_inc_insertCate" class="none">
        <table align="center">
            <tr valign="baseline">
                <td nowrap align="right">CategoryName:</td>
                <td><input type="text" name="categoryName" value="" size="32"></td>
            </tr>
            <tr valign="baseline">
                <td nowrap align="right">ParentID:</td>
                <td><input type="text" name="parentID" value="" size="32"></td>
            </tr>
            <tr valign="baseline">
                <td nowrap align="right">&nbsp;</td>
                <td><input type="submit" value="Insert record"></td>
            </tr>
        </table>
        <input type="hidden" name="MM_insert" value="form_inc_insertCate">
    </form>
    <p>&nbsp;</p>
    <!-- InstanceEndEditable --></div>
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
</body>
<!-- InstanceEnd -->
</html>

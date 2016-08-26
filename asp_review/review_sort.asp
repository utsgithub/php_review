<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../Connections/connReview.asp" -->
<% 
	arr=request.QueryString("arr")
	If arr<>"" then
		set conn=Server.CreateObject("ADODB.Connection")
		conn.Provider="Microsoft.Jet.OLEDB.4.0"
		conn.Open MM_connReview_STRING 
		set rs = Server.CreateObject("ADODB.recordset")
		arr=request.QueryString("arr")
		arr=split(arr,",")
		maxBound=Ubound(arr)
		for i=0 to maxBound
			sql="UPDATE review_category SET sort = "&i&" WHERE id = "&arr(i)
			'response.Write(sql&"<br/>")
			conn.execute(sql)
		next
		response.Redirect("review_sort.asp?pid="&request.QueryString("pid"))
		response.End()
	end if
 %>
<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "1"
If (Request.QueryString("pid") <> "") Then 
  Recordset1__MMColParam = Request.QueryString("pid")
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_connReview_STRING
Recordset1_cmd.CommandText = "SELECT * FROM review_category WHERE parentID = ? ORDER BY sort ASC" 
Recordset1_cmd.Prepared = true
Recordset1_cmd.Parameters.Append Recordset1_cmd.CreateParameter("param1", 5, 1, -1, Recordset1__MMColParam) ' adDouble

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
<html lang="en" xmlns:spry="http://ns.adobe.com/spry">
<!-- InstanceBegin template="/Templates/template.dwt.asp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Bootstrap Template</title>
<!-- InstanceEndEditable -->
<!-- inc_head -->
<!--#include file="../inc/inc_head.asp" -->
<!-- InstanceBeginEditable name="head" -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
  $(function() {
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
  });
  </script>

<!-- InstanceEndEditable -->
</head>
<body>
<!-- inc_nav --> 
<!--#include file="../inc/inc_nav.asp" -->
<div class="container"><!-- InstanceBeginEditable name="EditRegion1" -->
    <div>
        <ul id="sortable" class="list-group">
            <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) 
%>
                <li id="<%=(Recordset1.Fields.Item("ID").Value)%>" class="list-group-item" style="cursor:move;"><span class="glyphicon glyphicon-sort"></span> <%=(Recordset1.Fields.Item("id").Value)%>-<%=(Recordset1.Fields.Item("categoryName").Value)%>-<%=(Recordset1.Fields.Item("sort").Value)%></li>
                <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset1.MoveNext()
Wend
%>
        </ul>
    </div>
    <a class="btn btn-primary f_sort">Submit</a> <!-- InstanceEndEditable --></div>
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
</body>
<!-- InstanceEnd -->
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
<script>
$(".f_sort").click(function(){
		var arr=new Array();
		$("#sortable li").each(function(index){
			arr.push($("#sortable li").eq(index).attr("id"));	
		});
		url="review_sort.asp?arr="+arr+"&pid=<%= request.QueryString("pid") %>";
		alert(url);
		window.location.href=url;
	});

</script>
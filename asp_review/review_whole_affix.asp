<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../Connections/connReview.asp" -->
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_connReview_STRING
Recordset1_cmd.CommandText = "SELECT * FROM review_category where id>4 and id<14" 
Recordset1_cmd.Prepared = true

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
    <div class="row">
        <div class="col-md-8" role="main">
            <%
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.Jet.OLEDB.4.0"
MM_conn_STRING = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="& Server.MapPath("/asp_meal/data/meal.mdb")
conn.Open MM_conn_STRING

set rs = Server.CreateObject("ADODB.recordset")
rs.Open "SELECT * FROM review_category where id>4 and id<14", conn
%>
            <%do until rs.EOF%>
            <h2 id="<%Response.Write(rs("categoryname").value)%>">
                <%Response.Write(rs("categoryname").value)%>
            </h2>
            <% If rs("image")<>"" Then %>
            <div><img src="images/<%=rs("image")%>" class="img-thumbnail" style="width:100%"></div>
            <% End If %>
            <%     
	set rs2= Server.CreateObject("ADODB.recordset")
	rs2.open "select * from review_list where cid="&rs("id"), conn
	do until rs2.eof
%>
            <div class="mtm">
                <div class="none"><strong>[<%=(rs2.Fields.Item("num").Value)%>:]</strong></div>
                <div><strong><em><%=(rs2.Fields.Item("num").Value)%>:<%=(rs2.Fields.Item("question").Value)%></em></strong></div>
                <div>
                    <% if rs2.Fields.Item("answer").Value<>"" Then %>
                    <%=(replace(rs2.Fields.Item("answer").Value, CHR(10), "<br/>"))%>
                    <% End If %>
                </div>
            </div>
            <% rs2.MoveNext 
loop
rs2.close%>
            <%rs.MoveNext%>
            <%loop
			rs.close
			conn.close
		%>
        </div>
        <div class="col-md-2">
            <div class="affix" role="complementary">
                <ul class="nav bs-docs-sidenav">
                    <li> Overview
                        <ul class="nav">
                            <% 
While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) 
%>
                                <li><a href="#<%=(Recordset1.Fields.Item("categoryName").Value)%>">
								<%=(Recordset1.Fields.Item("categoryName").Value)%></a></li>
                                <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset1.MoveNext()
Wend
%>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> 
    <script src="assets/bootstrap/js/bootstrap.min.js"></script> 
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

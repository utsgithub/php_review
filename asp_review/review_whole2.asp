<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/connReview.asp" -->
<!DOCTYPE html>
<html lang="en">
<!-- InstanceBegin template="/Templates/template.dwt.asp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- InstanceBeginEditable name="doctitle" -->
<title>
<% If request.QueryString("title")<>"" Then %>
<%= request.QueryString("title") %>
<% Else %>
Whole Page
<% End If %>
</title>
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
    <%
Set conn      = Server.CreateObject("ADODB.Connection")
conn.Provider = "Microsoft.Jet.OLEDB.4.0"
conn.Open MM_connReview_STRING 
Set rs           = Server.CreateObject("ADODB.recordset")
sql= "SELECT * FROM review_category where parentID=" & Request.QueryString("pid")
response.Write(sql)
rs.Open sql, conn

Response.charset = "utf-8" %>
    <% Do until rs.EOF %>
    <h2>
        ##<% Response.Write(rs("categoryname").value) %>
    </h2>
    <% If rs("image") <> "" Then %>
    <div><img src="images/<% = rs("image") %>" class="img-thumbnail"></div>
    <% End If %>
    <%
Set rs2          = Server.CreateObject("ADODB.recordset")
rs2.open "select * from review_list where cid=" & rs("id"), conn
num=1
Do until rs2.eof %>
    <div class="mtm">
        <div class="none"><strong>[<% = (rs2.Fields.Item("num").Value) %>:]</strong></div>
        <div><strong><em>###<% = (rs2.Fields.Item("question").Value) %></em></strong></div>
        <div>
            <% If rs2.Fields.Item("answer").Value <> "" Then %>
            <div>####English Answer: <div>
            <% = (Replace(rs2.Fields.Item("answer").Value, Chr(10), "<br/>")) %>
            <% End If %>
        </div>
        <div>
            <% If rs2.Fields.Item("answer_cn").Value <> "" Then %>
            <div>####中文翻译：<div>
            <% = (Replace(rs2.Fields.Item("answer_cn").Value, Chr(10), "<br/>")) %>
            <% End If %>
        </div>
    </div>
    <% 
	num=num+1
	rs2.MoveNext

Loop

rs2.Close %>
    <% rs.MoveNext %>
    <% Loop

rs.Close
conn.Close %>
    <!-- InstanceEndEditable --></div>
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
</body>
<!-- InstanceEnd -->
</html>
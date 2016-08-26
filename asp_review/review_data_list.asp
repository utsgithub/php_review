<?xml version="1.0" encoding="utf-8"?> 
<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/connReview.asp" -->
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_connReview_STRING
Recordset1_cmd.CommandText = "SELECT * FROM review_list" 
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
<root>
<% While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) %>
    <list>
        <% for i=0 to Recordset1.Fields.count-1 %>
        <<%=(Recordset1.Fields.Item(i).Name)%>><%=(Recordset1.Fields.Item(i).Value)%></<%=(Recordset1.Fields.Item(i).Name)%>>
        <% next %>
    </list>
    <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset1.MoveNext()
Wend
%>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
</root>

<%@Language="vbscript" Codepage="65001"%>
<!--#include file="../Connections/connReview.asp" -->
<% 
cid=request.QueryString("cid")
num=request.QueryString("num")
 %>
<%
Dim Recordset1__MMColParam
Recordset1__MMColParam = "0"
If (Request.QueryString("cid") <> "") Then 
  Recordset1__MMColParam = Request.QueryString("cid")
End If
%>
<%
Dim Recordset1__MMCid
Recordset1__MMCid = "0"
If (Request.QueryString("num") <> "") Then 
  Recordset1__MMCid = Request.QueryString("num")
End If
%>
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_connReview_STRING
Recordset1_cmd.CommandText = "SELECT * FROM review_list WHERE num = "&num&" and cid= "&cid

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<% response.Redirect("review_edit2.asp?cid="&cid&"&id="&Recordset1("id")) %>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>

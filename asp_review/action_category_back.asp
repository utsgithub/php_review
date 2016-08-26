<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/connReview.asp" -->
<%
	getCid=request.QueryString("cid")
	getPageName=request.QueryString("pagename")
	Set rs=Server.CreateObject("ADODB.Recordset")
	SQL="select * from review_category where id="&getCid
	rs.open SQL,MM_connReview_STRING,1,3
	response.Redirect(getPageName&".asp?pid="&rs("parentid"))
%>
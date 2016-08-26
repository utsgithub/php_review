<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
 <!--#include file="../Connections/connReview.asp" -->
<% 
	set conn=Server.CreateObject("ADODB.Connection")
	conn.Provider="Microsoft.Jet.OLEDB.4.0"
	conn.Open MM_connReview_STRING 
	%>

 <%
 	

	set rs = Server.CreateObject("ADODB.recordset")
	
arr=request.QueryString("arr")
arr=split(arr,",")
maxBound=Ubound(arr)
for i=0 to maxBound
sql="UPDATE review_category SET sort = "&i&" WHERE id = "&arr(i)&" "
conn.execute(sql)
next
 %>
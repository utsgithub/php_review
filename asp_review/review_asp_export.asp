<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/connReview.asp" -->
<% 
question="question_cn"
answer="answer_simple"
categoryId=request.QueryString("categoryId")
export=request.QueryString("export")
cid=request.QueryString("cid")

%>
<% If export="xls" Then 
	symbol=chr(9) 
	Response.ContentType = "Application/msexcel"
	end if
	%>
<% If export="csv" Then symbol="," %>

 <% If categoryId<>"" and export<>"" and cid<>""  Then %>
<%  
'设置编码
'Response.Buffer = true
'  session.codepage="936"
'Response.CodePage = "936"
'Response.CharSet = "gb2312"
''设置文件头

Response.AddHeader "Content-Disposition", "attachment;filename=""exportTo"&categoryId&"."&export&"" 
'Response.ContentType = "application/octet-stream"  
'定义文件名

'定义文件名
'  dim  remotefile
'   remotefile=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)
'Response.AddHeader "Content-Disposition", "attachment;filename="&remotefile&".csv" 
%>
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
Recordset1_cmd.CommandText = "SELECT * FROM review_list WHERE cid = ? and "&question&"<>"""" and "&answer&"<>"""" order by num asc" 
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


    <%
	dim   strLine,responsestr   
    strLine   =   strLine   &   "categoryId"&symbol&"subTitle"&symbol&"subject"&vbnewline
	%>
    <% While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) %>
    <% 
	answer_=trim(replace(Recordset1.Fields.Item(answer).Value,"""",""""""))
	question_=trim(replace(Recordset1.Fields.Item(question).Value,"""",""""""))
	strLine=strLine&categoryId&symbol&""""&answer_&""""&symbol&""""&question_&""""&vbnewline
	 %>
      
      <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset1.MoveNext()
Wend
%>
<% response.write strLine %>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
<% End If %>

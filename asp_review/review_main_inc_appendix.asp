<%
Dim rsAppendix__MMColParam
rsAppendix__MMColParam = "1"
If (Request.QueryString("id") <> "") Then 
  rsAppendix__MMColParam = Request.QueryString("id")
End If
%>
<%
Dim rsAppendix
Dim rsAppendix_cmd
Dim rsAppendix_numRows

Set rsAppendix_cmd = Server.CreateObject ("ADODB.Command")
rsAppendix_cmd.ActiveConnection = MM_connReview_STRING
rsAppendix_cmd.CommandText = "SELECT * FROM review_appendix WHERE lID = ?" 
rsAppendix_cmd.Prepared = true
rsAppendix_cmd.Parameters.Append rsAppendix_cmd.CreateParameter("param1", 5, 1, -1, rsAppendix__MMColParam) ' adDouble

Set rsAppendix = rsAppendix_cmd.Execute
rsAppendix_numRows = 0
%>
<%
Dim RepeatAppendix__numRows
Dim RepeatAppendix__index

RepeatAppendix__numRows = -1
RepeatAppendix__index = 0
rsAppendix_numRows = rsAppendix_numRows + RepeatAppendix__numRows
%>
<% If Not rsAppendix.EOF Or Not rsAppendix.BOF Then %>
  <table class="table table-border">
    <tr>
      <td>ID</td>
      <td>lID</td>
      <td>file</td>
    </tr>
    <% While ((RepeatAppendix__numRows <> 0) AND (NOT rsAppendix.EOF)) %>
      <tr>
        <td><%=(rsAppendix.Fields.Item("ID").Value)%></td>
        <td><%=(rsAppendix.Fields.Item("lID").Value)%></td>
        <td><a href="temp/dsa/labs/<%=rsAppendix.Fields.Item("file").Value %>" target="_blank"><%=(rsAppendix.Fields.Item("file").Value)%></a></td>
      </tr>
      <% 
  RepeatAppendix__index=RepeatAppendix__index+1
  RepeatAppendix__numRows=RepeatAppendix__numRows-1
  rsAppendix.MoveNext()
Wend
%>
  </table>
  <% End If ' end Not rsAppendix.EOF Or NOT rsAppendix.BOF %>
<%
rsAppendix.Close()
Set rsAppendix = Nothing
%>

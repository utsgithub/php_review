<div>
  <% 
		outputQuestion="null" 
		outputQuestion=Recordset1.Fields.Item("question").Value
		outputQuestion=replace(outputQuestion, "<", " <")
		outputQuestion=replace(outputQuestion, ">", "> ")
		outputQuestion=replace(outputQuestion, "  ", " ")
		outputQuestion=replace(outputQuestion, "  ", " ")
		outputQuestion=replace(outputQuestion, "  ", " ")
		response.Write(outputQuestion)
    %>
  <% 
		outputAnswer="null" 
		outputAnswer=Recordset1.Fields.Item("answer").Value
		outputAnswer=replace(outputAnswer, "<img src=""", "<img src=""mvc/")
		response.Write(outputAnswer)
	  %>
  <% If Recordset1.Fields.Item("Answer_simple").Value<>"" Then %>
  <% 
	outputAnswer_simple="null" 
	outputAnswer_simple=Recordset1.Fields.Item("Answer_simple").Value
	response.Write("<pre class=""brush: csharp;"">"&outputAnswer_simple&"</pre>")
	'outputAnswer_simple=replace(outputAnswer_simple, "<pre>", "<pre class=""brush: csharp;"">")
		
	%>
  <% End If %>
  <div class="mtm">
    <% 
		outputAnswer_cn="null" 
		outputAnswer_cn=Recordset1.Fields.Item("Answer_cn").Value
		if outputAnswer_cn<>"" then response.Write("<div class=""alert alert-warning"" role=""alert"">"&outputAnswer_cn&"</div>")
    %>
  </div>
</div>

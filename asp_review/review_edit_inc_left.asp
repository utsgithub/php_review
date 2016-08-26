<!--#include file="review_inc_cateInfoStatus.asp" -->
<div class="panel-group admin" id="accordion" role="tablist" aria-multiselectable="true">
	<div class="panel panel-default">
		<div class="panel-heading admin" role="tab" id="headingOne">
			<h4 class="panel-title"> <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne"> Insert </a> </h4>
		</div>
		<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
			<div class="panel-body">
				<div class="pam"> 
					<!--#include file="review_inc_insertQuestion.asp" --> 
				</div>
			</div>
		</div>
	</div>
</div>
<% If rsCategory.EOF And rsCategory.BOF Then %>
	<% response.Redirect("review_list.asp?cid="&request.QueryString("cid")) %>
	<% End If ' end rsCategory.EOF And rsCategory.BOF %>
<ul class="nav nav-pills nav-stacked">
	<% 
					If (Request.QueryString("id") = "") Then 
						response.Redirect("?cid="&request.QueryString("cid")&"&id="&(rsCategory.Fields.Item("ID").Value))
					End If
				 %>
	<% While ((Repeat1__numRows <> 0) AND (NOT rsCategory.EOF)) %>
		<li class="list-group-item-<%= rsCategory.Fields.Item("status").Value %>"><a href="?cid=<%=(rsCategory.Fields.Item("cid").Value)%>&id=<%=(rsCategory.Fields.Item("ID").Value)%>">
			<% If cint(rsCategory.Fields.Item("ID").Value)=cint(Request.QueryString("id")) Then %>
			<span class="glyphicon glyphicon-hand-right"></span>
			<% End If %>
			<% If rsCategory.Fields.Item("answer").Value <>"" or rsCategory.Fields.Item("num").Value<>null Then %>
			<span class="glyphicon glyphicon-ok"></span>
			<% End If %>
			<% 
	  leftNavValue=""
	  if rsCategory.Fields.Item("question").Value<>"" then
	  	leftNavValue=left(rsCategory.Fields.Item("question").Value, 50)
		leftNavValue=replace(leftNavValue, "<", "&lt;")
	  end if
	   %>
			<%=Repeat1__index+1%>- <%=(leftNavValue)%>...</a> </li>
		<% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  rsCategory.MoveNext()
Wend
%>
</ul>

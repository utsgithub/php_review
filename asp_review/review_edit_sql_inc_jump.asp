<ul class="nav nav-pills">
	<li><a class="btn btn-primary" href="review_asp_jump.asp?cid=<%= cid %>&num=<%= cint(rsID.Fields.Item("num").Value)-1 %>">Left</a></li>
	<li><a href="review_list.asp?cid=<%= cid %>" class="btn btn-primary">List</a></li>
	<li class="none"><a href="review_temp_dsa_view_single.asp?id=<%= getID %>" target="_blank" class="btn btn-primary">DSA Single View</a></li>
	<li class="none"><a href="review_page_frame_question.asp?id=<%= rsID.Fields.Item("ID").Value %>" target="_blank" class="btn btn-warning">Ask</a></li>
	<li class="none"><a href="review_page_code.asp?id=<%= rsID.Fields.Item("ID").Value %>" target="_blank" class="btn btn-warning">Code</a></li>
	<li class="none"><a href="review_temp_mvc_view_single.asp?cid=<%= cid %>&id=<%= rsID.Fields.Item("ID").Value %>" target="_blank" class="btn btn-warning">MVC</a></li>
	<li class="none"><a href="review_edit2.asp?cid=<%= cid %>&id=<%= rsID.Fields.Item("ID").Value %>" class="btn btn-warning">Normal</a></li>
	<li class="none"><a href="review_page_export.asp?cid=<%= cid %>" target="_blank" class="btn btn-info">Export</a></li>
	<li><a href="review_asp_jump.asp?cid=<%= cid %>&num=<%= cint(rsID.Fields.Item("num").Value)+1 %>" class="btn btn-primary" accesskey="n">Next</a></li>
	<li class="none"><a href="review_inc_page_next.asp?" class="btn btn-primary">Up</a></li>
</ul>

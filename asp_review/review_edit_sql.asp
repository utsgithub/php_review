<%@Language="vbscript" Codepage="65001"%>
<!--#include file="../Connections/connReview.asp" -->
<!--#include file="review_edit_sql_inc_top.asp" -->
<!DOCTYPE html>

<!-- InstanceBegin template="/Templates/template.dwt.asp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- InstanceBeginEditable name="doctitle" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Review Edit</title>
<!-- InstanceEndEditable -->
<!-- inc_head -->
<!--#include file="../inc/inc_head.asp" -->
<!-- InstanceBeginEditable name="head" -->
<link href="asset/dp.SyntaxHighlighter/Styles/SyntaxHighlighter.css" rel="stylesheet" type="text/css" />
<script src="asset/dp.SyntaxHighlighter/Scripts/shCore.js"></script>
<script src="asset/dp.SyntaxHighlighter/Scripts/shBrushCpp.js"></script>
<script src="asset/dp.SyntaxHighlighter/Scripts/shBrushSql.js"></script>
<script language="javascript">
window.onload = function () {
dp.SyntaxHighlighter.ClipboardSwf = 'asset/dp.SyntaxHighlighter/Scripts/clipboard.swf';
dp.SyntaxHighlighter.HighlightAll('code');
}
</script>
<!-- InstanceEndEditable -->
</head>
<body>
<!-- inc_nav --> 
<!--#include file="../inc/inc_nav.asp" -->
<div class="container"><!-- InstanceBeginEditable name="EditRegion1" -->
  <div class="row">
    <div class="col-xs-4"> 
      <!--#include file="review_edit_inc_left.asp" --> 
    </div>
    <div class="col-xs-8">
      <% If request.QueryString("image")<>"" Then %>
      <div><img src="images/<%=request.QueryString("image")%>" class="img-thumbnail"></div>
      <% End If %>
      <script>
	function showTextarea(a){
		document.getElementById('textarea_'+a).style.display='block';
	}	
</script>
      <form method="post" action="<%=MM_editAction%>" name="form1" class="<% If request.QueryString("id")="" Then %>none<% End If %>
">
        <table align="center" class="table-condensed">
          <% If rsID.Fields.Item("img").Value<>"" Then %>
          <tr valign="baseline">
            <td nowrap align="right">Image:</td>
            <td><img src="images/<%=(rsID.Fields.Item("img").Value)%>" class="img-thumbnail"></td>
          </tr>
          <% End If %>
          <tr valign="baseline">
            <td nowrap align="right">Question:</td>
            <td><div><%=(rsID.Fields.Item("question").Value)%></div>
              <textarea name="question" class="form-control none" id="f_needTranslate" cols="200" rows="10"><%=(rsID.Fields.Item("question").Value)%></textarea></td>
          </tr>
          <tr valign="baseline" class="admin">
            <td nowrap align="right"><a href="javascript:showTextarea('question_cn')">Question_cn:</a></td>
            <td><div class="prePart">
                <pre name="code" class="sql">
                <%=(rsID.Fields.Item("question_cn").Value)%> </div>
              <a class="f_showTextarea" href="javascript:void(0)">Edit</a>
              <textarea name="question_cn" rows="5" class="form-control none"><%=(rsID.Fields.Item("question_cn").Value)%></textarea></td>
          </tr>
          <tr valign="baseline">
            <td nowrap align="right"><a target="_blank">Answer:</a></td>
            <td><div class="prePart">
                <pre name="code" class="sql"><%=(rsID.Fields.Item("answer").Value)%></pre>
              </div>
              <a class="f_showTextarea" href="javascript:void(0)">Edit</a>
              <textarea name="answer" cols="200" class="form-control none" rows="5"><%=(rsID.Fields.Item("answer").Value)%></textarea></td>
          </tr>
          <tr valign="baseline" class="admin">
            <td nowrap align="right">Answer_simple:</td>
            <td><div class="prePart">
                <pre name="code" class="sql"><%=(rsID.Fields.Item("answer_simple").Value)%></pre>
              </div>
              <a class="f_showTextarea" href="javascript:void(0)">Edit</a>
              <textarea name="answer_simple" class="form-control none" rows="5"><%=(rsID.Fields.Item("answer_simple").Value)%></textarea></td>
          </tr>
          <tr valign="baseline" class="admin none">
            <td nowrap align="right">Image:</td>
            <td><input name="img" type="text" class="form-control" value="<%=(rsID.Fields.Item("img").Value)%>" size="200"></td>
          </tr>
          <tr valign="baseline" class="none admin">
            <td nowrap align="right">Answer_cn:</td>
            <td><textarea name="answer_cn" rows="5" class="form-control"><%=(rsID.Fields.Item("answer_cn").Value)%></textarea></td>
          </tr>
          <tr valign="baseline" class="admin">
            <td nowrap align="right">Answer_draft:</td>
            <td><a class="f_showTextarea" href="javascript:void(0)">Edit</a>
              <textarea name="answer_draft" rows="5" class="form-control none"><%=(rsID.Fields.Item("answer_draft").Value)%></textarea></td>
          </tr>
          <tr valign="baseline" class="none admin">
            <td nowrap align="right">Category:</td>
            <td><input type="text" name="category" value="<%=(rsID.Fields.Item("category").Value)%>"  class="form-control"></td>
          </tr>
          <tr valign="baseline" class="none admin">
            <td nowrap align="right">Complete:</td>
            <td><input type="checkbox" name="complete" value=1 ></td>
          </tr>
          <tr valign="baseline" class="none admin">
            <td nowrap align="right">Num:</td>
            <td><input type="text" name="num" value="<%=(rsID.Fields.Item("num").Value)%>"  class="form-control"></td>
          </tr>
          <tr valign="baseline" class="admin">
            <td nowrap align="right">Status:</td>
            <td><select name="status" class="form-control" id="status">
                <option value="<%=(rsID.Fields.Item("status").Value)%>"><%=(rsID.Fields.Item("status").Value)%></option>
                <!--#include file="review_inc_select_status.asp" -->
              </select></td>
          </tr>
          <tr valign="baseline">
            <td nowrap align="right">&nbsp;</td>
            <td><input type="submit" class="btn btn-default" value="Update"></td>
          </tr>
        </table>
        <input type="hidden" name="MM_update" value="form1">
        <input type="hidden" name="MM_recordId" value="<%= rsID.Fields.Item("ID").Value %>">
      </form>
      <div class="fl_r"> 
        <!--#include file="review_edit_sql_inc_jump.asp" --> 
      </div>
      <!--include file="review_inc_listInsert.asp" --> 
      
    </div>
  </div>
  <!-- InstanceEndEditable --></div>
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
</body>
<!-- InstanceEnd -->
</html><%
rsCategory.Close()
Set rsCategory = Nothing
%>
<%
rsID.Close()
Set rsID = Nothing
%>
<script src="js/review_common.js"></script>
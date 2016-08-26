<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>frameset 演示</title>
</head>
<frameset cols="30%,*"  noresize="noresize">
<frame src="review_page_question.asp?id=<%= request.QueryString("id") %>" name="frm1"  />
<frame src="http://zhidao.baidu.com/new?word=&ie=GBK"  name="frm2"/>
<noframes>
</noframes>
</frameset>
</html>

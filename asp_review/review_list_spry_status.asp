<!DOCTYPE html>
<html lang="en" xmlns:spry="http://ns.adobe.com/spry">
<!-- InstanceBegin template="/Templates/template.dwt.asp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- InstanceBeginEditable name="doctitle" -->
<title>Status</title>
<!-- InstanceEndEditable -->
<!-- inc_head -->
<!--#include file="../inc/inc_head.asp" -->
<!-- InstanceBeginEditable name="head" -->
<script type="text/javascript">
 var params = Spry.Utils.getLocationParamsAsObject();

 var xpath = "root/list";

   if ((params.cid) && (params.status))
   xpath = "root/list[cid = '"+params.cid+"' and status= '"+params.status+"']";
var ds1 = new Spry.Data.XMLDataSet("review_data_list.asp", xpath, {sortOnLoad: "num", sortOrderOnLoad: "ascending"});
</script>
<!-- InstanceEndEditable -->
</head>
<body>
<!-- inc_nav --> 
<!--#include file="../inc/inc_nav.asp" -->
<div class="container"><!-- InstanceBeginEditable name="EditRegion1" --> 
    <script type="text/javascript">document.write('<h1 class="text-'+params.status+'">'+params.status+'</h1>');</script>
    <h1 class="text-danger"></h1>
    <div spry:region="ds1">
        <table class="table table-bordered table-condensed table-hover size1of1">
            <tr>
                <th spry:sort="ID">ID</th>
                <th spry:sort="question">Question</th>
                <th spry:sort="num">Num</th>
                <th spry:sort="status">Status</th>
            </tr>
            <tr spry:repeat="ds1">
                <td>{ID}</td>
                <td><a href="review_edit2.asp?id={ID}&cid={cid}" target="_blank">{question}</a></td>
                <td>{num}</td>
                <td>{status}</td>
            </tr>
        </table>
    </div>
    <!-- InstanceEndEditable --></div>
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
</body>
<!-- InstanceEnd -->
</html>
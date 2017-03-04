<?php
$colname_rsCateList = "0";
if (isset($_GET['parentID'])) {
    $colname_rsCateList = $_GET['parentID'];
}
mysql_select_db($database_conn, $conn);
$query_rsCateList = sprintf("SELECT * FROM review_catgory WHERE parentID = %s ORDER BY sort ASC", GetSQLValueString($colname_rsCateList, "int"));
$rsCateList = mysql_query($query_rsCateList, $conn) or die(mysql_error());
$row_rsCateList = mysql_fetch_assoc($rsCateList);
$totalRows_rsCateList = mysql_num_rows($rsCateList);
?>
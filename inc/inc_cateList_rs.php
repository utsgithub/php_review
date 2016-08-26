<?php
if (!function_exists("GetSQLValueString")) {
    function GetSQLValueString($theValue, $theType, $theDefinedValue = "", $theNotDefinedValue = "")
    {
        if (PHP_VERSION < 6) {
            $theValue = get_magic_quotes_gpc() ? stripslashes($theValue) : $theValue;
        }

        $theValue = function_exists("mysql_real_escape_string") ? mysql_real_escape_string($theValue) : mysql_escape_string($theValue);

        switch ($theType) {
            case "text":
                $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
                break;
            case "long":
            case "int":
                $theValue = ($theValue != "") ? intval($theValue) : "NULL";
                break;
            case "double":
                $theValue = ($theValue != "") ? doubleval($theValue) : "NULL";
                break;
            case "date":
                $theValue = ($theValue != "") ? "'" . $theValue . "'" : "NULL";
                break;
            case "defined":
                $theValue = ($theValue != "") ? $theDefinedValue : $theNotDefinedValue;
                break;
        }
        return $theValue;
    }
}

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
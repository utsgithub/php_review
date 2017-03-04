<?php require_once('Connections/conn.php'); ?>
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

$editFormAction = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING'])) {
    $editFormAction .= "?" . htmlentities($_SERVER['QUERY_STRING']);
}

if ((isset($_POST["MM_insert"])) && ($_POST["MM_insert"] == "form1")) {
    $insertSQL = sprintf("INSERT INTO review_catgory (categoryName, parentID, status, image, sort, note, appendix) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                         GetSQLValueString($_POST['categoryName'], "text"),
                         GetSQLValueString($_POST['parentID'], "int"),
                         GetSQLValueString($_POST['status'], "text"),
                         GetSQLValueString($_POST['image'], "text"),
                         GetSQLValueString($_POST['sort'], "int"),
                         GetSQLValueString($_POST['note'], "text"),
                         GetSQLValueString($_POST['appendix'], "text"));

    mysql_select_db($database_conn, $conn);
    $Result1 = mysql_query($insertSQL, $conn) or die(mysql_error());

    $insertGoTo = "review_cateList.php";
    if (isset($_SERVER['QUERY_STRING'])) {
        $insertGoTo .= (strpos($insertGoTo, '?')) ? "&" : "?";
        $insertGoTo .= $_SERVER['QUERY_STRING'];
    }
    header(sprintf("Location: %s", $insertGoTo));
}
?>
<!DOCTYPE html>
<html lang="en">
<!-- InstanceBegin template="/Templates/template.dwt.php" codeOutsideHTMLIsLocked="false" -->
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- InstanceBeginEditable name="doctitle" -->
    <title>Bootstrap Template</title>
    <!-- InstanceEndEditable -->
    <!-- inc_head -->
    <?php include("inc/inc_head.php"); ?>
    <!-- InstanceBeginEditable name="head" -->
    <!-- InstanceEndEditable -->
</head>
<body>
    <!-- inc_nav -->
    <?php include("inc/inc_nav.php"); ?>
    <div class="container">
        <!-- InstanceBeginEditable name="EditRegion1" -->
        <form method="post" name="form1" action="<?php echo $editFormAction; ?>">
            <table align="center" class="table table-bordered">
                <tr valign="baseline">
                    <td nowrap align="right">CategoryName:</td>
                    <td>
                        <input type="text" class="form-control" name="categoryName" value="" size="32" />
                    </td>
                </tr>
                <?php
                $default_parentID = "0";
                if (isset($_GET['parentID'])) {
                    $default_parentID = $_GET['parentID'];
                }
                ?>
                <tr valign="baseline">
                    <td nowrap align="right">ParentID:</td>
                    <td>
                        <input type="text" class="form-control" name="parentID" value="<?php echo $default_parentID; ?>" size="32" />
                    </td>
                </tr>
                <tr valign="baseline">
                    <td nowrap align="right">Status:</td>
                    <td>
                        <input type="text" class="form-control" name="status" value="" size="32" />
                    </td>
                </tr>
                <tr valign="baseline">
                    <td nowrap align="right">Image:</td>
                    <td>
                        <input type="text" class="form-control" name="image" value="" size="32" />
                    </td>
                </tr>
                <tr valign="baseline">
                    <td nowrap align="right">Sort:</td>
                    <td>
                        <input type="text" class="form-control" name="sort" value="" size="32" />
                    </td>
                </tr>
                <tr valign="baseline">
                    <td nowrap align="right">Note:</td>
                    <td>
                        <input type="text" class="form-control" name="note" value="" size="32" />
                    </td>
                </tr>
                <tr valign="baseline">
                    <td nowrap align="right">Appendix:</td>
                    <td>
                        <input type="text" class="form-control" name="appendix" value="" size="32" />
                    </td>
                </tr>
                <tr valign="baseline">
                    <td nowrap align="right">&nbsp;</td>
                    <td>
                        <input type="submit" value="插入记录" class="btn btn-primary" />
                        <a class="btn btn-primary" href="review_cateList.php?parentID=<?php echo $default_parentID; ?>">Back</a>
                    </td>
                </tr>
            </table>
            <input type="hidden" name="MM_insert" value="form1" />
        </form>
        <p>&nbsp;</p>
        <!-- InstanceEndEditable -->
    </div>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
<!-- InstanceEnd -->
</html>
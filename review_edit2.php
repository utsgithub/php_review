<?php require_once('Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_rsRowList = "SELECT * FROM review_list where id=".$_GET["id"];
$rsRowList = mysql_query($query_rsRowList, $conn) or die(mysql_error());
$row_rsRowList = mysql_fetch_assoc($rsRowList);
$totalRows_rsRowList = mysql_num_rows($rsRowList);
$editFormAction = $_SERVER['PHP_SELF'];
if (isset($_SERVER['QUERY_STRING'])) {
    $editFormAction .= "?" . htmlentities($_SERVER['QUERY_STRING']);
}
if ((isset($_POST["MM_update"])) && ($_POST["MM_update"] == "form1")) {
    $updateSQL = sprintf("UPDATE review_list SET question=%s, answer=%s, question_cn=%s, answer_cn=%s, answer_simple=%s, answer_draft=%s, category=%s, num=%s, complete=%s, mark=%s, cid=%s, image=%s, status=%s, img=%s, choiceA=%s, choiceB=%s, choiceC=%s, choiceD=%s, choiceType=%s, choiceAnswer=%s WHERE ID=%s",
                         GetSQLValueString($_POST['question'], "text"),
                         GetSQLValueString($_POST['answer'], "text"),
                         GetSQLValueString($_POST['question_cn'], "text"),
                         GetSQLValueString($_POST['answer_cn'], "text"),
                         GetSQLValueString($_POST['answer_simple'], "text"),
                         GetSQLValueString($_POST['answer_draft'], "text"),
                         GetSQLValueString($_POST['category'], "text"),
                         GetSQLValueString($_POST['num'], "int"),
                         GetSQLValueString($_POST['complete'], "int"),
                         GetSQLValueString($_POST['mark'], "int"),
                         GetSQLValueString($_POST['cid'], "int"),
                         GetSQLValueString($_POST['image'], "text"),
                         GetSQLValueString($_POST['status'], "text"),
                         GetSQLValueString($_POST['img'], "text"),
                         GetSQLValueString($_POST['choiceA'], "text"),
                         GetSQLValueString($_POST['choiceB'], "text"),
                         GetSQLValueString($_POST['choiceC'], "text"),
                         GetSQLValueString($_POST['choiceD'], "text"),
                         GetSQLValueString($_POST['choiceType'], "text"),
                         GetSQLValueString($_POST['choiceAnswer'], "text"),
                         GetSQLValueString($_POST['ID'], "int"));

    mysql_select_db($database_conn, $conn);
    $Result1 = mysql_query($updateSQL, $conn) or die(mysql_error());

    $insertGoTo = "review_edit2.php";
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
<div class="container"> <!-- InstanceBeginEditable name="EditRegion1" -->
    <?php $cid=$_GET['cid']?>
    <div class="row">
        <div class="col-xs-4">
            <?php include("review_edit_inc_left.php"); ?>
        </div>
        <div class="col-xs-8"> 
            <!--#include file="review_view.asp" -->
            <form method="post" name="form1" action="<?php echo $editFormAction; ?>">
                <table align="center" class="table">
                    <tr class="none">
                        <th width="100" align="right" nowrap>ID:</th>
                        <td><?php echo $row_rsRowList['ID']; ?></td>
                    </tr>
                    <tr>
                        <th nowrap align="right">Question:</th>
                        <td><textarea class="form-control" name="question" cols="32"><?php echo $row_rsRowList['question'] ?></textarea></td>
                    </tr>
                    <tr>
                        <th nowrap align="right">Answer:</th>
                        <td><textarea class="form-control" name="answer" cols="32" rows="10"><?php echo $row_rsRowList['answer'] ?></textarea></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">Question_cn:</th>
                        <td><textarea class="form-control" name="question_cn" cols="32"><?php echo $row_rsRowList['question_cn'] ?></textarea></td>
                    </tr>
                    <tr>
                        <th nowrap align="right">Answer_cn:</th>
                        <td><textarea class="form-control" name="answer_cn" cols="32"><?php echo $row_rsRowList['answer_cn'] ?></textarea></td>
                    </tr>
                    <tr>
                        <th nowrap align="right">Answer_simple:</th>
                        <td><textarea class="form-control" name="answer_simple" cols="32"><?php echo $row_rsRowList['answer_simple'] ?></textarea></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">Answer_draft:</th>
                        <td><textarea class="form-control" name="answer_draft" cols="32"><?php echo $row_rsRowList['answer_draft'] ?></textarea></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">Category:</th>
                        <td><input type="text" class="form-control" name="category" value="<?php echo $row_rsRowList['category'] ?>" size="32"></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">Num:</th>
                        <td><input type="text" class="form-control" name="num" value="<?php echo $row_rsRowList['num'] ?>" size="32"></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">Complete:</th>
                        <td><input type="text" class="form-control" name="complete" value="<?php echo $row_rsRowList['complete'] ?>" size="32"></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">Mark:</th>
                        <td><input type="text" class="form-control" name="mark" value="<?php echo $row_rsRowList['mark'] ?>" size="32"></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">Cid:</th>
                        <td><input type="text" class="form-control" name="cid" value="<?php echo $row_rsRowList['cid'] ?>" size="32"></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">Image:</th>
                        <td><input type="text" class="form-control" name="image" value="<?php echo $row_rsRowList['image'] ?>" size="32"></td>
                    </tr>
                    <tr>
                        <th nowrap align="right">Status:</th>
                        <td>
                            <select name="status" class="form-control" id="status">
                                <option value="<?php echo $row_rsRowList['status'] ?>"><?php echo $row_rsRowList['status'] ?></option>
                                <?php include("review_inc_select_status.php"); ?>
                            </select>
                        </td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">Img:</th>
                        <td><input type="text" class="form-control" name="img" value="<?php echo $row_rsRowList['img'] ?>" size="32"></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">ChoiceA:</th>
                        <td><input type="text" class="form-control" name="choiceA" value="<?php echo $row_rsRowList['choiceA'] ?>" size="32"></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">ChoiceB:</th>
                        <td><input type="text" class="form-control" name="choiceB" value="<?php echo $row_rsRowList['choiceB'] ?>" size="32"></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">ChoiceC:</th>
                        <td><input type="text" class="form-control" name="choiceC" value="<?php echo $row_rsRowList['choiceC'] ?>" size="32"></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">ChoiceD:</th>
                        <td><input type="text" class="form-control" name="choiceD" value="<?php echo $row_rsRowList['choiceD'] ?>" size="32"></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">ChoiceType:</th>
                        <td><input type="text" class="form-control" name="choiceType" value="<?php echo $row_rsRowList['choiceType'] ?>" size="32"></td>
                    </tr>
                    <tr class="none">
                        <th nowrap align="right">ChoiceAnswer:</th>
                        <td><input type="text" class="form-control" name="choiceAnswer" value="<?php echo $row_rsRowList['choiceAnswer'] ?>" size="32"></td>
                    </tr>
                    <tr>
                        <th nowrap align="right">&nbsp;</th>
                        <td><input type="submit" value="更新记录" class="btn btn-primary"></td>
                    </tr>
                </table>
                <input type="hidden" name="MM_update" value="form1">
                <input type="hidden" name="ID" value="<?php echo $row_rsRowList['ID']; ?>">
            </form>
            <p>&nbsp;</p>
            <div class="fl_r"> 
                <ul class="nav nav-pills">
                    <li>
                        <a class="btn btn-primary" href="review_asp_jump.php?cid=<?php echo $cid ?>&num=<?php echo $row_rsRowList['num']-1 ?>">Left</a>
                    </li>
                    <li>
                        <a href="review_list.php?cid=<?php echo $cid ?>" class="btn btn-primary">List</a>
                    </li>
                    
                    <li>
                        <a href="review_asp_jump.php?cid=<?php echo $cid ?>&num=<?php echo $row_rsRowList['num']+1 ?>" class="btn btn-primary" accesskey="n">Next</a>
                    </li>
                </ul>

            </div>
            <!--include file="review_inc_listInsert.asp" --> 
            
        </div>
    </div>
    <!-- InstanceEndEditable --> </div>
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
<!-- InstanceEnd -->
</html>
<?php
mysql_free_result($rsRowList);
?>

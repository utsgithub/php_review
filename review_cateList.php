<?php require_once('Connections/conn.php'); ?>

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
    <?php require_once('inc/inc_cateList_rs.php')?>
    <!-- InstanceBeginEditable name="head" -->
    <!-- InstanceEndEditable -->
</head>
<body>
    <!-- inc_nav -->
    <?php include("inc/inc_nav.php"); ?>
    <div class="container">
        <!-- InstanceBeginEditable name="EditRegion1" -->
        <table class="table table-bordered">
            <tr>
                <td>ID</td>
                <td>categoryName</td>
                <td>parentID</td>
                <td>status</td>
                <td>image</td>
                <td>sort</td>
                <td>note</td>
                <td>appendix</td>
            </tr>
            <?php do {
                      $IDRS1=$row_rsCateList['ID']; ?>
            <tr>
                <td>
                    <?php echo $row_rsCateList['ID']; ?>
                </td>
                <td>
                    <a href="review_cateList.php?parentID=<?php echo $row_rsCateList['ID']; ?>">
                        <?php echo $row_rsCateList['categoryName']; ?>
                    </a>
                    <ul class="list-inline mbn">
                        <li class="admin">
                            <a href="review_cateEdit.asp?id=<%=IDRS1%>&pid=<%= pid %>&title=<%= title %>">[Edit]</a>
                        </li>
                        <li class="admin">
                            <a href="review_list.asp?cid=<%=IDRS1%>&title=<%= title %>" target="_blank">[List]</a>
                        </li>
                        <?php
                      if($colname_rsCateList==0){
                          $href="review_cateList.php?parentID=".$IDRS1."&title=".$row_rsCateList['categoryName'];
                      }else{
                          $href="review_edit_jump.php?cid=".$IDRS1."&title=".$row_rsCateList['categoryName'];
                      }
                        ?>
                        <li>
                            <a href="<?php echo $href ?>">
                                <?php echo $row_rsCateList['categoryName'] ?>
                            </a>
                        </li>
                    </ul>
                </td>
                <td>
                    <?php echo $row_rsCateList['parentID']; ?>
                </td>
                <td>
                    <?php echo $row_rsCateList['status']; ?>
                </td>
                <td>
                    <?php echo $row_rsCateList['image']; ?>
                </td>
                <td>
                    <?php echo $row_rsCateList['sort']; ?>
                </td>
                <td>
                    <?php echo $row_rsCateList['note']; ?>
                </td>
                <td>
                    <?php echo $row_rsCateList['appendix']; ?>
                </td>
            </tr>
            <?php } while ($row_rsCateList = mysql_fetch_assoc($rsCateList)); ?>
        </table>
        <a href="review_cateCreate.php?parentID=<?php echo $_GET['parentID']; ?>" class="btn btn-primary">Create</a><!-- InstanceEndEditable -->
    </div>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
<!-- InstanceEnd -->
</html>
<?php
mysql_free_result($rsCateList);
?>

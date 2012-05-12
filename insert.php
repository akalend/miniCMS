<?php
include 'DbModel.php';
include 'Config.php';
$db = new DbModel();

    
    $sql = "INSERT INTO articles SET
    text = 'text',
    title = 'новый заголовок'";
    
    $db->query($sql,$_POST);    
    
    Header('Location', '/index.php');
    
 

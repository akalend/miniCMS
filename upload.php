<?php
include 'Config.php';
include 'DbModel.php';
include 'ImageResize.php';

$uploaddir = 'img/articles/';
$uploadfile = $uploaddir .'orig/'. basename($_FILES['myfile']['name']);

 $renamed=false;
 if (isset($_GET['orig']) && $_GET['orig']=='1') {
     if (move_uploaded_file($_FILES['myfile']['tmp_name'], $uploadfile))
        $renamed=true;
 }

 $title=false;
 if (isset($_GET['title']) && strlen($_GET['title'])) {
     $title=$_GET['title'];
 }

 
//if (move_uploaded_file($_FILES['myfile']['tmp_name'], $uploadfile)) {
    if (!isset($_GET['id'])) {
        echo json_encode(array('error' => 1, 'msg' => 'id'));;
        exit;
    }
    if ( strncmp($_FILES['myfile']['type'], 'image',5)) {
        echo json_encode(array('error' => 1, 'msg' => 'type'));
    } else {    
        $sql = "INSERT INTO img (article_id,title) VALUES({{i(id)}},'{{title}}')";
        
        $db = new DbModel();
        $db->query($sql,$_GET);   
        $id = $db->getId();
        
        $filename = $renamed ? $uploadfile : $_FILES['myfile']['tmp_name'];
        $img = new ImageResize($filename);	
		
		$img->setNewSize( 320, 240);
		$img->setImageType('jpg');	
        $img->setNewImage($uploaddir.$id.".jpg");
		$img->make();		
                
         if ($renamed)
             rename($uploadfile,$uploaddir."orig/".$id.".jpg");
         
        echo json_encode(array('error' => 0,'name' => $id.".jpg", 'id' => $id));
    }    
//} else {
//
//  echo  json_encode(array('error' => 1, 'msg' => 'uploading'));;
//}

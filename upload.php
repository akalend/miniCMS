<?php
include 'Config.php';
include 'DbModel.php';
include 'ImageResize.php';

$uploaddir = 'img/articles/';
$uploadfile = $uploaddir . basename($_FILES['myfile']['name']);

//if (move_uploaded_file($_FILES['myfile']['tmp_name'], $uploadfile)) {
    if (!isset($_GET['id'])) {
        echo json_encode(array('error' => 1, 'msg' => 'id'));;
        exit;
    }
    if ( strncmp($_FILES['myfile']['type'], 'image',5)) {
        echo json_encode(array('error' => 1, 'msg' => 'type'));
    } else {    
        $sql = "INSERT INTO img (article_id) VALUES({{i(id)}})";
        
        $db = new DbModel();
        $db->query($sql,$_GET);   
        $id = $db->getId();
        
        $img = new ImageResize($_FILES['myfile']['tmp_name']);	
		
		$img->setNewSize( 320, 240);
		$img->setImageType('jpg');	
        $img->setNewImage($uploaddir.$id.".jpg");
		$img->make();		
        echo json_encode(array('error' => 0,'name' => $id.".jpg", 'id' => $id));
    }    
//} else {
//
//  echo  json_encode(array('error' => 1, 'msg' => 'uploading'));;
//}

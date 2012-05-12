<?php
include 'DbModel.php';
include 'Config.php';
$db = new DbModel();

if ($_SERVER['REQUEST_METHOD']=='POST') {
    
    $_POST["pub"] = 0;
    isset($_POST["publication"]) && $_POST["pub"] = $_POST["publication"]== "on" ? 1:0;
    
    $sql = "UPDATE articles SET
    text = '{{text}}',
    public={{IF pub}}1{{END}}{{UNLESS pub}}0{{END}},
    title = '{{title}}'
    WHERE id={{i(id)}}";
    
    $db->query($sql,$_POST); 
    //$res = $db->finalize();    
}
 
$id = $_GET['id'];
$sql = "SELECT * from articles WHERE id={{i($id)}}";
$db->query($sql);

$res = $db->iterate();
$res['date'] = substr($res['date'],0,10);    
if ($res['public'])
    $res['checked']='checked="checked"';

$res['txt2'] =$res['text'];
//$res['txt2'] = str_replace("\n", "<br>",$res['text']);  
    
$pattern = "/<img (\d+)/i";
$replacement='<img align="left" src="/img/articles/$1.jpg"';
$xx = preg_replace($pattern,$replacement,$res['txt2']);
if ($xx != NULL) {
    $res['txt2']=$xx;    
} 
if (strpos($res['txt2'],'<cut>')) {
    $res['txt2'] = str_replace('<cut>', '</em></div>',$res['txt2']);
    $res['txt2'] = '<div><em>'.$res['txt2'];
}


$result[] = $res;    


$isGenerate = isset($_POST['generate']);
$tpl = $isGenerate ?'tpl/article.tpl': 'tpl/edit.tpl';

$T = new blitz($tpl);
$T->context('/page/article');

for($i=0; $i<count($result); $i++) {
    $T->iterate();
    $T->set( $result[$i] );        
}

if ($isGenerate) {
    echo $content=$T->parse();
    $filename="articles/$id.html";
    file_put_contents($filename, $content);
    exit;
}

$T->context('/page/image');
$sql = "SELECT * from img WHERE article_id={{i($id)}}";
$db->query($sql);
while ($res = $db->iterate()){
   $T->iterate();
    $T->set( $res );        
}

echo $T->parse();
<?php
include 'DbModel.php';
include 'Config.php';
$db = new DbModel();

$isShow = isset($_GET['mode']) && $_GET['mode']=='lenta';


$sql = "SELECT * from articles";
$db->query($sql);
$result=array();
while($res = $db->iterate()) {
    $res['date'] = substr($res['date'],0,10);
    $pos = strpos($res['text'],'<cut>');
    if ($pos) {
        $res['text'] = substr($res['text'],0,$pos);
        $res['text'] .= '<br><a href="/articles/'.$res['id'].'.html">Далее...</a>'; 
    }    
    
    $pattern = "/<img (\d+)/i";
    $replacement='<img align="left" height="100"  src="/img/articles/$1.jpg"';
    $xx = preg_replace($pattern,$replacement,$res['text']);
    if ($xx == NULL) 
        $xx = $res['text'];
    
    
    $res['text'] = str_replace("\r\n",'<br>',$xx);
    $result[] = $res;    
}

$tpl = $isShow ? 'tpl/lenta.tpl' : 'tpl/index.tpl';
$T = new blitz($tpl);
$T->context('/page/article');

for($i=0; $i<count($result); $i++) {
    $T->iterate();
    $T->set(  $result[$i] );        
}


echo$content = $T->parse();
if ($isShow)  {
    file_put_contents('articles/index.html', $content);
    unset($T);
    
    $T = new blitz($tpl);
    
    $T->context('/page');
    $T->set(array('ishome'=> true ));
    $T->iterate();
    
    $T->context('/page/article');
    
    for($i=0; $i<count($result); $i++) {
        $T->iterate();
        $T->set(  $result[$i] );        
    }


    $content = $T->parse();
    file_put_contents('index.html', $content);
}


<?php
include 'DbModel.php';
include 'Config.php';
$db = new DbModel();

$isShow = isset($_GET['mode']) && $_GET['mode']=='lenta';


function createLentaData($sql) {
    $db = new DbModel();
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
    
    return $result;
}

$sql = "SELECT * from articles";
$result = createLentaData($sql);

$tpl = $isShow ? 'tpl/lenta.tpl' : 'tpl/index.tpl';
$T = new blitz($tpl);


$T->block('page', array('ishome'=> false,'last_mod'=> date('r'), $isindex => true));    //
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
    
    $T->block('page', array('ishome'=> true,'last_mod'=> date('r')));    //
    
     
    $T->context('/page/article');
    
    for($i=0; $i<count($result); $i++) {
        $T->iterate();
        $T->set(  $result[$i] );        
    }


    $content = $T->parse();
    file_put_contents('index.html', $content);
    
    
    echo "generate tags";
    
    
    $sql = "SELECT name,shortname,ids FROM tags";
    $res = $db->exec($sql);
    foreach($res as $taginfo) {
        $ids = $taginfo['ids'];
        
        if ( strlen($ids)>2) {
            $ids = str_replace('-', ' ', $ids);
            if ($ids[1] == ',')
                $ids[1] = ' ';
            
            $sql = "SELECT * FROM articles WHERE id IN ($ids)";
            $result = createLentaData($sql);
            echo $taginfo['shortname'],'<br>',$sql,'<br>';
            $tpl = 'tpl/lenta.tpl';
            $T = new blitz($tpl);
            
            $T->block('page', array('last_mod'=> date('r')));    //
            $T->context('/page/article');

            for($i=0; $i<count($result); $i++) {
                $T->iterate();
                $T->set(  $result[$i] );        
            }

            $content = $T->parse();
            file_put_contents('articles/'.$taginfo['shortname'].'.html', $content);
            
        }
    }
    
}


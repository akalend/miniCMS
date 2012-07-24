<?php
include 'DbModel.php';
include 'Config.php';
$db = new DbModel();

if ($_SERVER['REQUEST_METHOD']=='POST') {
        
    $new = explode(',',trim($_POST['tags']));
    $old = explode(',',trim($_POST['oldtags']));
    
    $addTags = array_diff($new, $old);
    $delTags = array_diff($old, $new);

    print_r($delTags);
    print_r($addTags);
    
    
    foreach ($addTags as $tag) {
        $sql = "UPDATE tags 
        SET ids = CONCAT(ids,',','{$_POST['id']}') 
        WHERE name ='$tag'";
        echo $sql,'<br>';
        $db->query($sql);         
    }
    
    
    foreach ($delTags as $tag) {
        $sql = "UPDATE tags 
        SET ids = REPLACE(ids,',{$_POST['id']}','') 
        WHERE name ='$tag'";
         echo $sql,'<br>';
        $db->query($sql);         
    }
       
    
    $_POST["pub"] = 0;
    isset($_POST["publication"]) && $_POST["pub"] = $_POST["publication"]== "on" ? 1:0;
    
    $sql = "UPDATE articles SET
    text = '{{text}}',
    public={{IF pub}}1{{END}}{{UNLESS pub}}0{{END}},
    title = '{{title}}',
    tags = '{{tags}}'
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

$yy = preg_match($pattern, $res['text'],$yy_res);
if (false && $yy) {
    $sql = "SELECT * FROM img WHERE id=$yy_res[1]";
   // echo $sql,'<br>',PHP_EOL;
   $img_res = $db->exec($sql);   
    $replacement='<img align="left" src="/img/articles/$1.jpg"';
    if (is_array($img_res)) {
       $replacement .= ' title="'.$img_res[0]['title'].'" ';
//       if($img_res['isbig']) {
//           $replacement .= ' rel="lightbox" ';
//       }
    }
   
    $xx = preg_replace($pattern,$replacement,$res['txt2']);
    if ($xx != NULL) {
   
        /*
         <a href="/img/original/replication.jpg" rel="lightbox" title="abc">
        <img align="left" src="/img/articles/7.jpg"></a>
         */
        
        if (is_array($img_res) && $img_res[0]['isbig'] ) {
            $res['txt2']= "<a href=\"/img/articles/orig/{$yy_res[1]}.jpg\" rel=\"lightbox\" title=\"{$img_res[0]['title']}\" >". $xx."</a>";
        } else {
            $res['txt2']=$xx;
        }
    } 
   
}
if (strpos($res['txt2'],'<cut>')) {
    $res['txt2'] = str_replace('<cut>', '</em></div>',$res['txt2']);
    $res['txt2'] = '<div><em>'.$res['txt2'];
}

$res['last_mod'] = date('r');//  'Sun, 06 Nov 2005 14:59:42 GMT'
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
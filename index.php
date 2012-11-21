<?php
include 'DbModel.php';
include 'Config.php';
class Template extends blitz {
	function __construct($T) {
		parent::__construct($T);
	}
	
	public function dump($context ,  $mode =0) {
		if ($mode)
			return "<pre>".htmlspecialchars( var_export( $context,true))."</pre>";;
		return "<pre>". var_export( $context,true)."</pre>";;	
	}
}

$db = new DbModel();

$isShow = isset($_GET['mode']) && $_GET['mode']=='lenta';

function createTwoColumn ($result, $rows=777, $tags=null , $shortname=null) {
$new_res = array(); 
$i=0;
$j=0;
foreach($result as $item ) {
  if ( $j > $rows ) break; 
  if($item['public'] !=1 ) continue;
  if ($i==1) {
  //  if (is_array($item))
	foreach($item as $key => $val)  
		$subitem2[$key.'1'] = $val;	

  	$subitem2['tags1'] = array();  	
  	if (is_array($tags[$item['id'] ] ))
  	foreach($tags[$item['id'] ] as $tag )
	  	$subitem2['tags1'][] = array( 'name' => $tag , 'url' =>  $shortname[$tag] );
  	
	$i=0;
	$new_res[] = array_merge($subitem1,$subitem2);
	if (!--$rows) break;
	continue;
  }
  $subitem1 = $item;
  $subitem1['tags'] = array();
  	if (is_array($tags[$item['id'] ] ))
  	foreach($tags[$item['id'] ] as $tag )
	  	  	$subitem1['tags'][] = array( 'name' => $tag , 'url' =>  $shortname[$tag] );

  $i++;	
}

if (i==1) $new_res[] = $item;


return $new_res;
}

function createLentaData($sql) {
    $db = new DbModel();
    $db->query($sql);
    $result=array();
    while($res = $db->iterate()) {
        $res['date'] = substr($res['date'],0,10);
        $pos = strpos($res['text'],'<cut>');
        if ($pos) {
            $res['text'] = substr($res['text'],0,$pos);
            $res['text'] .= '<br><p><a class="btn" href="/articles/'.$res['id'].'.html">Далее...</a></p>'; 
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

$db->query("SELECT * FROM tags");
$tags=array();
$shortname=array();
while($res = $db->iterate()) {
	$tags[$res['name']] = $res['ids'];
	$shortname[$res['name']] = $res['shortname'];
}


$tag2article=array();
foreach($tags as $name=>$ids){
	$a_ids = explode( ',', $ids);
	foreach($a_ids as $id) {		
		if ($id == '-') continue;
		$tag2article[$id][] = $name;
	}	
}

$sql = "SELECT * from articles  where public=1 ORDER BY ID DESC";
$result = createLentaData($sql);
$result = createTwoColumn ($result, 4, $tag2article ,$shortname); 

$tpl = $isShow ? 'tpl/lenta.tpl' : 'tpl/index.tpl';
$T = new Template($tpl);


$T->block('page', array('ishome'=> false,'last_mod'=> date('r'), 'isindex' => true));    //
//$T->context('/page/article');

for($i=0; $i<count($result); $i++) {
    
    $T->block('/page/article', $result[$i] );
 //   var_dump( $result[$i]['title']);
    foreach ($result[$i]['tags'] as $name) {
    	//var_dump($name);
	    $T->block('tags', $name);
	    
    }

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
            $result = createTwoColumn ($result,777,$tag2article ,$shortname); 

            //echo $taginfo['shortname'],'<br>',$sql,'<br>';
            $tpl = 'tpl/lenta.tpl';
            $T = new blitz($tpl);
            
            $T->block('page', array('last_mod'=> date('r'), 'keywords'=> $taginfo['name']));    //
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


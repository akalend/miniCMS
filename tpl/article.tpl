{{BEGIN page}}
<html>
{{BEGIN article}}
<header>
<title>Highload. Высокие нагрузки в WEB. {{title}}</title>
<meta name="generator" content="minicms" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-language" content="ru" />
<meta name="author" content="Kalendarev Alexandre">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="авторский блог Александра Календарева: Высокие нагрузки в WEB">
<meta name="keywords" lang="ru" content="highload, высокие нарузки,{{keywords}}">
<meta http-equiv="last-Modified" content="{{last_mod}}"> 
<link href="/assets/css/bootstrap.css" rel="stylesheet">
<style>
  body {
    padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
  }
 
</style>
<link href="/assets/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="author" href="/humans.txt" />
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<!-- Le fav and touch icons -->
  <link rel="shortcut icon" href="/assets/ico/favicon.ico">

  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/assets/ico/apple-touch-icon-144-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/assets/ico/apple-touch-icon-114-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/assets/ico/apple-touch-icon-72-precomposed.png">
  <link rel="apple-touch-icon-precomposed" href="/assets/ico/apple-touch-icon-57-precomposed.png">
    
  <link rel="stylesheet" href="/css/lightbox.css" type="text/css" media="screen" />
  <!-- link rel="shortcut icon" type="image/ico" href="images/favicon.gif" /-->	  
<script src="http://userapi.com/js/api/openapi.js" type="text/javascript" charset="windows-1251"></script>
<script type="text/javascript">
  VK.init({apiId: 3249172, onlyWidgets: true});
</script>
  <script src="/js/jquery.min.js" type="text/javascript"></script>
  <!--script src="/assets/js/jquery.js"></script-->
	
	<script src="/js/jquery-ui-1.8.18.custom.min.js"></script>
    <script src="/js/jquery.smooth-scroll.min.js"></script>
	<script src="/js/lightbox.js"></script>

</header>
<body>

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner" style="background-color: #999" >

         <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a title="Высокие нарузки в WEB" class="brand" href="/"><span class="brand" style="color:fe5a5a; font-family: 'Charcoal CY'; font-size: 18 pt; font-style: bold;">HighloadBlog</span></a>
          <div class="nav-collapse">

            <ul class="nav">
              <li><li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#"><b> Материал по темам </b><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <li><a href="/articles/scaling.html">Масштабирование</a></li>
                      <li><a href="/articles/highload.html">HighLoad</a></li>
                      <!-- li><a href="#">MySQL</a></li -->                     
                      <li><a href="/articles/nosql.html">NoSQL</a></li>
                      <!li><a href="/articles/php.html">PHP</a></li>
                      <li><a href="/articles/web.html">WEB</a></li>
                      <li><a href="/articles/tarantool.html">Tarantool</a></li>
                      <li><a href="/articles/development.html">Программирование и разработка</a></li>
                    </ul>
              </li>
			  <li><a href="/articles/15.html"><b>Интересные ссылки</b></a></li>
              <!-- li class="active"><a href="#">личное</a></li-->
              <li><a href="/articles/4.html"><b>Об Авторе</b></a></li>
              <li><a href="/articles/5.html"><b>Сотрудничество</b></a></li>
			  
                   
            </ul>
          </div><!--/.nav-collapse -->
          
        </div>

      </div>
    </div>
<div class="container">
<div class="page-header"><h1>{{title}}</h1></div>
<p>{{txt2}}</p>
<p style="margin-bottom: 20px;">

<hr>
<div class='pluso pluso-theme-color pluso-round pluso-small'><div class='pluso-more-container'><a class='pluso-more' href=''></a></div><a class='pluso-facebook'></a><a class='pluso-twitter'></a><a class='pluso-vkontakte'></a><a class='pluso-odnoklassniki'></a><a class='pluso-livejournal'></a><a class='pluso-moimir'></a><a class='pluso-liveinternet'></a><a class='pluso-blogger'></a><a class='pluso-google'></a></div>
<script type='text/javascript'>if(!window.pluso){pluso={version:'0.9.1',url:'http://share.pluso.ru/'};h=document.getElementsByTagName('head')[0];l=document.createElement('link');l.href=pluso.url+'pluso.css';l.type='text/css';l.rel='stylesheet';s=document.createElement('script');s.src=pluso.url+'pluso.js';s.charset='UTF-8';h.appendChild(l);h.appendChild(s)}</script>
<!-- Put this div tag to the place, where the Comments block will be -->
<div id="vk_comments"></div>
<script type="text/javascript">
VK.Widgets.Comments("vk_comments", {limit: 10, width: "496", attach: "*"});
</script>

{{END}}
<!--LiveInternet counter--><script type="text/javascript"><!--
document.write("<a href='http://www.liveinternet.ru/click' "+
"target=_blank><img src='//counter.yadro.ru/hit?t25.6;r"+
escape(document.referrer)+((typeof(screen)=="undefined")?"":
";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
";h"+escape(document.title.substring(0,80))+";"+Math.random()+
"' alt='' title='LiveInternet: показано число посетителей за"+
" сегодня' "+
"border='0' width='88' height='15'><\/a>")
//--></script><!--/LiveInternet-->
</div>
</body>
 <!-- Placed at the end of the document so the pages load faster -->
    <!-- script src="/assets/js/jquery.js"></script -->
    <script src="/assets/js/bootstrap-transition.js"></script>
    <script src="/assets/js/bootstrap-alert.js"></script>

    <script src="/assets/js/bootstrap-modal.js"></script>
    <script src="/assets/js/bootstrap-dropdown.js"></script>
    <script src="/assets/js/bootstrap-scrollspy.js"></script>
    <script src="/assets/js/bootstrap-tab.js"></script>
    <script src="/assets/js/bootstrap-tooltip.js"></script>
    <script src="/assets/js/bootstrap-popover.js"></script>

    <script src="/assets/js/bootstrap-button.js"></script>
    <script src="/assets/js/bootstrap-collapse.js"></script>
    <script src="/assets/js/bootstrap-carousel.js"></script>
    <script src="/assets/js/bootstrap-typeahead.js"></script>
    
    
</html>
{{END}}
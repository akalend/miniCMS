{{BEGIN page}}
<html>
<header>
<title>Highload. Высокие нагрузки в WEB, персональный блог Александра Календарёва </title>
<meta name="generator" content="minicms" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-language" content="ru" />
<meta name="author" content="Kalendarev Alexandre">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" lang="ru" content="авторский блог Александра Календарева Высокие нагрузки в WEB">
<meta http-equiv="last-Modified" content="{{last_mod}}"> 


<link href="/assets/css/bootstrap.css" rel="stylesheet"
<style>
  body {
    padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
  }
</style>
<link href="/assets/css/bootstrap-responsive.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<!-- Le fav and touch icons -->
  <link rel="shortcut icon" href="assets/ico/favicon.ico">

  <link rel="/apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
  <link rel="/apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
  <link rel="/apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
  <link rel="/apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
  <script src="/js/jquery.min.js" type="text/javascript"></script>
{{IF ishome}}<script type="text/javascript">document.location.href="/articles/index.html"</script>{{END}}
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
          <a class="brand" href="/">Высокие нагрузки в  WEB</a>
          <div class="nav-collapse">

            <ul class="nav">
              <!-- li class="active"><a href="#">личное</a></li-->
              <li><a href="/articles/4.html">Об Авторе</a></li>
              <li><a href="/articles/5.html">Сотрудничество</a></li>
              <li><li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">материал по темам <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                      <li><a href="/articles/scaling.html">Масштабирование</a></li>
                      <li><a href="/articles/highload.html">HightLoad</a></li>
                      <!-- li><a href="#">MySQL</a></li -->                     
                      <li><a href="/articles/nosql.html">NoSQL</a></li>
                      <!-- li><a href="#">PHP</a></li -->
                      <li><a href="/articles/web.html">WEB</a></li>
                      <li><a href="/articles/tarantool.html">Tarantool</a></li>
                    </ul>
              </li>
              
            </ul>
          </div><!--/.nav-collapse -->
          
        </div>

      </div>
    </div>
 <div class="container">
<span class="twitter"><a href="https://twitter.com/intent/user?screen_name=akalend">мой <em>Twitter</em></a></span></p>
<div style="text-align:right; font: Arial; font-style:bold" >Если собрались опубликовать материалы данного блога,
    прошу ознакомиться с разделом <a href="/articles/5.html">Сотрудничество</a> </div >
{{IF isindex}}
<div ><p>Блог посвящен разработке и построению архитектуры высоко нагруженных веб-проектов и о прежде всего ориентирован на архитекторов,  разработчиков, а так же системных  администраторов.  В статьях делюсь реальным опытом проектирования разных систем, от больших социальных сетей и  высоко нагруженных служб знакомств, до работы учета баннеро-крутилок и интернет-магазинов (каталога магазинов).
</div>
{{END}}
{{BEGIN article}}
{{IF public}}
<div > <h2>{{title}}</h2><span style="padding-left: 8px; font-size: 10pt; font-style: italic">{{date}}</span></div>
<div>
<p>
 <div>{{text}}</div>
{{END}}
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
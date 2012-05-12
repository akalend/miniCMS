{{BEGIN page}}
<html>
<title>minicms</title>
<meta content="minicms-generator" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="author" content="Kalendarev Alexandre">

<body>
    
    
    <input type="button" value="Создать новый" ><span style="width: 20px;"/>
    <a href="index.php?mode=lenta"><input type="button" value="Сгенерить ленту"/></a><span style="width: 20px;"/>
     <a href="articles/"><input type="button" value="Посмотреть" ></a><br>
{{BEGIN article}}
<div >
 <h2 style="font-size: 14pt; font-weight: bold;">{{title}}<span style="padding-left: 8px; font-size: 10pt;">{{date}}</span> {{IF public}}<span style="color: red;">***</span>{{END}} </h2>
 <div><a href="edit.php?id={{id}}">Edit</a></div>
 <div>{{text}}</div>
</div>
{{END}}
</body>
</html>
{{END}}
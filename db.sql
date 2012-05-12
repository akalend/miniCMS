-- MySQL dump 10.13  Distrib 5.1.62, for apple-darwin9.8.0 (i386)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	5.1.62-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `text` mediumtext,
  `public` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'Введение и пару слов об этом сервере','2012-05-12 08:30:45','<div class=\"pull-left\"><img 4>\r\nОткрывая свой блог, первой статьей хочу рассказать о сервере, на котором он расположен. Все начилось с того, что я услышал о возможности перепрошить свой роутер и установить на него Linux.  Уточнив модель, у меня Asus  WL-500W, я загорелся этой идеей, так как давно собралось много материала, который разбросан как-то по сети. Захотелось его центролизовать в едином блоге. \r\n<p>Возможно, со временем мой блог наберет аудиторию и сервер переедет на отдельный хостинг. Но на данный момент меня вполне устраивает \"Домашний хостинг\".\r\n</div>\r\n<cut>\r\n<h3>О прошивке</h3>\r\n<p style=\"padding-top:20px;\"> Статью про прошивку  можно найти <a target=\"blank\" href=\"http://www.dd-wrt.com/wiki/index.php/%D0%9F%D0%B5%D1%80%D0%B5%D0%BF%D1%80%D0%BE%D1%88%D0%B8%D0%B2%D0%BA%D0%B0_WL-500W_%D0%BD%D0%B0_DD-WRT_%D0%B2_%D0%BA%D0%B0%D1%80%D1%82%D0%B8%D0%BD%D0%BA%D0%B0%D1%85!_:%29\">здесь</a></p>\r\n<p>В новую прошивку  DD-WRT входит тольк ядро ОС и  WEB сервер административной консоли. Для организации блога это оказалось не достаточным. Следующим шагом пришлось установить <a href=\"http://ru.wikipedia.org/wiki/Lighttpd\">ligthttpd</a></p>\r\n<p>Установка lighttpd осуществляется из портов, по этому первоночально необходимо установить порты. Об этом довольно подробно расписано <a  target=\"blank\" href=\"http://www.dd-wrt.com/wiki/index.php/Router_Dir-320_DD-WRT_%2B_WWW_%2B_PHP_%2B_MySQL_%2B_PERL\">здесь</a></p> \r\n<p>Но из-за ограничения ресурсов, 32М Оперативной памяти, установку пришлось немного сократить.  По этому ставим только один lighttpd. Соответственно все настройки используются только для ligthttpd без PHP</p>\r\n<h3>О ЦМС</h3>\r\n<p>Что касается блога, то он использует на <a href=\"#\">minicms</a>, написанной за пару дней. По этому не судите о ней строго. Особенность этой ЦМС в том, что она генерит статический контент, который впоследствии заливается на роутер по ftp. \r\n<p><span class=\"label label-warning\">Зависимости</span> PHP 5.3, MySQL, <a href=\"http://alexeyrybak.com/blitz/blitz_ru.html\" target=\"blank\">blitz</a>\r\n<p>Почему спросите блиц? Просто я его использую в своих других проектах и по этому уже привык к нему. Как всякий <s>лентяй</s>здравомыслящий программист,  я взял часть кода из моих других проектов. Вы можете переписать часть кода и использовать любой из понравившихся Вам шаблонизаторов. \r\n<p>Блог построен по принципу: лента с краткими выдержками и развернутые статьи. Содержание, которое отображается только в ленте (анонс) от самой статьи отделяется тегом <code>cut</code>, кто размещал свои статьи на <a  target=\"blank\" href=\"habrahabr.ru\">habrahabr</a>, то  это аналог тега <code>habracut</code>.\r\n<p>Картинки загружаются по ajax и каждой из них присваевается номер. В том месте, где она должна загрузится, необходимо указать тег<code><img #id ></code>\r\n',1),(2,'вторая тестовая','2012-05-10 19:49:36','это экспериментальный тескст 2\r\nerterte\r\nertertet\r\n66666\r\n<img 3>\r\nghfghf\r\nfghfggh\r\n<b>******</b>',0),(3,'третья статья','2012-05-04 21:47:21','text',11),(4,'Об авторе','2012-05-10 20:06:12','<img 6>',0),(5,'Сотрудничество','2012-05-10 19:56:28','text',0),(6,'новый заголовок','2012-05-10 09:05:56','text',0),(7,'новый заголовок','2012-05-10 09:08:14','text',0);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img`
--

DROP TABLE IF EXISTS `img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img`
--

LOCK TABLES `img` WRITE;
/*!40000 ALTER TABLE `img` DISABLE KEYS */;
INSERT INTO `img` VALUES (6,NULL,4),(5,NULL,1),(3,NULL,2),(4,NULL,1);
/*!40000 ALTER TABLE `img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `name` varchar(256) DEFAULT NULL,
  `ids` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-05-12 16:47:52

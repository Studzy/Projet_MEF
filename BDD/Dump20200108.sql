-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: meffer
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `controles`
--

DROP TABLE IF EXISTS `controles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `controles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT NULL,
  `poste_id` int(11) DEFAULT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `resultat` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `poste_idfk_idx` (`poste_id`),
  KEY `ref_idfk_idx` (`ref_id`),
  KEY `usr_idfk_idfk` (`user_id`),
  CONSTRAINT `ctrl_poste_idfk` FOREIGN KEY (`poste_id`) REFERENCES `postes` (`id`),
  CONSTRAINT `ctrl_ref_idfk` FOREIGN KEY (`ref_id`) REFERENCES `references` (`id`),
  CONSTRAINT `ctrl_usr_idfk` FOREIGN KEY (`user_id`) REFERENCES `controleurs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controles`
--

LOCK TABLES `controles` WRITE;
/*!40000 ALTER TABLE `controles` DISABLE KEYS */;
INSERT INTO `controles` VALUES (18,'2019-12-03 12:31:55',3,6,1,1),(19,'2019-12-03 12:31:56',3,8,1,1),(20,'2019-12-03 12:41:30',3,6,1,1),(21,'2019-12-03 12:43:53',3,6,1,1),(22,'2019-12-03 12:43:55',3,8,1,1),(23,'2019-12-03 12:43:57',3,6,1,1),(24,'2019-12-03 13:24:41',3,8,1,0),(25,'2019-12-03 13:25:16',3,6,1,1),(26,'2019-12-03 13:25:20',3,8,1,0),(27,'2019-12-03 13:30:53',3,6,1,0),(28,'2019-12-03 13:30:58',3,6,1,1),(29,'2019-12-03 13:32:21',3,6,1,1),(30,'2019-12-03 13:32:24',3,6,1,0),(31,'2019-12-03 13:32:25',3,6,1,1),(32,'2019-12-03 13:32:27',3,6,1,1),(33,'2019-12-03 13:35:31',3,6,1,1),(34,'2019-12-03 13:39:21',3,8,1,0),(35,'2019-12-03 13:39:49',3,8,1,0),(36,'2019-12-03 13:40:12',3,8,1,0),(37,'2019-12-03 13:40:31',3,8,1,0),(38,'2019-12-03 13:40:35',3,6,1,1),(39,'2019-12-03 13:40:37',3,8,1,0),(40,'2019-12-03 13:40:40',3,6,1,1),(41,'2019-12-03 13:40:42',3,6,1,1),(42,'2019-12-03 13:40:44',3,6,1,1),(43,'2019-12-03 13:40:47',3,6,1,1),(44,'2019-12-03 13:40:49',3,6,1,1),(45,'2019-12-03 13:42:55',3,8,1,0),(46,'2019-12-03 13:43:29',1,4,1,1),(47,'2019-12-03 13:43:31',1,5,1,1),(48,'2019-12-03 13:43:33',1,5,1,0),(49,'2019-12-03 13:43:35',1,4,1,1),(50,'2019-12-03 13:45:19',2,7,1,0),(51,'2019-12-03 14:52:52',3,6,1,0),(52,'2019-12-03 14:58:42',3,8,1,1),(53,'2019-12-03 14:58:47',3,8,1,1),(54,'2019-12-03 14:58:59',3,8,1,1),(55,'2019-12-04 12:28:22',3,6,1,0),(56,'2019-12-04 12:28:25',3,6,1,0),(57,'2019-12-04 12:28:27',3,6,1,0),(58,'2019-12-04 12:28:29',3,6,1,1),(59,'2019-12-04 12:28:33',3,6,1,1),(60,'2019-12-04 13:03:14',3,8,1,0),(61,'2019-12-04 13:20:23',3,6,1,1),(62,'2020-01-07 13:56:32',3,6,1,1),(63,'2020-01-07 14:01:50',3,6,1,0),(64,'2020-01-07 14:02:57',3,6,1,1),(65,'2020-01-07 14:37:05',2,7,1,1),(66,'2020-01-07 14:37:24',2,7,1,0);
/*!40000 ALTER TABLE `controles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controleurs`
--

DROP TABLE IF EXISTS `controleurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `controleurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifiant` varchar(45) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `photo` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controleurs`
--

LOCK TABLES `controleurs` WRITE;
/*!40000 ALTER TABLE `controleurs` DISABLE KEYS */;
INSERT INTO `controleurs` VALUES (1,'U482827','BURGET','BENJAMIN',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0\0h\0\0\0Á·¹\0\0\0sRGB\0®\Î\é\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0\Ã\0\0\Ã\Ço¨d\0\0y7IDATx^\íý“dw}\ç{\Î°±\Ãz\ã\ÆÀ\Î^…ht…®\ÑJÜ–²\Ü\ÑÀµ€i«0Ft\ë!–õÀ\\ƒ°\Ç\ê\Z/xqH‹Å ¹¶\\<–£g˜°vƒM„‡@m!ZBH!Pü6O\æÉª“y¾™yNeUžó\Ë|½\'^1V=dUžª,2?}²\êŸ=z4¬ƒk®¹&}ø\Ãf-N\ç=÷\Òy‡£\×¹\ì\è•\áËÝ³·³Ÿ{\ÎóhÀq\ë\é¯Å¦)\îoF÷CÖ‰±X\Æ\Âub,l\ËX{\ÏX\ØÇ­?¦¿›\ÆXlc!°6Œ…l2c!\ì=caw·þ˜þZl\Zc!°	Œ…À\Ú0²ÉŒ…°÷Œ…\Ýq\Üúcúk±iŒ…À&0k\ÃX\È&3\Â\Þ3v\Çq\ë\é¯Å¦1›ÀX¬\rc!›\ÌX{\ÏX\ØÇ­?¦¿›\ÆXlc!°6Œ…l2c!\ì=caw·þ˜þZl\Zc!°	Œ…À\Ú0²ÉŒ…°÷ö\âvöó\Ï}~8È°\íŸ?\çùŽ[OD_‹Mc,6±X\ÆB6™±ö\Þ^\ÜÎžÿ/\ÏG¶ý‹\ç\ïs\Üz\"úZl\Zc!°	Œ…À\Ú0²ÉŽ^yMºé¦›\Â\×Ë»ù\æ[Ò‘+®\n_·Œ+®¼*e)\Îdûõ_—\ã\Ö³¾›\ÆXlc!°6Œ…l²k®½.]ÿ…¯–WÜ¾®~\ßû\Ã\×-\ëŠ+®\Zž)WŒ1\ÑH³‰Šcñ\ßý‹\Ó\Ó{.;³‚\ã¶\ZM¾›\ÄXlc!°6Œ…l²â¬§\â)’C\Ø]\Åm\ëƒú\Í\áÙ»¿u\ã\á\Û\0›\ÃXlc!°6Œ…lºb\Ô(\Î0,ž*Y‡ÀòŠ\ÛÓ•\×\\\ëiþÀ±\Ø\ÆB`m\0\ØK\ÆB`µa,\0`/M`,Ö†±\0€½d,6±X\ÆB\0\0ö’±\Ø\ÆB`m\0\ØK\ÆB`!#¿ñ¿‘.½ô\Òôk¿ök\éÐ¡CL)Ž\Í{\Þó\0\0\Ø\Åý\Í\è~h\î\Þò–·¤w¾ó\ác`ó!oûÛ‡ÿ’ùµ¯}-=õ\ÔSI’$I’v£¿ú«¿\ZŽ¡o{\Û\Û\Â\Ç\"Àf1B\Þõ®w\rÿ\Ç\ÛH(I’$i¯*NN({DI€\Ía,„O(þµO’$I’öª\â1Gñ\Ø#zLlc!d\à’K.I\'Ož,ÿ\'\\’$I’v¿\â™L\Å\ïG“\0›\ÃX(~\é°$I’$\íu\Åc\è1	°9Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’¤Ud,Œ…c¡$I’´aý\ã·Ó¿ûƒ?M\ßù\Çò¿§û\É\Éôþ\èß¥o\Ïzý3\ÆB\È@—c\áý\Ç^—N\Ûwfºü\Ë\åZö\Ì=7¤s\ï\îµ_I—/S¥û¥‹\Ç\ç´+\ï._A_¾zø=\Ñ\äs~\æÞ¦W_ÿÁÛž,_&I’¤ý\ì‘t\ï\íIþð‡\ÓGn¿7=ò³ò\å\ã½~‰Œ…€±2°c\áxôk\æ\ê4ž–Sz:\Ýw\ì\âtÆ¾\Ò5_1\ÖZ\ç±ð\é¿I¿spðv¯úhú\ë§Ë—\íaÏœøzú\ÔoJç¾¸ü>~ñ\éõWÜž¾a¥\ìE\åƒ\éü³\ÎL/z\ã\í\éþòe’$iF?;•þ\î\ß~b8þ·\Ï\ß§^÷‰ûwé”±\ØE\ÆB\ÈÀnŒ…û™_O/{\Å/M*g§_|\Ù\ä\Ë_öŠ›\Ó\×\Ê÷[~,,:™\î¾ò‚t\Úþ\Ò=+²jm\ÇÂ§\Ó}¿;ø\Þ9\ë\ât\Û}+ø¢\ß{ú\Õ\á÷ó9\é—\ßy}z\ßû¯O\ïýW¯HgŸ\çþ÷§¯ü°|»u\è‡“¾t\ìªtð\×~?«\Ñ\ÍX(IR\Ë~öxºÿ\Î\ê(ø\íôƒÿ÷\í\êPx\çý\éñ]\n‹Œ…€±2°ca\Ô\ÝW\ã\Ê\ë\Òms¹\ï\ÎX8\è\ä\Ý\éòýg¦so¸\'=S¾Hƒ\Öt,|\æ¾c\éµg]0ø¾Y\Åi}O§¯}\à¼Á\ç4ýñ\ÊÁrð¹ú\ì\å\ËÖ ñ÷\ÌÁcF7I’Ö½Ÿ=’þóV\ÆÁý¯\ÓGöp(,2\ÆB\ÈÀZŒ…Š[ó\ßY¸š\îO·Ow~\É\r\éžò%[•\Ç÷E×Ï•]ƒŒ…’$mV?{$ÿ\ìÿ¶5‡\Â?üÏ»ú{\n«c!dÀX¸\Æw¡\Òg.)¾—¦»¦žñü\Ì\×>”\Î|®gþð\ÒÛ‹\ÏÿÈ—ò<\Ë\ÕX(IÒ†õ“tò?Ü¾uF\á‡?ü‘ô\É?ýN\Ú\å?‚¼•±0Bz3žü\Æ\Ä8\ãœ_N\ï8öõô³~%\Ý\Ó\'\Ò\×?}UzýþsF\ãÒ¾sÒ¹o¸*}\ê\ë\'\ê#M9@]tlð\ÉL|œ³\Ó/¾\îƒ\é‹\ßzjôvƒ\Ëü\êo¿%½òœ³·>‡C¿ý\ÕÙŸCz*}ë‹·¤C¯\Þ?úýu\Å\å½ú-\é\Æ/þ\×Ák‚žú¯\é‹7½%]¸õ9¿\ÓñM\é\èMg™§\Ó\ãÿ\åO\Òmƒ\Ïÿe\ÕË˜õ1\'\Æ\Â\é\Ïu\Îñ\Z7ø|ÿ÷cƒcü²ñû\Ç\ä\éõWKÿûø˜Mtwº¼x»\á\ÐôTú\æ§#½¼ü]\×ýûòM†•Ÿ\ËE¤\r/·¼w};=3w,|:ý\Ã\×oOG\ß0~¿3Ó‹öŽß§g|ŸŒ¿G*Ÿÿ‹öL‡n½§\Õ_\Ïþû\Ï^:|ÿ‹>þÍ­cü\Ô7oOo\Þ?¸\Ì\Ú\ï,¬ƒ†U¿?§¿¯\ÏÚŸ^yø–\í\ïÑ‰Z~?\Ìûú|ºü^‰Ô®K›¯\Ã\äÇœø,¯\Û]ßŽ¾xO¥\ïü\Õ\çÓ‡¦ó\Ë\Û\ã\Ü\ï\ÙY\Ãxõ\Ø>õ\Íô©w½zô9¿øƒ[¿;uXy\Û\ßö÷\ÑõEúÅ³ŠÏ«¸¼Ò…‡?‘\îY§\ß_)IÚ€þ1ý\Ã_l…ù\È\è/ ƒ\á\íÿ\ádúIùV»™±0Bz1~nô;_ôÊ·¤÷<\âpù€~\à\Ük¿RvNþYú\ÐkFê‹‘\â\íƒ÷y\ß;/.¸Ÿ“~õ\ÓSt<|ø\Ø\àãœ~ñu\ïN\ï{ÿ\é\Ð+ÇƒÌ¥\é3ú\Ôÿý\âW§CG«—7\ãsxúo\Òg\ÞrÁðõ\ÃQ±xŸ£o)Ç—³\Óù\×O½Où{‡c\Îð\ã\×ó\àh´lz\ÝxŽ&£\Ë\Øþ<\ÏN¯ý\ä\Ôõ\Þ\ZP>Ÿ\î¾ö\éŒ\á\0r\ÅðýÞ¾5ô\Þ\ï\Ø\ß\ÔÆ—g\îû\ìh«^¿\â˜m\r=¯H\×\Ô~g\àö0ôµr`ß\í³GOŽ>—\áeŒ?Ÿñåž“\Þñ®·Þ§vLN¦¯\Ýp\Ñ\èýŠ¿D<üC#\ïN\Ëq§ö‡-_Ÿ\Û^_¾®ü¾z\ß;\ß4\Zž\Úy\Ãþ[ºó]\Å\×zðuýWWlýq“¸%}õ\Äô\ÐUƒwþQóArüýù»_JŸ~Ž¯_\åx\×~gâ ¶\ßó¾>Ÿý“tkñþ\ï¹xx¶\äi/¹8½»ø\ïÂ­’N”—\Ðú\ë°õ1/\ÝUü\åòÁ\×ü\à\Ôûœö\â\ßHwN+G\ã\Ê÷\ìöÏ…à¯Ÿ/ÿ,}\æ’ò\ã\rmÿUö\í\ïõ\Ñ\Ð:ñ3hð}~\Ý\Ä\Ç\ZÿöÁ\ë\Æ?+\×e4H\Ïÿy\'IR¿ú\Çô?ý\äöPxû½é‘Ÿ<’î½½2\ÞûH\Ú\íg#c!d c\ág“^û»\Ûgm=õ\ÍO”CÈ¥\é3?\â\ï\Ëýg\×\Þ\ç™_\Z\rr\Ãñ¯|aQ9?\Î\Ä0Vþ%\åÁ\ë\Î\ÞA:cÿ\Õ\é\î\Êh1úC\Z\Ñ\çðtº\ç†\Ñû{\å—&Ï¦z\ê›\éw†#\Õ\éC•?\Ïü\×}\åð\í/þý¿›\æŠ3\Éþ²\á\Âpÿ\í\é\èõ_L\Ó\';=s\âó\é\í\Å\ç9ý{õ\Æ\Êàºÿšj\Ã\ÖÉ¿ühyý¥OU\×\Ó÷¤\rÇ“Ò›?=yŒ‹\ëþ_½!½ªx¿\é\ã<†.:”.\ÞQº&8»m|–\Þ¯ÿhú\Æ\Ä@T¹\Ü\â2¦FŸ\í÷û½ô\Í\ê…Ž\ß]Ã¯\á\Ù\é\Ðg·?™Ç¿ð\î\á\åœ}\íW§>‡§Ò·¾~oeüjPñ5:ö\Ötnñy•\Îzý\Í\é\Ë\ÑYg\å1¿\à£÷–/hPùýY|žÿ–\Û\'¯\ß\à¸|û¿1ú\Ø/ùPúZõK\Øöû¡Á\×g\ë{fÆ \Úö\ë°õ1\Ï:{xûº«ú=8xŸÏ½s4\àÕŽ\×W>’\Þ\ZœYü\Ô_þ?\Ó+ŠË»ä³“_\Ãc\á…o<”\Î}\Íû\ëg\nV¾\×/¿kòŒÅ§¾ù{£\ÛGõ/­Ÿfþ’÷§¯N]\ÔS\ßúzú\ë5ú[7’¤u\îÓ·ÿ\Ýö3ù\È\í‘þaü¼\ãü‡ô[ƒ\á\'\Òþ\ç\Ý…€±2Ð‡±ð´7Þž&6§a§/¼³¸Œ©\ßix\Ï\r\Ã3Ÿ\Îx\ç¥é“‘ŠþþÓ‡†\ï3ñ{\ä\Æg)½\ê\ÖôŸ\Êm5ö7ø8\Ó\ç‚=\î:R¼\î\ìt\ÍW\Ê=ð\ÙthxyM=5f—\Ý\Ù7lO5£\ãq^úP\í¯d\ìF\ãc5u¼·®\Û\ì¯\Ãú\Øk¯?3½\âcÿ±|IJ\'>{\éðeg\à\Ï\êO÷,‹\Þokª\rF\ã\îIzIñú©qr«§\Ó_tt¹“£Où~g½;}!ü¢ßž..Þ§2 ¿·–ýK\Å\Ï|û\Òe/+­s\Ò/_ÿùt\ïþ«ô¹›~-?5\ëc\êh¤<{ð½|c\Ìjüýù’«\Ó\Ý\á\ÓXOw¾k4¿\ã\Î&\ç+\Îø~Xøõ4w,lÿu\Øþ˜¯I¹78&÷~4]P¼þõ¿Ÿþ¶|\Ñü\îMyyqy\Ûg[0Ö‡\íQ\ã\ïõW|ô\Þ\à{}ü—°+·\ÛñÇ™+%IÊ©ŸmŸAø‘Oþiú\Îô/(ü\Ço§û‰rHü×ƒ\×ÿSùò]\ÈX!}g\r:÷ý\îÁ\á\ë/«üe‰\ÑzsÆ˜ñøP\r\ÊÁ >\Ûk<f\Ôÿ€E\Ñøs¨–\ã³Ö†¿-j|öQep\Ù:#«8»\é¿<>s„[\\ñ{\ê\îIüùc\é\Æ\âiªýR\å÷\Õ\Í\ç\r1÷ý^º°x›­§ÍŽ‡¦W¦\Ì;9.¼\ìñ±|wúB4z\Õ>V\ÐxÜ©~ýÊ¯\éƒ—\ÅÇ­> =s\Ï\r£³ñö¿5\Ýö\çß©ŸA×¤~%]3<Sõ\âô‘¿œ\\Çž9ñ\Õò©ðÕ§q—£\ÞYƒÏ£\ÅV8¾\Îg\\[]¤\'{æ®£Ã·©·ø~Xôõ)š7\î\à\ë°õ1£¿&]ôô—\Òe3__ü\Þ\Â?I|û\ÇGOõ}\Å/U~aË±0üž›5ªnW»­WÏº=ö\ç\é;;úÆ’$©ƒ\àÿ\ëß¦o\ÏúK&ƒ\×ÿ»?†\Ä%3\ÆB\È@\Æ\ÂY\ryüú\ê(7º\Ü‚±0÷\Æ\Ê\ÔøP}Ž\ã—-T\\žþvúÂ‘òwõ\r¿G\ï\Æ\Ï¯=\Írn\'ÿ,\Ýx`<\r¼ø‚ô²WŒ~g\ã%¯*^6c,œPª\ÕÆ¡û\Óm‹Ëš3(\r+\Û\Ë?šþº|\É\Ö\Ë.ú½t_ù’‰æŽ¶e\ÑX8~\ÙBÕ¯\á\Éô\ÚúÝ—gœsq:z\ìOjOÙ\×ø,Õ™£p\å)\ç\Å\ï|\æÞŸ\"Ÿ¥6§¹ßŸe\Ñqiûý°\è\ëS4o,\Ü\Ñ×¡ü˜\Ñ\å\r‹o\Å\ï|\ëðŒ\Î\ÑeX\çe¿Oð½\é\àð\ì\Ôvcá…¿û7\åª¿\×«~mNþ\å­\éW‡¿›t øŒ3ÿ\à$Iš\ÎX!yŽ…ç¥ƒ\ï)ÿø\Â,Pyz\ì\Ü1&+\Æ\Í_qiðq«&þ0Ä¨§¾Uüõ\Ú\í?žRœùö™ûš,†÷§O–\ÃÔ›?ö\'\é¿üpò}\Â\ã\Ýf,\Ü:Cp< \ÄgZn\rO†¡¹\ÃMY4Š•/;ûuïó–?H\Õ\'E=s\âxú\ÜM\ã?<3p\ÖE\éC_‹žC;\Ýø¬³ƒ\éwf.kƒNþ\Ñ\è÷žuqzmq\Üf=Ew^s¿?\ËÊ·\Ù>ûp\ß‹¾>E\r\Æ\Âv_‡E3¸ým\ÑyQº\æs5uö\Þøû³\ÝX\Ûñe½&]^m·þ\É\Ô\Ù\ÏOŸH\Ç?w\ËöI\Úwvz\Õ\rþjI’´±0Brï¹¡øbS¿CpQsƒ`¬¨}Ž\ã\ßsö\ÚO6û-kaO}\'ýùGË¿ªºÿ–ô”/ž\Ù\ßþ~zmñ¶\á\ïJ{ }\æ’\àx”9Oû}fpl†O\Þ\Z¡Æ—\Õði\È\Ñï§›5}\åý£\ë{\äK3Ï¼?\Ývbôÿž\Ê9O\Ó]\ØÓ§ÿò¹ò…œõ\Öôÿ^ø«\ÇC\Òü\ïá¢“ƒ\Ïyø„\çý.Ày•ßŸóÎ¸n}\Ï\í\äûa\Ñ×§h\ÞX¸£¯\Ã\Æ\Âòû¤ú;?·ÿ\Þ\Ë\Ý\Ç\Ç\é\â´ó›rñ4ðÏ§wŸš|vzó\ç–û™’$­{\ÆBÀX\Èm,|ü\Î\ß\r	sþøF­]\ÓºuôY\Ã?\ÌÒ¦¿I¿s\Ñ\â\ã4¬¼\áY‚\ã³\Ûf…3\Ïv;™¾0ük´“8cüô\Ûy\Çx|\\.þtõ,†Æ¿\Ëq\á\ç3u=øÿM\ï(®\ßô_n\Ýø\Ö\Ìþž«ö•kGŸË¥Ÿ›w¾\Ø\Ó\é¾ÏŽÿRò\Ù\é\í­O+4þ\Ú\Îøƒ9\é\é{\ÓG†O+~Mú\Øø/ô\ì\äûa\Ñ×§h\ÞX¸£¯Cû±0ºÝ?\Õ{w\Æ\Â\í?\Ô3ù}Ü¾p\ä–$IµŒ…€±2\ÛXXý\ïø\Ü­ý\áŠgN|=\Ýöö¤‰sŸv{,LŸ>s\Éhd{\íG¿^ÿ½ƒOý\×ô\Å\ë¯JŸ\Úúp¤{\î\nþ\Â\Ó\ßH7\â¬\ßHw\Îýý€ƒ\Æg’½\ähº«ºG\ro\Þ9\éŒyc\áÀ¹o¹=}s\â\ã?•¾ù»å™\Ó#\Õøi \ÅS\\§þ\Úo1Žý\ÃWoH¯*>\Þþ÷§¯L|Þ‹†¡\Ç\ßÅ™¡³?ŸŒ…ƒy\Ï\rŒ\Þ\ï]Ÿ¯ÿ\ÞÁ§O¤¯{Gúp\å‹þ¿ü\Å\ÚSs‹1òsÿkq½*£Ûœ¶þHJñN¾~¢6œ>õ?|¯~\å¯Gzsù\Ô\Ù}µþ¶sƒ\ï§W\Ýð\Õ\É\ï§Áu»\ë\Ê\ÑuŸø\à;ù~Xøõ)*\ß&üžlÿuXü1ƒ\Û\ßøÔƒ¿—ª\Ï\Ð\æÄ—\Ò\åû\Ï.¯\ÛîŒ…\é\ï?›—7\ëkü­/¦ë®¸}ûsÿw‡ \è\ä\ç\Þ6ü8“\\’$Mg,Œ…\ì\Æ\ÂA\Ï\Üw,½v8œ™\Î8\ç—Ó¡£\Å\ï+þ\ì£?hq\Öû÷x,trð~\ÃAm\à\Å¤×¿sô»\Í\Þþ†W”¿°ú\Ô\Æò)­g\íO\ç¿\áÝ£ßƒö\Î7¥s‡¿G¯ú\×t\çurpLGC\Í\Ö\Ç+/\ãŒ\×K¿3<cn\ÆXx\ä÷\Òm\Å\ï·\Ûú<ß^?þ‹¹/>”>ü\Î\Äg\îûý­?\â°}Œ½ß¢ah\Ð\à¸]3þ\ÃÓŸOq™¿;\ã­§ÿftŠ\×\rŽ\ã+_1<Ž\ï=|p\ë8VŸš>úþ;\';ü£ƒqô-\é•\å_\Ò=wp\Ù\Í\Îÿ{:\Ý÷\É\í?’ò¢ý¿4ü|‹¹ý‡\ÏI¿|ý—Ò·‡\âñ{n¨\åÛ¾\ìeû_\Û97€q\ã\ï\Ï~Om\ï\Ê\ç|\Æ\ËÞŸ\îžø¤wðý\Ð\ä\ë“Ê¿\è\\|\Ìs.No/nWïªŒe-¿‹?fpû«|Œñ±x\ï\á_Þ®Î½òXºy\×~gá¨“ƒ·Z|\ÝF fø=9øú\rG\Ë\ê_ü./\ïEûnÿ\ÜyuùvûŸS³o,I’66c!`,„\ä8g~\êŠ7¥ó\Ë1¥)~ñeƒð7}>?15b\í\ÅXXTœAx\Ó[Ò…[\ÃQ9(\Õþ:\ê\ã\é¾/Ü’]4^|Aºððõ\éSÁ\ÙL3{ú\Û\é®Á\Ç\Û\ZŠ!\å¦\ÑP\ï\ê€2<\Ûq<P\ïûŠÁ\çy{úúô±ª4þ\ã \Û×¯8\ÆoJoÿ\í/\Îø«\ÂMÆ¨A\åq_\á\Ø5þ\\Ê¯Umô)*\Î\\ûôU\Û#\Î@q=.<|Kú\Üñ\É\ãø\ßþ\ìX:ú†_Úº¾\ã¡ö·¿X?uQ\Å\Ùe¿ý\Î\ê÷Z9]Wÿ+¸\'ÿòXz\Çx<\Z\\¯·|¦Á/Ã«|ÏŒ}\×h\Ûú87\Í8\Þm¿š~}N~cð9¼ºI\ÏI\ç¾\çÿ3ù{[|\Ì·¿Á\çPÜ¾\Ç_¿b\Ä;ú\éo¤“ƒKÙ½?p²]ñ5¾qkð,®÷+sú/hÿ·?K·\r>¯\í±x\ÑmB’$U3\ÆB\ÈÀ^…’\Z\ÖpÐ’$I\Ê=c!`,„¥Ž3J’¤\r\ÉX!\ÆB©ãŒ…’$iC2\ÆBÈ€±P\ê8c¡$IÚŒ…€±2`,”:\ÎX(I’6$c!`,„¥Ž3J’¤\r\ÉX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\Åÿ`?ú\Ã\'\0\0\0ö”±0BœY(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ivý>”€~{\Û\Û~½üŸnI’$IÚ»Š\Ç\Ñc`s!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈXôr,¼\îL×¾ÿºô¾÷½/]s\Í5°ñ.½ô\Òòº%I’$i\ïz\ã¡K\ÒeG¯d…Ž\\quº\â\ê÷¥÷_ÿp#U\ë\ÝXX…\ÅHø›¿ù›é¦›nJþð‡a\ã½\ç=\ï)ÿ§[’$I’ö®\â±Gô˜„½s\ã7¥k¯û@z\ï\åW\é…Þ…×¾ÿý\éCúPx‚Mµú±ðþt\ÛÁ3\ÓiW\Þ]þw³ž¹\ïXz\íY¤Ë¿|²|‰$I’¤œ2v§‹3£­V©wc\á5\ï{_ºù\æ›\Ãlª\Ý\ï?öºtÚ¾3¸:\æÁ…E\'¿|u:÷%G\Ó]öBI’$)»Œ…Ý¹é¦›‡gF[	¬Rÿ\Æ\Âk®	o4°\Évc,|ü¾Ÿþø\ï\Úò©£¯L§\í;”n©¼\ìÿø¯\Ò¾õ\Î\ÇÂ”žN÷»8½\èõ¿?¸I’$I9e,\ìVñ;£­V\ÉXØ±pºÑ™†\ã3	§[f,”$I’”k\Æ\Ân\éc!dÀX(I’$i»e,¤Œ….\Ç\ÂgN|=\Ýö®_N¿x\Ö\à¿÷“\Î}\Ã\Ó]\ß~º|»J\'¿‘>uÅ›Ò¹/.\Þ\î\Ìô¢ýoJG?ý4ù«\ïN—^wÑ±û\ÓÉ¿<–\Þñ\êý\éŒÁŸq\Î\Å\éÆ¯žH\ÏÞ¢úò\Ó^ü\êôŽcÓ—1\ê\ä_ÞžŽ¾\á‚ô¢\á\ïZ,>¯«Ò§þrú-O¦o|úªôú—•—7|»ÒŸ<P¾Z’$I\ÒD\Æ\Ân\éc!d ³±ð½:]þ²W¤·~\ì‡¿\Óðó{k:·\Ý^õ\Ñô\×Õ½ð\ä\Ý\éòýƒ—\ïSºñö\Ñ\ï?üôõ¯y\ç\Þp\Ïp5\Z/<ruú\ÕW¾#}\ìóƒ·ýü­\é­/;{ð¹¼.ý\Î]\Ç\Òk_|Qºfx˜>ö–/?;ú\ìß—\ï?jøGTŠ\Ë~\Ã-\é\Ó\Ãßµx{º\îÀ9ƒ·½ }\èžñ\'ötº\ç†ÁûŸµýùÿñ\í·¤C¯<”nó\Ë%I’¤0ca·Œ…ô±2\Ð\ÙX¸\ï‚tù—«g\ë=þú£¯¼ü¼ô¡{\Ê¥\Ç\Ó\ÝWž—N«ý\ä§\Ó}¿[|ŒK\Óg¶\Î\ä…§õ\îô…\ê\Û\Þ,]T¼|ú\ã=ýg\éú—^~\ÉgÓ‰òEé‡ƒ\Ë¼\ì\ì#_š<\ãð\é¿I¿S|\Î[oû•tMq6\ä\à\í¶\Ç\ÊAO?•ž\nNŒ”$I’d,ìš±>0B:/ú½t_ù’­\îýhº`ß™\éò/—ÿý\Ã?Joü÷½·|A¥û~/]X}\ÛñX8=\à¥{\ÓG^>xù\Ë?šþº|É¨§\Ó]G/\É\ri¼M>þ…w>\ïW¦D\îwV®\ÓL{\Õ\à}÷_\î:a”$I’šd,ì–±>0B:k£Þ ò,À\â÷Vÿ»ø=…³l½m9nÿ÷¸ò\ã<6ø¿&»û\Ê\â2¶?\Ï\Ñ\ç=yù“^·õ4\ã“_»%ýòðw(ž“^~ø–ô¹¿úNzjô*I’$IA\Æ\Ân\éc!d ³±0úk\È3\Æ\Â\×\ßx\ç\è÷þý}\Þv\×\Æ\Â7¥\ïˆ?\Öÿñ¿O÷ý°|ã¢§¾“þü\Ó×§C¯,~§\á™\éEoüýtŸ\r%I’¤0ca·Œ…ô±2\Ð\ë±ðÏ¦CƒÿŸ†\\kù±ð\Äg/üwü4\äù=•¾õ\ïNg‡_’$IR‘±°[\ÆBúÀX\èõX˜þ>}êƒ·­ý“¨\å\Ç\Âô÷·§‹—Qû\'µžJOM?\çø\é/¥ËŠ÷½aë¯³H’$Iªd,ì–±>0Bú=¦ô\Ì}\Ç\Òk‹¿<ü\â×¦£\Çþ°|:ð¦\Ûn|w:øk¿_\0wa,,þ\Êò±‹\Óƒ\ËyÑ«\ÒmŸ/Ÿ~üùc\é\Æw^œþ\Õ\'Ç—0øX/~u:t\Ó\í[Ÿ\Ï\Ç\ÞþŠÁû½&}\ä^\ÏC–$I’¢Œ…\Ý2\Ò\ÆB\È@\ß\ÇÂ¢§¾õ\Åt\ã\á_N¿XŒ†ƒ×Ÿö\â\Ò\Ë\ÞpUº\í«ß®ü‘”\Ý‹žJ\ßú\â-\éÐ«÷G\Ã\á\ï\"\ÜÿK\éõWKú\íñxº\ãŠ7¥ó\Ï9{ôùœµ?ÿ†¦\Ï}s\áé’$I\Ò\Æf,ì–±>0Böb,”$I’¤éŒ…\Ý2\Ò\ÆBÈ€±P’$I\Ò*2v\ËXH!\ÆBI’$I«\ÈX\Ø-c!}°1c\á\áó!ýüsc\çŽ\ßú\ÂX(I’$i»e,¤Œ…[^š\ï7Ï‘/½\ïù‡\Ã\×\Ãn1J’$IZE\Æ\Ân\éƒ\Í÷HG¶^~$\Ø7ÛŽ~•÷5²ÇŒ…’$I’V‘±°[\ÆBú`\Ã\Ç\ÂBu0Ÿ]85\"–¶ž®|\ä@:}\êu…\Ó	.sd\îS·.¯ýÙl†\Ý\Ï}\éÿ\0\0¬¹e3v\ËXH¶žNü\Ü¦GŠ—N\ç•#ß´\á\è7w,\\ð¾S»P}Š´ßŸHd7\Æ\Â\Óö	\0\0¬¹e3v\ËXH\êc\á´\è)\ÇñÓ·/kû,Á…¿\ÛÐ™…,`,\0\0šX6ca·Œ…ô±p \Z«gûMX0\Î|¿Bð±¡	c!\0\0\ÐÄ²»e,¤Œ…Õ§\r—¯\Û\ÇO-nzfa\åe!g²3\ÆB\0\0 ‰e3v\ËXHløX8ùû\Ç dü¶\Û°¤òv\Ï,l1z\Z2\0€&–\ÍX\Ø-c!}°yc\á,MŸJ<\ç\í†\ã\âŒ?~2û÷!Nž\É\èœ1\0\0M,›±°[\ÆBúÀXž\Í7ùt\âó\Çg\Î:31þ‹È³\ÇBg²ˆ±\0\0hbÙŒ…\Ý2\Ò3BÎŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BV?^ž\îùAùŽ3ûAº\çHô¾›`\Æñù\Û¼\í†øôß•!hc\Ëô÷\Éß¥O-z›|=½§ö6\ë\ëS[^\ïjv\Æ\Þó³~\èF\ß7›b\Îÿmò\Ï\Û#_O–‡aºo}:xûM³õ¿G›|?e\ìß¤o•G£–û,ƒ‚\ï‘\Ê\í+\ç\ÛÓ²»e,¤6f,¼ù\æ[Òµ\×]Ÿ®¸\ê}\Ã\ää‡.)ÿ§{\çEw$f3\Î4\çAš;\ÞóÛ¼±õ\ÛQ\íL?m\ÊP6\ïvd,\Ú\Ô\Ñ\ÃX2\Îg,¬˜3m\è\Ï[c\áâŒ…\Ý*ÿE[	¬\ÒFŒ…\ÅPxô\Êk†—ÿ[7\Þ¾\rôY\×OC\Þ~»\Ég¸ŒlŸ	5u³¸si,¬—\ÉdÓ¾¶‡ŽGPþS\ß#\ãï§­\×o\Ä·\É¯“\Æ\Ç\ìo7},¬\ÜN*#ü£qy\í}\Ö_e,\ÜäŸ¯\Ó\Öd\Ì\Ø3\ÆÂŠíŸ·\Û?Cª#ü†Þ¯3.\ÌX\Ø-c!}°c\á5\×^—®»þ\á\ë \Æ\Âþ˜9nº9w¼«ƒ\áf=°\r\ÆÂ‰\ã3~÷ƒÁ\ë‡ÿ\Ç\àÿ\\ÿ¡ls¿\æ‹\ÎV†ÕËŒ…!c\á|\ÆÂŠh,\ÜôŸ+\ÆÂ…»e,¤6b,,\Î*¼é¦›\Â\×AŒ…=²usœc2\ÔðŽ÷fUÿ\â\ßTþ\ïòŒ\Ù\àÁ\Ú\Ö½öcaeü\ÙÔ§¿\Íþœ­ü¼qf¡±pK\åg\êdþ÷hh\Þÿmœ\Ê08\ÕFÍµûrq\Æ\Âøq	{\ÏXHl\ÄXX\ÜØ¢—C.Œ…=\Þ\É\Üðc3\ïÁ™±px½·nG\åH6‹#›3V¸\Z\'lÿœ\ÚÔŸ/•±pª:Œ…ó+f…E›ù\ÆÂ…»e,¤Œ…caOM\ß\Ù\Ü\äñ\ÃX˜·CqŒ\Æ\àF·)g2s,\Ü\è3êŒ…¡\Ê\ÏÔ>³+¶\Ç\Â\êÿþnü¯TixŸ\ÅX?.a\ï\éc!dÀX\Øg\Õ³üÀd\Î\ï\Í}P25Vÿ{\êžl\ÎX\èA\ê,~\ÎF*?_=\ry›±p.·¥ªx,¬þc\çF~f,ì–±>0BŒ…ýQ“w«c\áŸw¼·‡¡Aw&\ÙôXX?{lü½´IcaõAjý\Ú\àí†žq\è\çl\ÄX2\Ö|\ê/\Æ?7*O»uöòÀ¢3…\Æ\Â8ca·Œ…ô±2`,ì‰ñkºM~0;1\0Em\â÷N},¬>©“\Z¦GÓ‰Œ…\Æ\Â-\Æ\Â\Ð\ÄÏ‘\É&\Î\Û \Ñÿ6R•ñ4jSUc\áÂŒ…\Ý2\Ò\ÆBÈ€±°GfŒbÿ d\ÎX¸¹\Ç&gŒ›6Ž\Äb7u\ìðs6b,k&\Ç\Â`\0\ÚXs\ÆBÿÀ9\ÈX8+ca·Œ…ô±2\ÐõX\0\0\äaÙŒ…\Ý2\Ò\ÆBÈ€±\0\0hbÙŒ…\Ý2\Ò\ÆBÈ€±\0\0hbÙŒ…\Ý2\Ò\ÆBÈ€±\0\0hbÙŒ…\Ý2\Ò\ÆÂ¦\Þû«\é\Üÿ\áLû¶¼4½þ½õ·»ô—ªoóšt\é\Ô\ëg)\Þ\ï\Üÿ\åHðº#\éõû+—¹ÿWÓ‘\Ú\Û\\úš\ÊÇuYS†\×)øwûº\Îú8;=^›\ÆX\0\04±l\Æ\Ân\écaC—þ\Ò\äu\äyim\Ü\Z_•1oú¿gš9¦•C\á/½e\ÆDŸK³\Ê]»®fýó\Ûññ\Ú@\ÆB\0\0 ‰e3v\ËXHw\ì-\éUÿ\Ãÿ˜^uiù\ß\ÃÁoú¼©·™a8\ÆM\r€CÃ±mjd›þ8s\ÎÚ›¯ø\Ü\â3\ëvr]+ÿ]\èØ„—KÁX\0\04±l\Æ\Ân\éc\áŽMŽ]\ÃÁ¯vV\Ü\èLÀùO	..\'È†g\Ú\ÕF\ÄÉ¿\Íb3\ÊÐ’\×\ÕX¸4c!\0\0\ÐÄ²»e,¤Œ…;55€\Í\Z\íŽy\Å\å„O½5¾U_>ú¿_u\é\èÿ\ßz\Ê\ïÂ§òŽ\ß/z]`\Ù\ë\ZŽ…õ§7\ß\ßÓC\ÆB\0\0 ‰e3v\ËXHwbx\Üä·³±p\ÞhWg½|tv\Þ\ä )‡\Ã\r”Ý¸®3\Æ\Â\Âh0,®Ã€¡p&c!\0\0\ÐÄ²»e,¤Œ…-Ç­\éoGc\ápˆ‹G´6ca\ím†\ã\Ü\ì§óŸSýr\ëv\íº†capý|Þ›\ÌX\0\04±l\Æ\Ân\éca\Ã1l\Þrµ3\ãf\r~#‹F»x|«þ®¿—?\ïwÿ\Í(·\í\êu\Æ\Â\âeÁ™„3\Ç\rg,\0\0šX6ca·Œ…ô±°¡\áˆ5\ïi²\á\ÙsÅ°7\ëL¹y¯	G¹©±/\×\Â\Ïedx™Æ¸]¿®Á\ÛÇƒ£±pc!\0\0\ÐÄ²»e,¤Œ…,ö\Æg\ÖU‡®y\ÃW“\Ñn|\áö\ÙzÁ\Ù{\å\ï\Ü~ªðôûT5¹»]g‹SŸ\çð\ífý\Ç\Íf,\0\0šX6ca·Œ…ô±°‰r\ÛúCUgÇ•#\Úøu3\ÇÀ\Ñ\Û5\ÅF£\Úø2\Ãp\êó‹‡ÂbŒ›w\Æ`a×¯\ë@8&¯[ÁP3\0\0M,›±°[\ÆBúÀXØ…&£Ý®k3P\Ò7\ÆB\0\0 ‰e3v\ËXHWn4\Ú\Í<ûo¯\Ì<»\0€&–\ÍX\Ø-c!}`,„\ì\ÆXx\îKÿg\0\0`\Í-›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀXØ±ð\Ç?þ1\0\0°\æ–\ÍX\Ø-c!}`,„\0€&–\ÍX\Ø-c!}`,„\0€&–\ÍX\Ø-c!}`,„\0€&–\ÍX\Ø-c!}`,„\0€&–\ÍX\Ø-c!}°c\á\Ñ+¯I7\ÝtSø:È±\0\0hbÙŒ…\Ý2\Ò1^s\íu\ÃËŽ^90\0\0M,›±°[\ÆBú`#\ÆÂ›o¾e\ë½ú\ÎX\0\04±l\Æ\Ânéƒ\Å`XœaxäŠ«†7>\È\É]RþO÷Î‹\îH\0\0\0\ëeÙŒ…\Ý*ÿE[	¬\ÒÆŒ…3g\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX\èj,<u\êTzø\Ñ\ÇÒƒ\ß$}÷Á“sx\è\áôýGKO>y*¼¬u\â¸\Ô9&1\Ç%\æ¸\Ô9&1Ç¥\Î1‰9.1Ç¥nŽÉ²»e,¤Œ….\Æ\Â\âŽ\Ô\ß{8¼\ã4Oñ>\ë|\'\Óq©sLbŽK\Ìq©sLbŽKcs\\bŽKÝ¦“e3v\ËXH!]Œ…Å¿¢Fw–š(\Þ7º\Ìu\à¸\Ô9&1\Ç%\æ¸\Ô9&1Ç¥\Î1‰9.1Ç¥nSŽÉ²»e,¤Œ….\Æ\Â\âi\Ñ¥&Š}.s8.uŽI\Ìq‰9.uŽI\Ìq©sLbŽK\Ìq©Û”c²l\Æ\Ân\éc!d ‹±0º“\ÔFt™ó¿õ`:\íÈ\á\ëú$º®mD—9\Ûñôñg¦\Ë\îˆ^\×\Ñõl#ºÌ¹Ž\"]¸\ïhº#z]D×µ\è2\ç¹\ãÈ™\é\Â[‡¯\ë“èº¶]\ælw¦\ËöL?½®?¢\ë\ÙFt™s\Ýq4v\à\éxôº‰®k\ÑeÎ“\Ãm(ºžmD—9Ÿ\ÛP\Èm(\à>K¨£û,\Ëf,ì–±>\è\åXLºô\ÒK\Ëÿ\é\Þy\Ñ‰y¢;HmD—)œ¶¯d,,Î¶‹;Þ¥\âÁ\Ù\Öq1ŽŒœ‹±°4|p6>.†Ž±\á?ÊŒ‹¡£”\×m(ºžmD—r\n¹\rE\Üg	u|ŸeÙŒ…\Ý2\Ò\Î,„¬í™…\Ã;R£;P\Ã\Ñ\ÐX8´},FwÀ\Ýñ.TŽE\åû&~\Û~ˆ®k\ÑeN>p>`\r\Æ\ÂB\åXC\ÇP\åXl\ßo\×#\Ñum#º\Ìi¹Ý†¢\ë\ÙFt™unC!·¡û,‘\î\ï³,›±°[\ÆBúÀXØ„§!#\îx‡Œ…ca\È\Ð2tDŒ…!·¡\ÛP\Ä}–±0\Ò\ÆBÈ€±°?¢\ë\ÚFt™³¹\ã2Œ…!CG\È\Ð1†Ü†BnC÷YB\ÆBvÀXH!\Æ\Âþˆ®k\Ñe\Î\æŽw\ÈX0†!CG\ÄXr\n¹\rE\Üg	\Ùc!}`,„û#º®mD—9›;\Þ!caÀX2t„ca\Èm(\ä6qŸ%d,dŒ…ô±2`,\ìèº¶]\æl\îx‡Œ…ca\È\Ð2tDŒ…!·¡\ÛP\Ä}–±0\Ò\ÆB\È@cá‰‡\ï$5ñÀ÷/sž\\\Æ\Â\Õ—<\îx¯ú{%—±pµ\Ç%Ÿ±p¥\Ç%“¡cÕ·¡\\†·¡º•ÿ¼u\n¹\rE\Üg	\Ùc!}`,„t1~ÿ‘\Ç\Â;JM<ôð\ÂËœ\'—±pµ\Ç%;Þ«þ^\Ée,\\\íq\Ég,\\\éq\Éd\èXõm(—¡\Ãm¨n\å?oÝ†BnC÷YB\ÆBvÀXH!]Œ…§N\n\ï(-Rü«ëžx2¼\ÌyrW{\\ò¸\ã½\ê\ï•\\\Æ\Â\Õ—|\ÆÂ•—L†ŽUß†r:Ü†\êVþó\Öm(\ä6qŸ%d,dŒ…ô±2\Ð\ÅXX(\îPÿ[\ÜAŠ\î8Uoó½“¦\'Ÿ<^\Ö:q\\\ê“˜\ãs\\\ê“˜\ãR\ç˜\Ä—˜\ãR·	\ÇdÙŒ…\Ý2\Ò\ÆB\È@Wc!\0\0—e3v\ËXH!\ÆB\0\0 ‰e3v\ËXH!\ÆB\0\0 ‰e3v\ËXH!\ÆB\0\0 ‰e3v\ËXH!\ÆB\0\0 ‰e3v\ËXH!\ÆB\0\0 ‰e3v\ËXH!\ÆB\0\0 ‰e3v\ËXH!\ÆB\0\0 ‰e3v\ËXH!\ÆB\0\0 ‰e3v\ËXHl\ÌXxøü_H?ÿÜ}Ò‘\àõ\Ðg\ÆB\0\0 ‰e3v\ËXH›8r ^¼\ïs_šG¯\ß$‡_jtí€±\0\0hbÙŒ…\Ý2\Ò\Æ\ÂŽx\á\è}…\Î\Ðìˆ±\0\0hbÙŒ…\Ý2\Ò<N\ç\rÀ_H§8R«os$\ØW¾¬ª2”M¼_\áü\Ã[sbd¬ž‘7þ¿\Î;<z\Û\ÚÛ—/\Û:“o¬:\Òm½\î…\éÀ‘\ÉÏµ¸N\ã\Ë\Ý>3²ª:|69\Ûo3¡r}«¶.c\Æ\ëi\ÇX\0\04±l\Æ\Ân\éc\áÀ\éû¦¿\âeÃ±mþX¸u™\ÓÊ¬6$†\ï[¹Ü­1­þ²ðý\ã\ëPO¯}žÅ€X^ÿ\éÁq\Ëx0lr,ÚŒ…Õ·u6\æn0\0\0M,›±°[\ÆBúÀX81hU^¶õv3\Îø«œ­·uv\à\Ô\ï6¬Ž}gúU_7þ8µË«x[\ï;~Y9VGÀñhWy\Ùô\Ç\Ü2\çc-:MŸ†¼uý\Â1‘¶Œ…\0\0@\Ëf,ì–±>0TGµh\ÇÂ™g\ëFc\ÞöûU\Îò\Û\Zì¦†¿`<ŒG¾­Ï¡zùóFÆº\Ù\Ãd|,šŽ…\ì.c!\0\0\ÐÄ²»e,¤Œ…\r²h,\Ü~Y¬\áÂ‘q\ËöÓŽ‹?þ¸[Ÿ\Ë\Ü1²|»Fcaõ©\Ô\å\Û5:‹\ÑX\Ø\'»1~÷Á“\0\0Àš[6ca·Œ…ô±°Á@¶\è\Ì\Â\Ñ\àV7,¬¼þü—–ŸKeô«z\Õ\ÏoB£±püß•·©}\î»?n_7OC\Þ\r»1J’$IÒ¢Œ…\Ý2\Ò\ÆÂEY\í,¿\á\ëfüñ“ñ\å-\ZkO5ž\Z\à¶>—iµ\ßO\Ød,Œµ·¯S)«\Çf\Æu§c¡$I’¤Ud,ì–±>0,«/Ÿz]4\è5§\Ç\è\Å\Ú8Wh5^61J>—%ž†<ý9\Ï:sÐ™…»\ËX(I’$i»e,¤6f,„œ%I’$­\"ca·Œ…ô±2`,”$I’´ŠŒ…\Ý2\Ò\ÆBÈ€±P’$I\Ò*2v\ËXH!\ÆBI’$I«\ÈX\Ø-c!}`,„%I’$­\"ca·Œ…ô±2`,”$I’´ŠŒ…\Ý2\Ò\ÆBÈ€±P’$I\Ò*2v\ËXH!\ÆBI’$I«\ÈX\Ø-c!}`,„%I’$­\"ca·Œ…ô±2`,”$I’´ŠŒ…\Ý2\Ò\ÆBÈ€±P’$I\Ò*2v\ËXH!\ÆBI’$I«\ÈX\Ø-c!}`,„%I’$­\"ca·Œ…ô±2\Ð\ÕXø\ì³Ï¦>q*=ôðc\é»žœ\ëÁ“¦<þDú\éOV¾÷ú\æ¸\ÔsL\â—8Ç¥žc\ç¸\ÔsL\â—8Ç¥žc²8ca·Œ…ôÁÆŒ…7\ß|Kºöº\ë\ÓW½oxãƒœ¼ñ\Ð%\åÿt¯®\âŽÔ‰‡	\ï8\ÍS¼\Ï:ß¡r\\\ê9&qŽKœ\ãR\Ï1‰s\\\ê9&qŽKœ\ãR\Ï1i–±°[\Å\ã¿h+UÚˆ±°\n^y\Íðò\ë\ÆÃ·>\ë\â\Ì\Â\â_Q£;KMï»®9.õ“8\Ç%\Îq©\ç˜\Ä9.õ“8\Ç%\Îq©\ç˜4\ËX\Ø-c!}°c\á5\×^—®»þ\á\ë ]Œ…\Å\Ó.¢;JMÿúº®9.õ“8\Ç%\Îq©\ç˜\Ä9.õ“8\Ç%\Îq©\ç˜4\ËX\Ø-c!}°caqV\áM7\Ý¾r\Ð\ÅX\ÝIj£Q÷K\í;3¶\åu\é¶û\Ë\×õ´èº¶Ñ¤û½®rLK}>,\Ñõl£Y÷§\ÛVŽ\ÉÀE\Çúý\Í]\×6\Zõ\å«\'Ž\Éiû®Nw—¯\êk\Ñum£Iw_Y=&Wöû¨D×³fÝ.¯“Ë¿\\¾ª§E×µFevŠ®gMsŠrŠrŸ%*¿û,\Ó»e,¤6b,,nl\Ñ\Ë!\ë:\Þ}\åäƒ²\Ñ\ÎM 6x02ñ ¬¼\Ã\Ù\ãj\Ñõl£Qƒô\ÊÊ¡¹\ÏÔ¢\ë\Ú\Æ\â\ßWN>(>À\ßôjƒ\ï\Ë\'”\à÷ùZt=\Ûh\ÒýÇ®žüÇ˜\áH\Ö\ï ‰®k‹\Ë\ï6]\Ï6\Z\å6\æ6\å>KX†÷Y¦3v\ËXH!k{fa­\Ñ’\Í€‚†Hú;¢F×³6|P¿\éH¦> \Ùô¯õ†ÿ±\éP­ÑƒúM€jõü6]\Ï6vš\ÛP”\ÛP˜û,a}¿\Ï2±°[\ÆBúÀX0ö§èº¶±£\Üñ3\ÃQ†Ž0ca˜\ÛP”\ÛP˜û,a\ÆB\Ú0\Ò\ÆB\ÈÀÆŒ…=¿ƒY]\×6v’Q,Ê°\Õ÷ôE\Ñum£}Ð‡–ÃŒbQnCanCa\î³Dõÿ>\Ët\Æ\Ân\éc!d`#\Æ\Â\á\î~?)Š®km>põ`dª\ÑW£\ØTÃ±½ÿF¢\ë\ÚFÛ†\\ý#\ÄT£®}?\Ë%º®m´.ƒ\ÛPt=\Û\ØInCQnCQ\î³D\åqŸe:ca·Œ…ô±2°\îc\á\è\Îeÿ\â\Z]\×6šWÞ¹\ìù´¢\èz¶ÑªrT\Î\á©<\Ñum£M£óý~€6.º®m4¯|0ŸÁ´\èz¶Ñªr\ëû?\ÌE×µ6\årŠ®g\ír\ns\nrŸ%,£û,\Ó»e,¤Œ…us8c¡Zt]\ÛhVg,Œ‹®g\Ë\äÌ¹q\Ñum£Yù±]\×6\Z•É™\Ê\ã¢\ë\ÙF\Ór8\ë§Zt]\ÛhV^·¡\èz¶\Ñ8·¡0·¡(÷Y\Â2»\Ï2±°[\ÆBúÀX\èb,|ð\ä£á¤&N<ôHy)ó…™=-c\ï\Ë\èNw.ÐŠVñ½2ºÓ\Ï´¢½?.\åÈ‘\Ù{~\\Ê‘#§h«¸\rFŽ|þa¦\Èm¨\ÞJ~Þº\r…¹\rE¹\Ï–\á}–éŒ…\Ý2\Ò\ÆB\È@c\á\"¼£\Ô\Ä#ý¨¼”yw0ó»#µ\çÇ¥¸ƒ™Ù€º÷\ß+£a9§#E{~\\†\èóz\àZ´\×\Çeø€>³u\ïoC£Q,·3\\Ü†\ê­\â\ç­\ÛP”\ÛP˜û,a9\Þg™\ÎX\Ø-c!}`,\\‰÷¦_yÁó\Ò\é\Þ[þ÷›\Óþ\çTÿ\æ\ëb,|ö\Ùg\Ã;J‹ÿ\êúO?ùIy)s*\Ï\\(ž¢Q\Ó\ã;ž{}\\Fg.\Çd ¯w<÷ü{¥|“>ÿ\Ëýž—ò)N¡?\Ð\ß\ë\ã2ú\Õ±¾>\Ð\ßû\ÛPù4ÁP\Ç2·¡z{ÿ½\â6\ç6\å>KTž÷Y¦3v\ËXH[\r}ûG¯›eo\Ç\Â\Ã\ç=/ý\Ü\àò&¼\à`:2~›#\Ó\éÓ¯˜¾\á\å<\ç\å\épùú#\Î\Z¾,þ¼§¯\ã¶ñûUM|\ì\Ã/¯½¾Ê¨\Ú\ÍXXTÜ¡*þ¶¸ƒ\Ýqª*\Þ\æ\ä£?L?ý\é\Ï\Ê÷^\ß—zŽIœ\ã\ç¸\ÔsL\â—zŽIœ\ã\ç¸\ÔsLg,ì–±>0¶¶c\á.€\ç½y\êu\Å\Ç\ÛùFowVú•#•·)º\êõŽ…µ\ËÚ¶=úM]\ÖPtG\Çjb¸,\Ìü¼Ç¯‹.³u5J’$IÚ¬Œ…\Ý2\Ò\Æ\Â\Öú2¶ø<fp\Å8Xýœ\Z…/8˜~¥x»\é0¸Ž\ÃË«½\ÝØŒ\Ï\ßX2J’$IZE\Æ\Ân\écakS#\×pÜªœ\Å74=œMÿw4”^¶õôÛ™#\Û\Èx¸›÷6[\ÂnÆ¸\×`,<R~®\Õ÷­]^ƒ\Ñ/¼\ÆÂ±P’$I\Ò*2v\ËXH[Û‹±°>\Î?+¯>ô\Íp£§O~\Þ\Í\Ç\ÂÁŸ\Æ\\½Ì©\Ïiøú\é\ã2%zca\ÈX(I’$i»e,¤Œ…­\íþX8\á¦Gº¹£\Ù\èòª\ãba8ö\r.·ö{‡—U}]<4N¾©òyMŸ	89hc\áÌ±³;ca\ÈX(I’$i»e,¤Œ…­\íþXŽtCó\Ç\ÂhðšÜ¦þ{tVaý²[Y84º£\Ï#Y¸kŒ…’$I’V‘±°[\ÆBúÀX\Ø\ÚÞŒ…3‡¿\æ{\Æ\ÂBôþ\í\ÇÂ\á\àW\\ö\Ôul0ú…—g,%I’$­\"ca·Œ…ô±°­C\Ü\äw\Å\Ï\Ã\Ñl‘y£Z“\Ïqø²\Ê\è9°£±p`ø~ƒ—%¹:zÎ¿¼©\Ñul\Þõ\Ú`\ÆBI’$I«\ÈX\Ø-c!}`,l©>˜†À\ê(6\ÉZŒ…\ã\á®:´\r\ßf\ÎpW~.M·\Ü\èý·ÏŠ\Ü\éX8¾>“×¹òò\é÷)¯oø±Œ…!c¡$I’¤Ud,ì–±>06R‚\ÑðU_¥ý‡§\ÇÁcap³_\á´\í¡®jb´›9À•\ï[Žv\ã‘s\Úøóœ=ŸŽ<=Ž\Ô/w\Îu3†Œ…’$I’V‘±°[\ÆBúÀX0J’$IZE\Æ\Ân\éc!dÀX(I’$i»e,¤Œ…c¡$I’¤Ud,ì–±>0BŒ…’$I’V‘±°[\ÆBúÀX0J’$IZE\Æ\Ân\éc!dÀX(I’$i»e,¤Œ…\Ý¿û\àI\0\0`\Í-›±°[\ÆBúÀXØ±ð\Ç?þ1\0\0°\æ–\ÍX\Ø-c!}`,„\0€&–\ÍX\Ø-c!}°c\á\Ñ+¯I7\ÝtSø:È±\0\0hbÙŒ…\Ý2\Ò1^s\íu\ÃËŽ^90\0\0M,›±°[\ÆBú`#\ÆÂ›o¾e\ë½ú\ÎX\0\04±l\Æ\Ânéƒ\Å`XœaxäŠ«†7>\È\É]RþO÷Î‹\îH\0\0\0\ëeÙŒ…\Ý*ÿE[	¬\ÒÆŒ…3g\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX0\0\0M,›±°[\ÆBúÀX\èj,<u\êTzø\Ñ\ÇÒƒ\ß$}÷Á“sx\è\áôýGKO>y*¼¬u\â¸\Ô9&1\Ç%\æ¸\Ô9&1Ç¥\Î1‰9.1Ç¥nŽÉ²»e,¤Œ….\Æ\Â\âŽ\Ô\ß{8¼\ã4Oñ>\ë|\'\Óq©sLbŽK\Ìq©sLbŽKcs\\bŽKÝ¦“e3v\ËXHôr,&]z\é¥\åÿt\ï¼\èŽ\Ä<Å¿¢Fw–š(\Þ7º\Ìu\à¸\Ô9&1\Ç%\æ¸\Ô9&1Ç¥\Î1‰9.1Ç¥nSŽÉ²»e,¤œY\è\â\Ì\Â\âi\Ñ¥&Š}.s8.uŽI\Ìq‰9.uŽI\Ìq©sLbŽK\Ìq©Û”c²l\Æ\Ân\éc!d ‹±0º“\ÔFt™5wM§\í;sÛO¤\ã\Ñ\ÛõHt]Ûˆ.s\ÚG*\Çd\à\Â[‡o\×\Ñõl#ºÌº;\Óe•crÚ¾ƒ\é\ãÇ£·\ëèº¶]\æ´\ã·¬“#w†o\×\'\Ñum#º\ÌI\Ç\Ó\ÇTŽ\ÉÀewDo\×\Ñõl#ºÌš\ãŸHVŽ\ÉiûŽ¦;¢·\ë‘èº¶]\æ´\ÜnC\Ñõl#º\Ì:·¡\ÛP\È}–H÷÷Y–\ÍX\Ø-c!}`,„¬\ëXxü\ÖOT\îh—Nz>F×µ\è2\'\rŽÃ­•«åƒ“>\ßùŽ®g\Ñe\ÖŽ\Ã\Ç+VGðû=F×µ\è2§\Ý1¸\rm\ß^\Ê\'?v\Ü9¸\rUn/\å?Jôyìˆ®g\Ñe\Ö\Ü1¸\rUn/£øý;¢\ë\ÚFt™\Ór»\rE×³\è2\ëÜ†BnC÷YB=¸Ï²l\Æ\Ân\éc!d`m\Ï,œ6|@\âÁ\ë´\á’ð:mô ~\ã¼N> \ÙøÁ}\Ú\è\"6þÁ\ë´\áƒzƒû´¾ß†¢\ë\ÙFt™‹¹\r…Ü†B\î³DVŸeÙŒ…\Ý2\Ò\ÆBÈ€±°?¢\ë\ÚFt™‹¸\ã1FŒ…CG\È\Ð2FÜ†BnC!÷Y\"\ÆB\Ú1\Ò\ÆB\ÈÀfŒ…£;R}~0Rˆ®k\Ñe\Î5P=™6|0b›4|\à\Ú\ïµ]\×6¢Ëœgôô/ÿ1i4þôù}!º®mD—9W·¡\èz¶]\æ\"nC·¡û,¡.\î³,›±°[\ÆBúÀXXß±°¼³=xp\Ö÷;—c\Ñum#ºÌšò\ëð¸ô|+D×³\è2#£¬£\ã\Ò÷Q¹]\×6¢Ë¬\ì£\ã\Ò\ïóc\Ñum#ºÌšòw¬\rõüÁ|!ºžmD—>`-K\ßG\åBt]Ûˆ.³.¯\ÛPt=Ûˆ.3\ä6r\n¸\Ï\êú>Ë²»e,¤Œ…\Í8³p<:{a\ÂøN¸§ôL\ß	wPU9z8\ãrR9zx\n\å¤\Ñ\è\á Iý¿\rE×³\è2r\n¹\r\Üg	uqŸeÙŒ…\Ý2\Ò\ÆB\ÈÀfŒ……\Ñ5Ð”\áµþŽ¨\Ñõl#º\Ì&†\Ô< ™4| \æÁ\ë´\á5\Ð¿‡.\Ôó\ÛPt=Ûˆ.³	·¡ˆ\ÛP\È}–Ðª\ï³,›±°[\ÆBúÀX\èb,<ñ\Ð\Ãá¤&ø\Þ\Ã\áe.\Öÿ±°“\ã\Òó;\Þ\Ý|¯ô,\ì\ä¸d0vq\\ú>tts\êÿ\Ð\á6T\×\Õ\Ï[·¡ˆ\ÛP\È}–±6Œ…ô±2\Ð\ÅXøýG\ï(5ñ\Ð\Ã?/sÒé²©;M£§ôôûi\È{~\\w²\'\Ç\Òòiq=\Åöþ{¥øÞ˜ú¾>\é÷°¼\ç\Ç\åø\'\ÒeRË§ò÷ø}a¯\Ëñ[N=\Ãñ§\ß\è÷þ64ø\Þ82ù}1zZ\\¿‡e·¡ºUü¼uŠ¸\r…\Üg	õ\á>Ë²»e,¤Œ….\Æ\ÂS§N…w”)þ\ÕõGO<^\æ¤òAYq§r¬\ç#GaÏKù ¬z\\úü\0­°÷\ß+\ãe\Õ\ã\Ò\ïh…½?.åƒ²ª?@\Ûó\ãR>(«\êó¨\\X\Åmhô1Uýþ‡™‚\ÛP\Ý*¾WÜ†bnC÷YB}¸Ï²l\Æ\Ân\éc!d ‹±°PÜ¡*þ¶¸ƒ\Ýqª*\Þ\æ{\'MO>y*¼¬u\â¸\Ô9&1\Ç%\æ¸\Ô9&1Ç¥\Î1‰9.1Ç¥nŽÉ²»e,¤Œ…®\ÆB\0\0 /\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0öÙ‘\éô\çþBúùó¯\ß5‡\Óym>\Î\á—\ßö\çŸû\Òt8z=»\ÎX\0\04±l\Æ\Ân\éƒ\r¤ûFC\Øl/LŽD\ïÛ±U…[\ã\ß/¤\Ó‰ß¦\âðù=?nk\ÈX\0\04±l\Æ\Ân\éc\áÐ†…»rf\áø2ˆ{ÁX\0\04±l\Æ\Ânéƒ{\Zò‘/†®žZ\ÙX¸¶Dc\á^0\0\0M,›±°[\ÆBúÀXX¨ŒrO\Ã\Ýzùh\0\Ûzú\í¾\éH\å}\nµ1¯ò\ÔÞ­÷©¾>2ñ>ƒyx\ÆX\Øâ²·Ÿ2\\G+g[žx\Æ(œ‘Y~œ\éc¸ý1ª*¯\å±Øºü\âs^¿‰Œ…\0\0@\Ëf,ì–±>0U†±Êµõ¶\åË¶\Ç\ÂN…#\Ûg\ÔmŒ)óF²\éAm\Êx\Äk}\Ù\Ñ8ý²\Ú\Û\Ìx\êvù1¦á¼±°ý±\Ø~Jô\ä\×h³\0€&–\ÍX\Ø-c!}`,\Û\Z\ëÆ£\ßö`6>Û°:ŠE\Ã\Û\è\í¶Ç®\í³ý>¿\ê8·ýyU‡¶\Ñ\Ç[\î²\Ç\ïS;µ±0ú8\Û\ÂcX;~…|¾•\Ëwf\ác!\0\0\ÐÄ²»e,¤Œ…[¦†­­mû\í¶\Ï,¬žWú¦ž\Ò\Ù\Z\'\Ì\ç¦G¼]v\å:—Ÿ÷øzl}¬\ÚXœ-X¹Î\Ç\Â~¾\Ô\0€&–\ÍX\Ø-c!}`,Œ^wþ\á‰ÿ{üúFcá‚§Gg\êUGµ¹c\áN.{\ârŠ!/8³/\Û\Çjlô>\ÇÂ~¾\Ô\0€&–\ÍX\Ø-c!}`,¬ªŒj§—`u<\Û>\Û.Ä†\ã×¬\áo®\í3«Cdõ\ì¾\áç±£\Ë.lš\ç_~¾\ÕÁs\ÆX¸e\êõ\Ç\Â~¾\ÑP»éŒ…\0\0@\Ëf,ì–±>0N¨þ\îÀú\ÛÔžš;aûmg¾ÝœñkûóŠG¼\\vaúò\'Æ»\ÚXX/\'Œ®cx+—Q}]ûÏ·ú5˜<þ›\ÌX\0\04±l\Æ\Ân\éc\á´\é3+¯\Û\Z¾öH‡\'Æ·úe…\ã_«Aop™3\Îø\Û\ÉeOŽySŸo£±pû}f\Ã\Ú\ç¾¼\Ôd8]t6\ÈnŒ…\ß}ð$\0\0°\æ–\ÍX\Ø-c!}°qc\áB\Ñ\ÓiKÕ±pûw\Â\ÞÛ±P’$I’e,ì–±>0N¨<6…t\ÅX(I’$i»e,¤Œ…C\ÓO»­ŸUX0\Òc¡$I’¤Ud,ì–±>0U\Ç\Âx(,éŠ±P’$I\Ò*2v\ËXH!\ÆBI’$I«\ÈX\Ø-c!}`,„%I’$­\"ca·Œ…ô±2`,”$I’´ŠŒ…\Ý2\Ò\ÆBÈ€±P’$I\Ò*2v\ËXH!\ÆBI’$I«\ÈX\Ø-c!}`,„%I’$­\"ca·Œ…ô±2`,”$I’´ŠŒ…\Ý2\Ò\ÆBÈ€±P’$I\Ò*2v\ËXH!\ÆBI’$I«\ÈX\Ø-c!}`,„%I’$­\"ca·Œ…ôÁÆŒ…7\ß|Kºöº\ë\ÓW½oxãƒœ¼ñ\Ð%\åÿtK’$I\Ò\Þe,\ìVñø/\ÚJ`•6b,,†Â£W^3¼üßºñ\Æðm ÏœY(I’$i»e,¤6b,¼\æ\Ú\ë\Òu\× |ä «±ð‰§Sº\æ«)ý?~?¥ö[óý÷¿“Ò¯ß•\ÒO”\ï¼\Æ=û\ì³\é‡OœJ=üXú\îƒ\'\çzð\ä£\é?‘~úÓŸ•ï½ž9&qŽ‹š\æ{%\Îq©\ç˜\Ä9.qŽK=\Çdq\Æ\Ânéƒ‹³\noº\é¦ðuƒ.\Æ\Âb(ü\ç‰‡ÁyŠ÷Y\çÁ°¸ƒy\â¡G\Â;”óï³®w4“8\ÇEMó½\ç¸\ÔsL\â—8Ç¥žc\Ò,ca·Œ…ôÁFŒ…Å-z9ä¢‹±°8K0\Z›(\Þw]+þu9º\ÙDñ¾\ë˜cç¸¨i¾W\â—zŽIœ\ã\ç¸\ÔsLše,ì–±>0Bº‹§GC`\ÅÙ…\ëZñt”\èdÅ¿J¯cŽIœã¢¦ù^‰s\\\ê9&qŽKœ\ãR\Ï1i–±°[\ÆBúÀX\èb,ŒFÀ6\Úwwº|ß™\é´+\ï.ÿ»ŸEw\ÛhÝ—¯N§\rŽ\Ë\å_.ÿ»‡E×³t÷•ƒ\ï•}W¾kú[t]\Ûh\Ýý\Ç\ÒEƒï•‹Ž\Ý_¾@¹}ý\Ûh\ßýé¶ƒƒ\Û\ÐÁcƒÿ«¿E×µ\ÖepŠ®g;\éþc¯ü¼}]º­\Ç\ß,\Ñum£}nCaî³„\åpŸe:ca·Œ…ô±2\Ð×±°ø\Ã\'\Å\ï6|\Õg\ë¯k\Û\èÁˆ±p²òÁˆ;Þ“•è…“Œs,úú·Ñºò½¡c²nC\Ñõl£}\å?\ä\'s\nrŸ%,“û,\Ó»e,¤Œ…>Ž…ã¡°\èÿønýõ­\ZÞ‘º:]^<P3n5P¯w¼+Œ\\>8.\Æ\ÂJ\Å×ƒƒ\ï•Á±1\æWôõo£]\ÅøóºÁmhðó\ÅÐ±]&·¡\èz¶Ñ¶b@½hðóö\"ca%·¡(÷Y¢ò¹\Ï2±°[\ÆBúÀX\è\ÃXXŒƒühôÿO…\Ñ_Mn^yGjp\ÇrxV‡±pT9 \Þ=|P\âŽ÷¸Ñƒ‘Á÷\Èð¬c\á¨\Ñ\×\Û\îÝ–Œ…ù}ý\Ûh\Ópü|oK†Ž²|nC\Ñõl£U\Ãuð=2ü\ß#c\á8·¡ ÷Y\Ârº\Ï2±°[\ÆBúÀX\è\ÃXø\å¿½¼	\r……¦UBc\á¸\êmw¼·ª\Þ\Ù6–U\Ç\rca®E_ÿ6šV7\ãòº\rE×³\ÆUBc\áVnCQî³„evŸe:ca·Œ…ô±2Ð‡±°PŒƒ\ã\æ\r……&M\ß\Ñ6M?Xu\Ç{\ØôƒUc\á°\ÉÛŒ±0×¢¯šº\Í:F\åvŠ®gÍšú\ßc\á(·¡ ÷Y\Â2¼\Ï2±°[\ÆBúÀX\è\ËXX(F\ÂECaaaÁ\'cat\Üñ±0x j,Ìµ\è\ë\ß\ÆÂ‚±\ÇÐ‘\çm(ºžm,.8\Æ\Âð¸\r¹\Ï—\ç}–éŒ…\Ý2\Ò\Æ\Âuq\ä`:ý9\ÏKû¯\ë¹\Ã\ç=/ý\Ü¦#\Ãÿ~oú•</~à½µ·\Ûd}\Z‹†\Â\ÂüFF†I0\Ô\ß%\Ñ\Ç6\æ6|0RO”D×³E\rEÇ£\Ô\×ö\Ñumc~£#\Ññ\É\ëAÉ¦}ý\ÛX\Ôð}ø}2\Ò\×ö\Ñumc~yÞ†¢\ë\Ù\ÆÂ†£Ft<J=ý½èº¶±(·¡ ÷Y\Âr½\Ï2±°[\ÆBúÀX¸#oNûŸó¼ôs^ž‡o»\"{4C\Þh¸_\çù\×óÈ³†Ç£\Í\ça,\\¬‹±ð¿ÿxl¢wRg>xò\Ñð\Îc\'z¤¼”6õÿ_\éWLeð¯ô«?.\Î,Ìµ.nC9œ\å6T¯“Ÿ·œY\è6·ú\ã\â>K˜3i\ÉXH[\Zag¥_92ùò\Ã\ç\Õ_–½\á\09‹±ð¬tú\æ\r£¡¯\íX8\ÉX\éb,üõ»\â!°‰‹¿P^H\Ërðø\á\È&y\ìGå¥´©ÿw¼WLep\Ç{õ\Ç\ÅX˜k]Ü†r:Ü†\êuòó6ƒ±\Ðm(nõ\Ç\Å}–0c!-\éca‡_\Þý„+4F\Ï{sùß£3OÁ\àe[gN)Ž\Ï^žö\Ï1Fº‹¿x\r‹gþÿ\Z<\Ó)*‡±ð\ÙgŸ\r\ï@.Rükô?ý\ä\'å¥´©ÿw¼WLep\Ç{õ\Ç\ÅX˜k]Ü†r:Ü†\êuòó6ƒ±\Ðm(nõ\Ç\Å}–0c!-\écac\íF¬ñ\Óq·ln•\×O½lt&_\å\Åñ89üÿ\ÇO\Õož<‹oú}·.o\Ö\ç0\Zÿö?½xú\Ì\ÈÑ™„\Û/«¾}|\å\è)Ë£\Ïkb,œþ<¦\Æ\Æ\áÓ·>7ca¤‹±°¨‹3›üŽ\Â\âm^õÙ”x¢|\ç5®¸£Yü\Ëtq\Ç1ºCYU¼\Í\ÉG˜~úÓŸ•ï½ž9&qŽ‹š\æ{%\Îq©\ç˜\Ä9.qŽK=\Çdq\Æ\Ân\écaS\Ñ7\Ãpüš8q4€UG²\æcauH+”—5ý¹L¿o\íó-\ßo\ë²\Æ#\áŒ3%‡g	VG½ñX8\ïs/.kôqªc\á\áó‚cQyc\áb]…’$I’6+ca·Œ…ô±°©­1,x]Um¤‹_\Þ|,œ¾¬ú\Ø64õ¾£³ü¦·ñ™Š\Ãÿñ(Wüªcat,Š\ë3º¬\è}\'\r¯{eˆ4.f,”$I’´ŠŒ…\Ý2\Ò\ÆÂ¦f€\Ójg\äMŽh\Í\Ç\Â\érÆ˜6ñ¾£·\Ùz\Ú\ï„É±0õ‚1pú\í\'\Ç\È\âu“{úrGg[V[1J’$IZE\Æ\Ân\écacsÆµª…ó?\×\Ù\×\'<+qúí‹7¾ž\Å\ç95öM¼]1V®«3\Û3J’$IZE\Æ\Ân\éca\ÃQ++¦¿/ŸÌ††\ã\ànŒ…\Ó\\d\ÖXX=Kpú\å“o_|Œý‡‹Ï§úö“cat=…\í%I’$­\"ca·Œ…ô±°•ÑUðŠÁkj¨›x›òýª\ã]y\Æ\Ýöø6\Z\ãvk,½\ï\Ô8x›ý[\ï…\áCÁ\Û\ãg¥\Ó\'\Þ~r,¬]‡òz\Û1J’$IZE\Æ\Ân\éc\áµ\á°W15°\Ãm\Ñø5y9/O‡\ÃÁo‡ca¡\'>\Æ\ÖûDc\á\Ô\Ð7¡\é\Û\×_6q,^p0vfak\ÆBI’$I«\ÈX\Ø-c!}`,d\ÛðLÁ©§F\Ó\ÆBI’$I«\ÈX\Ø-c!}`,¤äŒ¾>3J’$IZE\Æ\Ân\éc!dÀX(I’$i»e,¤Œ…c¡$I’¤Ud,ì–±>0BŒ…’$I’V‘±°[\ÆBúÀX0J’$IZE\Æ\Ân\éc!dÀX(I’$i»e,¤Œ…c¡$I’¤Ud,ì–±>0BŒ…’$I’V‘±°[\ÆBú`#\ÆÂ£W^“nº\é¦ðuƒ\Ý¿û\àI\0\0`\Í-›±°[\ÆBú`#\Æ\Âk®½nx\Ù\Ñ\ë »1þø\Ç?\0\0\ÖÜ²»e,¤6b,¼ù\æ[¶np\Ñ\ë¡ïŒ…\0\0@\Ëf,ì–±>Øˆ±°P†\Å†G®¸jxãƒœ¼ñ\Ð%\åÿt\ï¼\èŽ\0\0°^–\ÍXØ­\âñ_´•À*m\ÌX9sf!\0\0\ÐÄ²»e,¤Œ…c!\0\0\ÐÄ²»e,¤Œ…c!\0\0\ÐÄ²»e,¤Œ…c!\0\0\ÐÄ²»e,¤Œ…c!\0\0\ÐÄ²»e,¤Œ…c!\0\0\ÐÄ²»e,¤Œ…c!\0\0\ÐÄ²»e,¤Œ…c!\0\0\ÐÄ²»e,¤Œ…c!\0\0\ÐÄ²»e,¤Œ…c!\0\0\ÐÄ²»e,¤Œ…c!\0\0\ÐÄ²»e,¤Œ…c!\0\0\ÐÄ²»e,¤z9“.½ô\Òòºw^tG\0\0X/\Ëf,ì–±>pf!d «3O:•~ô±ô\à÷I\ß}ð\ä\\\'z8}ÿ‘\ÇÒ“Ož\n/‹õ\æ{%\æ¸Ð”ï•˜\ãR\ç˜\ÄšÚ„\ï•e3v\ËXH!]Œ…\Å©¾÷px\Çiž\â}\Üù\Þ,¾WbŽMù^‰9.uŽI\Ìq¡©Mù^Y6ca·Œ…ô±2\Ð\ÅXXü+jtg©‰\â}£\Ëd=ù^‰9.4\å{%\æ¸\Ô9&1Ç…¦6\å{eÙŒ…\Ý2\Ò\ÆB\È@cañ´‹\èŽRÅ¿¾F—\Ézò½s\\h\Ê÷J\Ìq©sLbŽMm\Ê÷Ê²»e,¤Œ….\Æ\Â\èNR\Ñe\ÖÿDºpß™\é´	G\Ó\Ñ\Û\Ò[\Ñ×¿\è2ëŽ§˜þ^93]vGô¶ý]\×6¢Ë¬¹\ãhí˜œv\à\éxô¶ôVôõo#ºÌº;\Óe\Ó\ß+û¦Þ¶¢\ë\ÚFt™5™Ý†¢\ë\ÙFt™‘;ŽL“o=¾mD×µ\è2\ëò»\rQ}ýÛˆ.³®ûû,\Ëf,ì–±>0B\Ö{,4\æ.úú·]f\Ý\èŽwŸ\ÇÁi\Ñum#ºÌšb\è0f/úú·]f]1t\ä5lD×µ\è2k2»\rE×³\è2#\ÅX\Ø\çqpZt]Ûˆ.³.¿\Ûu\Ñ×¿\è2ëº¿Ï²l\Æ\Ân\éc!d`m\Ç\Â\á\Æ\Â\ÜE_ÿ6¢Ë¬\Ña,œtüÖƒ\Æ\Â5}ýÛˆ.³fø3\Æ\Âi¹Ý†¢\ë\ÙFt™u£¡\ÃX8%\Ã\Ûu\Ñ×¿\è2ëº¿Ï²l\Æ\Ân\éc!d`­\ÇBCGö¢¯\Ñe\Ö9+*2:Ž\Ü¾Ž|D_ÿ6¢Ë¬\ÉðL\îèº¶]\æ´\ÜnC\Ñõl#º\Ì:gr‡<b-D_ÿ6¢Ë¬\ëþ>Ë²»e,¤Œ…u‡\Ò*¿\Ë\ÅY†yŠ¾þmD—Y3|Vý^\éÿ\Ùèº¶]\æ´\Ú\ï3¾g)úú·]fM\íwóõ|®k\ÑeN\Ë\í6]\Ï6¢Ë¬U=.}?\Ë0º®mD—Y“\ámˆº\è\ë\ßFt™5=¸Ï²l\Æ\Ân\éc!d`m\Ï,œ2z\Ðf0\ÌMôõo#ºÌ…\Êm}£\ë\ÚFt™ó•¿P\Ý`˜\è\ë\ßFt™‹Œþ±¦\ßcGt]Ûˆ.s¾þß†¢\ë\ÙFt™•Ã‡?p2)‡\Ûu\Ñ×¿\è2\ê\à>Ë²»e,¤Œ…Msü=Itõ½R>Pó ~J~¿Û‘\înC\Ã \éñSp£\ë\ÚFt™‹õû6]\Ï6¢\Ëld8vô÷ó¢\ë\ÚFt™Môý6D]ôõo#º\Ì&V}ŸeÙŒ…\Ý2\Ò\ÆBÈ€±>‹¾þmD—Ù„±0b,\ÌQôõo#º\Ì&Œ…ca\ÈX2\æ\'úú·]f\ÆB\Ú0\Ò\ÆB\È@cá‰‡\ï$5ñÀ÷/s1CGŽºù^\éÿƒ´NŽ\Ëðé‚ž—›nnCýÿ\Ç·¡º®~\ÞöýgÜ†hª«\ÛÐª\ï³,›±°[\ÆBúÀX\èb,üþ#…w”šx\è\á„—9\íŽ#“g)\ïHù…\ÙY\Å÷JqV\ËÄˆœÁ\ï,\Üû\ã2x z¤ú\à}ôÀµ\Ïè‰­\â6tüÖ£\Øpü\éù°\ì6T·’Ÿ·\Ç?‘.«`ü\ÎB·!šZ\Ém¨÷Y–\ÍX\Ø-c!}`,„t1ž:u*¼£´Hñ¯®?z\â\Éð2§\ÆÁ\n#G–Vñ½2¾£½­ÿ\Ðöþ¸”\ÃFõ¸x:\\–Vq\Z\r\Õ\ï—þÿÃŒ\ÛP\ÝJ~Þ–\ã`õ¸ôýŒ·!šZ\Ém¨÷Y–\ÍX\Ø-c!}`,„t1Š;TÅ¿Àw¢;NU\Å\Û|\ï\ä£\é\É\'O…—\Åzó½s\\h\Ê÷J\Ìq©sLbŽMm\Â÷Ê²»e,¤Œ…®\ÆB\0\0 /\Ëf,ì–±>0BŒ…\0\0@\Ëf,ì–±>0V>ÿ\Ò\Ï?w`ßt$x}U›·%\'‡\Óy\Å\×u\à¼\Ã\Ñ\ë»a,\0\0šX6ca·Œ…ôÁŒ…GÒ}\å°7\ÓÓ#\íÀ#^8|û\Ó	_\ß+‡_Z¹¾…—¦\Ã\Ñ\Ûmº\Êq\ê\Ó\×\ÕX\0\04±l\Æ\Ân\éc\á\Ð\Î\Æ\Â\Â\è}F\ï½¾jC\áX\Ãñ\ç\Ú\Ù›\Î,\0\0òµl\Æ\Ânéƒ{\ZòølÀh(\ÛùS‹¤#=·®óøz9Nƒñ\È9Èº==½;f,\0\0šX6ca·Œ…ô±°bb¨\Ú\Z\Ô\nõmûrJ\ç\Þ~ýÖ™|\ÅûMž\Ù8:[mû\ìµ\í—UL|\ì\Â\Ô\ç\Zœ)8÷,¸©q°66\'\Û\ä\ç_}ºn\í¸ªÇ¦r\Ý\Î;\\ý¸“—½\ï\Ö×§\Üú\çW=6\í>¿\ÑËª\ß‡\Ç\ï¿õ>õ3W\'¿Áõª~¼ª­]ÿ\Þ4\0\0M,›±°[\ÆBúÀXX1=FM¨œ\é6ó\í\Æ#Pe,<½ö\è\èe•\Ïe\ÑS†g¼~\îXX˜~¿p «“±\í\ã}þÁ°6müñ*cÜ¶Ec\áì§’\ÃùŸ\ßöõjóùÍ½NÃ·Ÿñ9Œ\Þwñ\0ZUý8\Ó_Oc!\0\0\ÐÄ²»e,¤Œ…\ÑX³ý²ò\íƒ1©6¶U†¹ú˜5PŽEÕktF_e\Û\Z”¶_V|¼yŸÿ,‹²­Ëœ1bªŸÿö}•1l\Æû\Ö>\ß\êX<\Õx\ës­¾®2¾nù8~Yùv\Ñ\çW}\Ùôø66\ïó«L^N\í}«/+ŽGô½2\Ïô÷Q…±\0\0hbÙŒ…\Ý2\Ò\ÆÂŠh¨\Ú~ûr¨šqf\ß\Èô\Û\ã\ÖÜ—\Í>S­0Áªc[i\Þ_\ß\Ê\Ç\Ù÷\Âòò*ŸW`\Öq«³™Ç§|¿\Ê\ç¿=:Î¹¼\í]nøùEc]‹Ï¯>Î¸\î‘\á\çœ9g\ÇX\0\04±l\Æ\Ân\écaE“±pþpUL;ƒ!p\Â\Ö\ÐŒŠ\á©86y\ÑpW5\ë¸M³\ê\ç_\Ã\ÚûE^Eô5˜;\ÊÕ¾.•\Ïoúc\íðó‹>§yO\Ùþ<\êŸÿ\ä1l\ÂX\0\04±l\Æ\Ân\écaE4\nm¿}9\èU\ÎL‹Æ®¡Ž…\rž\Ö;-²Æªƒ\Ö\äõÝ¾^…\Ê\ç4Cõ\í·®wu|+>\ßñõ	‡¾\Ùc\\U£¯A\å\í\ÇÂ¯\ëô\Ç\Ú\á\ç7\ë\×\Þw‘\è{ j\ëc\×/\ÏX\0\04±l\Æ\Ân\écaE³¡jöe[g\ç5\Z\ã—UG¹	\å\ç4\ëõ3\Ï\Üú\rM\rbc3?¯¡òóŸû±fqs?\Îp4ýô\ìñel¿_\å\ë:k,\Íþüf…Õ·TY¯opŒ§±\0\0hbÙŒ…\Ý2\Ò\ÆÂŠfc\á\Ô\ÛV\ì\ÆX8ùòŠ9cá¢§‡£Ux\'_^5q\Ü&>¿\É\Ï}\â²\Î?<ù~\Å\ÛcÜ¤©1v\ë\Ëx¤m5N¼\Ý@\Ã\Ïo\æX8\r™\å1Yp\Ük¶Þ¾þ½i,\0\0šX6ca·Œ…ôÁÆ…\ìL8Æ±2\ÆB\0\0 ‰e3v\ËXHi\ÄX\Ø-c!\0\0\ÐÄ²»e,¤Œ…4b,\ì\ÖnŒ…\ß}ð$\0\0°\æ–\ÍX\Ø-c!}`,¤ca·vc,”$I’¤E»e,¤Œ…c¡$I’¤Ud,ì–±>0BŒ…’$I’V‘±°[\ÆBúÀX0J’$IZE\Æ\Ân\éc!dÀX(I’$i»e,¤Œ…c¡$I’¤Ud,ì–±>0BŒ…’$I’V‘±°[\ÆBúÀX0J’$IZE\Æ\Ân\éc!dÀX(I’$i»s\ÓM7§÷^~U¸•À*!\ÆBI’$I«\ÈXØk¯û@ºüª÷…[	¬’±2`,”$I’´ŠŒ…«WœQøþ\ë?˜Ž\\qõp0Œ¶X%c!dÀX(I’$i½ñ\Ð%\Ãß›\Ç\êO=¾ü\Êk\Òû¯7\Ò\ÆBÈ€±P’$I\Ò*z\Û\Û~=|¬lc!dÀX(I’$ic!dÀX(I’$i¯¸òªô?\í\Ìôóÿ—ÿ[ú¹\ç<~þ¹\ÏO\Ïÿ—g¤÷¼\çHx<\Ù[\ÆBI’$I«\ÈXl\äXx\ÅW¥þœç‡£‹½\ç2ƒ\áªu5>û\ì³\é‡OœJ=üXú\îƒ\'\çzð\ä£\é?‘~úÓŸ•\ï-\ÉmHMó½\ç¸\ÔsL$\íu\ÆB`#\Ç\Â\â¹h£™\âøEÇ•½\Ó\ÅXX<9ñ\Ð#áƒyŠ÷ñ DrRó|¯\Ä9.õI«\ÈXl\äXX<¥6\ZÁh¦8+3:®\ì.\Æ\Â\âL„\èG\ÅûJ›žÛš\æ{%\Îq©\ç˜HZE\ÆB`#\Ç\Âh\0£è¸²wº‹§.E6š(\Î`6=·!5\Í÷Jœ\ãR\Ï1‘´ŠŒ…€±‰Ž+{§‹±0z \ÑF›\î?öºtÚ¾3·\\þ\åòR\ÆE·‹6\Út÷•Û·Ÿ\Óö½.\Ývù\neQôõo£U_¾ºò½rfº\èX¿Y¢\ë\ÚF›r¹\rE×³vÝ.¯|¯œvðXò£EÚŒŒ…€±‰Ž+{g\Ç\Â\á4@´†E·‹6šuº\í\à\à6t\å\Ý\å+Ç¢¯Mý\Ã\Ì\Õ)—\ï–èº¶Ñ¬¼nC\Ñõl£q÷K\íówÒ¦f,Œ…\ìHt\\\Ù;k;g¸\nµ¦E·‹6š4…\Ù}ý\Ûh\Ôpü\Ég(,Š®kM\Ê\í6]\Ï6š5\ZP\r…\Ò\æf,Œ…\ìHt\\\Ù;\ë9ŽŒôù)p\Ò2E·‹67zŠ ôù}ý\Ûh\Òð,\îÌ†\åèº¶±¸ünC\Ñõl£QÃ§ª\ç5,K\ÚÝŒ…€±‰Ž+{g=\Ç\Â\âAZñ{¡¦~\'’³¤´&E·‹66>S¬|º\àø6d€Ï¯\è\ë\ß\Æ\â\ÆgŠ•O¹¿ôü\Ì\îèº¶±°oC\Ñõl£I\ã³-\'Ÿ°ß…*mR\ÆBÀXÈŽDÇ•½³–c\áÖƒ³\ê\Ù£\á\ÐØ¡u(º]´±°ñª¨>\å\í\ÊÙ†y}ý\ÛX\ÜøeªƒOÿW_t]\ÛXX†·¡\èz¶Ñ¤ñ{©þoqn¿\ïR\Òrc!;Wö\Î:…\Ó\È< Ñº\Ý.\ÚX\Øpè¨Ÿ\í\ã\åWôõocq3þ!f\Æ÷P_Š®k\Ëð6]\Ï6š_ÿ˜\'mR\ÆBÀXÈŽDÇ•½³¾OC\Î\Þ>x3*ÿ¢\ÛE\îõ¡c8¸³*úú·±¸¿#v\Æ÷P_Š®k\Ëð6]\Ï6š_¿gXÚ¤Œ…€±pÏ¼,½õúòc^~qü²\×]1ø¿?\Þú?M¿o\ä\âttð~G_½nõªÇ“½\×\ÅXø\à\ÉG\Ã\ZMœx\è‘òR\æ?ð0th]\Úû\ÛP<¸\çø‡,6½½ÿ^™ñ}\Ñóœqª·Š\ï•øûb\Æ?ðIZËŒ…€±p‡^{yqYW¤\×¯\Ûzý\ÖH8\ãe\ÆB\Z\êb,üÁ\ãO„6šx\ä±•—² é§€õüwEImZ\Åm¨ö´ýO«T¿[\É\Ï\Û\Ú\Ï\×þ?­\Ôm¨\ÞJ¾W\ÊÌ«¦}~j¶¤\Ý\ÏXw\âzGºþ\ÃH\×_?k¼Axý\Û^¶\àem7Yc\á³\Ï>>\ØX¤8s\áŸ~ò“òR\Z4|`6xR2j]Z\Õmh4vŒoC†\Â[\Ù\Ï\Ûr0¿ôý)¥nCõVö½2\Ç\Ç\ÅP(mT\ÆBÀX¸\ç¾\í\Ã3‡ÿÿõ\ïH\ç\Ö\Þ\ÆX\È\î\êb,,*”g12¢U\ÅÛœ|ô‡\é§?ýYùÞ’Ü†\Ô4\ß+qŽK=\ÇD\Ò^g,Œ…­F¿\ÑhWxSO#žu8ùñŽ¾-xYñþÃ§!O=•¹öþ\ã×\Ç\Â\Ñ\Ç\ßzý\ÔSÇŸ_ýýG\ÆO…=z\ç\ã\åö\å³\n]…’$I’6+c!`,lkj\à‹~7a\ã3§\Ç\Â\áOž=ø\Ú\Ë\'\ÇÂ‰\ßqX‹\Ûo_ÿÃ³§?ß©±\Õ\ã\É\Þ3J’$IZE\ÆBÀX\ØRüGJ&\Ï\Þ\Û\ÙX½O\Õh,œ~ý\Ä\çS\\^\íiÑ“O_¾}ø\Ô\év¢\ã\Ê\Þ1J’$IZE\ÆBÀX\ØJð´\ã©1nd\'cat\ÙU\ÑÇ™GgÖ¯oab,¬	\Ù^ô1\Ø;\ÆBI’$I«\ÈX[˜7\ÆMž­\×\áX¸`4\æ\ÉX(I’$icacsž&<ýªC\ßN\Æ\Â9—?´x,œ¼¼˜±0O\ÆBI’$I«\ÈX›\Zþ1‘YgþM};\Çÿ=9Nÿ“¹caù6“c\à\à\ã^¾}Ö£±0O\ÆBI’$I«\ÈX\ZŽlsþ0\È\ä_\Þ\áX¸õ²\Ê\ç;5\Î·ß®z“\ã\ãô\Û\ïLõò\Ù{\ÆBI’$I«\ÈXÙ‘è¸²wŒ…’$I’V‘±0²#\Ñqe\ï%I’$­\"c!`,dG¢\ã\Ê\Þ1J’$IZE\ÆBÀXÈŽDÇ•½c,”$I’´ŠŒ…€±‰Ž+{\ÇX(I’$ic!;WöŽ±P’$I\Ò*2\ÆBv$:®\ìc¡$I’¤Ud,Œ…\ìHt\\\Ù;\ÆBI’$I«\ÈXÙ‘è¸²wvc,ü\îƒ\'\0€5·l\ÆB`#\ÇÂŸ\îó\ÃŒfþùsžWö\ÎnŒ…?þñ\0€5·l\ÆB`#\Ç\Â\çÿ\Ë3\ÂŒfþ\Åó÷…Ç•½c,\0\0šX6c!°‘c\áW^Ž`,VœUø\ë¿þ®ð¸²wŒ…\0\0@\Ëf,6r,,\\q\ÅU\Ã3‹ñ+\ZÅ˜T§ÿ\î_œž\ÞsÙ‘ðx²·Œ…\0\0@\Ëf,6v,„œ\0€&–\ÍX!\ÆB\0\0 ‰e3\ÆBÈ€±\0\0hbÙŒ…€±2`,\0\0šX6c!`,„\0€&–\ÍX!\ÆB\0\0 ‰e3\ÆBÈ€±\0\0hbÙŒ…€±2`,\0\0šX6c!`,„\0€&–\ÍX!\ÆB\0\0 ‰e3\ÆBÈ€±\0\0hbÙŒ…€±2`,\0\0šX6c!`,„t5ž:u*=ü\èc\éÁ\ï?’¾û\àÉ¹N<ôpúþ#¥\'Ÿ<^\0³ùys\\\ê`‘e3ý\ß÷¾tó\Í7‡ƒ	lª.\Æ\Â\âÁ\È\ß{8|ð1Oñ>”\04\ç\çm\Ìq©sL€&–\ÍXôn,¼öý\ïO¿ù›¿&°©º‹3¢M\ï]&\0u~\Þ\Æ—:\ÇhbÙŒ…@\ï\Æ\Â\ë>ðÁ\áS‘\r†°­‹±°x\êRô`£‰\â†\è2¨óó6\æ¸\Ô9&@\Ëf,z7ŠÁ°8Ã°\rkÒ¥—^ZþO÷Î‹\îH\Ì=\Ðh#º\Ì	wM§\í;3v\à\éxô>\0k(ú\ÚFt™Ž\"]ý¬:š\îˆÞ§¢\ë\ÚFt™U\Ço=Ò‘;\Ã÷\éZt=Ûˆ.s\ÒñôñÁñ(]vGô>@\ß,›±\è\åXL*þ{Ù¢;óD2Úˆ.s±;\ÓeŒ\0&ú\ÚFt™‹F¡o=¼®¢\ë\ÚFt™\r‡Õƒ\é\ãÇƒ\×õ@t=Ûˆ.³‰\á°\êò \Ëf,Œ…M=6Qô3´\è2\Zž\Ý\Ýß³\n\Ñum#º\ÌE\î8rfo\Ï*,D×³\è2óy›e3\ÆB\ÈÀfŒ…Œ\0›)ú\ÚFt™óõÿ¬\ÂBt]Ûˆ.s®žŸUXˆ®g\Ñe.\âò ?\Ëf,Œ…M=6Uô3´\è2\ç\Ê\à¬\ÂBt]Ûˆ.sž¾ŸUXˆ®g\Ñe\Î\çò G\Ëf,Œ…õGg¹x0l¢\ègh\Ñe\ÎSŒb}?«°]\×6¢Ëœ­\Åú}Va!ºžmD—9W1,û‡<\ÈÎ²c!d`\í\Ç\ÂL\Îr\Ø\Ñ\Ï\Ð6¢Ëœ)ƒ§ÚŽE×µ\è2g\É\å\ìö\èz¶]\æly<]¨[6c!`,„¬ûX˜\ÃS¿\0öJô3´\è2g\É\éW>D×µ\è2cùŒb\Ñõl#ºÌ™2\Z–I\Ëf,Œ….\Æ\Â=>\Ðh\â\ï=^f\Ì\ïC6\Û\ê~\Þ\æu¦\ØÊŽKF£\Ø\ê¾Wü.a\ÈÙ²c!d ‹±ðû<>\Øhâ¡‡^f\ÈS\r·²Ÿ·™)¶ª\ã’\Ó(¶²\ïOA†¬-›±0BºO:>\ØX¤8s\áGO<^fÄ™À¦[\Õ\Ï\Û\ÜþqfU\Ç%§_…±²\ïgýCÖ–\ÍX!]Œ……\âAIqCñ #zðQU¼\Í÷N>šž|òTxY\0\Ì\æ\çm\Ìq©sL€E–\ÍX!]…\0\0@^–\ÍX!\ÆB\0\0 ‰e3\ÆBÈ€±\0\0hbÙŒ…€±2`,\0\0šX6c!`,„\0€&–\ÍX!\ÆB\0\0 ‰e3\ÆBÈ€±\0\0hbÙŒ…€±2`,\0\0šX6c!`,„\0€&–\ÍX!\ÆB\0\0 ‰e3\ÆBÈ€±\0\0hbÙŒ…€±2`,\0\0šX6c!`,„\0€&–\ÍX!\ÆB\0\0 ‰e3\ÆBÈ€±\0\0hbÙŒ…€±2`,\0\0šX6c!`,„\ì\ÆXø\ÝO\0\0knÙŒ…€±2°c¡$I’$-\ÊX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!\ÆBI’$I«\ÈX!]…\Ï>ûlú\á§\ÒC?–¾û\àÉ¹<ùhúÁ\ãO¤Ÿþôg\å{K’š\æç­š\æ{E\Ò^g,Œ….\Æ\Â\âÁÈ‰‡	|\ÌS¼%’\Ô<?o\Õ4\ß+’V‘±0Bº‹3¢M\ï+Ij–Ÿ·jš\ïI«\ÈX!]Œ…\ÅS—¢Mg0H’š\åç­š\æ{E\Ò*2\ÆB\È@caô@£¦\Ý\ìu\é´}g–^—n»¿|…$mH\Ñ\Ï\Ð6\Z÷\å«+?o\ÏL—¹|¹²)úú·Ñ¼»\Ó\å•\ï•Ó®¼»|¹¤M\ÈX!\ë:Ž†Â«I\âÿ–¤M(ú\ÚF£†Ca\åd¦ÿ[Y}ý\Ûh\Öh(¼\è\Øø›cú¿%­{\ÆBÀXXÏ±ðþt\ÛÁ\é£$\Îv‘´IE?C\Ûh\Ò\ÝWNŸýVß‹¾þm4j8$Oþ\Ã\Ýðó|\×HÚ„Œ…€±2`,”¤õ-ú\ÚF“Œ…\ëQôõo£Q\ÆBi\ã3\ÆB\ÈÀzŽ…ƒ¦ž\çiÈ’6±\èghºÿXº¨ú1ž†œe\Ñ×¿f†\ä\íq\ÙÓ¥M\ËX!k;\r°–¿@\ÝP(i‹~†¶Ñ¸r0ý¼5\æXôõo£y\å`X~¿\n¥\Í\ÊX!\ë:Öž7}\æ‹$m@\Ñ\Ï\Ð6šT\Z©³\År,úú·Ñ¨\áÿOŽ\É\Ãÿ½ö4dic2\ÆB\ÈÀZŽ…\Ã#õ3	ý^$I›Vô3´\Å\Ã`p&að»\é\Ôï¢¯M*†Áúˆ\ìw\nK›”±0Bº<ùhø@£‰=R^Êœf<H5JÚ´öü\çmp¦\Ø0cav\íù÷Jùôcc¡´\Ùc!d ‹±ð?>\Øh\â‘\Ç~T^Ê¼¦ú òiÈž\'i“\ÚûŸ·\Ñ\ÓHG\ã\Ï\ä_HV\ß[\Å÷Jô\Ço†\ß?†eic2\ÆB\È@c\á³\Ï>>\ØX¤8s\áŸ~ò“òR5ù\ÔýuI›\Øj~ÞŽŸ\nCav­\ê{eò…\Ò&e,Œ….\ÆÂ¢\âAIqCñ #zðQU¼\Í\ÉG˜~úÓŸ•\ï-IjšŸ·jš\ïI{±0Bº\Z%I’$mV\ÆBÀX0J’$IZE\ÆBÀX0J’$IZE\ÆBÀX0J’$IZE\ÆB\Ø\\\×]ÿÁt\íû¯Kÿ\ì\èÑ£	\è·C‡•ÿ\Ó-I’$I{Wñ\Ø#zLlc!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!dÀX(I’$ic!d`7\Æ\Â\ï>x\0\0Xs\Ëf,Œ…\Ýü\ã\0\0knÙŒ…€±2`,\0\0šX6c!`,„\0€&–\ÍX!\ÆB\0\0 ‰e3\ÆBÈ€±\0\0hbÙŒ…€±2`,\0\0šX6c!`,„\0€&–\ÍX!\ÆB\0\0 ‰e3\ÆBÈ€±\0\0hbÙŒ…€±2`,\0\0šX6c!`,„\0€&–\ÍX!\ÆB\0\0 ‰e3\ÆBÈ€±\0\0hbÙŒ…€±2`,\0\0šX6c!`,„\0€&–\ÍX!\ÆB\0\0 ‰e3\ÆB\È@Wc\á©S§\ÒÃ>–üþ#\é»žœ\ë\ÄC§\ï?òXzò\ÉS\áe0›Ÿ·\0\ì–e3\ÆB\È@cañÀõ\ï=>P§x`šóó€Ý´l\ÆBÀX\èb,,\ÎZ‰œ6Q¼ot™\0\ÔùyÀnZ6c!ð\Ï~\î9\ÏK@¿ýŸþ\Ïÿ\×òºw^tGbž\âin\Ñ\Ó&Š³]¢\Ë \Î\Ï[\0vÓ²=¢\Ç$À\æ0Bº£¥mD—¹\ãÈ™\é´}c\ÓÇ\Ço°®¢Ÿ¡mD—9~\ëÁ\Ê\Ï\Û3\Óew\Äo@Þ–\ÍX!\ë:‡\ÂŸH\Ç\Ëÿ==šî¨¼\rÀº‹~†¶]\æ´\Ú\Ï\×;Žþ\Û?\Ð\0¬£e3\ÆB\ÈÀZŽ…\Ç?‘.¬=P=ž>~\à\Ìt\á­\Ç+/Xo\Ñ\Ï\Ð6¢Ëœtgº,8“pø6G\îœx\0ù[6c!`,„¬\ïXX?‹pxö‹¯À‰~†¶]\æ¤b,\Î\",\Î.¬œ\Ý\rÀzX6c!`,„lÎ™…õ§&¬»\ègh\ÑeNŠ\Ï,ô«\0\ÖÓ²c!d`-\Ç\Âò)\Ç\Ã\àðwh\Íým#º\Ìi£?&U‡ÿ`3õ2\0\ÖÂ²c!d`=\Ç\ÂB9°¹\ÓÓým#º\Ì\È\Ä_Ÿ/þQ\ÆÓ\ÖÒ²c!d`}\ÇÂº\âÁ¬?pl’\ègh\Ñe6\ág\0\ÖÓ²c!d ‹±ð\ÄC‡J›x\à{‡—¹ÐŒ\ßc°\Î:ùy;\ã÷¿e3\ÆB\È@c\á÷y,|`\Ú\ÄCÿ ¼\Ìiw\ÜZ}ú\Ûè«³\nM³ŠŸ·\Ç?o·7aù+ œU°––\ÍX!]Œ…§N\n˜.Rœ\åò£\'ž/s\Ú\Ä\ï\Ïr†°¡Vñóvô—·\Þú‡€õµl\ÆBÀX\èb,,`‹3^Š¤\ÑÕª\âm¾wò\Ñôä“§\Â\Ë`6?o\Ø-\Ëf,Œ…®\ÆB\0\0 /\Ëf,Œ…c!\0\0\ÐÄ²c!dÀX\0\04±l\ÆBÀX0\0\0M,›±0BŒ…\0\0@\Ëf,Œ…c!\0\0\ÐÄ²c!dÀX\0\04±l\ÆB\Øt\ÏKÿ$)G—xÄ–\0\0\0\0IEND®B`‚');
/*!40000 ALTER TABLE `controleurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postes`
--

DROP TABLE IF EXISTS `postes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `postes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poste` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postes`
--

LOCK TABLES `postes` WRITE;
/*!40000 ALTER TABLE `postes` DISABLE KEYS */;
INSERT INTO `postes` VALUES (1,'Poste1'),(2,'Poste2'),(3,'Poste3'),(4,'Poste4'),(5,'Poste5');
/*!40000 ALTER TABLE `postes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `references`
--

DROP TABLE IF EXISTS `references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `references` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` int(10) DEFAULT NULL,
  `poste_id` int(11) NOT NULL,
  `photo` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `poste_idfk_idx` (`poste_id`),
  CONSTRAINT `poste_idfk` FOREIGN KEY (`poste_id`) REFERENCES `postes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `references`
--

LOCK TABLES `references` WRITE;
/*!40000 ALTER TABLE `references` DISABLE KEYS */;
INSERT INTO `references` VALUES (4,2147483643,1,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿÀ\0\0\È\0\È\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\08\0\0\0\0\0\0!1AQ\"aq2‘#BR±$34\Ñbr¡Áñÿ\Ú\0\0\0?\0ýRˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆ‹”\äiû\Ç\Çø¸=\ã\Ü\ßx6>«†$\Å_dÏ§m²\Å	\é|cºAú\ëJ:§2§<f\ËÀ‡m\ZŒ\ï\ÑsÁ\×\é#cº—«œ\Æ[¾\êUoÖš\ÓA.Š9œ\0ñðú©$DDDDDDDDEs3B¬ÿ\0‡’\ÌFÎ»@\Ï\ÙR1|²÷\"\Ëd1\ÒÁJ°õ6B\Ç\'‰\Z\ßoQ\â\Ì\Èb¬\å«\nQJ\×F\Ûr;Z>]-#\âúö\\®££‰›Ž³\î\êJv\àZ6\ã½\ï~>*¡KcrÁ…¹˜w?®@ã¦µ\Äù¯ù[Ÿ\0\âø}«\á·œ+\Ü\éXdoñ\Ã\Èob}6\n½¢\"\"\"\"\"\"\"(Ì¦w‹•‘^»2¿ô\ÆN\Ü~Ãº¤æ¹–Mœ¢c[\nr48M7b\æ‘\êt7ôP¹\Üe®;v\Ï&Á×4ÀK¤©\ïzd¾oi\ëððU[ü‡\í\"6\Òv6\æ7+\ßØ²\Ã\æ[­ªé¥Ž½Ã°‚\ï\"Î‰™3šÁM²u=£¯¨÷û&™d²QC\'\r ÖŠ‡\ÞM!ð¸kù·ý•»€ñz\Î]¬+Üžsfv5ºë•¯?>-Þ‚Õ€DDDDDDDEš\Î\ãp±±ù;L€<\é€\ì—}\0Tžs\Ëòu ¥g2wiÖŸõ\á\Ü\ïô¨òQY\Ìl¦\×\Ì`2T­\å gPŽYŽÓ‡};´÷úxX—;‘û\Î=\Êx¤•\Î÷R²7]ýMón¼wµ\á‰â§Œ\Çk)k‘¾:5Á5`ž¹ô6¼€^w9W\æ˜Iñ|;³>Ÿ+£R½\ï~Zõ\\|+Z\æ³d\á\Ï~0¾a½ö\ã°7ò\ZòZ—²ž\n\ì!V ÿ\0d\É]\Ù\ÍgN»\ë\×\ÑhµkCR» ­b…ƒMcF€\Õ_)OQ\Ör¶[üÇ¿\ì;ò»÷øû\íñ8e“N\r.1m\äyô·\å\ê«>ÿ\0\ÊqA“\äP~iºŸ\'¼Lx\Z\ésN¶‚ŸrŒ.Kòkø\Z¤\îT1ÚZøG}ý?ú¸\ép3²n\ÉI‘“Ä’ v\äŠMÿ\0¦\Ó\å¯\Üx/º\\ÿ\0b\Å8\æ\Ê\Î\rq7G[\äh\Ø\0}½T\ã\Ù|·\'‹ò¬¶\'@÷¹¬vˆ\é\0ô‚{E¨{?öj\Ì#\É^seŠœˆa\Î\ÓÁ\ê}½5¥¢\â0ôñ^üÓ‹¥ó»®W“·<üÊ‘DDDDDDE\ãn\ÔU+I=‡DÁ²U?ü_ùý±ñ¦\È\Û°–\Ë3CFõ\Û@ùŸš¥bó¸\ë0\\\ÄslŒ‘\å$:EÑ¹=ö\Ò{yy(¬®sp\ç\Â06)\æð!°\È\Øõ$Nþ—øŸŸšñ\Èqzœ®ü9,ü1ñÌƒ\Û\×iŒ\Å\ì;Ó‹{t¸\és»\Ð\ã7\ä\Æ\àc2C]¢:ó\Ïñ=½@l\è\ï¾ÿ\0º„»‡ä§“Q~U²t\å.7¨1\Û:sÀ$\ë¶õ\ß\äµO²š”¹n7#^Z­2\\\èË½\à\è€7\ã\ß{;ZM,=\ZVf\0\Í\è/q.!¾€Ÿ\0¤ng\"\Êq5–&O!\éo[€\én\Ñô\Ò\Ç0|\Ó\ä™\Ì2’¼=\Îu“#5²6u\á\Û\ä¾s¯±‡2\ä=š\æ+Øª\ß\âX\ÇHÁ&ÁþfÄ’\ä\ÈUµ\Ë1¥\ç+\ã\çÿ\0“¶\Ó!h\îv–¼‰Q÷ù6„\\¯KŒ\Äù\á\r.–Yûõ\Èø\Ç\Ë\ËÁCòZ\\›9KüLû^ò)X×·k¹\à7\à”ÿ\0dõ2˜Œ_ðb©1\Ë<»&Gvþc\Ã\Åjq\âh2x\æmHD±±\Ý?¤\ë[…v¢\"\"\"\"\"\"(L\ï*\Ã\á\î\ïÜ³\ëbüO?a\á÷YŸ$ö\É\rfL\Úl€‘Ñ¹7&µ\ß`v^\Ë\r\Ïdr›!5·Ù±){‰,{‹ˆoù+,<K)g\0ÜŽnƒ™JÀ/>0\Ùz	\× =J²\å²|kˆcª7‹6K\×K\Ç]¹;‰\ZF\Ë@ò}½m\Æç½¡\Ð~H]kb¨\\žv\ç\à\Ñ\é¥t\á>\ÏF[\Âr4\àm\Û\í3K±\'Hw\Âw\é¯.\ËR\Âq¬~/Bƒ`ŽfÔ¬k\äh$\ë¾ÿ\0~\êl\r\"\"\"\"\"\"\"(^K\Éñ<r·½\Ê[dd† w#þY/(ö\Ê\Éb’*%Ô£;m\Ó\æ#û7ÿ\0+\Èe0´÷Ež——\É!\êwÔ•h\â^\Íò9\íY}VR¥úf\Ù k\Ôâ¬¹ºSŠ\ã\çüª[9„lø¥$šG˜\íÿ\0µöü—!\çøvV‘ï†„\0\çt\Æ\ÞÝ¶}N¼Õ§\ÙWl|a\ç\'^39–H\Øé™²è¼µý=÷\Ü+ÿ\0\âT8\Þ)ô cdJfyx\Ø.>€ü•‰­\rh\r\0\Ø\0¿¨ˆˆˆˆˆˆ¼.Ü¯J»\ç¹4pBÁ·>G\0\ÇùÇ¶úö\É_\Ä,\Í\à,IÙƒ\æ\â~úXE\ÎA–\Ëå¤¿;Ì³I¾©\'ø‰\Ë\ä=\0Sücˆ\äs·cg\\¢uþ&vt´\rúŸ\ëL©€\ã¼f#ªþK“Öœ\ç\à´ü‚\â­6S’e\ç\ÆGi´\r4\ã-hÞƒC|7µ¢f˜‹t+C•’Í‰ccý\Û^w³°q\ä®\Õ*ÁN¼u\êE0F:Ym\rkG\Èìˆˆˆˆˆˆ¼.\ÙmXŽ\Ç`5£\Å\Äø\0²¿i£?J\åhñ÷E(\Þ\Ò\íE\\OÈ¹À\ï\ì®\Ã\Ïù¶²9Hc\É`ƒõbx\"H[\êGo\Ýi˜®O>o\ì5ŠSA+~ð»\ÑÃ«\Äz,\'\Û~a¸Ÿ•¾\ëx\é\Ù$}£c¿§¤v\Ó\ÕW¸o³ü·&œ\ZUœöñX—b1÷Z­)Ä¸S&vF\æ2`¢Á¶0ý?\åq\ç9g“\êV>\ËqÑ‘†”dµ»\Ùo^¾‡^KA\á\\B6Ú¹U\Ò\ÎX?\Üw;>?€À5r§‹¡JW\ËR•h%x\Ó\ßa®pù‘\â»&t“~‹;––\Êuå¿‡_Ü¬÷9^I}Ú”2½Pöºx\Î\Ìn={\ì\ÝHðGZ»«\Ìø\ì\ã\ì‚\ÆK­²A\àGuo\äxO+l¼V»\çÁd·\×U›p…\àv×§\Ë\în;”\ÉÙ±6}Ñ¾œ€\ÃHÝ—\0v\ÊFS—fr“;\Çéº´-&1Xöt;w vSgÙ„³¹¶y,\Î\ï\ßðñ»¹ÿ\0¹\Þ_e§bñ”ñu[_^:ðŽý,\Z\ß\×\Õv\"\"\"\"\"\"\"\".\Ä%õ„¬’{À=@ñ¶\×\ç/iøûù­S\Æþ6Ë¯N&mx^[G\á\êõ}û|–Á®\å¬\Óv/—ÁN­Ç³ü°\ã¬=­þ`;’ã¼´=Á¯\ÆK^\Â};\'C-!k6\Ý$\æ\ê\Ñ\â]ûmZ±Š8Šþ\ç]‘4þ§ñ<ú¸ø“õ]èˆˆˆˆˆˆˆˆˆU+–q\ÖXk\Ìb9=\åy\Û\ã÷¾“ÿ\0A*†\ê\á3VoOš\Ì`\ËÛžÿ\0ù÷Y¬¥¦d&ž7:9¤‘\Î#\æO‚ý\ìS48™òV¶e\Ý1ƒ\è<O\Üÿ\0e¥¢\"\"\"\"\"\"\"\"\"!\0‚\Ú*½™\âõò0{¦Hbo¡@};‚?uW\Æû%\ÄG•7²²\î\ÛA»õv‰\ÚÑ¡‰\ÄÈ¢cY\0kZÑ ¢ûDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD_ÿ\Ù'),(5,2147483644,1,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿÀ\0\0\È\0\È\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\08\0\0\0\0\0\0!1AQ\"aq2‘#BR±$34\Ñbr¡Áñÿ\Ú\0\0\0?\0ýRˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆ‹”\äiû\Ç\Çø¸=\ã\Ü\ßx6>«†$\Å_dÏ§m²\Å	\é|cºAú\ëJ:§2§<f\ËÀ‡m\ZŒ\ï\ÑsÁ\×\é#cº—«œ\Æ[¾\êUoÖš\ÓA.Š9œ\0ñðú©$DDDDDDDDEs3B¬ÿ\0‡’\ÌFÎ»@\Ï\ÙR1|²÷\"\Ëd1\ÒÁJ°õ6B\Ç\'‰\Z\ßoQ\â\Ì\Èb¬\å«\nQJ\×F\Ûr;Z>]-#\âúö\\®££‰›Ž³\î\êJv\àZ6\ã½\ï~>*¡KcrÁ…¹˜w?®@ã¦µ\Äù¯ù[Ÿ\0\âø}«\á·œ+\Ü\éXdoñ\Ã\Èob}6\n½¢\"\"\"\"\"\"\"(Ì¦w‹•‘^»2¿ô\ÆN\Ü~Ãº¤æ¹–Mœ¢c[\nr48M7b\æ‘\êt7ôP¹\Üe®;v\Ï&Á×4ÀK¤©\ïzd¾oi\ëððU[ü‡\í\"6\Òv6\æ7+\ßØ²\Ã\æ[­ªé¥Ž½Ã°‚\ï\"Î‰™3šÁM²u=£¯¨÷û&™d²QC\'\r ÖŠ‡\ÞM!ð¸kù·ý•»€ñz\Î]¬+Üžsfv5ºë•¯?>-Þ‚Õ€DDDDDDDEš\Î\ãp±±ù;L€<\é€\ì—}\0Tžs\Ëòu ¥g2wiÖŸõ\á\Ü\ïô¨òQY\Ìl¦\×\Ì`2T­\å gPŽYŽÓ‡};´÷úxX—;‘û\Î=\Êx¤•\Î÷R²7]ýMón¼wµ\á‰â§Œ\Çk)k‘¾:5Á5`ž¹ô6¼€^w9W\æ˜Iñ|;³>Ÿ+£R½\ï~Zõ\\|+Z\æ³d\á\Ï~0¾a½ö\ã°7ò\ZòZ—²ž\n\ì!V ÿ\0d\É]\Ù\ÍgN»\ë\×\ÑhµkCR» ­b…ƒMcF€\Õ_)OQ\Ör¶[üÇ¿\ì;ò»÷øû\íñ8e“N\r.1m\äyô·\å\ê«>ÿ\0\ÊqA“\äP~iºŸ\'¼Lx\Z\ésN¶‚ŸrŒ.Kòkø\Z¤\îT1ÚZøG}ý?ú¸\ép3²n\ÉI‘“Ä’ v\äŠMÿ\0¦\Ó\å¯\Üx/º\\ÿ\0b\Å8\æ\Ê\Î\rq7G[\äh\Ø\0}½T\ã\Ù|·\'‹ò¬¶\'@÷¹¬vˆ\é\0ô‚{E¨{?öj\Ì#\É^seŠœˆa\Î\ÓÁ\ê}½5¥¢\â0ôñ^üÓ‹¥ó»®W“·<üÊ‘DDDDDDE\ãn\ÔU+I=‡DÁ²U?ü_ùý±ñ¦\È\Û°–\Ë3CFõ\Û@ùŸš¥bó¸\ë0\\\ÄslŒ‘\å$:EÑ¹=ö\Ò{yy(¬®sp\ç\Â06)\æð!°\È\Øõ$Nþ—øŸŸšñ\Èqzœ®ü9,ü1ñÌƒ\Û\×iŒ\Å\ì;Ó‹{t¸\és»\Ð\ã7\ä\Æ\àc2C]¢:ó\Ïñ=½@l\è\ï¾ÿ\0º„»‡ä§“Q~U²t\å.7¨1\Û:sÀ$\ë¶õ\ß\äµO²š”¹n7#^Z­2\\\èË½\à\è€7\ã\ß{;ZM,=\ZVf\0\Í\è/q.!¾€Ÿ\0¤ng\"\Êq5–&O!\éo[€\én\Ñô\Ò\Ç0|\Ó\ä™\Ì2’¼=\Îu“#5²6u\á\Û\ä¾s¯±‡2\ä=š\æ+Øª\ß\âX\ÇHÁ&ÁþfÄ’\ä\ÈUµ\Ë1¥\ç+\ã\çÿ\0“¶\Ó!h\îv–¼‰Q÷ù6„\\¯KŒ\Äù\á\r.–Yûõ\Èø\Ç\Ë\ËÁCòZ\\›9KüLû^ò)X×·k¹\à7\à”ÿ\0dõ2˜Œ_ðb©1\Ë<»&Gvþc\Ã\Åjq\âh2x\æmHD±±\Ý?¤\ë[…v¢\"\"\"\"\"\"(L\ï*\Ã\á\î\ïÜ³\ëbüO?a\á÷YŸ$ö\É\rfL\Úl€‘Ñ¹7&µ\ß`v^\Ë\r\Ïdr›!5·Ù±){‰,{‹ˆoù+,<K)g\0ÜŽnƒ™JÀ/>0\Ùz	\× =J²\å²|kˆcª7‹6K\×K\Ç]¹;‰\ZF\Ë@ò}½m\Æç½¡\Ð~H]kb¨\\žv\ç\à\Ñ\é¥t\á>\ÏF[\Âr4\àm\Û\í3K±\'Hw\Âw\é¯.\ËR\Âq¬~/Bƒ`ŽfÔ¬k\äh$\ë¾ÿ\0~\êl\r\"\"\"\"\"\"\"(^K\Éñ<r·½\Ê[dd† w#þY/(ö\Ê\Éb’*%Ô£;m\Ó\æ#û7ÿ\0+\Èe0´÷Ež——\É!\êwÔ•h\â^\Íò9\íY}VR¥úf\Ù k\Ôâ¬¹ºSŠ\ã\çüª[9„lø¥$šG˜\íÿ\0µöü—!\çøvV‘ï†„\0\çt\Æ\ÞÝ¶}N¼Õ§\ÙWl|a\ç\'^39–H\Øé™²è¼µý=÷\Ü+ÿ\0\âT8\Þ)ô cdJfyx\Ø.>€ü•‰­\rh\r\0\Ø\0¿¨ˆˆˆˆˆˆ¼.Ü¯J»\ç¹4pBÁ·>G\0\ÇùÇ¶úö\É_\Ä,\Í\à,IÙƒ\æ\â~úXE\ÎA–\Ëå¤¿;Ì³I¾©\'ø‰\Ë\ä=\0Sücˆ\äs·cg\\¢uþ&vt´\rúŸ\ëL©€\ã¼f#ªþK“Öœ\ç\à´ü‚\â­6S’e\ç\ÆGi´\r4\ã-hÞƒC|7µ¢f˜‹t+C•’Í‰ccý\Û^w³°q\ä®\Õ*ÁN¼u\êE0F:Ym\rkG\Èìˆˆˆˆˆˆ¼.\ÙmXŽ\Ç`5£\Å\Äø\0²¿i£?J\åhñ÷E(\Þ\Ò\íE\\OÈ¹À\ï\ì®\Ã\Ïù¶²9Hc\É`ƒõbx\"H[\êGo\Ýi˜®O>o\ì5ŠSA+~ð»\ÑÃ«\Äz,\'\Û~a¸Ÿ•¾\ëx\é\Ù$}£c¿§¤v\Ó\ÕW¸o³ü·&œ\ZUœöñX—b1÷Z­)Ä¸S&vF\æ2`¢Á¶0ý?\åq\ç9g“\êV>\ËqÑ‘†”dµ»\Ùo^¾‡^KA\á\\B6Ú¹U\Ò\ÎX?\Üw;>?€À5r§‹¡JW\ËR•h%x\Ó\ßa®pù‘\â»&t“~‹;––\Êuå¿‡_Ü¬÷9^I}Ú”2½Pöºx\Î\Ìn={\ì\ÝHðGZ»«\Ìø\ì\ã\ì‚\ÆK­²A\àGuo\äxO+l¼V»\çÁd·\×U›p…\àv×§\Ë\în;”\ÉÙ±6}Ñ¾œ€\ÃHÝ—\0v\ÊFS—fr“;\Çéº´-&1Xöt;w vSgÙ„³¹¶y,\Î\ï\ßðñ»¹ÿ\0¹\Þ_e§bñ”ñu[_^:ðŽý,\Z\ß\×\Õv\"\"\"\"\"\"\"\".\Ä%õ„¬’{À=@ñ¶\×\ç/iøûù­S\Æþ6Ë¯N&mx^[G\á\êõ}û|–Á®\å¬\Óv/—ÁN­Ç³ü°\ã¬=­þ`;’ã¼´=Á¯\ÆK^\Â};\'C-!k6\Ý$\æ\ê\Ñ\â]ûmZ±Š8Šþ\ç]‘4þ§ñ<ú¸ø“õ]èˆˆˆˆˆˆˆˆˆU+–q\ÖXk\Ìb9=\åy\Û\ã÷¾“ÿ\0A*†\ê\á3VoOš\Ì`\ËÛžÿ\0ù÷Y¬¥¦d&ž7:9¤‘\Î#\æO‚ý\ìS48™òV¶e\Ý1ƒ\è<O\Üÿ\0e¥¢\"\"\"\"\"\"\"\"\"!\0‚\Ú*½™\âõò0{¦Hbo¡@};‚?uW\Æû%\ÄG•7²²\î\ÛA»õv‰\ÚÑ¡‰\ÄÈ¢cY\0kZÑ ¢ûDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD_ÿ\Ù'),(6,2147483645,3,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿÀ\0\0\È\0\È\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\08\0\0\0\0\0\0!1AQ\"aq2‘#BR±$34\Ñbr¡Áñÿ\Ú\0\0\0?\0ýRˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆ‹”\äiû\Ç\Çø¸=\ã\Ü\ßx6>«†$\Å_dÏ§m²\Å	\é|cºAú\ëJ:§2§<f\ËÀ‡m\ZŒ\ï\ÑsÁ\×\é#cº—«œ\Æ[¾\êUoÖš\ÓA.Š9œ\0ñðú©$DDDDDDDDEs3B¬ÿ\0‡’\ÌFÎ»@\Ï\ÙR1|²÷\"\Ëd1\ÒÁJ°õ6B\Ç\'‰\Z\ßoQ\â\Ì\Èb¬\å«\nQJ\×F\Ûr;Z>]-#\âúö\\®££‰›Ž³\î\êJv\àZ6\ã½\ï~>*¡KcrÁ…¹˜w?®@ã¦µ\Äù¯ù[Ÿ\0\âø}«\á·œ+\Ü\éXdoñ\Ã\Èob}6\n½¢\"\"\"\"\"\"\"(Ì¦w‹•‘^»2¿ô\ÆN\Ü~Ãº¤æ¹–Mœ¢c[\nr48M7b\æ‘\êt7ôP¹\Üe®;v\Ï&Á×4ÀK¤©\ïzd¾oi\ëððU[ü‡\í\"6\Òv6\æ7+\ßØ²\Ã\æ[­ªé¥Ž½Ã°‚\ï\"Î‰™3šÁM²u=£¯¨÷û&™d²QC\'\r ÖŠ‡\ÞM!ð¸kù·ý•»€ñz\Î]¬+Üžsfv5ºë•¯?>-Þ‚Õ€DDDDDDDEš\Î\ãp±±ù;L€<\é€\ì—}\0Tžs\Ëòu ¥g2wiÖŸõ\á\Ü\ïô¨òQY\Ìl¦\×\Ì`2T­\å gPŽYŽÓ‡};´÷úxX—;‘û\Î=\Êx¤•\Î÷R²7]ýMón¼wµ\á‰â§Œ\Çk)k‘¾:5Á5`ž¹ô6¼€^w9W\æ˜Iñ|;³>Ÿ+£R½\ï~Zõ\\|+Z\æ³d\á\Ï~0¾a½ö\ã°7ò\ZòZ—²ž\n\ì!V ÿ\0d\É]\Ù\ÍgN»\ë\×\ÑhµkCR» ­b…ƒMcF€\Õ_)OQ\Ör¶[üÇ¿\ì;ò»÷øû\íñ8e“N\r.1m\äyô·\å\ê«>ÿ\0\ÊqA“\äP~iºŸ\'¼Lx\Z\ésN¶‚ŸrŒ.Kòkø\Z¤\îT1ÚZøG}ý?ú¸\ép3²n\ÉI‘“Ä’ v\äŠMÿ\0¦\Ó\å¯\Üx/º\\ÿ\0b\Å8\æ\Ê\Î\rq7G[\äh\Ø\0}½T\ã\Ù|·\'‹ò¬¶\'@÷¹¬vˆ\é\0ô‚{E¨{?öj\Ì#\É^seŠœˆa\Î\ÓÁ\ê}½5¥¢\â0ôñ^üÓ‹¥ó»®W“·<üÊ‘DDDDDDE\ãn\ÔU+I=‡DÁ²U?ü_ùý±ñ¦\È\Û°–\Ë3CFõ\Û@ùŸš¥bó¸\ë0\\\ÄslŒ‘\å$:EÑ¹=ö\Ò{yy(¬®sp\ç\Â06)\æð!°\È\Øõ$Nþ—øŸŸšñ\Èqzœ®ü9,ü1ñÌƒ\Û\×iŒ\Å\ì;Ó‹{t¸\és»\Ð\ã7\ä\Æ\àc2C]¢:ó\Ïñ=½@l\è\ï¾ÿ\0º„»‡ä§“Q~U²t\å.7¨1\Û:sÀ$\ë¶õ\ß\äµO²š”¹n7#^Z­2\\\èË½\à\è€7\ã\ß{;ZM,=\ZVf\0\Í\è/q.!¾€Ÿ\0¤ng\"\Êq5–&O!\éo[€\én\Ñô\Ò\Ç0|\Ó\ä™\Ì2’¼=\Îu“#5²6u\á\Û\ä¾s¯±‡2\ä=š\æ+Øª\ß\âX\ÇHÁ&ÁþfÄ’\ä\ÈUµ\Ë1¥\ç+\ã\çÿ\0“¶\Ó!h\îv–¼‰Q÷ù6„\\¯KŒ\Äù\á\r.–Yûõ\Èø\Ç\Ë\ËÁCòZ\\›9KüLû^ò)X×·k¹\à7\à”ÿ\0dõ2˜Œ_ðb©1\Ë<»&Gvþc\Ã\Åjq\âh2x\æmHD±±\Ý?¤\ë[…v¢\"\"\"\"\"\"(L\ï*\Ã\á\î\ïÜ³\ëbüO?a\á÷YŸ$ö\É\rfL\Úl€‘Ñ¹7&µ\ß`v^\Ë\r\Ïdr›!5·Ù±){‰,{‹ˆoù+,<K)g\0ÜŽnƒ™JÀ/>0\Ùz	\× =J²\å²|kˆcª7‹6K\×K\Ç]¹;‰\ZF\Ë@ò}½m\Æç½¡\Ð~H]kb¨\\žv\ç\à\Ñ\é¥t\á>\ÏF[\Âr4\àm\Û\í3K±\'Hw\Âw\é¯.\ËR\Âq¬~/Bƒ`ŽfÔ¬k\äh$\ë¾ÿ\0~\êl\r\"\"\"\"\"\"\"(^K\Éñ<r·½\Ê[dd† w#þY/(ö\Ê\Éb’*%Ô£;m\Ó\æ#û7ÿ\0+\Èe0´÷Ež——\É!\êwÔ•h\â^\Íò9\íY}VR¥úf\Ù k\Ôâ¬¹ºSŠ\ã\çüª[9„lø¥$šG˜\íÿ\0µöü—!\çøvV‘ï†„\0\çt\Æ\ÞÝ¶}N¼Õ§\ÙWl|a\ç\'^39–H\Øé™²è¼µý=÷\Ü+ÿ\0\âT8\Þ)ô cdJfyx\Ø.>€ü•‰­\rh\r\0\Ø\0¿¨ˆˆˆˆˆˆ¼.Ü¯J»\ç¹4pBÁ·>G\0\ÇùÇ¶úö\É_\Ä,\Í\à,IÙƒ\æ\â~úXE\ÎA–\Ëå¤¿;Ì³I¾©\'ø‰\Ë\ä=\0Sücˆ\äs·cg\\¢uþ&vt´\rúŸ\ëL©€\ã¼f#ªþK“Öœ\ç\à´ü‚\â­6S’e\ç\ÆGi´\r4\ã-hÞƒC|7µ¢f˜‹t+C•’Í‰ccý\Û^w³°q\ä®\Õ*ÁN¼u\êE0F:Ym\rkG\Èìˆˆˆˆˆˆ¼.\ÙmXŽ\Ç`5£\Å\Äø\0²¿i£?J\åhñ÷E(\Þ\Ò\íE\\OÈ¹À\ï\ì®\Ã\Ïù¶²9Hc\É`ƒõbx\"H[\êGo\Ýi˜®O>o\ì5ŠSA+~ð»\ÑÃ«\Äz,\'\Û~a¸Ÿ•¾\ëx\é\Ù$}£c¿§¤v\Ó\ÕW¸o³ü·&œ\ZUœöñX—b1÷Z­)Ä¸S&vF\æ2`¢Á¶0ý?\åq\ç9g“\êV>\ËqÑ‘†”dµ»\Ùo^¾‡^KA\á\\B6Ú¹U\Ò\ÎX?\Üw;>?€À5r§‹¡JW\ËR•h%x\Ó\ßa®pù‘\â»&t“~‹;––\Êuå¿‡_Ü¬÷9^I}Ú”2½Pöºx\Î\Ìn={\ì\ÝHðGZ»«\Ìø\ì\ã\ì‚\ÆK­²A\àGuo\äxO+l¼V»\çÁd·\×U›p…\àv×§\Ë\în;”\ÉÙ±6}Ñ¾œ€\ÃHÝ—\0v\ÊFS—fr“;\Çéº´-&1Xöt;w vSgÙ„³¹¶y,\Î\ï\ßðñ»¹ÿ\0¹\Þ_e§bñ”ñu[_^:ðŽý,\Z\ß\×\Õv\"\"\"\"\"\"\"\".\Ä%õ„¬’{À=@ñ¶\×\ç/iøûù­S\Æþ6Ë¯N&mx^[G\á\êõ}û|–Á®\å¬\Óv/—ÁN­Ç³ü°\ã¬=­þ`;’ã¼´=Á¯\ÆK^\Â};\'C-!k6\Ý$\æ\ê\Ñ\â]ûmZ±Š8Šþ\ç]‘4þ§ñ<ú¸ø“õ]èˆˆˆˆˆˆˆˆˆU+–q\ÖXk\Ìb9=\åy\Û\ã÷¾“ÿ\0A*†\ê\á3VoOš\Ì`\ËÛžÿ\0ù÷Y¬¥¦d&ž7:9¤‘\Î#\æO‚ý\ìS48™òV¶e\Ý1ƒ\è<O\Üÿ\0e¥¢\"\"\"\"\"\"\"\"\"!\0‚\Ú*½™\âõò0{¦Hbo¡@};‚?uW\Æû%\ÄG•7²²\î\ÛA»õv‰\ÚÑ¡‰\ÄÈ¢cY\0kZÑ ¢ûDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD_ÿ\Ù'),(7,2147483646,2,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿÀ\0\0\È\0\È\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\08\0\0\0\0\0\0!1AQ\"aq2‘#BR±$34\Ñbr¡Áñÿ\Ú\0\0\0?\0ýRˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆ‹”\äiû\Ç\Çø¸=\ã\Ü\ßx6>«†$\Å_dÏ§m²\Å	\é|cºAú\ëJ:§2§<f\ËÀ‡m\ZŒ\ï\ÑsÁ\×\é#cº—«œ\Æ[¾\êUoÖš\ÓA.Š9œ\0ñðú©$DDDDDDDDEs3B¬ÿ\0‡’\ÌFÎ»@\Ï\ÙR1|²÷\"\Ëd1\ÒÁJ°õ6B\Ç\'‰\Z\ßoQ\â\Ì\Èb¬\å«\nQJ\×F\Ûr;Z>]-#\âúö\\®££‰›Ž³\î\êJv\àZ6\ã½\ï~>*¡KcrÁ…¹˜w?®@ã¦µ\Äù¯ù[Ÿ\0\âø}«\á·œ+\Ü\éXdoñ\Ã\Èob}6\n½¢\"\"\"\"\"\"\"(Ì¦w‹•‘^»2¿ô\ÆN\Ü~Ãº¤æ¹–Mœ¢c[\nr48M7b\æ‘\êt7ôP¹\Üe®;v\Ï&Á×4ÀK¤©\ïzd¾oi\ëððU[ü‡\í\"6\Òv6\æ7+\ßØ²\Ã\æ[­ªé¥Ž½Ã°‚\ï\"Î‰™3šÁM²u=£¯¨÷û&™d²QC\'\r ÖŠ‡\ÞM!ð¸kù·ý•»€ñz\Î]¬+Üžsfv5ºë•¯?>-Þ‚Õ€DDDDDDDEš\Î\ãp±±ù;L€<\é€\ì—}\0Tžs\Ëòu ¥g2wiÖŸõ\á\Ü\ïô¨òQY\Ìl¦\×\Ì`2T­\å gPŽYŽÓ‡};´÷úxX—;‘û\Î=\Êx¤•\Î÷R²7]ýMón¼wµ\á‰â§Œ\Çk)k‘¾:5Á5`ž¹ô6¼€^w9W\æ˜Iñ|;³>Ÿ+£R½\ï~Zõ\\|+Z\æ³d\á\Ï~0¾a½ö\ã°7ò\ZòZ—²ž\n\ì!V ÿ\0d\É]\Ù\ÍgN»\ë\×\ÑhµkCR» ­b…ƒMcF€\Õ_)OQ\Ör¶[üÇ¿\ì;ò»÷øû\íñ8e“N\r.1m\äyô·\å\ê«>ÿ\0\ÊqA“\äP~iºŸ\'¼Lx\Z\ésN¶‚ŸrŒ.Kòkø\Z¤\îT1ÚZøG}ý?ú¸\ép3²n\ÉI‘“Ä’ v\äŠMÿ\0¦\Ó\å¯\Üx/º\\ÿ\0b\Å8\æ\Ê\Î\rq7G[\äh\Ø\0}½T\ã\Ù|·\'‹ò¬¶\'@÷¹¬vˆ\é\0ô‚{E¨{?öj\Ì#\É^seŠœˆa\Î\ÓÁ\ê}½5¥¢\â0ôñ^üÓ‹¥ó»®W“·<üÊ‘DDDDDDE\ãn\ÔU+I=‡DÁ²U?ü_ùý±ñ¦\È\Û°–\Ë3CFõ\Û@ùŸš¥bó¸\ë0\\\ÄslŒ‘\å$:EÑ¹=ö\Ò{yy(¬®sp\ç\Â06)\æð!°\È\Øõ$Nþ—øŸŸšñ\Èqzœ®ü9,ü1ñÌƒ\Û\×iŒ\Å\ì;Ó‹{t¸\és»\Ð\ã7\ä\Æ\àc2C]¢:ó\Ïñ=½@l\è\ï¾ÿ\0º„»‡ä§“Q~U²t\å.7¨1\Û:sÀ$\ë¶õ\ß\äµO²š”¹n7#^Z­2\\\èË½\à\è€7\ã\ß{;ZM,=\ZVf\0\Í\è/q.!¾€Ÿ\0¤ng\"\Êq5–&O!\éo[€\én\Ñô\Ò\Ç0|\Ó\ä™\Ì2’¼=\Îu“#5²6u\á\Û\ä¾s¯±‡2\ä=š\æ+Øª\ß\âX\ÇHÁ&ÁþfÄ’\ä\ÈUµ\Ë1¥\ç+\ã\çÿ\0“¶\Ó!h\îv–¼‰Q÷ù6„\\¯KŒ\Äù\á\r.–Yûõ\Èø\Ç\Ë\ËÁCòZ\\›9KüLû^ò)X×·k¹\à7\à”ÿ\0dõ2˜Œ_ðb©1\Ë<»&Gvþc\Ã\Åjq\âh2x\æmHD±±\Ý?¤\ë[…v¢\"\"\"\"\"\"(L\ï*\Ã\á\î\ïÜ³\ëbüO?a\á÷YŸ$ö\É\rfL\Úl€‘Ñ¹7&µ\ß`v^\Ë\r\Ïdr›!5·Ù±){‰,{‹ˆoù+,<K)g\0ÜŽnƒ™JÀ/>0\Ùz	\× =J²\å²|kˆcª7‹6K\×K\Ç]¹;‰\ZF\Ë@ò}½m\Æç½¡\Ð~H]kb¨\\žv\ç\à\Ñ\é¥t\á>\ÏF[\Âr4\àm\Û\í3K±\'Hw\Âw\é¯.\ËR\Âq¬~/Bƒ`ŽfÔ¬k\äh$\ë¾ÿ\0~\êl\r\"\"\"\"\"\"\"(^K\Éñ<r·½\Ê[dd† w#þY/(ö\Ê\Éb’*%Ô£;m\Ó\æ#û7ÿ\0+\Èe0´÷Ež——\É!\êwÔ•h\â^\Íò9\íY}VR¥úf\Ù k\Ôâ¬¹ºSŠ\ã\çüª[9„lø¥$šG˜\íÿ\0µöü—!\çøvV‘ï†„\0\çt\Æ\ÞÝ¶}N¼Õ§\ÙWl|a\ç\'^39–H\Øé™²è¼µý=÷\Ü+ÿ\0\âT8\Þ)ô cdJfyx\Ø.>€ü•‰­\rh\r\0\Ø\0¿¨ˆˆˆˆˆˆ¼.Ü¯J»\ç¹4pBÁ·>G\0\ÇùÇ¶úö\É_\Ä,\Í\à,IÙƒ\æ\â~úXE\ÎA–\Ëå¤¿;Ì³I¾©\'ø‰\Ë\ä=\0Sücˆ\äs·cg\\¢uþ&vt´\rúŸ\ëL©€\ã¼f#ªþK“Öœ\ç\à´ü‚\â­6S’e\ç\ÆGi´\r4\ã-hÞƒC|7µ¢f˜‹t+C•’Í‰ccý\Û^w³°q\ä®\Õ*ÁN¼u\êE0F:Ym\rkG\Èìˆˆˆˆˆˆ¼.\ÙmXŽ\Ç`5£\Å\Äø\0²¿i£?J\åhñ÷E(\Þ\Ò\íE\\OÈ¹À\ï\ì®\Ã\Ïù¶²9Hc\É`ƒõbx\"H[\êGo\Ýi˜®O>o\ì5ŠSA+~ð»\ÑÃ«\Äz,\'\Û~a¸Ÿ•¾\ëx\é\Ù$}£c¿§¤v\Ó\ÕW¸o³ü·&œ\ZUœöñX—b1÷Z­)Ä¸S&vF\æ2`¢Á¶0ý?\åq\ç9g“\êV>\ËqÑ‘†”dµ»\Ùo^¾‡^KA\á\\B6Ú¹U\Ò\ÎX?\Üw;>?€À5r§‹¡JW\ËR•h%x\Ó\ßa®pù‘\â»&t“~‹;––\Êuå¿‡_Ü¬÷9^I}Ú”2½Pöºx\Î\Ìn={\ì\ÝHðGZ»«\Ìø\ì\ã\ì‚\ÆK­²A\àGuo\äxO+l¼V»\çÁd·\×U›p…\àv×§\Ë\în;”\ÉÙ±6}Ñ¾œ€\ÃHÝ—\0v\ÊFS—fr“;\Çéº´-&1Xöt;w vSgÙ„³¹¶y,\Î\ï\ßðñ»¹ÿ\0¹\Þ_e§bñ”ñu[_^:ðŽý,\Z\ß\×\Õv\"\"\"\"\"\"\"\".\Ä%õ„¬’{À=@ñ¶\×\ç/iøûù­S\Æþ6Ë¯N&mx^[G\á\êõ}û|–Á®\å¬\Óv/—ÁN­Ç³ü°\ã¬=­þ`;’ã¼´=Á¯\ÆK^\Â};\'C-!k6\Ý$\æ\ê\Ñ\â]ûmZ±Š8Šþ\ç]‘4þ§ñ<ú¸ø“õ]èˆˆˆˆˆˆˆˆˆU+–q\ÖXk\Ìb9=\åy\Û\ã÷¾“ÿ\0A*†\ê\á3VoOš\Ì`\ËÛžÿ\0ù÷Y¬¥¦d&ž7:9¤‘\Î#\æO‚ý\ìS48™òV¶e\Ý1ƒ\è<O\Üÿ\0e¥¢\"\"\"\"\"\"\"\"\"!\0‚\Ú*½™\âõò0{¦Hbo¡@};‚?uW\Æû%\ÄG•7²²\î\ÛA»õv‰\ÚÑ¡‰\ÄÈ¢cY\0kZÑ ¢ûDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD_ÿ\Ù'),(8,2147483647,3,_binary 'ÿ\Øÿ\à\0JFIF\0\0\0\0\0\0ÿ\Û\0C\0\n\n\n		\n\Z%\Z# , #&\')*)-0-(0%()(ÿÀ\0\0\È\0\È\0ÿ\Ä\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Ä\08\0\0\0\0\0\0!1AQ\"aq2‘#BR±$34\Ñbr¡Áñÿ\Ú\0\0\0?\0ýRˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆˆ‹”\äiû\Ç\Çø¸=\ã\Ü\ßx6>«†$\Å_dÏ§m²\Å	\é|cºAú\ëJ:§2§<f\ËÀ‡m\ZŒ\ï\ÑsÁ\×\é#cº—«œ\Æ[¾\êUoÖš\ÓA.Š9œ\0ñðú©$DDDDDDDDEs3B¬ÿ\0‡’\ÌFÎ»@\Ï\ÙR1|²÷\"\Ëd1\ÒÁJ°õ6B\Ç\'‰\Z\ßoQ\â\Ì\Èb¬\å«\nQJ\×F\Ûr;Z>]-#\âúö\\®££‰›Ž³\î\êJv\àZ6\ã½\ï~>*¡KcrÁ…¹˜w?®@ã¦µ\Äù¯ù[Ÿ\0\âø}«\á·œ+\Ü\éXdoñ\Ã\Èob}6\n½¢\"\"\"\"\"\"\"(Ì¦w‹•‘^»2¿ô\ÆN\Ü~Ãº¤æ¹–Mœ¢c[\nr48M7b\æ‘\êt7ôP¹\Üe®;v\Ï&Á×4ÀK¤©\ïzd¾oi\ëððU[ü‡\í\"6\Òv6\æ7+\ßØ²\Ã\æ[­ªé¥Ž½Ã°‚\ï\"Î‰™3šÁM²u=£¯¨÷û&™d²QC\'\r ÖŠ‡\ÞM!ð¸kù·ý•»€ñz\Î]¬+Üžsfv5ºë•¯?>-Þ‚Õ€DDDDDDDEš\Î\ãp±±ù;L€<\é€\ì—}\0Tžs\Ëòu ¥g2wiÖŸõ\á\Ü\ïô¨òQY\Ìl¦\×\Ì`2T­\å gPŽYŽÓ‡};´÷úxX—;‘û\Î=\Êx¤•\Î÷R²7]ýMón¼wµ\á‰â§Œ\Çk)k‘¾:5Á5`ž¹ô6¼€^w9W\æ˜Iñ|;³>Ÿ+£R½\ï~Zõ\\|+Z\æ³d\á\Ï~0¾a½ö\ã°7ò\ZòZ—²ž\n\ì!V ÿ\0d\É]\Ù\ÍgN»\ë\×\ÑhµkCR» ­b…ƒMcF€\Õ_)OQ\Ör¶[üÇ¿\ì;ò»÷øû\íñ8e“N\r.1m\äyô·\å\ê«>ÿ\0\ÊqA“\äP~iºŸ\'¼Lx\Z\ésN¶‚ŸrŒ.Kòkø\Z¤\îT1ÚZøG}ý?ú¸\ép3²n\ÉI‘“Ä’ v\äŠMÿ\0¦\Ó\å¯\Üx/º\\ÿ\0b\Å8\æ\Ê\Î\rq7G[\äh\Ø\0}½T\ã\Ù|·\'‹ò¬¶\'@÷¹¬vˆ\é\0ô‚{E¨{?öj\Ì#\É^seŠœˆa\Î\ÓÁ\ê}½5¥¢\â0ôñ^üÓ‹¥ó»®W“·<üÊ‘DDDDDDE\ãn\ÔU+I=‡DÁ²U?ü_ùý±ñ¦\È\Û°–\Ë3CFõ\Û@ùŸš¥bó¸\ë0\\\ÄslŒ‘\å$:EÑ¹=ö\Ò{yy(¬®sp\ç\Â06)\æð!°\È\Øõ$Nþ—øŸŸšñ\Èqzœ®ü9,ü1ñÌƒ\Û\×iŒ\Å\ì;Ó‹{t¸\és»\Ð\ã7\ä\Æ\àc2C]¢:ó\Ïñ=½@l\è\ï¾ÿ\0º„»‡ä§“Q~U²t\å.7¨1\Û:sÀ$\ë¶õ\ß\äµO²š”¹n7#^Z­2\\\èË½\à\è€7\ã\ß{;ZM,=\ZVf\0\Í\è/q.!¾€Ÿ\0¤ng\"\Êq5–&O!\éo[€\én\Ñô\Ò\Ç0|\Ó\ä™\Ì2’¼=\Îu“#5²6u\á\Û\ä¾s¯±‡2\ä=š\æ+Øª\ß\âX\ÇHÁ&ÁþfÄ’\ä\ÈUµ\Ë1¥\ç+\ã\çÿ\0“¶\Ó!h\îv–¼‰Q÷ù6„\\¯KŒ\Äù\á\r.–Yûõ\Èø\Ç\Ë\ËÁCòZ\\›9KüLû^ò)X×·k¹\à7\à”ÿ\0dõ2˜Œ_ðb©1\Ë<»&Gvþc\Ã\Åjq\âh2x\æmHD±±\Ý?¤\ë[…v¢\"\"\"\"\"\"(L\ï*\Ã\á\î\ïÜ³\ëbüO?a\á÷YŸ$ö\É\rfL\Úl€‘Ñ¹7&µ\ß`v^\Ë\r\Ïdr›!5·Ù±){‰,{‹ˆoù+,<K)g\0ÜŽnƒ™JÀ/>0\Ùz	\× =J²\å²|kˆcª7‹6K\×K\Ç]¹;‰\ZF\Ë@ò}½m\Æç½¡\Ð~H]kb¨\\žv\ç\à\Ñ\é¥t\á>\ÏF[\Âr4\àm\Û\í3K±\'Hw\Âw\é¯.\ËR\Âq¬~/Bƒ`ŽfÔ¬k\äh$\ë¾ÿ\0~\êl\r\"\"\"\"\"\"\"(^K\Éñ<r·½\Ê[dd† w#þY/(ö\Ê\Éb’*%Ô£;m\Ó\æ#û7ÿ\0+\Èe0´÷Ež——\É!\êwÔ•h\â^\Íò9\íY}VR¥úf\Ù k\Ôâ¬¹ºSŠ\ã\çüª[9„lø¥$šG˜\íÿ\0µöü—!\çøvV‘ï†„\0\çt\Æ\ÞÝ¶}N¼Õ§\ÙWl|a\ç\'^39–H\Øé™²è¼µý=÷\Ü+ÿ\0\âT8\Þ)ô cdJfyx\Ø.>€ü•‰­\rh\r\0\Ø\0¿¨ˆˆˆˆˆˆ¼.Ü¯J»\ç¹4pBÁ·>G\0\ÇùÇ¶úö\É_\Ä,\Í\à,IÙƒ\æ\â~úXE\ÎA–\Ëå¤¿;Ì³I¾©\'ø‰\Ë\ä=\0Sücˆ\äs·cg\\¢uþ&vt´\rúŸ\ëL©€\ã¼f#ªþK“Öœ\ç\à´ü‚\â­6S’e\ç\ÆGi´\r4\ã-hÞƒC|7µ¢f˜‹t+C•’Í‰ccý\Û^w³°q\ä®\Õ*ÁN¼u\êE0F:Ym\rkG\Èìˆˆˆˆˆˆ¼.\ÙmXŽ\Ç`5£\Å\Äø\0²¿i£?J\åhñ÷E(\Þ\Ò\íE\\OÈ¹À\ï\ì®\Ã\Ïù¶²9Hc\É`ƒõbx\"H[\êGo\Ýi˜®O>o\ì5ŠSA+~ð»\ÑÃ«\Äz,\'\Û~a¸Ÿ•¾\ëx\é\Ù$}£c¿§¤v\Ó\ÕW¸o³ü·&œ\ZUœöñX—b1÷Z­)Ä¸S&vF\æ2`¢Á¶0ý?\åq\ç9g“\êV>\ËqÑ‘†”dµ»\Ùo^¾‡^KA\á\\B6Ú¹U\Ò\ÎX?\Üw;>?€À5r§‹¡JW\ËR•h%x\Ó\ßa®pù‘\â»&t“~‹;––\Êuå¿‡_Ü¬÷9^I}Ú”2½Pöºx\Î\Ìn={\ì\ÝHðGZ»«\Ìø\ì\ã\ì‚\ÆK­²A\àGuo\äxO+l¼V»\çÁd·\×U›p…\àv×§\Ë\în;”\ÉÙ±6}Ñ¾œ€\ÃHÝ—\0v\ÊFS—fr“;\Çéº´-&1Xöt;w vSgÙ„³¹¶y,\Î\ï\ßðñ»¹ÿ\0¹\Þ_e§bñ”ñu[_^:ðŽý,\Z\ß\×\Õv\"\"\"\"\"\"\"\".\Ä%õ„¬’{À=@ñ¶\×\ç/iøûù­S\Æþ6Ë¯N&mx^[G\á\êõ}û|–Á®\å¬\Óv/—ÁN­Ç³ü°\ã¬=­þ`;’ã¼´=Á¯\ÆK^\Â};\'C-!k6\Ý$\æ\ê\Ñ\â]ûmZ±Š8Šþ\ç]‘4þ§ñ<ú¸ø“õ]èˆˆˆˆˆˆˆˆˆU+–q\ÖXk\Ìb9=\åy\Û\ã÷¾“ÿ\0A*†\ê\á3VoOš\Ì`\ËÛžÿ\0ù÷Y¬¥¦d&ž7:9¤‘\Î#\æO‚ý\ìS48™òV¶e\Ý1ƒ\è<O\Üÿ\0e¥¢\"\"\"\"\"\"\"\"\"!\0‚\Ú*½™\âõò0{¦Hbo¡@};‚?uW\Æû%\ÄG•7²²\î\ÛA»õv‰\ÚÑ¡‰\ÄÈ¢cY\0kZÑ ¢ûDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD_ÿ\Ù');
/*!40000 ALTER TABLE `references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_listemagytest`
--

DROP TABLE IF EXISTS `t_listemagytest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `t_listemagytest` (
  `CodePersonnel` varchar(255) NOT NULL,
  `Nom` varchar(255) DEFAULT NULL,
  `NomNaissance` varchar(255) DEFAULT NULL,
  `Prenom` varchar(255) DEFAULT NULL,
  `User` varchar(255) DEFAULT NULL,
  `Rue` varchar(255) DEFAULT NULL,
  `CodePostal` varchar(255) DEFAULT NULL,
  `Ville` varchar(255) DEFAULT NULL,
  `Telephone` varchar(255) DEFAULT NULL,
  `DateNaissance` date DEFAULT NULL,
  `DateEmbauche` date DEFAULT NULL,
  `Poste` varchar(255) DEFAULT NULL,
  `PosteAtelier` varchar(255) DEFAULT NULL,
  `AgentRelation` varchar(255) DEFAULT NULL,
  `CategorieProfessionnel` varchar(255) DEFAULT NULL,
  `Coefficient` varchar(255) DEFAULT NULL,
  `Classification` tinytext,
  `NumeroSecuriteSocial` varchar(255) DEFAULT NULL,
  `TypeContrat` tinytext,
  `NatureContrat` tinytext,
  `LieuNaissance` varchar(255) DEFAULT NULL,
  `Nationalite` tinytext,
  `NomConjoint` varchar(255) DEFAULT NULL,
  `PrenomConjoint` varchar(255) DEFAULT NULL,
  `DateNaissanceConjoint` date DEFAULT NULL,
  `ConjointSalarieCPM` tinyint(1) DEFAULT '0',
  `CodePersonnelConjoint` varchar(255) DEFAULT NULL,
  `DateUnionConjoint` date DEFAULT NULL,
  `DateDecesConjoint` date DEFAULT NULL,
  `TypeHoraire` tinytext,
  `Affectation` varchar(255) DEFAULT NULL,
  `SituationMatrimoniale` varchar(255) DEFAULT NULL,
  `DateSituationMatrimoniale` date DEFAULT NULL,
  `NonMagy` tinyint(1) DEFAULT '0',
  `ClientPresent` tinyint(1) DEFAULT '0',
  `Invalidite` tinyint(1) DEFAULT '0',
  `Deces` tinyint(1) DEFAULT '0',
  `LongueMaladie` tinyint(1) DEFAULT '0',
  `DateRadiation` date DEFAULT NULL,
  `MotifRadiation` tinytext,
  `DebutDerniereMutuelle` date DEFAULT NULL,
  `FinDerniereMutuelle` date DEFAULT NULL,
  `CodeOptionMutuelle` varchar(255) DEFAULT NULL,
  `Changement` tinyint(1) DEFAULT '0',
  `Archiver` tinyint(1) DEFAULT '0',
  `dateEquivalence` date DEFAULT NULL,
  `toubib` tinytext,
  `UO` varchar(255) DEFAULT NULL,
  `SPU` varchar(255) DEFAULT NULL,
  `SPU_R` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CodePersonnel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_listemagytest`
--

LOCK TABLES `t_listemagytest` WRITE;
/*!40000 ALTER TABLE `t_listemagytest` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_listemagytest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'meffer'
--
/*!50003 DROP PROCEDURE IF EXISTS `ecrire_controle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_DATE' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `ecrire_controle`(`idPoste` INT, `idRef` INT, `dateHeureControle` DATETIME, `idUser` INT, `resultat` TINYINT(1))
BEGIN
	INSERT INTO `controles` (`poste_id`, `ref_id`, `timestamp`, `user_id`, `resultat`)
    VALUES (`idPoste`, `idRef`, `dateHeureControle`, `idUser`, `resultat`);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-08 13:17:47

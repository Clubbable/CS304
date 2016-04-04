-- MySQL dump 10.13  Distrib 5.6.26, for osx10.10 (x86_64)
--
-- Host: cs304.c0mk5mvcjljr.us-west-2.rds.amazonaws.com    Database: cs304
-- ------------------------------------------------------
-- Server version	5.6.27-log

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
-- Table structure for table `CreditPaymentMethod`
--

DROP TABLE IF EXISTS `CreditPaymentMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CreditPaymentMethod` (
  `CardNumber` char(16) NOT NULL DEFAULT '',
  `expireDate` char(40) DEFAULT NULL,
  PRIMARY KEY (`CardNumber`),
  CONSTRAINT `CreditPaymentMethod_ibfk_1` FOREIGN KEY (`CardNumber`) REFERENCES `PaymentMethod` (`CardNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CreditPaymentMethod`
--

LOCK TABLES `CreditPaymentMethod` WRITE;
/*!40000 ALTER TABLE `CreditPaymentMethod` DISABLE KEYS */;
INSERT INTO `CreditPaymentMethod` VALUES ('1111111111111111','2019-02-20'),('1234346446262363','2015-05-05'),('1234346446262998','2018-09-29'),('1234567890098761','2015-02-01'),('1354747237228254','2011-02-20'),('2344236461464724','2016-02-03'),('3333333333333333','2077-08-22'),('3424234242423423','2016-08-22'),('4444444444444464','2015-03-03');
/*!40000 ALTER TABLE `CreditPaymentMethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DebitPaymentMethod`
--

DROP TABLE IF EXISTS `DebitPaymentMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DebitPaymentMethod` (
  `CardNumber` char(16) NOT NULL DEFAULT '',
  `accountType` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`CardNumber`),
  CONSTRAINT `DebitPaymentMethod_ibfk_1` FOREIGN KEY (`CardNumber`) REFERENCES `PaymentMethod` (`CardNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DebitPaymentMethod`
--

LOCK TABLES `DebitPaymentMethod` WRITE;
/*!40000 ALTER TABLE `DebitPaymentMethod` DISABLE KEYS */;
INSERT INTO `DebitPaymentMethod` VALUES ('2121212121212121','CheckIn'),('2365834562327176','Chequeing'),('3642734523564223','Chequeing'),('4654273446345634','Saving');
/*!40000 ALTER TABLE `DebitPaymentMethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentMethod`
--

DROP TABLE IF EXISTS `PaymentMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaymentMethod` (
  `CardNumber` char(16) NOT NULL DEFAULT '',
  `ownerID` char(40) DEFAULT NULL,
  PRIMARY KEY (`CardNumber`),
  KEY `ownerID` (`ownerID`),
  CONSTRAINT `PaymentMethod_ibfk_1` FOREIGN KEY (`ownerID`) REFERENCES `User` (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentMethod`
--

LOCK TABLES `PaymentMethod` WRITE;
/*!40000 ALTER TABLE `PaymentMethod` DISABLE KEYS */;
INSERT INTO `PaymentMethod` VALUES ('1234346446262998','admin'),('1234567890098761','admin'),('4654273446345634','admin'),('3333333333333333','ianc'),('3424234242423423','ianc'),('4444444444444464','ianc'),('1234346446262363','martin'),('2344236461464724','syl'),('2365834562327176','syl'),('1111111111111111','syltaxue'),('1354747237228254','syltaxue'),('2121212121212121','syltaxue'),('3642734523564223','syltaxue');
/*!40000 ALTER TABLE `PaymentMethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(2000) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `supplierUserID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productID2` (`productID`),
  KEY `supplierUserID` (`supplierUserID`),
  CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`supplierUserID`) REFERENCES `User` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Mac book lablop','Mac book',9000,'electronics','admin'),(2,'Sofa Made in Canada','THE GREAT TOM BOOK 2',8000,'furniture','admin'),(3,'Michael mikey mikey','Michael\'s book of awesomeness',20,'book','admin'),(4,'iPad Pro is more than the next generation of iPad â?? itâ??s an uncompromising vision of personal computing for the modern world. It puts incredible power that leaps past most portable PCs at your fingertips. It makes even complex work as natural as touching, swiping or writing with a pencil. And whether you choose the 12.9-inch model or the new 9.7-inch model, iPad Pro is more capable, versatile and portable than anything thatâ??s come before. In a word, super.','iPad Pro',799,'electronics','admin'),(8,'Important Note: THESE HEADSETS ARE NOT COMPATIBLE WITH PS4, PS3, XBOX 360, only for desktop and old laptop with two 3.5mm jacks. \r\nThe green 3.5mm connector is for the audio, the red one is for the microphone and the USB connector is just for the LED light. \r\n\r\nOverview: \r\nThis KOTION EACH G2000 is a primary kind of gaming headsets, which brings you vivid sound field, sound clarity, sound shock feeling, capable of various games. \r\nIts super soft over-ear pads are more comfortable for long time wear, and they are great headsets for game player! \r\n\r\nTechnical Specifications: \r\nModel: KOTION EACH G2000 \r\nDriver diameter: 50mm \r\nImpedance: 32Ohm \r\nSensitivity: 114dB +/- 3dB \r\nFrequency range: 20-20KHz \r\nMic dimension: 6.0 * 5.0mm \r\nMic sensitivity: -34dB +/- 3dB \r\nMic impedance: 2.2kohm \r\nDirectivity: Omnidirectional \r\nLED working voltage: DC5V +/- 5% \r\nWorking current: Below 100mA \r\nHeadset interface: USB (plug the USB connector, LED light is on, unplug, it off) + 3.5mm stereo \r\nCable length: Approx. 2.2m / 7.22ft \r\nColor: Blue \r\n\r\nPackage Content: \r\n1 * KOTION EACH G2000 Headphone','Professional Stereo Noise Isolation Gaming Headphones Headset Earphones',25.99,'electronics','syltaxue'),(9,'Ipad pro 2','iPad Pro 2',790,'electronics','syltaxue'),(17,'A TV stand will look great under your new smart TV.','TV Stand',200,'furniture','ianc'),(18,'Watch your TV in style with this fancy LayZBoi couch.','Couch',800,'furniture','ianc'),(19,'Steve Jobs last invention.','iPad Micro',9001,'electronics','ianc'),(20,'Jobs\' Car','Jobs\' Mobile',200000,'electronics','ianc');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductFeedback`
--

DROP TABLE IF EXISTS `ProductFeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductFeedback` (
  `FeedbackID` int(11) NOT NULL AUTO_INCREMENT,
  `FeedBackDate` datetime DEFAULT NULL,
  `FeedBackComment` varchar(1200) DEFAULT NULL,
  `rateStar` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `FeedBackTitle` varchar(40) DEFAULT NULL,
  `CustomerUserID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `ProductFeedback_ibfk_1` (`productID`),
  KEY `ProductFeedback_ibfk_3` (`CustomerUserID`),
  CONSTRAINT `ProductFeedback_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `Product` (`productID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ProductFeedback_ibfk_3` FOREIGN KEY (`CustomerUserID`) REFERENCES `User` (`userName`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductFeedback`
--

LOCK TABLES `ProductFeedback` WRITE;
/*!40000 ALTER TABLE `ProductFeedback` DISABLE KEYS */;
INSERT INTO `ProductFeedback` VALUES (1,'2015-02-23 00:00:00','Piece of trash',0,3,'Good','admin'),(2,'2015-01-24 00:00:00','Useless AF',0,3,'OK','admin'),(3,'2014-11-23 00:00:00','Godly AF',5,3,'Very enjoyable','admin'),(4,'2008-02-23 00:00:00','Why so much garbage?',2,2,'Nice product','admin'),(5,'2009-12-16 00:00:00','Sorta ok',5,1,'kinda ok','admin'),(7,'2015-02-23 00:00:00','Piece of trash',0,3,'Good','123'),(11,'2016-04-02 15:27:00','By that I mean I am not pro enough.',1,4,'Not pro enough','ianc'),(12,'2016-04-03 05:11:34','It\'s simply the best.',5,4,'The Best','ianc'),(13,'2016-04-03 06:23:54','Too micro',2,19,'Not as advertised','ianc'),(14,'2016-04-03 07:31:50','HA get it!!!',5,17,'Standard','ianc');
/*!40000 ALTER TABLE `ProductFeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Purchase`
--

DROP TABLE IF EXISTS `Purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Purchase` (
  `OrderNumber` int(11) NOT NULL AUTO_INCREMENT,
  `ShippingAddress` varchar(40) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `CardNumber` char(16) DEFAULT NULL,
  `purchaseDate` datetime DEFAULT NULL,
  `CustomerUserID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`OrderNumber`),
  UNIQUE KEY `id` (`OrderNumber`),
  KEY `CardNumber` (`CardNumber`),
  KEY `CustomerUserID` (`CustomerUserID`),
  KEY `Purchase_ibfk_1` (`productID`),
  CONSTRAINT `Purchase_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `Product` (`productID`) ON DELETE CASCADE,
  CONSTRAINT `Purchase_ibfk_2` FOREIGN KEY (`CardNumber`) REFERENCES `PaymentMethod` (`CardNumber`),
  CONSTRAINT `Purchase_ibfk_4` FOREIGN KEY (`CustomerUserID`) REFERENCES `User` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Purchase`
--

LOCK TABLES `Purchase` WRITE;
/*!40000 ALTER TABLE `Purchase` DISABLE KEYS */;
INSERT INTO `Purchase` VALUES (1,'678 Nani Street',1,'1234346446262363','2009-12-13 00:00:00','martin'),(2,'467 Nani Street',2,'4654273446345634','2008-02-15 00:00:00','admin'),(3,'3457 Nani Street',3,'4654273446345634','2014-10-15 00:00:00','admin'),(4,'45686 Nani Street',3,'4654273446345634','2015-02-15 00:00:00','admin'),(13,'2250 West 8th Ave, Vancouver, BC',1,'1354747237228254','2016-04-01 18:44:11','syltaxue'),(14,'Some address,',8,'1234567890098761','2016-04-01 20:39:12','admin'),(16,'2901 E 4th Ave',4,'1111111111111111','2016-04-02 00:40:04','syltaxue'),(19,'mccain dr',3,'3424234242423423','2016-04-02 15:09:12','ianc'),(20,'mccain dr',3,'3424234242423423','2016-04-02 15:09:41','ianc'),(22,'mccain dr',4,'3424234242423423','2016-04-02 15:23:30','ianc'),(25,'test addr',4,'3333333333333333','2016-04-02 16:56:31','ianc'),(26,'Mc\'Cain Dr',3,'3333333333333333','2016-04-03 05:36:41','ianc'),(29,'2205 Lower Mall',3,'3333333333333333','2016-04-03 06:16:52','ianc'),(30,'6 W. 107th Street - 5B',3,'3333333333333333','2016-04-03 06:21:00','ianc'),(31,'6 W. 107th Street - 5B',3,'3333333333333333','2016-04-03 06:21:30','ianc'),(32,'6 W. 107th Street - 5B',19,'3424234242423423','2016-04-03 06:23:17','ianc'),(33,'2205 Lower Mall',17,'3333333333333333','2016-04-03 07:31:02','ianc'),(34,'2205 Lower Mall',3,'3424234242423423','2016-04-03 07:33:52','ianc'),(35,'2205 Lower Mall',18,'3333333333333333','2016-04-03 07:49:54','ianc'),(36,'2205 Lower Mall',1,'3424234242423423','2016-04-03 09:15:33','ianc'),(37,'2205 Lower Mall',17,'1111111111111111','2016-04-03 16:08:03','ianc');
/*!40000 ALTER TABLE `Purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SupplierFeedback`
--

DROP TABLE IF EXISTS `SupplierFeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SupplierFeedback` (
  `FeedbackID` int(11) NOT NULL AUTO_INCREMENT,
  `FeedBackDate` datetime DEFAULT NULL,
  `FeedBackComment` varchar(40) DEFAULT NULL,
  `rateStar` int(11) DEFAULT NULL,
  `CustomerUserID` varchar(40) DEFAULT NULL,
  `supplierUserID` varchar(40) DEFAULT NULL,
  `FeedbackTitle` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `CustomerUserID` (`CustomerUserID`),
  KEY `supplierUserID` (`supplierUserID`),
  CONSTRAINT `SupplierFeedback_ibfk_1` FOREIGN KEY (`CustomerUserID`) REFERENCES `User` (`userName`),
  CONSTRAINT `SupplierFeedback_ibfk_2` FOREIGN KEY (`supplierUserID`) REFERENCES `User` (`userName`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SupplierFeedback`
--

LOCK TABLES `SupplierFeedback` WRITE;
/*!40000 ALTER TABLE `SupplierFeedback` DISABLE KEYS */;
INSERT INTO `SupplierFeedback` VALUES (2,'2015-01-25 00:00:00','Useless AF',0,'syl','admin','This seller is bad'),(3,'2014-11-24 00:00:00','Godly AF',5,'syl','admin','This seller is good'),(4,'2008-02-24 00:00:00','Why so much garbage?',2,'syl','admin','I dont like this guy'),(5,'2009-12-17 00:00:00','Sorta ok',5,'syl','admin','Kinda ok'),(8,'2016-04-02 15:25:49','delivered slow',5,'ianc','admin','slow delivery'),(9,'2016-04-02 15:35:18','bad',5,'ianc','ianc','bad'),(10,'2016-04-03 05:14:46','best seller ever',5,'ianc','admin','You\'re good');
/*!40000 ALTER TABLE `SupplierFeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `userName` varchar(40) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `firstName` varchar(40) DEFAULT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('123','123','123','123'),('1234','1234','123','123'),('admin','admin','Kenneth','Song'),('ian\'cll','ianc1993','Clelland','Ian'),('ian.clelland','ianc1993','Clelland','Ian'),('ianc','ianc1993','Ian','Clelland'),('ianc100','ianc1993','Clelland','Ian'),('ianc89','ianc1993','Clelland','Ian'),('ianc98','ianc1993','Clelland','Ian'),('ianc99','ianc1993','Clelland','Ian'),('iancll','ianc1993','Ianion','Clellandia'),('Jim','dhth','Jim','ASD'),('martin','martin','Martin','Liu'),('Mary','edfg','Mary','m'),('Micheal','abcd','Micheal','mi'),('Micheal\'s BookStore','abcd','Micheal\'s BookStore','231'),('newacc','newacc','First','Last'),('syl','syl','kenneth','song'),('syltaxue','syltaxue','Song','Kenneth'),('Tom DA GREAT SUPPLIER','dadh','GREAT SUPPLIER','1');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-03 17:18:53

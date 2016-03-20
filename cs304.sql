/*
SQLyog Community v12.09 (64 bit)
MySQL - 5.6.27-log : Database - cs304
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cs304` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cs304`;

/*Table structure for table `CreditPaymentMethod` */

DROP TABLE IF EXISTS `CreditPaymentMethod`;

CREATE TABLE `CreditPaymentMethod` (
  `CardNumber` char(16) NOT NULL DEFAULT '',
  `expireDate` datetime DEFAULT NULL,
  PRIMARY KEY (`CardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `CreditPaymentMethod` */

insert  into `CreditPaymentMethod`(`CardNumber`,`expireDate`) values ('1234346446262363','2015-02-03 00:00:00'),('1354747237228254','2018-02-03 00:00:00'),('1464235423453446','2017-02-03 00:00:00'),('2344236461464724','2016-02-03 00:00:00'),('4586705788880644','2019-02-03 00:00:00');

/*Table structure for table `Customer` */

DROP TABLE IF EXISTS `Customer`;

CREATE TABLE `Customer` (
  `userID` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `Customer` */

insert  into `Customer`(`userID`,`userName`,`password`,`name`,`address`) values (1,'Micheal','abcd','Micheal','123 Hi Street'),(2,'Mary','edfg','Mary','456 Hi Street'),(5,'Jim','dhth','Jim','789 Hi Street');

/*Table structure for table `DebitPaymentMethod` */

DROP TABLE IF EXISTS `DebitPaymentMethod`;

CREATE TABLE `DebitPaymentMethod` (
  `CardNumber` char(16) NOT NULL DEFAULT '',
  `accountType` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`CardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `DebitPaymentMethod` */

insert  into `DebitPaymentMethod`(`CardNumber`,`accountType`) values ('2365834562327175','Chequeing'),('3642734523564223','Chequeing'),('4654273446345634','Saving');

/*Table structure for table `PaymentMethod` */

DROP TABLE IF EXISTS `PaymentMethod`;

CREATE TABLE `PaymentMethod` (
  `CardNumber` char(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`CardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `PaymentMethod` */

insert  into `PaymentMethod`(`CardNumber`) values ('1234346446262363'),('1354747237228254'),('1464235423453446'),('2344236461464724'),('2365834562327175'),('3642734523564223'),('4586705788880644'),('4654273446345634');

/*Table structure for table `Product` */

DROP TABLE IF EXISTS `Product`;

CREATE TABLE `Product` (
  `productID` int(11) NOT NULL DEFAULT '0',
  `description` varchar(40) DEFAULT NULL,
  `title` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `supplierUserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  KEY `supplierUserID` (`supplierUserID`),
  CONSTRAINT `Product_ibfk_1` FOREIGN KEY (`supplierUserID`) REFERENCES `Supplier` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `Product` */

insert  into `Product`(`productID`,`description`,`title`,`price`,`supplierUserID`) values (1,'Tommy tom tom','THE GREAT TOM BOOK',9000,3),(2,'Tommy tom tom 2 ','THE GREAT TOM BOOK 2',8000,3),(3,'Michael mikey mikey','Michael\'s book of awesomeness',4555.34,4);

/*Table structure for table `ProductFeedback` */

DROP TABLE IF EXISTS `ProductFeedback`;

CREATE TABLE `ProductFeedback` (
  `FeedbackID` int(11) NOT NULL DEFAULT '0',
  `FeedBackDate` datetime DEFAULT NULL,
  `FeedBackComment` varchar(40) DEFAULT NULL,
  `rateStar` int(11) DEFAULT NULL,
  `CustomerUserID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `productID` (`productID`),
  KEY `CustomerUserID` (`CustomerUserID`),
  CONSTRAINT `ProductFeedback_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `Product` (`productID`),
  CONSTRAINT `ProductFeedback_ibfk_2` FOREIGN KEY (`CustomerUserID`) REFERENCES `Customer` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ProductFeedback` */

insert  into `ProductFeedback`(`FeedbackID`,`FeedBackDate`,`FeedBackComment`,`rateStar`,`CustomerUserID`,`productID`) values (1,'2015-02-23 00:00:00','Piece of trash',0,5,3),(2,'2015-01-24 00:00:00','Useless AF',0,2,3),(3,'2014-11-23 00:00:00','Godly AF',10,1,3),(4,'2008-02-23 00:00:00','Why so much garbage?',2,5,2),(5,'2009-12-16 00:00:00','Sorta ok',5,2,1);

/*Table structure for table `Purchase` */

DROP TABLE IF EXISTS `Purchase`;

CREATE TABLE `Purchase` (
  `ShippingNumber` int(11) NOT NULL DEFAULT '0',
  `custShippingAddress` varchar(40) DEFAULT NULL,
  `supShippingAddress` varchar(40) DEFAULT NULL,
  `OrderNumber` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `CardNumber` char(16) DEFAULT NULL,
  `CustomerUserID` int(11) DEFAULT NULL,
  `purchaseDate` datetime DEFAULT NULL,
  PRIMARY KEY (`ShippingNumber`),
  KEY `productID` (`productID`),
  KEY `CardNumber` (`CardNumber`),
  KEY `CustomerUserID` (`CustomerUserID`),
  CONSTRAINT `Purchase_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `Product` (`productID`),
  CONSTRAINT `Purchase_ibfk_2` FOREIGN KEY (`CardNumber`) REFERENCES `PaymentMethod` (`CardNumber`),
  CONSTRAINT `Purchase_ibfk_3` FOREIGN KEY (`CustomerUserID`) REFERENCES `Customer` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `Purchase` */

insert  into `Purchase`(`ShippingNumber`,`custShippingAddress`,`supShippingAddress`,`OrderNumber`,`productID`,`CardNumber`,`CustomerUserID`,`purchaseDate`) values (1,'234 Waja Street','678 Nani Street',1,1,'1234346446262363',2,'2009-12-13 00:00:00'),(2,'345 Waja Street','467 Nani Street',3,2,'1354747237228254',5,'2008-02-15 00:00:00'),(3,'1262 Waja Street','3457 Nani Street',5,3,'1354747237228254',1,'2014-10-15 00:00:00'),(4,'4623 Waja Street','45686 Nani Street',9,3,'4654273446345634',2,'2015-02-15 00:00:00');

/*Table structure for table `Supplier` */

DROP TABLE IF EXISTS `Supplier`;

CREATE TABLE `Supplier` (
  `userID` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `region` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `Supplier` */

insert  into `Supplier`(`userID`,`userName`,`password`,`name`,`region`) values (3,'Tom DA GREAT SUPPLIER','dadh','GREAT SUPPLIER','North America'),(4,'Micheal\'s BookStore','abcd','Micheal\'s BookStore','Europe');

/*Table structure for table `SupplierFeedback` */

DROP TABLE IF EXISTS `SupplierFeedback`;

CREATE TABLE `SupplierFeedback` (
  `FeedbackID` int(11) NOT NULL DEFAULT '0',
  `FeedBackDate` datetime DEFAULT NULL,
  `FeedBackComment` varchar(40) DEFAULT NULL,
  `rateStar` int(11) DEFAULT NULL,
  `CustomerUserID` int(11) DEFAULT NULL,
  `supplierUserID` int(11) DEFAULT NULL,
  PRIMARY KEY (`FeedbackID`),
  KEY `supplierUserID` (`supplierUserID`),
  KEY `CustomerUserID` (`CustomerUserID`),
  CONSTRAINT `SupplierFeedback_ibfk_1` FOREIGN KEY (`supplierUserID`) REFERENCES `Supplier` (`userID`),
  CONSTRAINT `SupplierFeedback_ibfk_2` FOREIGN KEY (`CustomerUserID`) REFERENCES `Customer` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `SupplierFeedback` */

insert  into `SupplierFeedback`(`FeedbackID`,`FeedBackDate`,`FeedBackComment`,`rateStar`,`CustomerUserID`,`supplierUserID`) values (6,'2015-02-24 00:00:00','Trash Supplier',0,5,3),(7,'2015-01-25 00:00:00','Useless AF',0,2,3),(8,'2014-11-24 00:00:00','Godly AF',10,1,3),(9,'2008-02-24 00:00:00','Why so much garbage?',2,5,4),(10,'2009-12-17 00:00:00','Sorta ok',5,2,3);

/*Table structure for table `User` */

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `userID` int(11) NOT NULL DEFAULT '0',
  `userName` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `User` */

insert  into `User`(`userID`,`userName`,`password`,`name`) values (1,'Micheal','abcd','Micheal'),(2,'Mary','edfg','Mary'),(3,'Tom DA GREAT SUPPLIER','dadh','GREAT SUPPLIER'),(4,'Micheal\'s BookStore','abcd','Micheal\'s BookStore'),(5,'Jim','dhth','Jim');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

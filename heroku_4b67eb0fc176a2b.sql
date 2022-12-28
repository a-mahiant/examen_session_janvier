-- -------------------------------------------------------------
-- TablePlus 5.1.0(468)
--
-- https://tableplus.com/
--
-- Database: heroku_4b67eb0fc176a2b
-- Generation Time: 2022-12-28 22:19:56.6310
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cities` (
  `name_city` char(30) NOT NULL,
  `pop_density` int(11) NOT NULL,
  `leading_party` text NOT NULL,
  `spoken_lang_id` int(11) NOT NULL,
  PRIMARY KEY (`name_city`),
  KEY `spoken_lang_id` (`spoken_lang_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`spoken_lang_id`) REFERENCES `spoken_lang` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `nbr_inscript` int(11) NOT NULL DEFAULT '1',
  `approved` binary(1) DEFAULT '0',
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `element_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` char(255) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `name_city` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_city` (`name_city`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`name_city`) REFERENCES `cities` (`name_city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `URL` text NOT NULL,
  `code_photo` text NOT NULL,
  `element_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `element_id` (`element_id`),
  CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`element_id`) REFERENCES `element` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `processes` (
  `admin_id` int(11) NOT NULL,
  `element_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`admin_id`,`element_id`),
  KEY `element_id` (`element_id`),
  CONSTRAINT `processes_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `processes_ibfk_2` FOREIGN KEY (`element_id`) REFERENCES `element` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `spoken_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_visit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `element_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `element_id` (`element_id`),
  CONSTRAINT `visitor_ibfk_1` FOREIGN KEY (`element_id`) REFERENCES `element` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
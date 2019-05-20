-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 15 May 2019, 18:40:54
-- Sunucu sürümü: 5.7.23
-- PHP Sürümü: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `homework`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(50) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `country_name` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `country_name`) VALUES
(1000, 'Moskow', 'Russia'),
(1001, 'Ankara', 'Turkey');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `consits_of_cities`
--

DROP TABLE IF EXISTS `consits_of_cities`;
CREATE TABLE IF NOT EXISTS `consits_of_cities` (
  `country_name` varchar(50) NOT NULL,
  `city_id` int(11) NOT NULL,
  KEY `country_name` (`country_name`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `consits_of_cities`
--

INSERT INTO `consits_of_cities` (`country_name`, `city_id`) VALUES
('Russia', 1000),
('Turkey', 1001);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `consits_of_hospitals`
--

DROP TABLE IF EXISTS `consits_of_hospitals`;
CREATE TABLE IF NOT EXISTS `consits_of_hospitals` (
  `hospital_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  KEY `hospital_id` (`hospital_id`),
  KEY `trip_id` (`trip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `consits_of_hospitals`
--

INSERT INTO `consits_of_hospitals` (`hospital_id`, `trip_id`) VALUES
(1000, 1001);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_name` varchar(50) NOT NULL,
  PRIMARY KEY (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `country`
--

INSERT INTO `country` (`country_name`) VALUES
('Russia'),
('Turkey');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) NOT NULL,
  `years_of_experience` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `hospital_id` (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `doctor`
--

INSERT INTO `doctor` (`emp_id`, `age`, `years_of_experience`, `hospital_id`) VALUES
(1000, 43, 19, 1000),
(1001, 26, 2, 1001);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `doctor_language`
--

DROP TABLE IF EXISTS `doctor_language`;
CREATE TABLE IF NOT EXISTS `doctor_language` (
  `emp_id` int(11) NOT NULL,
  `language` varchar(50) NOT NULL,
  PRIMARY KEY (`language`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `doctor_language`
--

INSERT INTO `doctor_language` (`emp_id`, `language`) VALUES
(1000, 'English'),
(1000, 'Turkish'),
(1001, 'French'),
(1001, 'Spanish');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `doctor_name`
--

DROP TABLE IF EXISTS `doctor_name`;
CREATE TABLE IF NOT EXISTS `doctor_name` (
  `emp_id` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  UNIQUE KEY `firstName` (`firstName`),
  UNIQUE KEY `lastName` (`lastName`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `doctor_name`
--

INSERT INTO `doctor_name` (`emp_id`, `firstName`, `lastName`) VALUES
(1000, 'Ahmet', 'Turkmen'),
(1001, 'Hasan', 'Ay');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `has_hospitals`
--

DROP TABLE IF EXISTS `has_hospitals`;
CREATE TABLE IF NOT EXISTS `has_hospitals` (
  `hospital_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  KEY `hospital_id` (`hospital_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `has_hospitals`
--

INSERT INTO `has_hospitals` (`hospital_id`, `emp_id`) VALUES
(1000, 1000),
(1000, 1000);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `hospital`
--

DROP TABLE IF EXISTS `hospital`;
CREATE TABLE IF NOT EXISTS `hospital` (
  `hospital_id` int(11) NOT NULL AUTO_INCREMENT,
  `hospital_name` varchar(50) NOT NULL,
  `rank` int(50) NOT NULL,
  `foundation_year` varchar(50) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  PRIMARY KEY (`hospital_id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `hospital`
--

INSERT INTO `hospital` (`hospital_id`, `hospital_name`, `rank`, `foundation_year`, `city_id`) VALUES
(1000, 'Hacettepe University', 4, '1967', 1001),
(1001, 'Maternity Hospital of Abrikosova ', 3, '1862', 1000),
(1002, 'Numune Hospital', 2, '1986', 1001),
(1003, 'Dikmen Policlinic', 3, '1985', 1001);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `includes_countries`
--

DROP TABLE IF EXISTS `includes_countries`;
CREATE TABLE IF NOT EXISTS `includes_countries` (
  `trip_id` int(11) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  KEY `trip_id` (`trip_id`),
  KEY `country_name` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `includes_countries`
--

INSERT INTO `includes_countries` (`trip_id`, `country_name`) VALUES
(1001, 'Turkey'),
(1001, 'Turkey'),
(1001, 'Russia');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `practitioner`
--

DROP TABLE IF EXISTS `practitioner`;
CREATE TABLE IF NOT EXISTS `practitioner` (
  `emp_id` int(11) NOT NULL,
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `practitioner`
--

INSERT INTO `practitioner` (`emp_id`) VALUES
(1001);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `private_hospital`
--

DROP TABLE IF EXISTS `private_hospital`;
CREATE TABLE IF NOT EXISTS `private_hospital` (
  `hospital_id` int(11) NOT NULL,
  KEY `hospital_id` (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `private_hospital`
--

INSERT INTO `private_hospital` (`hospital_id`) VALUES
(1003);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `private_hospital_fee`
--

DROP TABLE IF EXISTS `private_hospital_fee`;
CREATE TABLE IF NOT EXISTS `private_hospital_fee` (
  `hospital_id` int(11) NOT NULL,
  `service_fee` varchar(50) NOT NULL,
  PRIMARY KEY (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `private_hospital_fee`
--

INSERT INTO `private_hospital_fee` (`hospital_id`, `service_fee`) VALUES
(1003, '200$, 50$, 10$');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `public_hospital`
--

DROP TABLE IF EXISTS `public_hospital`;
CREATE TABLE IF NOT EXISTS `public_hospital` (
  `hospital_id` int(11) NOT NULL,
  KEY `hospital_id` (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `public_hospital`
--

INSERT INTO `public_hospital` (`hospital_id`) VALUES
(1002);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `public_hospital_department`
--

DROP TABLE IF EXISTS `public_hospital_department`;
CREATE TABLE IF NOT EXISTS `public_hospital_department` (
  `hospital_id` int(11) NOT NULL,
  `department` varchar(50) NOT NULL,
  UNIQUE KEY `department` (`department`),
  KEY `hospital_id` (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `public_hospital_department`
--

INSERT INTO `public_hospital_department` (`hospital_id`, `department`) VALUES
(1002, 'Eye'),
(1002, 'General Surgery');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `rating`
--

DROP TABLE IF EXISTS `rating`;
CREATE TABLE IF NOT EXISTS `rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` int(50) NOT NULL,
  `Service` int(50) NOT NULL,
  `Gentility` int(50) NOT NULL,
  `Comment` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  PRIMARY KEY (`rating_id`),
  KEY `user_id` (`user_id`),
  KEY `hospital_id` (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `rating`
--

INSERT INTO `rating` (`rating_id`, `location`, `Service`, `Gentility`, `Comment`, `user_id`, `hospital_id`) VALUES
(1, 3, 4, 5, NULL, 1000, 1000),
(2, 2, 5, 4, 'Location is bad', 1001, 1001);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `research_hospital`
--

DROP TABLE IF EXISTS `research_hospital`;
CREATE TABLE IF NOT EXISTS `research_hospital` (
  `hospital_id` int(11) NOT NULL,
  `research_num` int(50) NOT NULL,
  KEY `hospital_id` (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `research_hospital`
--

INSERT INTO `research_hospital` (`hospital_id`, `research_num`) VALUES
(1000, 3),
(1001, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `research_hospital_researchtopic`
--

DROP TABLE IF EXISTS `research_hospital_researchtopic`;
CREATE TABLE IF NOT EXISTS `research_hospital_researchtopic` (
  `hospital_id` int(11) NOT NULL,
  `research_topic` varchar(50) NOT NULL,
  UNIQUE KEY `research_topic` (`research_topic`),
  KEY `hospital_id` (`hospital_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `research_hospital_researchtopic`
--

INSERT INTO `research_hospital_researchtopic` (`hospital_id`, `research_topic`) VALUES
(1000, 'Cardiology'),
(1000, 'Cloning'),
(1000, 'General Surgery'),
(1001, 'Surgery with 5G technologies');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reserves`
--

DROP TABLE IF EXISTS `reserves`;
CREATE TABLE IF NOT EXISTS `reserves` (
  `user_id` int(11) NOT NULL,
  `trip_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `trip_id` (`trip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `reserves`
--

INSERT INTO `reserves` (`user_id`, `trip_id`) VALUES
(1000, 1001),
(1001, 1000);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `surgeon`
--

DROP TABLE IF EXISTS `surgeon`;
CREATE TABLE IF NOT EXISTS `surgeon` (
  `emp_id` int(11) NOT NULL,
  `num_of_surgeries` int(11) NOT NULL,
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `surgeon`
--

INSERT INTO `surgeon` (`emp_id`, `num_of_surgeries`) VALUES
(1000, 8);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `surgeon_speciality`
--

DROP TABLE IF EXISTS `surgeon_speciality`;
CREATE TABLE IF NOT EXISTS `surgeon_speciality` (
  `emp_id` int(11) NOT NULL,
  `speciality` varchar(50) NOT NULL,
  UNIQUE KEY `speciality` (`speciality`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `surgeon_speciality`
--

INSERT INTO `surgeon_speciality` (`emp_id`, `speciality`) VALUES
(1000, 'Cardiologist'),
(1000, 'Urologist');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `trip`
--

DROP TABLE IF EXISTS `trip`;
CREATE TABLE IF NOT EXISTS `trip` (
  `trip_id` int(11) NOT NULL AUTO_INCREMENT,
  `starting_date` varchar(50) NOT NULL,
  `ending_date` varchar(50) NOT NULL,
  PRIMARY KEY (`trip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `trip`
--

INSERT INTO `trip` (`trip_id`, `starting_date`, `ending_date`) VALUES
(1000, '12.06.2019', '20.06.2019'),
(1001, '09.07.2019', '02.08.2019');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `trip_location`
--

DROP TABLE IF EXISTS `trip_location`;
CREATE TABLE IF NOT EXISTS `trip_location` (
  `trip_id` int(11) NOT NULL,
  `location` varchar(50) NOT NULL,
  PRIMARY KEY (`location`),
  KEY `trip_id` (`trip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `trip_location`
--

INSERT INTO `trip_location` (`trip_id`, `location`) VALUES
(1000, 'Ankara'),
(1000, 'Moscow'),
(1001, 'Milano');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `num_of_trip` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`, `gender`, `num_of_trip`) VALUES
(1000, 'apeker', 'apeker@hotmail.com', '199523', 'male', 3),
(1001, 'tbayeshov', 'tb@gmail.com', '2041226', 'male', 8),
(1002, 'tzaferler', 'taicho@gmail.com', 'taicho2', 'female', 5),
(1003, 'ccbalci', 'ccb@gmail.com', 'malatya44', 'male', 6),
(1004, 'quaresma', 'q7@hotmail.com', '19031904', 'male', 1234);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `worksfor`
--

DROP TABLE IF EXISTS `worksfor`;
CREATE TABLE IF NOT EXISTS `worksfor` (
  `hospital_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  KEY `hospital_id` (`hospital_id`),
  KEY `emp_id` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `worksfor`
--

INSERT INTO `worksfor` (`hospital_id`, `emp_id`) VALUES
(1000, 1000);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_name`) REFERENCES `country` (`country_name`);

--
-- Tablo kısıtlamaları `consits_of_cities`
--
ALTER TABLE `consits_of_cities`
  ADD CONSTRAINT `consits_of_cities_ibfk_1` FOREIGN KEY (`country_name`) REFERENCES `country` (`country_name`),
  ADD CONSTRAINT `consits_of_cities_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

--
-- Tablo kısıtlamaları `consits_of_hospitals`
--
ALTER TABLE `consits_of_hospitals`
  ADD CONSTRAINT `consits_of_hospitals_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`),
  ADD CONSTRAINT `consits_of_hospitals_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`);

--
-- Tablo kısıtlamaları `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`);

--
-- Tablo kısıtlamaları `doctor_language`
--
ALTER TABLE `doctor_language`
  ADD CONSTRAINT `doctor_language_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `doctor` (`emp_id`);

--
-- Tablo kısıtlamaları `doctor_name`
--
ALTER TABLE `doctor_name`
  ADD CONSTRAINT `doctor_name_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `doctor` (`emp_id`);

--
-- Tablo kısıtlamaları `has_hospitals`
--
ALTER TABLE `has_hospitals`
  ADD CONSTRAINT `has_hospitals_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`),
  ADD CONSTRAINT `has_hospitals_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `doctor` (`emp_id`);

--
-- Tablo kısıtlamaları `hospital`
--
ALTER TABLE `hospital`
  ADD CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

--
-- Tablo kısıtlamaları `includes_countries`
--
ALTER TABLE `includes_countries`
  ADD CONSTRAINT `includes_countries_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`),
  ADD CONSTRAINT `includes_countries_ibfk_2` FOREIGN KEY (`country_name`) REFERENCES `country` (`country_name`);

--
-- Tablo kısıtlamaları `practitioner`
--
ALTER TABLE `practitioner`
  ADD CONSTRAINT `practitioner_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `doctor` (`emp_id`);

--
-- Tablo kısıtlamaları `private_hospital`
--
ALTER TABLE `private_hospital`
  ADD CONSTRAINT `private_hospital_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`);

--
-- Tablo kısıtlamaları `public_hospital`
--
ALTER TABLE `public_hospital`
  ADD CONSTRAINT `public_hospital_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`);

--
-- Tablo kısıtlamaları `public_hospital_department`
--
ALTER TABLE `public_hospital_department`
  ADD CONSTRAINT `public_hospital_department_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`);

--
-- Tablo kısıtlamaları `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`);

--
-- Tablo kısıtlamaları `research_hospital`
--
ALTER TABLE `research_hospital`
  ADD CONSTRAINT `research_hospital_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`);

--
-- Tablo kısıtlamaları `research_hospital_researchtopic`
--
ALTER TABLE `research_hospital_researchtopic`
  ADD CONSTRAINT `research_hospital_researchtopic_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`);

--
-- Tablo kısıtlamaları `reserves`
--
ALTER TABLE `reserves`
  ADD CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `reserves_ibfk_2` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`);

--
-- Tablo kısıtlamaları `surgeon`
--
ALTER TABLE `surgeon`
  ADD CONSTRAINT `surgeon_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `doctor` (`emp_id`);

--
-- Tablo kısıtlamaları `surgeon_speciality`
--
ALTER TABLE `surgeon_speciality`
  ADD CONSTRAINT `surgeon_speciality_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `doctor` (`emp_id`);

--
-- Tablo kısıtlamaları `trip_location`
--
ALTER TABLE `trip_location`
  ADD CONSTRAINT `trip_location_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trip` (`trip_id`);

--
-- Tablo kısıtlamaları `worksfor`
--
ALTER TABLE `worksfor`
  ADD CONSTRAINT `worksfor_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`),
  ADD CONSTRAINT `worksfor_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `doctor` (`emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

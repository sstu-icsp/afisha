-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 19 2016 г., 12:52
-- Версия сервера: 5.5.25
-- Версия PHP: 5.6.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `afisha`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blacklist`
--

CREATE TABLE IF NOT EXISTS `blacklist` (
  `idBlackList` int(11) NOT NULL AUTO_INCREMENT,
  `idUsers` int(11) NOT NULL,
  `unbanTime` datetime NOT NULL,
  `banReason` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idBlackList`),
  KEY `FK_BlackList_Users_idx` (`idUsers`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `blacklist`
--

INSERT INTO `blacklist` (`idBlackList`, `idUsers`, `unbanTime`, `banReason`) VALUES
(1, 3, '1900-02-02 00:00:00', 'TestBan');

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE IF NOT EXISTS `cities` (
  `idCities` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(45) NOT NULL,
  PRIMARY KEY (`idCities`),
  UNIQUE KEY `city_UNIQUE` (`city`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`idCities`, `city`) VALUES
(1, 'city1'),
(2, 'city2'),
(3, 'city3');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `idEvents` int(11) NOT NULL,
  `idUsers` int(11) NOT NULL,
  `comment` blob NOT NULL,
  PRIMARY KEY (`idEvents`,`idUsers`),
  KEY `FK_Comments_Users_idx` (`idUsers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`idEvents`, `idUsers`, `comment`) VALUES
(1, 1, 0x54657374436f6d6d656e74);

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `idEvents` int(11) NOT NULL AUTO_INCREMENT,
  `idTypes` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `idCities` int(11) NOT NULL,
  `coords` point DEFAULT NULL,
  `description` blob,
  `idImages` int(11) DEFAULT NULL,
  `idUserCreator` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEvents`),
  UNIQUE KEY `idImages_UNIQUE` (`idImages`),
  KEY `FK_Events_Types_idx` (`idTypes`),
  KEY `FK_Events_Cities_idx` (`idCities`),
  KEY `FK_Events_Users_idx` (`idUserCreator`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`idEvents`, `idTypes`, `title`, `date`, `idCities`, `coords`, `description`, `idImages`, `idUserCreator`) VALUES
(1, 1, 'Event1', '1900-02-02 00:00:00', 1, NULL, NULL, 1, 2),
(2, 2, 'Event2', '1900-02-02 00:00:00', 2, NULL, NULL, NULL, 3),
(4, 4, 'Event4', '1900-02-02 00:00:00', 1, NULL, NULL, NULL, 3),
(6, 6, 'Event6', '1900-02-02 00:00:00', 3, NULL, NULL, NULL, 1),
(8, 2, 'Event8', '1900-02-02 00:00:00', 2, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `events_users`
--

CREATE TABLE IF NOT EXISTS `events_users` (
  `idEvents` int(11) NOT NULL,
  `idUsers` int(11) NOT NULL,
  PRIMARY KEY (`idEvents`,`idUsers`),
  KEY `fk_Events_has_Users_Users1_idx` (`idUsers`),
  KEY `fk_Events_has_Users_Events1_idx` (`idEvents`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `events_users`
--

INSERT INTO `events_users` (`idEvents`, `idUsers`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `gender`
--

CREATE TABLE IF NOT EXISTS `gender` (
  `idGender` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(11) NOT NULL,
  PRIMARY KEY (`idGender`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `gender`
--

INSERT INTO `gender` (`idGender`, `gender`) VALUES
(1, 'Мужской'),
(2, 'Женский'),
(3, 'Не определе');

-- --------------------------------------------------------

--
-- Структура таблицы `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `idImages` int(11) NOT NULL AUTO_INCREMENT,
  `pathAddress` varchar(255) NOT NULL,
  PRIMARY KEY (`idImages`),
  UNIQUE KEY `pathAddress_UNIQUE` (`pathAddress`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `images`
--

INSERT INTO `images` (`idImages`, `pathAddress`) VALUES
(1, 'C://'),
(3, 'D:\\2.png'),
(2, 'D:\\\\1.png');

-- --------------------------------------------------------

--
-- Структура таблицы `prefer_user_genres`
--

CREATE TABLE IF NOT EXISTS `prefer_user_genres` (
  `idUsers` int(11) NOT NULL,
  `idTypes` int(11) NOT NULL,
  PRIMARY KEY (`idUsers`,`idTypes`),
  KEY `fk_Users_has_Types_Types1_idx` (`idTypes`),
  KEY `fk_Users_has_Types_Users1_idx` (`idUsers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `prefer_user_genres`
--

INSERT INTO `prefer_user_genres` (`idUsers`, `idTypes`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `ratings`
--

CREATE TABLE IF NOT EXISTS `ratings` (
  `idUsers` int(11) NOT NULL,
  `idEvents` int(11) NOT NULL,
  `rating` decimal(3,2) NOT NULL,
  PRIMARY KEY (`idUsers`,`idEvents`),
  KEY `FK_Ratings_Events_idx` (`idEvents`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ratings`
--

INSERT INTO `ratings` (`idUsers`, `idEvents`, `rating`) VALUES
(1, 1, '0.00'),
(1, 2, '3.00');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `idRoles` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`idRoles`),
  UNIQUE KEY `role_UNIQUE` (`role`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`idRoles`, `role`) VALUES
(1, 'Admin'),
(2, 'User');

-- --------------------------------------------------------

--
-- Структура таблицы `typesofevents`
--

CREATE TABLE IF NOT EXISTS `typesofevents` (
  `idTypes` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`idTypes`),
  UNIQUE KEY `title_UNIQUE` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `typesofevents`
--

INSERT INTO `typesofevents` (`idTypes`, `title`) VALUES
(4, 'Exhibitions'),
(1, 'Film'),
(2, 'Show'),
(3, 'Sport'),
(5, 'Theater'),
(6, 'Yet');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `idUsers` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `nickname` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `idRoles` int(11) NOT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `idCities` int(11) DEFAULT NULL,
  `timeFrom` datetime DEFAULT NULL,
  `timeTo` datetime DEFAULT NULL,
  `idGender` int(1) NOT NULL,
  `idImages` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsers`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`),
  UNIQUE KEY `idImages_UNIQUE` (`idImages`),
  KEY `FK_Usets_Images_idx` (`idImages`),
  KEY `FK_Users_Roles_idx` (`idRoles`),
  KEY `FK_Users_Cities_idx` (`idCities`),
  KEY `idGender` (`idGender`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`idUsers`, `email`, `nickname`, `password`, `idRoles`, `fullname`, `birthdate`, `idCities`, `timeFrom`, `timeTo`, `idGender`, `idImages`) VALUES
(1, 'admin', 'admin', 'admin', 1, NULL, NULL, 1, NULL, NULL, 1, 1),
(2, 'user', 'user', 'user', 2, NULL, NULL, 2, NULL, NULL, 2, 2),
(3, 'banneduser', 'banneduser', 'banneduser', 2, NULL, NULL, 3, NULL, NULL, 3, 3);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `blacklist`
--
ALTER TABLE `blacklist`
  ADD CONSTRAINT `FK_BlackList_Users` FOREIGN KEY (`idUsers`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_Comments_Events` FOREIGN KEY (`idEvents`) REFERENCES `events` (`idEvents`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Comments_Users` FOREIGN KEY (`idUsers`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `FK_Events_Users` FOREIGN KEY (`idUserCreator`) REFERENCES `users` (`idUsers`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Events_Cities` FOREIGN KEY (`idCities`) REFERENCES `cities` (`idCities`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Events_Images` FOREIGN KEY (`idImages`) REFERENCES `images` (`idImages`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Events_Types` FOREIGN KEY (`idTypes`) REFERENCES `typesofevents` (`idTypes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `events_users`
--
ALTER TABLE `events_users`
  ADD CONSTRAINT `fk_Events_has_Users_Events1` FOREIGN KEY (`idEvents`) REFERENCES `events` (`idEvents`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Events_has_Users_Users1` FOREIGN KEY (`idUsers`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `prefer_user_genres`
--
ALTER TABLE `prefer_user_genres`
  ADD CONSTRAINT `fk_Users_has_Types_Users1` FOREIGN KEY (`idUsers`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Users_has_Types_Types1` FOREIGN KEY (`idTypes`) REFERENCES `typesofevents` (`idTypes`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `FK_Ratings_Events` FOREIGN KEY (`idEvents`) REFERENCES `events` (`idEvents`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Ratings_Users` FOREIGN KEY (`idUsers`) REFERENCES `users` (`idUsers`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idGender`) REFERENCES `gender` (`idGender`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Users_Cities` FOREIGN KEY (`idCities`) REFERENCES `cities` (`idCities`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Users_Images` FOREIGN KEY (`idImages`) REFERENCES `images` (`idImages`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Users_Roles` FOREIGN KEY (`idRoles`) REFERENCES `roles` (`idRoles`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

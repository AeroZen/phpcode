-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- 主机: web.boyaa.com
-- 生成日期: 2012 年 12 月 26 日 18:26
-- 服务器版本: 5.1.57-community-log
-- PHP 版本: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `bynews`
--

-- --------------------------------------------------------

--
-- 表的结构 `signup`
--

CREATE TABLE IF NOT EXISTS `signup` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` int(5) NOT NULL COMMENT '工号',
  `type` int(5) NOT NULL COMMENT '类型(0扑克/1订餐)',
  `date` varchar(20) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 27, 2019 at 06:51 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cyber_insurance`
--
CREATE DATABASE IF NOT EXISTS `cyber_insurance` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cyber_insurance`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add register model', 7, 'add_registermodel'),
(20, 'Can change register model', 7, 'change_registermodel'),
(21, 'Can delete register model', 7, 'delete_registermodel'),
(22, 'Can add upload model', 8, 'add_uploadmodel'),
(23, 'Can change upload model', 8, 'change_uploadmodel'),
(24, 'Can delete upload model', 8, 'delete_uploadmodel'),
(25, 'Can add request model', 9, 'add_requestmodel'),
(26, 'Can change request model', 9, 'change_requestmodel'),
(27, 'Can delete request model', 9, 'delete_requestmodel'),
(28, 'Can add feedback model', 10, 'add_feedbackmodel'),
(29, 'Can change feedback model', 10, 'change_feedbackmodel'),
(30, 'Can delete feedback model', 10, 'delete_feedbackmodel');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(10, 'user', 'feedbackmodel'),
(7, 'user', 'registermodel'),
(9, 'user', 'requestmodel'),
(8, 'user', 'uploadmodel');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-02-23 05:54:23.596265'),
(2, 'auth', '0001_initial', '2019-02-23 05:54:50.489113'),
(3, 'admin', '0001_initial', '2019-02-23 05:54:54.500320'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-02-23 05:54:54.547120'),
(5, 'contenttypes', '0002_remove_content_type_name', '2019-02-23 05:54:55.826322'),
(6, 'auth', '0002_alter_permission_name_max_length', '2019-02-23 05:54:59.149128'),
(7, 'auth', '0003_alter_user_email_max_length', '2019-02-23 05:55:02.971135'),
(8, 'auth', '0004_alter_user_username_opts', '2019-02-23 05:55:03.329935'),
(9, 'auth', '0005_alter_user_last_login_null', '2019-02-23 05:55:03.845736'),
(10, 'auth', '0006_require_contenttypes_0002', '2019-02-23 05:55:03.876937'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2019-02-23 05:55:03.923737'),
(12, 'auth', '0008_alter_user_username_max_length', '2019-02-23 05:55:04.563338'),
(13, 'sessions', '0001_initial', '2019-02-23 05:55:05.733340'),
(14, 'user', '0001_initial', '2019-02-23 05:55:11.723750'),
(15, 'user', '0002_uploadmodel', '2019-02-23 06:19:59.444460'),
(16, 'user', '0003_uploadmodel_add_count', '2019-02-25 10:03:10.525141'),
(17, 'user', '0004_requestmodel', '2019-02-25 12:38:32.428700'),
(18, 'user', '0005_requestmodel_cate', '2019-02-25 13:11:14.118850'),
(19, 'user', '0006_feedbackmodel', '2019-02-26 05:59:01.347470');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('aigw4a3kxzm3nz57po4ylya562e69rgg', 'ZmQxMGNlZDcwMmQyZmVlMzIzNjE2MmRkZmQ2NzY3ZGE4OWZlNmRmMzp7InVzZXJpZCI6MSwib3RwIjo3MzQ0LCJqaGYiOjN9', '2019-03-13 06:26:35.697736'),
('g2oiaddmid2oydk3pjkws0bqskftk3w2', 'MjE4ZDE1Njg1NDhiMTUzZjU1NWU2MzI5NDIzZTFiMWU1ODIwMzIyNjp7InVzZXJpZCI6MX0=', '2019-03-11 06:09:23.570598'),
('hpeg4klxkcu206wda6thrthvdq15s3z6', 'MjE4ZDE1Njg1NDhiMTUzZjU1NWU2MzI5NDIzZTFiMWU1ODIwMzIyNjp7InVzZXJpZCI6MX0=', '2019-03-11 06:53:18.418231'),
('p82xn7004b49t0yq7bofqhgi47e4cloc', 'MjE4ZDE1Njg1NDhiMTUzZjU1NWU2MzI5NDIzZTFiMWU1ODIwMzIyNjp7InVzZXJpZCI6MX0=', '2019-03-11 05:10:52.087023');

-- --------------------------------------------------------

--
-- Table structure for table `user_feedbackmodel`
--

CREATE TABLE IF NOT EXISTS `user_feedbackmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(300) NOT NULL,
  `username_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_feedbackmodel_username_id_1c74a46b_fk_user_registermodel_id` (`username_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_feedbackmodel`
--

INSERT INTO `user_feedbackmodel` (`id`, `feedback`, `username_id`) VALUES
(1, ' Thank you', 1),
(2, ' Thank you', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_registermodel`
--

CREATE TABLE IF NOT EXISTS `user_registermodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(300) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `userid` varchar(200) NOT NULL,
  `password` int(11) NOT NULL,
  `mblenum` bigint(20) NOT NULL,
  `email` varchar(400) NOT NULL,
  `gender` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_registermodel`
--

INSERT INTO `user_registermodel` (`id`, `firstname`, `lastname`, `userid`, `password`, `mblenum`, `email`, `gender`) VALUES
(1, 'santhosh', 'kumar', 'santhosh', 1998, 9789672189, 'sabarinathan1350@gmail.com', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `user_requestmodel`
--

CREATE TABLE IF NOT EXISTS `user_requestmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request` varchar(200) NOT NULL,
  `accessone_id` int(11) NOT NULL,
  `accesstwo_id` int(11) NOT NULL,
  `cate` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_requestmodel_accessone_id_3ea4cbd6_fk_user_registermodel_id` (`accessone_id`),
  KEY `user_requestmodel_accesstwo_id_4242f44e_fk_user_uploadmodel_id` (`accesstwo_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `user_requestmodel`
--

INSERT INTO `user_requestmodel` (`id`, `request`, `accessone_id`, `accesstwo_id`, `cate`) VALUES
(1, 'pending', 1, 5, 'Property Details'),
(2, 'pending', 1, 5, 'Property Details'),
(3, 'pending', 1, 5, 'Property Details'),
(4, 'pending', 1, 5, 'Property Details'),
(5, 'pending', 1, 5, 'Property Details'),
(6, 'pending', 1, 6, 'IT Asset'),
(7, 'pending', 1, 6, 'IT Asset'),
(8, 'pending', 1, 6, 'IT Asset'),
(9, 'pending', 1, 6, 'IT Asset'),
(10, 'pending', 1, 6, 'IT Asset'),
(11, 'pending', 1, 6, 'IT Asset'),
(12, 'pending', 1, 6, 'IT Asset'),
(13, 'pending', 1, 6, 'IT Asset'),
(14, 'pending', 1, 6, 'IT Asset'),
(15, 'pending', 1, 7, 'Business Details'),
(16, 'pending', 1, 7, 'Business Details'),
(17, 'pending', 1, 7, 'Business Details'),
(18, 'pending', 1, 7, 'Business Details'),
(19, 'pending', 1, 7, 'Business Details'),
(20, 'pending', 1, 7, 'Business Details'),
(21, 'pending', 1, 7, 'Business Details'),
(22, 'pending', 1, 7, 'Business Details'),
(23, 'pending', 1, 7, 'Business Details'),
(24, 'pending', 1, 7, 'Business Details'),
(25, 'pending', 1, 7, 'Business Details'),
(26, 'pending', 1, 7, 'Business Details'),
(27, 'pending', 1, 7, 'Business Details'),
(28, 'pending', 1, 7, 'Business Details'),
(29, 'pending', 1, 7, 'Business Details'),
(30, 'pending', 1, 7, 'Business Details'),
(31, 'pending', 1, 8, 'Personal Details'),
(32, 'pending', 1, 8, 'Personal Details'),
(33, 'pending', 1, 8, 'Personal Details'),
(34, 'pending', 1, 8, 'Personal Details'),
(35, 'pending', 1, 8, 'Personal Details'),
(36, 'pending', 1, 8, 'Personal Details'),
(37, 'pending', 1, 8, 'Personal Details'),
(38, 'pending', 1, 8, 'Personal Details'),
(39, 'pending', 1, 8, 'Personal Details'),
(40, 'pending', 1, 8, 'Personal Details'),
(41, 'pending', 1, 8, 'Personal Details'),
(42, 'pending', 1, 8, 'Personal Details'),
(43, 'pending', 1, 8, 'Personal Details'),
(44, 'pending', 1, 8, 'Personal Details'),
(45, 'pending', 1, 8, 'Personal Details'),
(46, 'pending', 1, 8, 'Personal Details'),
(47, 'pending', 1, 8, 'Personal Details'),
(48, 'pending', 1, 8, 'Personal Details'),
(49, 'pending', 1, 8, 'Personal Details'),
(50, 'pending', 1, 8, 'Personal Details'),
(51, 'pending', 1, 8, 'Personal Details'),
(52, 'pending', 1, 8, 'Personal Details'),
(53, 'pending', 1, 8, 'Personal Details'),
(54, 'pending', 1, 8, 'Personal Details'),
(55, 'pending', 1, 8, 'Personal Details'),
(56, 'pending', 1, 8, 'Personal Details'),
(57, 'pending', 1, 8, 'Personal Details'),
(58, 'pending', 1, 8, 'Personal Details'),
(59, 'pending', 1, 8, 'Personal Details'),
(60, 'pending', 1, 8, 'Personal Details'),
(61, 'pending', 1, 8, 'Personal Details'),
(62, 'pending', 1, 8, 'Personal Details'),
(63, 'pending', 1, 8, 'Personal Details'),
(64, 'pending', 1, 3, 'Property Details');

-- --------------------------------------------------------

--
-- Table structure for table `user_uploadmodel`
--

CREATE TABLE IF NOT EXISTS `user_uploadmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `upload_file` varchar(100) NOT NULL,
  `area` varchar(200) NOT NULL,
  `upload_user_id` int(11) NOT NULL,
  `add_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_uploadmodel_upload_user_id_d3186b13_fk_user_regi` (`upload_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `user_uploadmodel`
--

INSERT INTO `user_uploadmodel` (`id`, `file_name`, `category`, `upload_file`, `area`, `upload_user_id`, `add_count`) VALUES
(3, 'property', 'Property Details', 'SYSTEM_DESIGN.docx', 'Chennai', 1, 0),
(5, 'property', 'Property Details', 'PPT.pptx', 'Chennai', 1, 1),
(6, 'Asset', 'IT Asset', 'asset.txt', 'Chennai', 1, 6),
(7, 'Business', 'Business Details', 'business.txt', 'chennai', 1, 5),
(8, 'Bank', 'Personal Details', 'bank.txt', 'chennai', 1, 5),
(9, 'Land', 'Property Details', 'property.txt', 'chennai', 1, 0),
(10, 'project', 'IT Asset', 'asset_TeQ4bqr.txt', 'Krishnagiri', 1, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `user_feedbackmodel`
--
ALTER TABLE `user_feedbackmodel`
  ADD CONSTRAINT `user_feedbackmodel_username_id_1c74a46b_fk_user_registermodel_id` FOREIGN KEY (`username_id`) REFERENCES `user_registermodel` (`id`);

--
-- Constraints for table `user_requestmodel`
--
ALTER TABLE `user_requestmodel`
  ADD CONSTRAINT `user_requestmodel_accessone_id_3ea4cbd6_fk_user_registermodel_id` FOREIGN KEY (`accessone_id`) REFERENCES `user_registermodel` (`id`),
  ADD CONSTRAINT `user_requestmodel_accesstwo_id_4242f44e_fk_user_uploadmodel_id` FOREIGN KEY (`accesstwo_id`) REFERENCES `user_uploadmodel` (`id`);

--
-- Constraints for table `user_uploadmodel`
--
ALTER TABLE `user_uploadmodel`
  ADD CONSTRAINT `user_uploadmodel_upload_user_id_d3186b13_fk_user_regi` FOREIGN KEY (`upload_user_id`) REFERENCES `user_registermodel` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.4.3-beta-community - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table finder_server.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finder_server.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;


-- Dumping structure for table finder_server.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finder_server.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;


-- Dumping structure for table finder_server.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Dumping data for table finder_server.auth_permission: ~27 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
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
	(19, 'Can add users', 7, 'add_users'),
	(20, 'Can change users', 7, 'change_users'),
	(21, 'Can delete users', 7, 'delete_users'),
	(22, 'Can add report', 8, 'add_report'),
	(23, 'Can change report', 8, 'change_report'),
	(24, 'Can delete report', 8, 'delete_report'),
	(25, 'Can add img', 9, 'add_img'),
	(26, 'Can change img', 9, 'change_img'),
	(27, 'Can delete img', 9, 'delete_img');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;


-- Dumping structure for table finder_server.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finder_server.auth_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;


-- Dumping structure for table finder_server.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finder_server.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;


-- Dumping structure for table finder_server.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finder_server.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;


-- Dumping structure for table finder_server.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finder_server.django_admin_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;


-- Dumping structure for table finder_server.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table finder_server.django_content_type: ~9 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(9, 'finder_server', 'img'),
	(8, 'finder_server', 'report'),
	(7, 'finder_server', 'users'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;


-- Dumping structure for table finder_server.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table finder_server.django_migrations: ~12 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2015-09-30 23:05:22'),
	(2, 'auth', '0001_initial', '2015-09-30 23:05:22'),
	(3, 'admin', '0001_initial', '2015-09-30 23:05:22'),
	(4, 'contenttypes', '0002_remove_content_type_name', '2015-09-30 23:05:22'),
	(5, 'auth', '0002_alter_permission_name_max_length', '2015-09-30 23:05:22'),
	(6, 'auth', '0003_alter_user_email_max_length', '2015-09-30 23:05:22'),
	(7, 'auth', '0004_alter_user_username_opts', '2015-09-30 23:05:22'),
	(8, 'auth', '0005_alter_user_last_login_null', '2015-09-30 23:05:22'),
	(9, 'auth', '0006_require_contenttypes_0002', '2015-09-30 23:05:22'),
	(10, 'sessions', '0001_initial', '2015-09-30 23:05:22'),
	(11, 'finder_server', '0001_initial', '2015-09-30 23:39:08'),
	(12, 'finder_server', '0002_report_uid', '2015-10-02 03:35:31');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;


-- Dumping structure for table finder_server.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finder_server.django_session: ~1 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('aogl3vq8wn09uj5r16g2tut3of8byi5l', 'MjY5MDcxMmJiZjRkNzY0NzZkZTM2ZWNhYmIzOGY4YzM0Y2I2ZDVhODp7fQ==', '2015-10-16 05:23:06');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;


-- Dumping structure for table finder_server.finder_server_img
CREATE TABLE IF NOT EXISTS `finder_server_img` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `url` varchar(500) NOT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finder_server.finder_server_img: ~0 rows (approximately)
/*!40000 ALTER TABLE `finder_server_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `finder_server_img` ENABLE KEYS */;


-- Dumping structure for table finder_server.finder_server_report
CREATE TABLE IF NOT EXISTS `finder_server_report` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `device_name` varchar(100) NOT NULL,
  `location_x` double NOT NULL,
  `location_y` double NOT NULL,
  `ip_addr` varchar(50) NOT NULL,
  `wifi_name` varchar(50) NOT NULL,
  `uid_id` int(11) NOT NULL,
  PRIMARY KEY (`rid`),
  KEY `finder_server_report_71422c2d` (`uid_id`),
  CONSTRAINT `finder_server_report_uid_id_59ccc32c_fk_finder_server_users_uid` FOREIGN KEY (`uid_id`) REFERENCES `finder_server_users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table finder_server.finder_server_report: ~0 rows (approximately)
/*!40000 ALTER TABLE `finder_server_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `finder_server_report` ENABLE KEYS */;


-- Dumping structure for table finder_server.finder_server_users
CREATE TABLE IF NOT EXISTS `finder_server_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table finder_server.finder_server_users: ~3 rows (approximately)
/*!40000 ALTER TABLE `finder_server_users` DISABLE KEYS */;
INSERT INTO `finder_server_users` (`uid`, `username`, `password`) VALUES
	(1, 'meng', '123'),
	(2, 'lily', '123'),
	(3, 'lily2', '123');
/*!40000 ALTER TABLE `finder_server_users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

# Host: localhost  (Version 5.5.5-10.1.26-MariaDB)
# Date: 2017-12-27 14:42:33
# Generator: MySQL-Front 6.0  (Build 1.163)


#
# Structure for table "carts"
#

DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "carts"
#


#
# Structure for table "categories"
#

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "categories"
#

INSERT INTO `categories` VALUES (1,'Sepatu',0,'2017-11-23 08:44:01','2017-11-23 08:44:01'),(2,'Lifestyle',1,'2017-11-23 08:44:01','2017-11-23 08:44:01'),(3,'Berlari',1,'2017-11-23 08:44:01','2017-11-23 08:44:01'),(4,'Basket',1,'2017-11-23 08:44:01','2017-11-23 08:44:01'),(5,'Sepakbola',1,'2017-11-23 08:44:01','2017-11-23 08:44:01'),(6,'Pakaian',0,'2017-11-23 08:44:01','2017-11-23 08:44:01'),(7,'Jaket',6,'2017-11-23 08:44:01','2017-11-23 08:44:01'),(8,'Hoodie',6,'2017-11-23 08:44:01','2017-11-23 08:44:01'),(9,'Rompi',6,'2017-11-23 08:44:01','2017-11-23 08:44:01');

#
# Structure for table "fees"
#

DROP TABLE IF EXISTS `fees`;
CREATE TABLE `fees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `origin` int(11) NOT NULL,
  `destination` int(11) NOT NULL,
  `courier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `service` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "fees"
#

INSERT INTO `fees` VALUES (1,23,153,'jne','REG',2000,20000,'2017-11-23 08:50:23','2017-12-07 00:00:00'),(2,23,153,'jne','REG',3000,30000,'2017-11-23 08:50:28','2017-11-23 00:00:00'),(3,23,55,'jne','REG',1000,11000,'2017-11-23 09:14:41','2017-11-23 00:00:00');

#
# Structure for table "migrations"
#

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "migrations"
#

INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2016_02_24_031222_create_products_table',1),('2016_02_24_031230_create_categories_table',1),('2016_03_01_131442_create_carts_table',1),('2016_03_05_090947_create_addresses_table',1),('2016_03_06_080428_create_fees_table',1),('2016_03_08_033605_create_orders_table',1);

#
# Structure for table "order"
#

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `no_invoice` int(10) NOT NULL DEFAULT '0',
  `customer_name` varchar(150) NOT NULL DEFAULT '',
  `customer_phone` varchar(15) NOT NULL DEFAULT '',
  `customer_email` varchar(120) NOT NULL DEFAULT '',
  `customer_address` text NOT NULL,
  `total` double NOT NULL DEFAULT '0',
  `payment_status` varchar(10) NOT NULL DEFAULT '',
  `payment_date` timestamp NULL DEFAULT NULL,
  `payment_channel` varchar(255) DEFAULT NULL,
  `payment_approval_code` varchar(100) DEFAULT NULL,
  `payment_session_id` int(10) NOT NULL DEFAULT '0',
  `amount` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Data for table "order"
#


#
# Structure for table "password_resets"
#

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "password_resets"
#

INSERT INTO `password_resets` VALUES ('humamalamin13@gmail.com','37f28dab355bbace500112e104c6deed07df73a7778978e7aaf580032aac2da4','2017-12-07 03:40:49');

#
# Structure for table "products"
#

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `weight` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "products"
#

INSERT INTO `products` VALUES (1,'Nike Air Force','stub-shoe.jpg','Sepatu Pria',340000.00,2000.00,'2017-11-23 08:44:01','2017-11-23 08:44:01'),(2,'Nike Air Max','stub-shoe.jpg','Sepatu Wanita',420000.00,3000.00,'2017-11-23 08:44:01','2017-11-23 08:44:01'),(3,'Nike Air Zoom','stub-shoe.jpg','Sepatu Wanita',360000.00,3000.00,'2017-11-23 08:44:01','2017-11-23 08:44:01'),(4,'Nike Aeroloft Bomber','stub-jacket.jpg','Jaket Wanita',720000.00,1000.00,'2017-11-23 08:44:02','2017-11-23 08:44:02'),(5,'Nike Guild 550','stub-jacket.jpg','Jaket Pria',380000.00,1000.00,'2017-11-23 08:44:02','2017-11-23 08:44:02'),(6,'Nike SB Steele','stub-jacket.jpg','Jaket Pria',1200000.00,2000.00,'2017-11-23 08:44:02','2017-11-23 08:44:02');

#
# Structure for table "category_product"
#

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE `category_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_product_product_id_foreign` (`product_id`),
  KEY `category_product_category_id_foreign` (`category_id`),
  CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "category_product"
#

INSERT INTO `category_product` VALUES (1,1,3,NULL,NULL),(2,2,3,NULL,NULL),(3,3,3,NULL,NULL),(4,1,2,NULL,NULL),(5,2,2,NULL,NULL),(6,4,7,NULL,NULL),(7,6,7,NULL,NULL),(8,5,9,NULL,NULL),(9,6,9,NULL,NULL);

#
# Structure for table "provinces"
#

DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces` (
  `id` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "provinces"
#

INSERT INTO `provinces` VALUES ('1','Bali','2017-11-23 08:44:03','2017-11-23 08:44:03'),('10','Jawa Tengah','2017-11-23 08:44:04','2017-11-23 08:44:04'),('11','Jawa Timur','2017-11-23 08:44:04','2017-11-23 08:44:04'),('12','Kalimantan Barat','2017-11-23 08:44:04','2017-11-23 08:44:04'),('13','Kalimantan Selatan','2017-11-23 08:44:04','2017-11-23 08:44:04'),('14','Kalimantan Tengah','2017-11-23 08:44:04','2017-11-23 08:44:04'),('15','Kalimantan Timur','2017-11-23 08:44:04','2017-11-23 08:44:04'),('16','Kalimantan Utara','2017-11-23 08:44:04','2017-11-23 08:44:04'),('17','Kepulauan Riau','2017-11-23 08:44:04','2017-11-23 08:44:04'),('18','Lampung','2017-11-23 08:44:04','2017-11-23 08:44:04'),('19','Maluku','2017-11-23 08:44:04','2017-11-23 08:44:04'),('2','Bangka Belitung','2017-11-23 08:44:03','2017-11-23 08:44:03'),('20','Maluku Utara','2017-11-23 08:44:04','2017-11-23 08:44:04'),('21','Nanggroe Aceh Darussalam (NAD)','2017-11-23 08:44:04','2017-11-23 08:44:04'),('22','Nusa Tenggara Barat (NTB)','2017-11-23 08:44:04','2017-11-23 08:44:04'),('23','Nusa Tenggara Timur (NTT)','2017-11-23 08:44:04','2017-11-23 08:44:04'),('24','Papua','2017-11-23 08:44:04','2017-11-23 08:44:04'),('25','Papua Barat','2017-11-23 08:44:04','2017-11-23 08:44:04'),('26','Riau','2017-11-23 08:44:04','2017-11-23 08:44:04'),('27','Sulawesi Barat','2017-11-23 08:44:04','2017-11-23 08:44:04'),('28','Sulawesi Selatan','2017-11-23 08:44:04','2017-11-23 08:44:04'),('29','Sulawesi Tengah','2017-11-23 08:44:04','2017-11-23 08:44:04'),('3','Banten','2017-11-23 08:44:03','2017-11-23 08:44:03'),('30','Sulawesi Tenggara','2017-11-23 08:44:04','2017-11-23 08:44:04'),('31','Sulawesi Utara','2017-11-23 08:44:05','2017-11-23 08:44:05'),('32','Sumatera Barat','2017-11-23 08:44:05','2017-11-23 08:44:05'),('33','Sumatera Selatan','2017-11-23 08:44:05','2017-11-23 08:44:05'),('34','Sumatera Utara','2017-11-23 08:44:05','2017-11-23 08:44:05'),('4','Bengkulu','2017-11-23 08:44:03','2017-11-23 08:44:03'),('5','DI Yogyakarta','2017-11-23 08:44:03','2017-11-23 08:44:03'),('6','DKI Jakarta','2017-11-23 08:44:03','2017-11-23 08:44:03'),('7','Gorontalo','2017-11-23 08:44:03','2017-11-23 08:44:03'),('8','Jambi','2017-11-23 08:44:04','2017-11-23 08:44:04'),('9','Jawa Barat','2017-11-23 08:44:04','2017-11-23 08:44:04');

#
# Structure for table "regencies"
#

DROP TABLE IF EXISTS `regencies`;
CREATE TABLE `regencies` (
  `id` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `province_id` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `regencies_province_id_foreign` (`province_id`),
  CONSTRAINT `regencies_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "regencies"
#

INSERT INTO `regencies` VALUES ('1','21','Kabupaten Aceh Barat','2017-11-23 08:44:06','2017-11-23 08:44:06'),('10','21','Kabupaten Aceh Timur','2017-11-23 08:44:07','2017-11-23 08:44:07'),('100','19','Kabupaten Buru Selatan','2017-11-23 08:44:10','2017-11-23 08:44:10'),('101','30','Kabupaten Buton','2017-11-23 08:44:10','2017-11-23 08:44:10'),('102','30','Kabupaten Buton Utara','2017-11-23 08:44:10','2017-11-23 08:44:10'),('103','9','Kabupaten Ciamis','2017-11-23 08:44:10','2017-11-23 08:44:10'),('104','9','Kabupaten Cianjur','2017-11-23 08:44:10','2017-11-23 08:44:10'),('105','10','Kabupaten Cilacap','2017-11-23 08:44:10','2017-11-23 08:44:10'),('106','3','Kota Cilegon','2017-11-23 08:44:10','2017-11-23 08:44:10'),('107','9','Kota Cimahi','2017-11-23 08:44:10','2017-11-23 08:44:10'),('108','9','Kabupaten Cirebon','2017-11-23 08:44:10','2017-11-23 08:44:10'),('109','9','Kota Cirebon','2017-11-23 08:44:10','2017-11-23 08:44:10'),('11','21','Kabupaten Aceh Utara','2017-11-23 08:44:07','2017-11-23 08:44:07'),('110','34','Kabupaten Dairi','2017-11-23 08:44:10','2017-11-23 08:44:10'),('111','24','Kabupaten Deiyai (Deliyai)','2017-11-23 08:44:10','2017-11-23 08:44:10'),('112','34','Kabupaten Deli Serdang','2017-11-23 08:44:10','2017-11-23 08:44:10'),('113','10','Kabupaten Demak','2017-11-23 08:44:10','2017-11-23 08:44:10'),('114','1','Kota Denpasar','2017-11-23 08:44:10','2017-11-23 08:44:10'),('115','9','Kota Depok','2017-11-23 08:44:10','2017-11-23 08:44:10'),('116','32','Kabupaten Dharmasraya','2017-11-23 08:44:10','2017-11-23 08:44:10'),('117','24','Kabupaten Dogiyai','2017-11-23 08:44:10','2017-11-23 08:44:10'),('118','22','Kabupaten Dompu','2017-11-23 08:44:10','2017-11-23 08:44:10'),('119','29','Kabupaten Donggala','2017-11-23 08:44:10','2017-11-23 08:44:10'),('12','32','Kabupaten Agam','2017-11-23 08:44:07','2017-11-23 08:44:07'),('120','26','Kota Dumai','2017-11-23 08:44:10','2017-11-23 08:44:10'),('121','33','Kabupaten Empat Lawang','2017-11-23 08:44:10','2017-11-23 08:44:10'),('122','23','Kabupaten Ende','2017-11-23 08:44:11','2017-11-23 08:44:11'),('123','28','Kabupaten Enrekang','2017-11-23 08:44:11','2017-11-23 08:44:11'),('124','25','Kabupaten Fakfak','2017-11-23 08:44:11','2017-11-23 08:44:11'),('125','23','Kabupaten Flores Timur','2017-11-23 08:44:11','2017-11-23 08:44:11'),('126','9','Kabupaten Garut','2017-11-23 08:44:11','2017-11-23 08:44:11'),('127','21','Kabupaten Gayo Lues','2017-11-23 08:44:11','2017-11-23 08:44:11'),('128','1','Kabupaten Gianyar','2017-11-23 08:44:11','2017-11-23 08:44:11'),('129','7','Kabupaten Gorontalo','2017-11-23 08:44:11','2017-11-23 08:44:11'),('13','23','Kabupaten Alor','2017-11-23 08:44:07','2017-11-23 08:44:07'),('130','7','Kota Gorontalo','2017-11-23 08:44:11','2017-11-23 08:44:11'),('131','7','Kabupaten Gorontalo Utara','2017-11-23 08:44:11','2017-11-23 08:44:11'),('132','28','Kabupaten Gowa','2017-11-23 08:44:11','2017-11-23 08:44:11'),('133','11','Kabupaten Gresik','2017-11-23 08:44:11','2017-11-23 08:44:11'),('134','10','Kabupaten Grobogan','2017-11-23 08:44:11','2017-11-23 08:44:11'),('135','5','Kabupaten Gunung Kidul','2017-11-23 08:44:11','2017-11-23 08:44:11'),('136','14','Kabupaten Gunung Mas','2017-11-23 08:44:11','2017-11-23 08:44:11'),('137','34','Kota Gunungsitoli','2017-11-23 08:44:11','2017-11-23 08:44:11'),('138','20','Kabupaten Halmahera Barat','2017-11-23 08:44:11','2017-11-23 08:44:11'),('139','20','Kabupaten Halmahera Selatan','2017-11-23 08:44:11','2017-11-23 08:44:11'),('14','19','Kota Ambon','2017-11-23 08:44:07','2017-11-23 08:44:07'),('140','20','Kabupaten Halmahera Tengah','2017-11-23 08:44:11','2017-11-23 08:44:11'),('141','20','Kabupaten Halmahera Timur','2017-11-23 08:44:11','2017-11-23 08:44:11'),('142','20','Kabupaten Halmahera Utara','2017-11-23 08:44:11','2017-11-23 08:44:11'),('143','13','Kabupaten Hulu Sungai Selatan','2017-11-23 08:44:11','2017-11-23 08:44:11'),('144','13','Kabupaten Hulu Sungai Tengah','2017-11-23 08:44:11','2017-11-23 08:44:11'),('145','13','Kabupaten Hulu Sungai Utara','2017-11-23 08:44:11','2017-11-23 08:44:11'),('146','34','Kabupaten Humbang Hasundutan','2017-11-23 08:44:11','2017-11-23 08:44:11'),('147','26','Kabupaten Indragiri Hilir','2017-11-23 08:44:11','2017-11-23 08:44:11'),('148','26','Kabupaten Indragiri Hulu','2017-11-23 08:44:11','2017-11-23 08:44:11'),('149','9','Kabupaten Indramayu','2017-11-23 08:44:11','2017-11-23 08:44:11'),('15','34','Kabupaten Asahan','2017-11-23 08:44:07','2017-11-23 08:44:07'),('150','24','Kabupaten Intan Jaya','2017-11-23 08:44:11','2017-11-23 08:44:11'),('151','6','Kota Jakarta Barat','2017-11-23 08:44:11','2017-11-23 08:44:11'),('152','6','Kota Jakarta Pusat','2017-11-23 08:44:12','2017-11-23 08:44:12'),('153','6','Kota Jakarta Selatan','2017-11-23 08:44:12','2017-11-23 08:44:12'),('154','6','Kota Jakarta Timur','2017-11-23 08:44:12','2017-11-23 08:44:12'),('155','6','Kota Jakarta Utara','2017-11-23 08:44:12','2017-11-23 08:44:12'),('156','8','Kota Jambi','2017-11-23 08:44:12','2017-11-23 08:44:12'),('157','24','Kabupaten Jayapura','2017-11-23 08:44:12','2017-11-23 08:44:12'),('158','24','Kota Jayapura','2017-11-23 08:44:12','2017-11-23 08:44:12'),('159','24','Kabupaten Jayawijaya','2017-11-23 08:44:12','2017-11-23 08:44:12'),('16','24','Kabupaten Asmat','2017-11-23 08:44:07','2017-11-23 08:44:07'),('160','11','Kabupaten Jember','2017-11-23 08:44:12','2017-11-23 08:44:12'),('161','1','Kabupaten Jembrana','2017-11-23 08:44:12','2017-11-23 08:44:12'),('162','28','Kabupaten Jeneponto','2017-11-23 08:44:12','2017-11-23 08:44:12'),('163','10','Kabupaten Jepara','2017-11-23 08:44:12','2017-11-23 08:44:12'),('164','11','Kabupaten Jombang','2017-11-23 08:44:12','2017-11-23 08:44:12'),('165','25','Kabupaten Kaimana','2017-11-23 08:44:12','2017-11-23 08:44:12'),('166','26','Kabupaten Kampar','2017-11-23 08:44:12','2017-11-23 08:44:12'),('167','14','Kabupaten Kapuas','2017-11-23 08:44:12','2017-11-23 08:44:12'),('168','12','Kabupaten Kapuas Hulu','2017-11-23 08:44:12','2017-11-23 08:44:12'),('169','10','Kabupaten Karanganyar','2017-11-23 08:44:12','2017-11-23 08:44:12'),('17','1','Kabupaten Badung','2017-11-23 08:44:07','2017-11-23 08:44:07'),('170','1','Kabupaten Karangasem','2017-11-23 08:44:12','2017-11-23 08:44:12'),('171','9','Kabupaten Karawang','2017-11-23 08:44:12','2017-11-23 08:44:12'),('172','17','Kabupaten Karimun','2017-11-23 08:44:12','2017-11-23 08:44:12'),('173','34','Kabupaten Karo','2017-11-23 08:44:12','2017-11-23 08:44:12'),('174','14','Kabupaten Katingan','2017-11-23 08:44:12','2017-11-23 08:44:12'),('175','4','Kabupaten Kaur','2017-11-23 08:44:12','2017-11-23 08:44:12'),('176','12','Kabupaten Kayong Utara','2017-11-23 08:44:12','2017-11-23 08:44:12'),('177','10','Kabupaten Kebumen','2017-11-23 08:44:12','2017-11-23 08:44:12'),('178','11','Kabupaten Kediri','2017-11-23 08:44:13','2017-11-23 08:44:13'),('179','11','Kota Kediri','2017-11-23 08:44:13','2017-11-23 08:44:13'),('18','13','Kabupaten Balangan','2017-11-23 08:44:07','2017-11-23 08:44:07'),('180','24','Kabupaten Keerom','2017-11-23 08:44:13','2017-11-23 08:44:13'),('181','10','Kabupaten Kendal','2017-11-23 08:44:13','2017-11-23 08:44:13'),('182','30','Kota Kendari','2017-11-23 08:44:13','2017-11-23 08:44:13'),('183','4','Kabupaten Kepahiang','2017-11-23 08:44:13','2017-11-23 08:44:13'),('184','17','Kabupaten Kepulauan Anambas','2017-11-23 08:44:13','2017-11-23 08:44:13'),('185','19','Kabupaten Kepulauan Aru','2017-11-23 08:44:13','2017-11-23 08:44:13'),('186','32','Kabupaten Kepulauan Mentawai','2017-11-23 08:44:13','2017-11-23 08:44:13'),('187','26','Kabupaten Kepulauan Meranti','2017-11-23 08:44:13','2017-11-23 08:44:13'),('188','31','Kabupaten Kepulauan Sangihe','2017-11-23 08:44:13','2017-11-23 08:44:13'),('189','6','Kabupaten Kepulauan Seribu','2017-11-23 08:44:13','2017-11-23 08:44:13'),('19','15','Kota Balikpapan','2017-11-23 08:44:07','2017-11-23 08:44:07'),('190','31','Kabupaten Kepulauan Siau Tagulandang Biaro (Sitaro)','2017-11-23 08:44:13','2017-11-23 08:44:13'),('191','20','Kabupaten Kepulauan Sula','2017-11-23 08:44:13','2017-11-23 08:44:13'),('192','31','Kabupaten Kepulauan Talaud','2017-11-23 08:44:13','2017-11-23 08:44:13'),('193','24','Kabupaten Kepulauan Yapen (Yapen Waropen)','2017-11-23 08:44:13','2017-11-23 08:44:13'),('194','8','Kabupaten Kerinci','2017-11-23 08:44:13','2017-11-23 08:44:13'),('195','12','Kabupaten Ketapang','2017-11-23 08:44:13','2017-11-23 08:44:13'),('196','10','Kabupaten Klaten','2017-11-23 08:44:13','2017-11-23 08:44:13'),('197','1','Kabupaten Klungkung','2017-11-23 08:44:13','2017-11-23 08:44:13'),('198','30','Kabupaten Kolaka','2017-11-23 08:44:13','2017-11-23 08:44:13'),('199','30','Kabupaten Kolaka Utara','2017-11-23 08:44:13','2017-11-23 08:44:13'),('2','21','Kabupaten Aceh Barat Daya','2017-11-23 08:44:06','2017-11-23 08:44:06'),('20','21','Kota Banda Aceh','2017-11-23 08:44:07','2017-11-23 08:44:07'),('200','30','Kabupaten Konawe','2017-11-23 08:44:13','2017-11-23 08:44:13'),('201','30','Kabupaten Konawe Selatan','2017-11-23 08:44:13','2017-11-23 08:44:13'),('202','30','Kabupaten Konawe Utara','2017-11-23 08:44:13','2017-11-23 08:44:13'),('203','13','Kabupaten Kotabaru','2017-11-23 08:44:13','2017-11-23 08:44:13'),('204','31','Kota Kotamobagu','2017-11-23 08:44:13','2017-11-23 08:44:13'),('205','14','Kabupaten Kotawaringin Barat','2017-11-23 08:44:13','2017-11-23 08:44:13'),('206','14','Kabupaten Kotawaringin Timur','2017-11-23 08:44:13','2017-11-23 08:44:13'),('207','26','Kabupaten Kuantan Singingi','2017-11-23 08:44:14','2017-11-23 08:44:14'),('208','12','Kabupaten Kubu Raya','2017-11-23 08:44:14','2017-11-23 08:44:14'),('209','10','Kabupaten Kudus','2017-11-23 08:44:14','2017-11-23 08:44:14'),('21','18','Kota Bandar Lampung','2017-11-23 08:44:07','2017-11-23 08:44:07'),('210','5','Kabupaten Kulon Progo','2017-11-23 08:44:14','2017-11-23 08:44:14'),('211','9','Kabupaten Kuningan','2017-11-23 08:44:14','2017-11-23 08:44:14'),('212','23','Kabupaten Kupang','2017-11-23 08:44:14','2017-11-23 08:44:14'),('213','23','Kota Kupang','2017-11-23 08:44:14','2017-11-23 08:44:14'),('214','15','Kabupaten Kutai Barat','2017-11-23 08:44:14','2017-11-23 08:44:14'),('215','15','Kabupaten Kutai Kartanegara','2017-11-23 08:44:14','2017-11-23 08:44:14'),('216','15','Kabupaten Kutai Timur','2017-11-23 08:44:14','2017-11-23 08:44:14'),('217','34','Kabupaten Labuhan Batu','2017-11-23 08:44:14','2017-11-23 08:44:14'),('218','34','Kabupaten Labuhan Batu Selatan','2017-11-23 08:44:14','2017-11-23 08:44:14'),('219','34','Kabupaten Labuhan Batu Utara','2017-11-23 08:44:14','2017-11-23 08:44:14'),('22','9','Kabupaten Bandung','2017-11-23 08:44:07','2017-11-23 08:44:07'),('220','33','Kabupaten Lahat','2017-11-23 08:44:14','2017-11-23 08:44:14'),('221','14','Kabupaten Lamandau','2017-11-23 08:44:14','2017-11-23 08:44:14'),('222','11','Kabupaten Lamongan','2017-11-23 08:44:14','2017-11-23 08:44:14'),('223','18','Kabupaten Lampung Barat','2017-11-23 08:44:14','2017-11-23 08:44:14'),('224','18','Kabupaten Lampung Selatan','2017-11-23 08:44:14','2017-11-23 08:44:14'),('225','18','Kabupaten Lampung Tengah','2017-11-23 08:44:14','2017-11-23 08:44:14'),('226','18','Kabupaten Lampung Timur','2017-11-23 08:44:14','2017-11-23 08:44:14'),('227','18','Kabupaten Lampung Utara','2017-11-23 08:44:14','2017-11-23 08:44:14'),('228','12','Kabupaten Landak','2017-11-23 08:44:14','2017-11-23 08:44:14'),('229','34','Kabupaten Langkat','2017-11-23 08:44:14','2017-11-23 08:44:14'),('23','9','Kota Bandung','2017-11-23 08:44:07','2017-11-23 08:44:07'),('230','21','Kota Langsa','2017-11-23 08:44:14','2017-11-23 08:44:14'),('231','24','Kabupaten Lanny Jaya','2017-11-23 08:44:14','2017-11-23 08:44:14'),('232','3','Kabupaten Lebak','2017-11-23 08:44:14','2017-11-23 08:44:14'),('233','4','Kabupaten Lebong','2017-11-23 08:44:14','2017-11-23 08:44:14'),('234','23','Kabupaten Lembata','2017-11-23 08:44:14','2017-11-23 08:44:14'),('235','21','Kota Lhokseumawe','2017-11-23 08:44:14','2017-11-23 08:44:14'),('236','32','Kabupaten Lima Puluh Koto/Kota','2017-11-23 08:44:14','2017-11-23 08:44:14'),('237','17','Kabupaten Lingga','2017-11-23 08:44:14','2017-11-23 08:44:14'),('238','22','Kabupaten Lombok Barat','2017-11-23 08:44:14','2017-11-23 08:44:14'),('239','22','Kabupaten Lombok Tengah','2017-11-23 08:44:15','2017-11-23 08:44:15'),('24','9','Kabupaten Bandung Barat','2017-11-23 08:44:07','2017-11-23 08:44:07'),('240','22','Kabupaten Lombok Timur','2017-11-23 08:44:15','2017-11-23 08:44:15'),('241','22','Kabupaten Lombok Utara','2017-11-23 08:44:15','2017-11-23 08:44:15'),('242','33','Kota Lubuk Linggau','2017-11-23 08:44:15','2017-11-23 08:44:15'),('243','11','Kabupaten Lumajang','2017-11-23 08:44:15','2017-11-23 08:44:15'),('244','28','Kabupaten Luwu','2017-11-23 08:44:15','2017-11-23 08:44:15'),('245','28','Kabupaten Luwu Timur','2017-11-23 08:44:15','2017-11-23 08:44:15'),('246','28','Kabupaten Luwu Utara','2017-11-23 08:44:15','2017-11-23 08:44:15'),('247','11','Kabupaten Madiun','2017-11-23 08:44:15','2017-11-23 08:44:15'),('248','11','Kota Madiun','2017-11-23 08:44:15','2017-11-23 08:44:15'),('249','10','Kabupaten Magelang','2017-11-23 08:44:15','2017-11-23 08:44:15'),('25','29','Kabupaten Banggai','2017-11-23 08:44:07','2017-11-23 08:44:07'),('250','10','Kota Magelang','2017-11-23 08:44:15','2017-11-23 08:44:15'),('251','11','Kabupaten Magetan','2017-11-23 08:44:15','2017-11-23 08:44:15'),('252','9','Kabupaten Majalengka','2017-11-23 08:44:15','2017-11-23 08:44:15'),('253','27','Kabupaten Majene','2017-11-23 08:44:15','2017-11-23 08:44:15'),('254','28','Kota Makassar','2017-11-23 08:44:15','2017-11-23 08:44:15'),('255','11','Kabupaten Malang','2017-11-23 08:44:15','2017-11-23 08:44:15'),('256','11','Kota Malang','2017-11-23 08:44:15','2017-11-23 08:44:15'),('257','16','Kabupaten Malinau','2017-11-23 08:44:15','2017-11-23 08:44:15'),('258','19','Kabupaten Maluku Barat Daya','2017-11-23 08:44:15','2017-11-23 08:44:15'),('259','19','Kabupaten Maluku Tengah','2017-11-23 08:44:15','2017-11-23 08:44:15'),('26','29','Kabupaten Banggai Kepulauan','2017-11-23 08:44:07','2017-11-23 08:44:07'),('260','19','Kabupaten Maluku Tenggara','2017-11-23 08:44:15','2017-11-23 08:44:15'),('261','19','Kabupaten Maluku Tenggara Barat','2017-11-23 08:44:15','2017-11-23 08:44:15'),('262','27','Kabupaten Mamasa','2017-11-23 08:44:15','2017-11-23 08:44:15'),('263','24','Kabupaten Mamberamo Raya','2017-11-23 08:44:15','2017-11-23 08:44:15'),('264','24','Kabupaten Mamberamo Tengah','2017-11-23 08:44:15','2017-11-23 08:44:15'),('265','27','Kabupaten Mamuju','2017-11-23 08:44:15','2017-11-23 08:44:15'),('266','27','Kabupaten Mamuju Utara','2017-11-23 08:44:15','2017-11-23 08:44:15'),('267','31','Kota Manado','2017-11-23 08:44:15','2017-11-23 08:44:15'),('268','34','Kabupaten Mandailing Natal','2017-11-23 08:44:15','2017-11-23 08:44:15'),('269','23','Kabupaten Manggarai','2017-11-23 08:44:16','2017-11-23 08:44:16'),('27','2','Kabupaten Bangka','2017-11-23 08:44:07','2017-11-23 08:44:07'),('270','23','Kabupaten Manggarai Barat','2017-11-23 08:44:16','2017-11-23 08:44:16'),('271','23','Kabupaten Manggarai Timur','2017-11-23 08:44:16','2017-11-23 08:44:16'),('272','25','Kabupaten Manokwari','2017-11-23 08:44:16','2017-11-23 08:44:16'),('273','25','Kabupaten Manokwari Selatan','2017-11-23 08:44:16','2017-11-23 08:44:16'),('274','24','Kabupaten Mappi','2017-11-23 08:44:16','2017-11-23 08:44:16'),('275','28','Kabupaten Maros','2017-11-23 08:44:16','2017-11-23 08:44:16'),('276','22','Kota Mataram','2017-11-23 08:44:16','2017-11-23 08:44:16'),('277','25','Kabupaten Maybrat','2017-11-23 08:44:16','2017-11-23 08:44:16'),('278','34','Kota Medan','2017-11-23 08:44:16','2017-11-23 08:44:16'),('279','12','Kabupaten Melawi','2017-11-23 08:44:16','2017-11-23 08:44:16'),('28','2','Kabupaten Bangka Barat','2017-11-23 08:44:07','2017-11-23 08:44:07'),('280','8','Kabupaten Merangin','2017-11-23 08:44:16','2017-11-23 08:44:16'),('281','24','Kabupaten Merauke','2017-11-23 08:44:16','2017-11-23 08:44:16'),('282','18','Kabupaten Mesuji','2017-11-23 08:44:16','2017-11-23 08:44:16'),('283','18','Kota Metro','2017-11-23 08:44:16','2017-11-23 08:44:16'),('284','24','Kabupaten Mimika','2017-11-23 08:44:16','2017-11-23 08:44:16'),('285','31','Kabupaten Minahasa','2017-11-23 08:44:16','2017-11-23 08:44:16'),('286','31','Kabupaten Minahasa Selatan','2017-11-23 08:44:16','2017-11-23 08:44:16'),('287','31','Kabupaten Minahasa Tenggara','2017-11-23 08:44:16','2017-11-23 08:44:16'),('288','31','Kabupaten Minahasa Utara','2017-11-23 08:44:16','2017-11-23 08:44:16'),('289','11','Kabupaten Mojokerto','2017-11-23 08:44:16','2017-11-23 08:44:16'),('29','2','Kabupaten Bangka Selatan','2017-11-23 08:44:07','2017-11-23 08:44:07'),('290','11','Kota Mojokerto','2017-11-23 08:44:16','2017-11-23 08:44:16'),('291','29','Kabupaten Morowali','2017-11-23 08:44:16','2017-11-23 08:44:16'),('292','33','Kabupaten Muara Enim','2017-11-23 08:44:16','2017-11-23 08:44:16'),('293','8','Kabupaten Muaro Jambi','2017-11-23 08:44:17','2017-11-23 08:44:17'),('294','4','Kabupaten Muko Muko','2017-11-23 08:44:17','2017-11-23 08:44:17'),('295','30','Kabupaten Muna','2017-11-23 08:44:17','2017-11-23 08:44:17'),('296','14','Kabupaten Murung Raya','2017-11-23 08:44:17','2017-11-23 08:44:17'),('297','33','Kabupaten Musi Banyuasin','2017-11-23 08:44:17','2017-11-23 08:44:17'),('298','33','Kabupaten Musi Rawas','2017-11-23 08:44:17','2017-11-23 08:44:17'),('299','24','Kabupaten Nabire','2017-11-23 08:44:17','2017-11-23 08:44:17'),('3','21','Kabupaten Aceh Besar','2017-11-23 08:44:06','2017-11-23 08:44:06'),('30','2','Kabupaten Bangka Tengah','2017-11-23 08:44:08','2017-11-23 08:44:08'),('300','21','Kabupaten Nagan Raya','2017-11-23 08:44:17','2017-11-23 08:44:17'),('301','23','Kabupaten Nagekeo','2017-11-23 08:44:17','2017-11-23 08:44:17'),('302','17','Kabupaten Natuna','2017-11-23 08:44:17','2017-11-23 08:44:17'),('303','24','Kabupaten Nduga','2017-11-23 08:44:17','2017-11-23 08:44:17'),('304','23','Kabupaten Ngada','2017-11-23 08:44:17','2017-11-23 08:44:17'),('305','11','Kabupaten Nganjuk','2017-11-23 08:44:17','2017-11-23 08:44:17'),('306','11','Kabupaten Ngawi','2017-11-23 08:44:17','2017-11-23 08:44:17'),('307','34','Kabupaten Nias','2017-11-23 08:44:17','2017-11-23 08:44:17'),('308','34','Kabupaten Nias Barat','2017-11-23 08:44:17','2017-11-23 08:44:17'),('309','34','Kabupaten Nias Selatan','2017-11-23 08:44:17','2017-11-23 08:44:17'),('31','11','Kabupaten Bangkalan','2017-11-23 08:44:08','2017-11-23 08:44:08'),('310','34','Kabupaten Nias Utara','2017-11-23 08:44:17','2017-11-23 08:44:17'),('311','16','Kabupaten Nunukan','2017-11-23 08:44:17','2017-11-23 08:44:17'),('312','33','Kabupaten Ogan Ilir','2017-11-23 08:44:17','2017-11-23 08:44:17'),('313','33','Kabupaten Ogan Komering Ilir','2017-11-23 08:44:17','2017-11-23 08:44:17'),('314','33','Kabupaten Ogan Komering Ulu','2017-11-23 08:44:17','2017-11-23 08:44:17'),('315','33','Kabupaten Ogan Komering Ulu Selatan','2017-11-23 08:44:17','2017-11-23 08:44:17'),('316','33','Kabupaten Ogan Komering Ulu Timur','2017-11-23 08:44:17','2017-11-23 08:44:17'),('317','11','Kabupaten Pacitan','2017-11-23 08:44:17','2017-11-23 08:44:17'),('318','32','Kota Padang','2017-11-23 08:44:17','2017-11-23 08:44:17'),('319','34','Kabupaten Padang Lawas','2017-11-23 08:44:17','2017-11-23 08:44:17'),('32','1','Kabupaten Bangli','2017-11-23 08:44:08','2017-11-23 08:44:08'),('320','34','Kabupaten Padang Lawas Utara','2017-11-23 08:44:17','2017-11-23 08:44:17'),('321','32','Kota Padang Panjang','2017-11-23 08:44:18','2017-11-23 08:44:18'),('322','32','Kabupaten Padang Pariaman','2017-11-23 08:44:18','2017-11-23 08:44:18'),('323','34','Kota Padang Sidempuan','2017-11-23 08:44:18','2017-11-23 08:44:18'),('324','33','Kota Pagar Alam','2017-11-23 08:44:18','2017-11-23 08:44:18'),('325','34','Kabupaten Pakpak Bharat','2017-11-23 08:44:18','2017-11-23 08:44:18'),('326','14','Kota Palangka Raya','2017-11-23 08:44:18','2017-11-23 08:44:18'),('327','33','Kota Palembang','2017-11-23 08:44:18','2017-11-23 08:44:18'),('328','28','Kota Palopo','2017-11-23 08:44:18','2017-11-23 08:44:18'),('329','29','Kota Palu','2017-11-23 08:44:18','2017-11-23 08:44:18'),('33','13','Kabupaten Banjar','2017-11-23 08:44:08','2017-11-23 08:44:08'),('330','11','Kabupaten Pamekasan','2017-11-23 08:44:18','2017-11-23 08:44:18'),('331','3','Kabupaten Pandeglang','2017-11-23 08:44:18','2017-11-23 08:44:18'),('332','9','Kabupaten Pangandaran','2017-11-23 08:44:18','2017-11-23 08:44:18'),('333','28','Kabupaten Pangkajene Kepulauan','2017-11-23 08:44:18','2017-11-23 08:44:18'),('334','2','Kota Pangkal Pinang','2017-11-23 08:44:18','2017-11-23 08:44:18'),('335','24','Kabupaten Paniai','2017-11-23 08:44:18','2017-11-23 08:44:18'),('336','28','Kota Parepare','2017-11-23 08:44:18','2017-11-23 08:44:18'),('337','32','Kota Pariaman','2017-11-23 08:44:18','2017-11-23 08:44:18'),('338','29','Kabupaten Parigi Moutong','2017-11-23 08:44:18','2017-11-23 08:44:18'),('339','32','Kabupaten Pasaman','2017-11-23 08:44:18','2017-11-23 08:44:18'),('34','9','Kota Banjar','2017-11-23 08:44:08','2017-11-23 08:44:08'),('340','32','Kabupaten Pasaman Barat','2017-11-23 08:44:18','2017-11-23 08:44:18'),('341','15','Kabupaten Paser','2017-11-23 08:44:18','2017-11-23 08:44:18'),('342','11','Kabupaten Pasuruan','2017-11-23 08:44:18','2017-11-23 08:44:18'),('343','11','Kota Pasuruan','2017-11-23 08:44:18','2017-11-23 08:44:18'),('344','10','Kabupaten Pati','2017-11-23 08:44:18','2017-11-23 08:44:18'),('345','32','Kota Payakumbuh','2017-11-23 08:44:18','2017-11-23 08:44:18'),('346','25','Kabupaten Pegunungan Arfak','2017-11-23 08:44:18','2017-11-23 08:44:18'),('347','24','Kabupaten Pegunungan Bintang','2017-11-23 08:44:18','2017-11-23 08:44:18'),('348','10','Kabupaten Pekalongan','2017-11-23 08:44:19','2017-11-23 08:44:19'),('349','10','Kota Pekalongan','2017-11-23 08:44:19','2017-11-23 08:44:19'),('35','13','Kota Banjarbaru','2017-11-23 08:44:08','2017-11-23 08:44:08'),('350','26','Kota Pekanbaru','2017-11-23 08:44:19','2017-11-23 08:44:19'),('351','26','Kabupaten Pelalawan','2017-11-23 08:44:19','2017-11-23 08:44:19'),('352','10','Kabupaten Pemalang','2017-11-23 08:44:19','2017-11-23 08:44:19'),('353','34','Kota Pematang Siantar','2017-11-23 08:44:19','2017-11-23 08:44:19'),('354','15','Kabupaten Penajam Paser Utara','2017-11-23 08:44:19','2017-11-23 08:44:19'),('355','18','Kabupaten Pesawaran','2017-11-23 08:44:19','2017-11-23 08:44:19'),('356','18','Kabupaten Pesisir Barat','2017-11-23 08:44:19','2017-11-23 08:44:19'),('357','32','Kabupaten Pesisir Selatan','2017-11-23 08:44:19','2017-11-23 08:44:19'),('358','21','Kabupaten Pidie','2017-11-23 08:44:19','2017-11-23 08:44:19'),('359','21','Kabupaten Pidie Jaya','2017-11-23 08:44:19','2017-11-23 08:44:19'),('36','13','Kota Banjarmasin','2017-11-23 08:44:08','2017-11-23 08:44:08'),('360','28','Kabupaten Pinrang','2017-11-23 08:44:19','2017-11-23 08:44:19'),('361','7','Kabupaten Pohuwato','2017-11-23 08:44:19','2017-11-23 08:44:19'),('362','27','Kabupaten Polewali Mandar','2017-11-23 08:44:19','2017-11-23 08:44:19'),('363','11','Kabupaten Ponorogo','2017-11-23 08:44:19','2017-11-23 08:44:19'),('364','12','Kabupaten Pontianak','2017-11-23 08:44:19','2017-11-23 08:44:19'),('365','12','Kota Pontianak','2017-11-23 08:44:19','2017-11-23 08:44:19'),('366','29','Kabupaten Poso','2017-11-23 08:44:19','2017-11-23 08:44:19'),('367','33','Kota Prabumulih','2017-11-23 08:44:19','2017-11-23 08:44:19'),('368','18','Kabupaten Pringsewu','2017-11-23 08:44:19','2017-11-23 08:44:19'),('369','11','Kabupaten Probolinggo','2017-11-23 08:44:19','2017-11-23 08:44:19'),('37','10','Kabupaten Banjarnegara','2017-11-23 08:44:08','2017-11-23 08:44:08'),('370','11','Kota Probolinggo','2017-11-23 08:44:19','2017-11-23 08:44:19'),('371','14','Kabupaten Pulang Pisau','2017-11-23 08:44:19','2017-11-23 08:44:19'),('372','20','Kabupaten Pulau Morotai','2017-11-23 08:44:19','2017-11-23 08:44:19'),('373','24','Kabupaten Puncak','2017-11-23 08:44:19','2017-11-23 08:44:19'),('374','24','Kabupaten Puncak Jaya','2017-11-23 08:44:19','2017-11-23 08:44:19'),('375','10','Kabupaten Purbalingga','2017-11-23 08:44:20','2017-11-23 08:44:20'),('376','9','Kabupaten Purwakarta','2017-11-23 08:44:20','2017-11-23 08:44:20'),('377','10','Kabupaten Purworejo','2017-11-23 08:44:20','2017-11-23 08:44:20'),('378','25','Kabupaten Raja Ampat','2017-11-23 08:44:20','2017-11-23 08:44:20'),('379','4','Kabupaten Rejang Lebong','2017-11-23 08:44:20','2017-11-23 08:44:20'),('38','28','Kabupaten Bantaeng','2017-11-23 08:44:08','2017-11-23 08:44:08'),('380','10','Kabupaten Rembang','2017-11-23 08:44:20','2017-11-23 08:44:20'),('381','26','Kabupaten Rokan Hilir','2017-11-23 08:44:20','2017-11-23 08:44:20'),('382','26','Kabupaten Rokan Hulu','2017-11-23 08:44:20','2017-11-23 08:44:20'),('383','23','Kabupaten Rote Ndao','2017-11-23 08:44:20','2017-11-23 08:44:20'),('384','21','Kota Sabang','2017-11-23 08:44:20','2017-11-23 08:44:20'),('385','23','Kabupaten Sabu Raijua','2017-11-23 08:44:20','2017-11-23 08:44:20'),('386','10','Kota Salatiga','2017-11-23 08:44:20','2017-11-23 08:44:20'),('387','15','Kota Samarinda','2017-11-23 08:44:20','2017-11-23 08:44:20'),('388','12','Kabupaten Sambas','2017-11-23 08:44:20','2017-11-23 08:44:20'),('389','34','Kabupaten Samosir','2017-11-23 08:44:20','2017-11-23 08:44:20'),('39','5','Kabupaten Bantul','2017-11-23 08:44:08','2017-11-23 08:44:08'),('390','11','Kabupaten Sampang','2017-11-23 08:44:20','2017-11-23 08:44:20'),('391','12','Kabupaten Sanggau','2017-11-23 08:44:20','2017-11-23 08:44:20'),('392','24','Kabupaten Sarmi','2017-11-23 08:44:20','2017-11-23 08:44:20'),('393','8','Kabupaten Sarolangun','2017-11-23 08:44:20','2017-11-23 08:44:20'),('394','32','Kota Sawah Lunto','2017-11-23 08:44:20','2017-11-23 08:44:20'),('395','12','Kabupaten Sekadau','2017-11-23 08:44:20','2017-11-23 08:44:20'),('396','28','Kabupaten Selayar (Kepulauan Selayar)','2017-11-23 08:44:20','2017-11-23 08:44:20'),('397','4','Kabupaten Seluma','2017-11-23 08:44:20','2017-11-23 08:44:20'),('398','10','Kabupaten Semarang','2017-11-23 08:44:20','2017-11-23 08:44:20'),('399','10','Kota Semarang','2017-11-23 08:44:20','2017-11-23 08:44:20'),('4','21','Kabupaten Aceh Jaya','2017-11-23 08:44:06','2017-11-23 08:44:06'),('40','33','Kabupaten Banyuasin','2017-11-23 08:44:08','2017-11-23 08:44:08'),('400','19','Kabupaten Seram Bagian Barat','2017-11-23 08:44:20','2017-11-23 08:44:20'),('401','19','Kabupaten Seram Bagian Timur','2017-11-23 08:44:20','2017-11-23 08:44:20'),('402','3','Kabupaten Serang','2017-11-23 08:44:21','2017-11-23 08:44:21'),('403','3','Kota Serang','2017-11-23 08:44:21','2017-11-23 08:44:21'),('404','34','Kabupaten Serdang Bedagai','2017-11-23 08:44:21','2017-11-23 08:44:21'),('405','14','Kabupaten Seruyan','2017-11-23 08:44:21','2017-11-23 08:44:21'),('406','26','Kabupaten Siak','2017-11-23 08:44:21','2017-11-23 08:44:21'),('407','34','Kota Sibolga','2017-11-23 08:44:21','2017-11-23 08:44:21'),('408','28','Kabupaten Sidenreng Rappang/Rapang','2017-11-23 08:44:21','2017-11-23 08:44:21'),('409','11','Kabupaten Sidoarjo','2017-11-23 08:44:21','2017-11-23 08:44:21'),('41','10','Kabupaten Banyumas','2017-11-23 08:44:08','2017-11-23 08:44:08'),('410','29','Kabupaten Sigi','2017-11-23 08:44:21','2017-11-23 08:44:21'),('411','32','Kabupaten Sijunjung (Sawah Lunto Sijunjung)','2017-11-23 08:44:21','2017-11-23 08:44:21'),('412','23','Kabupaten Sikka','2017-11-23 08:44:21','2017-11-23 08:44:21'),('413','34','Kabupaten Simalungun','2017-11-23 08:44:21','2017-11-23 08:44:21'),('414','21','Kabupaten Simeulue','2017-11-23 08:44:21','2017-11-23 08:44:21'),('415','12','Kota Singkawang','2017-11-23 08:44:21','2017-11-23 08:44:21'),('416','28','Kabupaten Sinjai','2017-11-23 08:44:21','2017-11-23 08:44:21'),('417','12','Kabupaten Sintang','2017-11-23 08:44:21','2017-11-23 08:44:21'),('418','11','Kabupaten Situbondo','2017-11-23 08:44:21','2017-11-23 08:44:21'),('419','5','Kabupaten Sleman','2017-11-23 08:44:21','2017-11-23 08:44:21'),('42','11','Kabupaten Banyuwangi','2017-11-23 08:44:08','2017-11-23 08:44:08'),('420','32','Kabupaten Solok','2017-11-23 08:44:21','2017-11-23 08:44:21'),('421','32','Kota Solok','2017-11-23 08:44:21','2017-11-23 08:44:21'),('422','32','Kabupaten Solok Selatan','2017-11-23 08:44:21','2017-11-23 08:44:21'),('423','28','Kabupaten Soppeng','2017-11-23 08:44:21','2017-11-23 08:44:21'),('424','25','Kabupaten Sorong','2017-11-23 08:44:21','2017-11-23 08:44:21'),('425','25','Kota Sorong','2017-11-23 08:44:21','2017-11-23 08:44:21'),('426','25','Kabupaten Sorong Selatan','2017-11-23 08:44:22','2017-11-23 08:44:22'),('427','10','Kabupaten Sragen','2017-11-23 08:44:22','2017-11-23 08:44:22'),('428','9','Kabupaten Subang','2017-11-23 08:44:22','2017-11-23 08:44:22'),('429','21','Kota Subulussalam','2017-11-23 08:44:22','2017-11-23 08:44:22'),('43','13','Kabupaten Barito Kuala','2017-11-23 08:44:08','2017-11-23 08:44:08'),('430','9','Kabupaten Sukabumi','2017-11-23 08:44:22','2017-11-23 08:44:22'),('431','9','Kota Sukabumi','2017-11-23 08:44:22','2017-11-23 08:44:22'),('432','14','Kabupaten Sukamara','2017-11-23 08:44:22','2017-11-23 08:44:22'),('433','10','Kabupaten Sukoharjo','2017-11-23 08:44:22','2017-11-23 08:44:22'),('434','23','Kabupaten Sumba Barat','2017-11-23 08:44:22','2017-11-23 08:44:22'),('435','23','Kabupaten Sumba Barat Daya','2017-11-23 08:44:22','2017-11-23 08:44:22'),('436','23','Kabupaten Sumba Tengah','2017-11-23 08:44:22','2017-11-23 08:44:22'),('437','23','Kabupaten Sumba Timur','2017-11-23 08:44:22','2017-11-23 08:44:22'),('438','22','Kabupaten Sumbawa','2017-11-23 08:44:22','2017-11-23 08:44:22'),('439','22','Kabupaten Sumbawa Barat','2017-11-23 08:44:22','2017-11-23 08:44:22'),('44','14','Kabupaten Barito Selatan','2017-11-23 08:44:08','2017-11-23 08:44:08'),('440','9','Kabupaten Sumedang','2017-11-23 08:44:22','2017-11-23 08:44:22'),('441','11','Kabupaten Sumenep','2017-11-23 08:44:22','2017-11-23 08:44:22'),('442','8','Kota Sungaipenuh','2017-11-23 08:44:22','2017-11-23 08:44:22'),('443','24','Kabupaten Supiori','2017-11-23 08:44:22','2017-11-23 08:44:22'),('444','11','Kota Surabaya','2017-11-23 08:44:22','2017-11-23 08:44:22'),('445','10','Kota Surakarta (Solo)','2017-11-23 08:44:22','2017-11-23 08:44:22'),('446','13','Kabupaten Tabalong','2017-11-23 08:44:22','2017-11-23 08:44:22'),('447','1','Kabupaten Tabanan','2017-11-23 08:44:22','2017-11-23 08:44:22'),('448','28','Kabupaten Takalar','2017-11-23 08:44:22','2017-11-23 08:44:22'),('449','25','Kabupaten Tambrauw','2017-11-23 08:44:22','2017-11-23 08:44:22'),('45','14','Kabupaten Barito Timur','2017-11-23 08:44:08','2017-11-23 08:44:08'),('450','16','Kabupaten Tana Tidung','2017-11-23 08:44:22','2017-11-23 08:44:22'),('451','28','Kabupaten Tana Toraja','2017-11-23 08:44:22','2017-11-23 08:44:22'),('452','13','Kabupaten Tanah Bumbu','2017-11-23 08:44:22','2017-11-23 08:44:22'),('453','32','Kabupaten Tanah Datar','2017-11-23 08:44:23','2017-11-23 08:44:23'),('454','13','Kabupaten Tanah Laut','2017-11-23 08:44:23','2017-11-23 08:44:23'),('455','3','Kabupaten Tangerang','2017-11-23 08:44:23','2017-11-23 08:44:23'),('456','3','Kota Tangerang','2017-11-23 08:44:23','2017-11-23 08:44:23'),('457','3','Kota Tangerang Selatan','2017-11-23 08:44:23','2017-11-23 08:44:23'),('458','18','Kabupaten Tanggamus','2017-11-23 08:44:23','2017-11-23 08:44:23'),('459','34','Kota Tanjung Balai','2017-11-23 08:44:23','2017-11-23 08:44:23'),('46','14','Kabupaten Barito Utara','2017-11-23 08:44:08','2017-11-23 08:44:08'),('460','8','Kabupaten Tanjung Jabung Barat','2017-11-23 08:44:23','2017-11-23 08:44:23'),('461','8','Kabupaten Tanjung Jabung Timur','2017-11-23 08:44:23','2017-11-23 08:44:23'),('462','17','Kota Tanjung Pinang','2017-11-23 08:44:23','2017-11-23 08:44:23'),('463','34','Kabupaten Tapanuli Selatan','2017-11-23 08:44:23','2017-11-23 08:44:23'),('464','34','Kabupaten Tapanuli Tengah','2017-11-23 08:44:23','2017-11-23 08:44:23'),('465','34','Kabupaten Tapanuli Utara','2017-11-23 08:44:23','2017-11-23 08:44:23'),('466','13','Kabupaten Tapin','2017-11-23 08:44:23','2017-11-23 08:44:23'),('467','16','Kota Tarakan','2017-11-23 08:44:23','2017-11-23 08:44:23'),('468','9','Kabupaten Tasikmalaya','2017-11-23 08:44:23','2017-11-23 08:44:23'),('469','9','Kota Tasikmalaya','2017-11-23 08:44:23','2017-11-23 08:44:23'),('47','28','Kabupaten Barru','2017-11-23 08:44:08','2017-11-23 08:44:08'),('470','34','Kota Tebing Tinggi','2017-11-23 08:44:23','2017-11-23 08:44:23'),('471','8','Kabupaten Tebo','2017-11-23 08:44:23','2017-11-23 08:44:23'),('472','10','Kabupaten Tegal','2017-11-23 08:44:23','2017-11-23 08:44:23'),('473','10','Kota Tegal','2017-11-23 08:44:23','2017-11-23 08:44:23'),('474','25','Kabupaten Teluk Bintuni','2017-11-23 08:44:23','2017-11-23 08:44:23'),('475','25','Kabupaten Teluk Wondama','2017-11-23 08:44:23','2017-11-23 08:44:23'),('476','10','Kabupaten Temanggung','2017-11-23 08:44:23','2017-11-23 08:44:23'),('477','20','Kota Ternate','2017-11-23 08:44:23','2017-11-23 08:44:23'),('478','20','Kota Tidore Kepulauan','2017-11-23 08:44:23','2017-11-23 08:44:23'),('479','23','Kabupaten Timor Tengah Selatan','2017-11-23 08:44:23','2017-11-23 08:44:23'),('48','17','Kota Batam','2017-11-23 08:44:08','2017-11-23 08:44:08'),('480','23','Kabupaten Timor Tengah Utara','2017-11-23 08:44:24','2017-11-23 08:44:24'),('481','34','Kabupaten Toba Samosir','2017-11-23 08:44:24','2017-11-23 08:44:24'),('482','29','Kabupaten Tojo Una-Una','2017-11-23 08:44:24','2017-11-23 08:44:24'),('483','29','Kabupaten Toli-Toli','2017-11-23 08:44:24','2017-11-23 08:44:24'),('484','24','Kabupaten Tolikara','2017-11-23 08:44:24','2017-11-23 08:44:24'),('485','31','Kota Tomohon','2017-11-23 08:44:24','2017-11-23 08:44:24'),('486','28','Kabupaten Toraja Utara','2017-11-23 08:44:24','2017-11-23 08:44:24'),('487','11','Kabupaten Trenggalek','2017-11-23 08:44:24','2017-11-23 08:44:24'),('488','19','Kota Tual','2017-11-23 08:44:24','2017-11-23 08:44:24'),('489','11','Kabupaten Tuban','2017-11-23 08:44:24','2017-11-23 08:44:24'),('49','10','Kabupaten Batang','2017-11-23 08:44:08','2017-11-23 08:44:08'),('490','18','Kabupaten Tulang Bawang','2017-11-23 08:44:24','2017-11-23 08:44:24'),('491','18','Kabupaten Tulang Bawang Barat','2017-11-23 08:44:24','2017-11-23 08:44:24'),('492','11','Kabupaten Tulungagung','2017-11-23 08:44:24','2017-11-23 08:44:24'),('493','28','Kabupaten Wajo','2017-11-23 08:44:24','2017-11-23 08:44:24'),('494','30','Kabupaten Wakatobi','2017-11-23 08:44:24','2017-11-23 08:44:24'),('495','24','Kabupaten Waropen','2017-11-23 08:44:24','2017-11-23 08:44:24'),('496','18','Kabupaten Way Kanan','2017-11-23 08:44:24','2017-11-23 08:44:24'),('497','10','Kabupaten Wonogiri','2017-11-23 08:44:24','2017-11-23 08:44:24'),('498','10','Kabupaten Wonosobo','2017-11-23 08:44:24','2017-11-23 08:44:24'),('499','24','Kabupaten Yahukimo','2017-11-23 08:44:24','2017-11-23 08:44:24'),('5','21','Kabupaten Aceh Selatan','2017-11-23 08:44:06','2017-11-23 08:44:06'),('50','8','Kabupaten Batang Hari','2017-11-23 08:44:08','2017-11-23 08:44:08'),('500','24','Kabupaten Yalimo','2017-11-23 08:44:24','2017-11-23 08:44:24'),('501','5','Kota Yogyakarta','2017-11-23 08:44:24','2017-11-23 08:44:24'),('51','11','Kota Batu','2017-11-23 08:44:08','2017-11-23 08:44:08'),('52','34','Kabupaten Batu Bara','2017-11-23 08:44:08','2017-11-23 08:44:08'),('53','30','Kota Bau-Bau','2017-11-23 08:44:08','2017-11-23 08:44:08'),('54','9','Kabupaten Bekasi','2017-11-23 08:44:08','2017-11-23 08:44:08'),('55','9','Kota Bekasi','2017-11-23 08:44:08','2017-11-23 08:44:08'),('56','2','Kabupaten Belitung','2017-11-23 08:44:08','2017-11-23 08:44:08'),('57','2','Kabupaten Belitung Timur','2017-11-23 08:44:08','2017-11-23 08:44:08'),('58','23','Kabupaten Belu','2017-11-23 08:44:08','2017-11-23 08:44:08'),('59','21','Kabupaten Bener Meriah','2017-11-23 08:44:08','2017-11-23 08:44:08'),('6','21','Kabupaten Aceh Singkil','2017-11-23 08:44:07','2017-11-23 08:44:07'),('60','26','Kabupaten Bengkalis','2017-11-23 08:44:08','2017-11-23 08:44:08'),('61','12','Kabupaten Bengkayang','2017-11-23 08:44:08','2017-11-23 08:44:08'),('62','4','Kota Bengkulu','2017-11-23 08:44:08','2017-11-23 08:44:08'),('63','4','Kabupaten Bengkulu Selatan','2017-11-23 08:44:09','2017-11-23 08:44:09'),('64','4','Kabupaten Bengkulu Tengah','2017-11-23 08:44:09','2017-11-23 08:44:09'),('65','4','Kabupaten Bengkulu Utara','2017-11-23 08:44:09','2017-11-23 08:44:09'),('66','15','Kabupaten Berau','2017-11-23 08:44:09','2017-11-23 08:44:09'),('67','24','Kabupaten Biak Numfor','2017-11-23 08:44:09','2017-11-23 08:44:09'),('68','22','Kabupaten Bima','2017-11-23 08:44:09','2017-11-23 08:44:09'),('69','22','Kota Bima','2017-11-23 08:44:09','2017-11-23 08:44:09'),('7','21','Kabupaten Aceh Tamiang','2017-11-23 08:44:07','2017-11-23 08:44:07'),('70','34','Kota Binjai','2017-11-23 08:44:09','2017-11-23 08:44:09'),('71','17','Kabupaten Bintan','2017-11-23 08:44:09','2017-11-23 08:44:09'),('72','21','Kabupaten Bireuen','2017-11-23 08:44:09','2017-11-23 08:44:09'),('73','31','Kota Bitung','2017-11-23 08:44:09','2017-11-23 08:44:09'),('74','11','Kabupaten Blitar','2017-11-23 08:44:09','2017-11-23 08:44:09'),('75','11','Kota Blitar','2017-11-23 08:44:09','2017-11-23 08:44:09'),('76','10','Kabupaten Blora','2017-11-23 08:44:09','2017-11-23 08:44:09'),('77','7','Kabupaten Boalemo','2017-11-23 08:44:09','2017-11-23 08:44:09'),('78','9','Kabupaten Bogor','2017-11-23 08:44:09','2017-11-23 08:44:09'),('79','9','Kota Bogor','2017-11-23 08:44:09','2017-11-23 08:44:09'),('8','21','Kabupaten Aceh Tengah','2017-11-23 08:44:07','2017-11-23 08:44:07'),('80','11','Kabupaten Bojonegoro','2017-11-23 08:44:09','2017-11-23 08:44:09'),('81','31','Kabupaten Bolaang Mongondow (Bolmong)','2017-11-23 08:44:09','2017-11-23 08:44:09'),('82','31','Kabupaten Bolaang Mongondow Selatan','2017-11-23 08:44:09','2017-11-23 08:44:09'),('83','31','Kabupaten Bolaang Mongondow Timur','2017-11-23 08:44:09','2017-11-23 08:44:09'),('84','31','Kabupaten Bolaang Mongondow Utara','2017-11-23 08:44:09','2017-11-23 08:44:09'),('85','30','Kabupaten Bombana','2017-11-23 08:44:09','2017-11-23 08:44:09'),('86','11','Kabupaten Bondowoso','2017-11-23 08:44:09','2017-11-23 08:44:09'),('87','28','Kabupaten Bone','2017-11-23 08:44:09','2017-11-23 08:44:09'),('88','7','Kabupaten Bone Bolango','2017-11-23 08:44:09','2017-11-23 08:44:09'),('89','15','Kota Bontang','2017-11-23 08:44:09','2017-11-23 08:44:09'),('9','21','Kabupaten Aceh Tenggara','2017-11-23 08:44:07','2017-11-23 08:44:07'),('90','24','Kabupaten Boven Digoel','2017-11-23 08:44:09','2017-11-23 08:44:09'),('91','10','Kabupaten Boyolali','2017-11-23 08:44:09','2017-11-23 08:44:09'),('92','10','Kabupaten Brebes','2017-11-23 08:44:10','2017-11-23 08:44:10'),('93','32','Kota Bukittinggi','2017-11-23 08:44:10','2017-11-23 08:44:10'),('94','1','Kabupaten Buleleng','2017-11-23 08:44:10','2017-11-23 08:44:10'),('95','28','Kabupaten Bulukumba','2017-11-23 08:44:10','2017-11-23 08:44:10'),('96','16','Kabupaten Bulungan (Bulongan)','2017-11-23 08:44:10','2017-11-23 08:44:10'),('97','8','Kabupaten Bungo','2017-11-23 08:44:10','2017-11-23 08:44:10'),('98','29','Kabupaten Buol','2017-11-23 08:44:10','2017-11-23 08:44:10'),('99','19','Kabupaten Buru','2017-11-23 08:44:10','2017-11-23 08:44:10');

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'Admin','admin@gmail.com','$2y$10$ZUV.aA0XuFM2cBc1.cpnpO/Gw6N97eWLVZ6RtSQugLmPqpgYkPev2','admin',NULL,'2017-11-23 08:44:01','2017-11-23 08:44:01'),(2,'customer','customer@gmail.com','$2y$10$ko8OQWe3LF83/a3wyBEUcOfeAAG.XBzB8KPeLz0.EXdoRIv0NwGe6','customer',NULL,'2017-11-23 08:44:01','2017-11-23 08:44:01'),(3,'Humam Al Amin','humamalamin13@gmail.com','','customer',NULL,'2017-11-23 08:59:44','2017-11-23 08:59:44');

#
# Structure for table "addresses"
#

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `regency_id` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_regency_id_foreign` (`regency_id`),
  KEY `addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `addresses_regency_id_foreign` FOREIGN KEY (`regency_id`) REFERENCES `regencies` (`id`),
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "addresses"
#

INSERT INTO `addresses` VALUES (1,2,'Budi','Kp Cipadung RT 4 RW 9 Ds Cipadung','107','87823451238','2017-11-23 08:44:24','2017-11-23 08:44:24'),(2,2,'Susi','Kp Karang Jati RT 19 RW 23 Ds Sukamahi','55','87823451238','2017-11-23 08:44:24','2017-11-23 08:44:24'),(3,3,'Humam Al Amin','Ulujami','153','85891931071','2017-11-23 08:59:44','2017-11-23 08:59:44');

#
# Structure for table "orders"
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `address_id` int(10) unsigned NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'waiting-payment',
  `bank` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sender` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total_payment` decimal(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_address_id_foreign` (`address_id`),
  CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "orders"
#

INSERT INTO `orders` VALUES (1,3,3,'waiting-payment','bca','Humam Al Amin',3690000.00,'2017-11-23 08:59:44','2017-11-23 08:59:44'),(2,2,2,'waiting-payment','atm-bersama','Susi',2193000.00,'2017-11-23 09:14:53','2017-11-23 09:14:54');

#
# Structure for table "order_details"
#

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `total_price` decimal(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_details_order_id_foreign` (`order_id`),
  KEY `order_details_product_id_foreign` (`product_id`),
  CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "order_details"
#

INSERT INTO `order_details` VALUES (1,1,1,4,340000.00,20000.00,1440000.00,'2017-11-23 08:59:44','2017-11-23 08:59:44'),(2,1,2,5,420000.00,30000.00,2250000.00,'2017-11-23 08:59:44','2017-11-23 08:59:44'),(3,2,4,3,720000.00,11000.00,2193000.00,'2017-11-23 09:14:53','2017-11-23 09:14:53');

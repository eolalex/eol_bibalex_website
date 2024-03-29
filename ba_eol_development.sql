-- MySQL dump 10.13  Distrib 5.5.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: 
-- ------------------------------------------------------
-- Server version	5.5.58-0+deb8u1

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
-- Current Database: `ba_eol_development`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ba_eol_development` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ba_eol_development`;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2018-05-23 11:57:52','2018-05-23 11:57:52');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner` text,
  `resource_id` int(11) DEFAULT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `resource_pk` varchar(255) DEFAULT NULL,
  `languages_id` bigint(20) DEFAULT NULL,
  `licenses_id` bigint(20) DEFAULT NULL,
  `locations_id` bigint(20) DEFAULT NULL,
  `mime_type` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rights_statement` varchar(255) DEFAULT NULL,
  `source_url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `bibliographic_citation_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_articles_on_languages_id` (`languages_id`),
  KEY `index_articles_on_licenses_id` (`licenses_id`),
  KEY `index_articles_on_locations_id` (`locations_id`),
  KEY `index_articles_on_bibliographic_citation_id` (`bibliographic_citation_id`),
  CONSTRAINT `fk_rails_167e580e33` FOREIGN KEY (`licenses_id`) REFERENCES `licenses` (`id`),
  CONSTRAINT `fk_rails_82eae30da3` FOREIGN KEY (`languages_id`) REFERENCES `languages` (`id`),
  CONSTRAINT `fk_rails_dce27d14a3` FOREIGN KEY (`bibliographic_citation_id`) REFERENCES `bibliographic_citations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles_collected_pages`
--

DROP TABLE IF EXISTS `articles_collected_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles_collected_pages` (
  `collected_page_id` bigint(20) NOT NULL,
  `article_id` bigint(20) NOT NULL,
  `position` int(11) DEFAULT NULL,
  KEY `index_articles_collected_pages_on_collected_page_id` (`collected_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_collected_pages`
--

LOCK TABLES `articles_collected_pages` WRITE;
/*!40000 ALTER TABLE `articles_collected_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles_collected_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributions`
--

DROP TABLE IF EXISTS `attributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `value` text,
  `url` varchar(255) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_pk` varchar(255) DEFAULT NULL,
  `content_resource_fk` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attributions_on_content_type` (`content_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributions`
--

LOCK TABLES `attributions` WRITE;
/*!40000 ALTER TABLE `attributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bibliographic_citations`
--

DROP TABLE IF EXISTS `bibliographic_citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibliographic_citations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `body` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibliographic_citations`
--

LOCK TABLES `bibliographic_citations` WRITE;
/*!40000 ALTER TABLE `bibliographic_citations` DISABLE KEYS */;
INSERT INTO `bibliographic_citations` VALUES (1,1,'sa','2018-07-04 15:00:58','2018-07-04 15:00:58');
/*!40000 ALTER TABLE `bibliographic_citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collected_pages`
--

DROP TABLE IF EXISTS `collected_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collected_pages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `collection_id` bigint(20) NOT NULL,
  `page_id` bigint(20) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `annotation` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enforce_unique_pairs` (`collection_id`,`page_id`),
  KEY `index_collected_pages_on_collection_id` (`collection_id`),
  KEY `index_collected_pages_on_page_id` (`page_id`),
  CONSTRAINT `fk_rails_46e24d72cf` FOREIGN KEY (`collection_id`) REFERENCES `collections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collected_pages`
--

LOCK TABLES `collected_pages` WRITE;
/*!40000 ALTER TABLE `collected_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `collected_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collected_pages_links`
--

DROP TABLE IF EXISTS `collected_pages_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collected_pages_links` (
  `collected_page_id` bigint(20) NOT NULL,
  `link_id` bigint(20) NOT NULL,
  `position` int(11) DEFAULT NULL,
  KEY `index_collected_pages_links_on_collected_page_id` (`collected_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collected_pages_links`
--

LOCK TABLES `collected_pages_links` WRITE;
/*!40000 ALTER TABLE `collected_pages_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `collected_pages_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collected_pages_media`
--

DROP TABLE IF EXISTS `collected_pages_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collected_pages_media` (
  `collected_page_id` bigint(20) NOT NULL,
  `medium_id` bigint(20) NOT NULL,
  `position` int(11) DEFAULT NULL,
  KEY `index_collected_pages_media_on_collected_page_id` (`collected_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collected_pages_media`
--

LOCK TABLES `collected_pages_media` WRITE;
/*!40000 ALTER TABLE `collected_pages_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `collected_pages_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `collected_pages_count` int(11) DEFAULT '0',
  `collection_associations_count` int(11) DEFAULT '0',
  `collection_type` int(11) DEFAULT '0',
  `default_sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_users`
--

DROP TABLE IF EXISTS `collections_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_users` (
  `collection_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_manager` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  KEY `index_collections_users_on_collection_id` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_users`
--

LOCK TABLES `collections_users` WRITE;
/*!40000 ALTER TABLE `collections_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_partner_users`
--

DROP TABLE IF EXISTS `content_partner_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partner_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `content_partner_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_content_partner_users_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partner_users`
--

LOCK TABLES `content_partner_users` WRITE;
/*!40000 ALTER TABLE `content_partner_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_partner_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_sections`
--

DROP TABLE IF EXISTS `content_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_sections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `section_id` bigint(20) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_content_sections_on_section_id` (`section_id`),
  CONSTRAINT `fk_rails_26e636aea0` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_sections`
--

LOCK TABLES `content_sections` WRITE;
/*!40000 ALTER TABLE `content_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_info`
--

DROP TABLE IF EXISTS `image_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `original_size` varchar(255) DEFAULT NULL,
  `large_size` varchar(255) DEFAULT NULL,
  `medium_size` varchar(255) DEFAULT NULL,
  `small_size` varchar(255) DEFAULT NULL,
  `crop_x` decimal(10,0) DEFAULT NULL,
  `crop_y` decimal(10,0) DEFAULT NULL,
  `crop_w` decimal(10,0) DEFAULT NULL,
  `resource_pk` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_info`
--

LOCK TABLES `image_info` WRITE;
/*!40000 ALTER TABLE `image_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `group` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT INTO `licenses` VALUES (1,'source_url','License1','2018-07-04 09:00:24','2018-07-04 09:00:24');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` text,
  `resource_id` int(11) DEFAULT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `resource_pk` varchar(255) DEFAULT NULL,
  `languages_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `rights_statement` varchar(255) DEFAULT NULL,
  `source_url` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_links_on_languages_id` (`languages_id`),
  CONSTRAINT `fk_rails_0f796e1364` FOREIGN KEY (`languages_id`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `longitude` decimal(10,0) DEFAULT NULL,
  `latitude` decimal(10,0) DEFAULT NULL,
  `altitude` decimal(10,0) DEFAULT NULL,
  `spatial_location` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `format` int(11) NOT NULL DEFAULT '1',
  `description` text,
  `owner` varchar(255) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `guid` varchar(255) NOT NULL,
  `resource_pk` varchar(255) DEFAULT NULL,
  `source_page_url` varchar(255) DEFAULT NULL,
  `base_url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `mime_type` int(11) DEFAULT NULL,
  `subclass` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `rights_statment` varchar(255) DEFAULT NULL,
  `source_url` varchar(255) DEFAULT NULL,
  `bibliographic_citation_id` bigint(20) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `license_id` bigint(20) DEFAULT NULL,
  `location_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_media_on_bibliographic_citation_id` (`bibliographic_citation_id`),
  KEY `index_media_on_language_id` (`language_id`),
  KEY `index_media_on_license_id` (`license_id`),
  KEY `index_media_on_location_id` (`location_id`),
  CONSTRAINT `fk_rails_15659d24cb` FOREIGN KEY (`bibliographic_citation_id`) REFERENCES `bibliographic_citations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,0,'description','amr',1,'GUID','1','https://www.gettyimages.ie/gi-resources/images/Homepage/Hero/UK/CMS_Creative_164657191_Kingfisher.jpg','https://www.gettyimages.ie/gi-resources/images/Homepage/Hero/UK/CMS_Creative_164657191_Kingfisher.jpg','2018-07-04 15:01:03','2018-07-04 15:01:03',1,1,'bird','ds','https://www.gettyimages.ie/gi-resources/images/Homepage/Hero/UK/CMS_Creative_164657191_Kingfisher.jpg',1,1,1,1);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_ancestors`
--

DROP TABLE IF EXISTS `node_ancestors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_ancestors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `node_id` int(11) DEFAULT NULL COMMENT 'the id of the descendant node',
  `ancestor_id` int(11) DEFAULT NULL COMMENT 'the id of the node which is an ancestor',
  `node_resource_pk` varchar(255) DEFAULT NULL,
  `ancestor_resource_pk` varchar(255) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_node_ancestors_on_node_id` (`node_id`),
  KEY `index_node_ancestors_on_ancestor_id` (`ancestor_id`),
  KEY `index_node_ancestors_on_node_resource_pk` (`node_resource_pk`),
  KEY `index_node_ancestors_on_ancestor_resource_pk` (`ancestor_resource_pk`),
  KEY `index_node_ancestors_on_resource_id` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_ancestors`
--

LOCK TABLES `node_ancestors` WRITE;
/*!40000 ALTER TABLE `node_ancestors` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_ancestors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `scientific_name` varchar(255) DEFAULT NULL,
  `canonical_form` varchar(255) DEFAULT NULL,
  `generated_node_id` int(11) DEFAULT NULL,
  `resource_pk` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `rank_id` bigint(20) DEFAULT NULL,
  `page_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_nodes_on_generated_node_id` (`generated_node_id`),
  KEY `index_nodes_on_rank_id` (`rank_id`),
  KEY `index_nodes_on_page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` VALUES (1,1,'Panthera Tigris','canonical form',1,'1','2018-07-04 15:06:50','2018-07-04 15:06:50',1,1,1);
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_contents`
--

DROP TABLE IF EXISTS `page_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_contents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `trust` int(11) DEFAULT NULL,
  `is_incorrect` tinyint(1) DEFAULT NULL,
  `is_misidentified` tinyint(1) DEFAULT NULL,
  `is_hidden` tinyint(1) DEFAULT NULL,
  `is_duplicate` tinyint(1) DEFAULT NULL,
  `page_id` bigint(20) DEFAULT NULL,
  `source_page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_page_contents_on_content_type` (`content_type`),
  KEY `index_page_contents_on_page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_contents`
--

LOCK TABLES `page_contents` WRITE;
/*!40000 ALTER TABLE `page_contents` DISABLE KEYS */;
INSERT INTO `page_contents` VALUES (1,1,'Medium',1,'2018-07-04 15:03:54','2018-07-04 15:03:54',1,0,0,0,0,1,1);
/*!40000 ALTER TABLE `page_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `page_richness` int(11) DEFAULT NULL,
  `node_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'2018-07-04 14:50:19','2018-07-04 14:50:19',1,1);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_nodes`
--

DROP TABLE IF EXISTS `pages_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_nodes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `page_id` bigint(20) DEFAULT NULL,
  `node_id` bigint(20) DEFAULT NULL,
  `is_native` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pages_nodes_on_page_id` (`page_id`),
  KEY `index_pages_nodes_on_node_id` (`node_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_nodes`
--

LOCK TABLES `pages_nodes` WRITE;
/*!40000 ALTER TABLE `pages_nodes` DISABLE KEYS */;
INSERT INTO `pages_nodes` VALUES (1,1,1,1,'2018-07-04 15:07:56','2018-07-04 15:07:56');
/*!40000 ALTER TABLE `pages_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_referents`
--

DROP TABLE IF EXISTS `pages_referents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_referents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `referent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_referents`
--

LOCK TABLES `pages_referents` WRITE;
/*!40000 ALTER TABLE `pages_referents` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_referents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (1,'Kingdom','2018-07-07 11:39:58','2018-07-07 11:39:58'),(2,'species','2018-07-07 11:50:12','2018-07-07 11:50:12');
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `references`
--

DROP TABLE IF EXISTS `references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `references` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `referent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_references_on_parent_type` (`parent_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `references`
--

LOCK TABLES `references` WRITE;
/*!40000 ALTER TABLE `references` DISABLE KEYS */;
/*!40000 ALTER TABLE `references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referents`
--

DROP TABLE IF EXISTS `referents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `primary_title` varchar(255) DEFAULT NULL,
  `secondary_title` varchar(255) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `page_start` int(11) DEFAULT NULL,
  `page_end` int(11) DEFAULT NULL,
  `volume` varchar(255) DEFAULT NULL,
  `editor` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `authors_list` varchar(255) DEFAULT NULL,
  `editors_list` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `doi` varchar(255) DEFAULT NULL,
  `body` text,
  `resource_id` int(11) DEFAULT NULL,
  `resource_pk` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referents`
--

LOCK TABLES `referents` WRITE;
/*!40000 ALTER TABLE `referents` DISABLE KEYS */;
/*!40000 ALTER TABLE `referents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_image_translations`
--

DROP TABLE IF EXISTS `refinery_image_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_image_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refinery_image_id` int(11) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_alt` varchar(255) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_image_translations_on_refinery_image_id` (`refinery_image_id`),
  KEY `index_refinery_image_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_image_translations`
--

LOCK TABLES `refinery_image_translations` WRITE;
/*!40000 ALTER TABLE `refinery_image_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_image_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_images`
--

DROP TABLE IF EXISTS `refinery_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_mime_type` varchar(255) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `image_width` int(11) DEFAULT NULL,
  `image_height` int(11) DEFAULT NULL,
  `image_uid` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_images`
--

LOCK TABLES `refinery_images` WRITE;
/*!40000 ALTER TABLE `refinery_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_page_part_translations`
--

DROP TABLE IF EXISTS `refinery_page_part_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_page_part_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refinery_page_part_id` int(11) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `body` text,
  PRIMARY KEY (`id`),
  KEY `index_refinery_page_part_translations_on_refinery_page_part_id` (`refinery_page_part_id`),
  KEY `index_refinery_page_part_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_page_part_translations`
--

LOCK TABLES `refinery_page_part_translations` WRITE;
/*!40000 ALTER TABLE `refinery_page_part_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_page_part_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_page_parts`
--

DROP TABLE IF EXISTS `refinery_page_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_page_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_page_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_page_parts_on_id` (`id`),
  KEY `index_refinery_page_parts_on_refinery_page_id` (`refinery_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_page_parts`
--

LOCK TABLES `refinery_page_parts` WRITE;
/*!40000 ALTER TABLE `refinery_page_parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_page_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_page_translations`
--

DROP TABLE IF EXISTS `refinery_page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_page_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refinery_page_id` int(11) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `custom_slug` varchar(255) DEFAULT NULL,
  `menu_title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_page_translations_on_refinery_page_id` (`refinery_page_id`),
  KEY `index_refinery_page_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_page_translations`
--

LOCK TABLES `refinery_page_translations` WRITE;
/*!40000 ALTER TABLE `refinery_page_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_pages`
--

DROP TABLE IF EXISTS `refinery_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `show_in_menu` tinyint(1) DEFAULT '1',
  `link_url` varchar(255) DEFAULT NULL,
  `menu_match` varchar(255) DEFAULT NULL,
  `deletable` tinyint(1) DEFAULT '1',
  `draft` tinyint(1) DEFAULT '0',
  `skip_to_first_child` tinyint(1) DEFAULT '0',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `view_template` varchar(255) DEFAULT NULL,
  `layout_template` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `children_count` int(11) NOT NULL DEFAULT '0',
  `show_date` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_pages_on_depth` (`depth`),
  KEY `index_refinery_pages_on_id` (`id`),
  KEY `index_refinery_pages_on_lft` (`lft`),
  KEY `index_refinery_pages_on_parent_id` (`parent_id`),
  KEY `index_refinery_pages_on_rgt` (`rgt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_pages`
--

LOCK TABLES `refinery_pages` WRITE;
/*!40000 ALTER TABLE `refinery_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_resource_translations`
--

DROP TABLE IF EXISTS `refinery_resource_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_resource_translations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `refinery_resource_id` int(11) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resource_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_resource_translations_on_refinery_resource_id` (`refinery_resource_id`),
  KEY `index_refinery_resource_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_resource_translations`
--

LOCK TABLES `refinery_resource_translations` WRITE;
/*!40000 ALTER TABLE `refinery_resource_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_resource_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_resources`
--

DROP TABLE IF EXISTS `refinery_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_uid` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_resources`
--

LOCK TABLES `refinery_resources` WRITE;
/*!40000 ALTER TABLE `refinery_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20180517082959'),('20180523115010'),('20180523115012'),('20180523115013'),('20180523115015'),('20180523115017'),('20180523115018'),('20180523115020'),('20180523115021'),('20180523115023'),('20180523115024'),('20180523115026'),('20180523115028'),('20180523115029'),('20180523115031'),('20180603074016'),('20180604102210'),('20180604102935'),('20180606102444'),('20180606120759'),('20180606120824'),('20180607084811'),('20180607085603'),('20180607090841'),('20180607101236'),('20180607113411'),('20180607120830'),('20180607124449'),('20180607125258'),('20180607125425'),('20180607125727'),('20180607125919'),('20180610090522'),('20180610090614'),('20180611115013'),('20180612115746'),('20180613073018'),('20180613075647'),('20180619071754'),('20180619072545'),('20180619083915'),('20180619083916'),('20180619083917'),('20180619083918'),('20180619083919'),('20180619083920'),('20180619083921'),('20180619083922'),('20180619083923'),('20180619083924'),('20180619083925'),('20180619083926'),('20180619083927'),('20180619083928'),('20180619083929'),('20180619083930'),('20180619083931'),('20180619092855'),('20180619101757'),('20180619102236'),('20180619102514'),('20180619102743'),('20180619112852'),('20180620084729'),('20180620092931'),('20180620131121'),('20180621135321'),('20180621142008'),('20180626131900'),('20180629110311'),('20180629114045'),('20180701102342'),('20180701103521'),('20180701111054'),('20180701111505'),('20180701111921'),('20180701112345'),('20180701112601'),('20180701112657'),('20180701112956'),('20180701113244'),('20180701113400'),('20180701115517'),('20180701123605'),('20180701124017'),('20180701124449'),('20180702084601'),('20180702092906'),('20180702115007'),('20180702115300'),('20180702125112'),('20180703081655'),('20180703083253'),('20180703085010');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scientific_names`
--

DROP TABLE IF EXISTS `scientific_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scientific_names` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `canonical_form` varchar(255) DEFAULT NULL,
  `node_resource_pk` varchar(255) DEFAULT NULL,
  `italicized` varchar(255) DEFAULT NULL,
  `generated_node_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_preferred` tinyint(1) DEFAULT NULL,
  `node_id` bigint(20) DEFAULT NULL,
  `page_id` bigint(20) DEFAULT NULL,
  `taxonomic_status_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_scientific_names_on_generated_node_id` (`generated_node_id`),
  KEY `index_scientific_names_on_node_id` (`node_id`),
  KEY `index_scientific_names_on_page_id` (`page_id`),
  KEY `index_scientific_names_on_taxonomic_status_id` (`taxonomic_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scientific_names`
--

LOCK TABLES `scientific_names` WRITE;
/*!40000 ALTER TABLE `scientific_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `scientific_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_meta`
--

DROP TABLE IF EXISTS `seo_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seo_meta_id` int(11) DEFAULT NULL,
  `seo_meta_type` varchar(255) DEFAULT NULL,
  `browser_title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_seo_meta_on_id` (`id`),
  KEY `id_type_index_on_seo_meta` (`seo_meta_id`,`seo_meta_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_meta`
--

LOCK TABLES `seo_meta` WRITE;
/*!40000 ALTER TABLE `seo_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomic_statuses`
--

DROP TABLE IF EXISTS `taxonomic_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomic_statuses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `is_preferred` tinyint(1) DEFAULT NULL,
  `is_problematic` tinyint(1) DEFAULT NULL,
  `is_alternative_preferred` tinyint(1) DEFAULT NULL,
  `can_merge` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomic_statuses`
--

LOCK TABLES `taxonomic_statuses` WRITE;
/*!40000 ALTER TABLE `taxonomic_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxonomic_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'amr.morad@eol.org','$2a$11$.fNJdSUqOQ97mjBzKmz68.5osdxX1Ws0mzzzhINRo4QJqgft0A8ce',NULL,NULL,NULL,2,'2018-07-03 12:49:56','2018-07-03 07:02:38','127.0.0.1','127.0.0.1','gbFwxZ3icDb_RoMiBNWJ','2018-07-03 09:02:27','2018-07-03 06:51:22','2018-07-03 06:51:22','2018-07-03 12:49:56',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vernaculars`
--

DROP TABLE IF EXISTS `vernaculars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vernaculars` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `string` varchar(255) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `is_prefered_by_resource` tinyint(1) DEFAULT NULL,
  `generated_node_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `node_id` bigint(20) DEFAULT NULL,
  `page_id` bigint(20) DEFAULT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vernaculars_on_generated_node_id` (`generated_node_id`),
  KEY `index_vernaculars_on_node_id` (`node_id`),
  KEY `index_vernaculars_on_page_id` (`page_id`),
  KEY `index_vernaculars_on_language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vernaculars`
--

LOCK TABLES `vernaculars` WRITE;
/*!40000 ALTER TABLE `vernaculars` DISABLE KEYS */;
/*!40000 ALTER TABLE `vernaculars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `eol`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `eol` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `eol`;

--
-- Table structure for table `content_partner`
--

DROP TABLE IF EXISTS `content_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(255) DEFAULT NULL,
  `url` text,
  `description` text,
  `logo_path` text,
  `logo_type` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_partner`
--

LOCK TABLES `content_partner` WRITE;
/*!40000 ALTER TABLE `content_partner` DISABLE KEYS */;
INSERT INTO `content_partner` VALUES (1,'hhh','fd','re','hk','path','','2018-07-03 13:51:24','2018-07-03 13:51:24'),(2,'cp1','cp1','cp1','cp1','path','','2018-07-03 13:53:02','2018-07-03 13:53:02'),(3,'fd','fd','fd','fd','/eol_workspace/contentPartners/3/','','2018-07-03 14:02:31','2018-07-03 14:02:32'),(4,'as','as','as','as','/eol_workspace/contentPartners/4/','','2018-07-03 14:04:51','2018-07-03 14:04:51');
/*!40000 ALTER TABLE `content_partner` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `my_table_bi` BEFORE INSERT ON `content_partner` FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `harvest`
--

DROP TABLE IF EXISTS `harvest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `harvest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `start_at` datetime DEFAULT NULL,
  `validated_at` datetime DEFAULT NULL,
  `deltas_created_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `state` enum('succeed','failed','running','pending') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `harvest`
--

LOCK TABLES `harvest` WRITE;
/*!40000 ALTER TABLE `harvest` DISABLE KEYS */;
/*!40000 ALTER TABLE `harvest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_partner_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `origin_url` text,
  `uploaded_url` text,
  `type` enum('url','file') DEFAULT NULL,
  `path` text,
  `is_harvest_inprogress` tinyint(1) DEFAULT '0',
  `last_harvested_at` datetime DEFAULT NULL,
  `harvest_frequency` enum('0','7','30','60','90') DEFAULT NULL,
  `day_of_month` int(11) unsigned DEFAULT '0',
  `nodes_count` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT '-1',
  `is_paused` tinyint(1) DEFAULT '0',
  `is_approved` tinyint(1) DEFAULT '0',
  `is_trusted` tinyint(1) DEFAULT '0',
  `is_autopublished` tinyint(1) DEFAULT '0',
  `is_forced` tinyint(1) DEFAULT '0',
  `forced_internally` tinyint(1) DEFAULT '0',
  `dataset_license` int(11) DEFAULT '47',
  `dataset_rights_statement` text,
  `dataset_rights_holder` text,
  `default_license_string` int(11) DEFAULT NULL,
  `default_rights_statement` text,
  `default_rights_holder` text,
  `default_language_id` int(11) DEFAULT '152',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES (102,4,'uy','uy',NULL,'file','/eol_workspace/resources/102/',0,NULL,'0',0,0,-1,0,0,0,0,0,0,1,'uy','uy',1,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `eol_development`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `eol_development` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `eol_development`;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `resource_pk` varchar(255) DEFAULT NULL,
  `license_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `stylesheet_id` int(11) DEFAULT NULL,
  `javascript_id` int(11) DEFAULT NULL,
  `bibliographic_citation_id` int(11) DEFAULT NULL,
  `owner` text NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `source_url` varchar(4096) DEFAULT NULL,
  `body` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `rights_statement` varchar(1024) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_articles_on_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles_collected_pages`
--

DROP TABLE IF EXISTS `articles_collected_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles_collected_pages` (
  `collected_page_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  KEY `index_articles_collected_pages_on_collected_page_id` (`collected_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_collected_pages`
--

LOCK TABLES `articles_collected_pages` WRITE;
/*!40000 ALTER TABLE `articles_collected_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles_collected_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributions`
--

DROP TABLE IF EXISTS `attributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `url` varchar(512) DEFAULT NULL,
  `resource_id` int(11) NOT NULL,
  `resource_pk` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attributions_on_content_type_and_content_id` (`content_type`,`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributions`
--

LOCK TABLES `attributions` WRITE;
/*!40000 ALTER TABLE `attributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bibliographic_citations`
--

DROP TABLE IF EXISTS `bibliographic_citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibliographic_citations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `body` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibliographic_citations`
--

LOCK TABLES `bibliographic_citations` WRITE;
/*!40000 ALTER TABLE `bibliographic_citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `bibliographic_citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `activity_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_changes_on_user_id` (`user_id`),
  KEY `index_changes_on_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collected_pages`
--

DROP TABLE IF EXISTS `collected_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collected_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `annotation` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enforce_unique_pairs` (`collection_id`,`page_id`),
  KEY `index_collected_pages_on_collection_id` (`collection_id`),
  KEY `index_collected_pages_on_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collected_pages`
--

LOCK TABLES `collected_pages` WRITE;
/*!40000 ALTER TABLE `collected_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `collected_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collected_pages_links`
--

DROP TABLE IF EXISTS `collected_pages_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collected_pages_links` (
  `collected_page_id` int(11) NOT NULL,
  `link_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  KEY `index_collected_pages_links_on_collected_page_id` (`collected_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collected_pages_links`
--

LOCK TABLES `collected_pages_links` WRITE;
/*!40000 ALTER TABLE `collected_pages_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `collected_pages_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collected_pages_media`
--

DROP TABLE IF EXISTS `collected_pages_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collected_pages_media` (
  `collected_page_id` int(11) NOT NULL,
  `medium_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  KEY `index_collected_pages_media_on_collected_page_id` (`collected_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collected_pages_media`
--

LOCK TABLES `collected_pages_media` WRITE;
/*!40000 ALTER TABLE `collected_pages_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `collected_pages_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectings`
--

DROP TABLE IF EXISTS `collectings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `associated_collection_id` int(11) DEFAULT NULL,
  `changed_field` varchar(255) DEFAULT NULL,
  `changed_from` text,
  `changed_to` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_collectings_on_user_id` (`user_id`),
  KEY `index_collectings_on_collection_id` (`collection_id`),
  KEY `index_collectings_on_content_type_and_content_id` (`content_type`,`content_id`),
  KEY `index_collectings_on_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectings`
--

LOCK TABLES `collectings` WRITE;
/*!40000 ALTER TABLE `collectings` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_associations`
--

DROP TABLE IF EXISTS `collection_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `associated_id` int(11) DEFAULT NULL,
  `annotation` text,
  PRIMARY KEY (`id`),
  KEY `index_collection_associations_on_collection_id` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_associations`
--

LOCK TABLES `collection_associations` WRITE;
/*!40000 ALTER TABLE `collection_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `icon_file_name` varchar(255) DEFAULT NULL,
  `icon_content_type` varchar(255) DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `collected_pages_count` int(11) DEFAULT '0',
  `collection_associations_count` int(11) DEFAULT '0',
  `collection_type` int(11) DEFAULT '0',
  `default_sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_users`
--

DROP TABLE IF EXISTS `collections_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_users` (
  `user_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `is_manager` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  KEY `index_collections_users_on_user_id` (`user_id`),
  KEY `index_collections_users_on_collection_id` (`collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_users`
--

LOCK TABLES `collections_users` WRITE;
/*!40000 ALTER TABLE `collections_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_edits`
--

DROP TABLE IF EXISTS `content_edits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_edits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id_id` int(11) DEFAULT NULL,
  `page_content_id` int(11) DEFAULT NULL,
  `changed_field` varchar(255) DEFAULT NULL,
  `changed_from` text,
  `changed_to` text,
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_edits`
--

LOCK TABLES `content_edits` WRITE;
/*!40000 ALTER TABLE `content_edits` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_edits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_repositions`
--

DROP TABLE IF EXISTS `content_repositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_repositions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id_id` int(11) DEFAULT NULL,
  `page_content_id` int(11) DEFAULT NULL,
  `changed_from` int(11) DEFAULT NULL,
  `changed_to` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_repositions`
--

LOCK TABLES `content_repositions` WRITE;
/*!40000 ALTER TABLE `content_repositions` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_repositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_sections`
--

DROP TABLE IF EXISTS `content_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `content_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_content_sections_on_content_type_and_content_id` (`content_type`,`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_sections`
--

LOCK TABLES `content_sections` WRITE;
/*!40000 ALTER TABLE `content_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curations`
--

DROP TABLE IF EXISTS `curations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `page_content_id` int(11) NOT NULL,
  `trust` int(11) NOT NULL DEFAULT '0',
  `is_incorrect` tinyint(1) NOT NULL DEFAULT '0',
  `is_misidentified` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `is_duplicate` tinyint(1) NOT NULL DEFAULT '0',
  `is_low_quality` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `old_trust` int(11) NOT NULL DEFAULT '0',
  `old_is_incorrect` tinyint(1) NOT NULL DEFAULT '0',
  `old_is_misidentified` tinyint(1) NOT NULL DEFAULT '0',
  `old_is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `old_is_duplicate` tinyint(1) NOT NULL DEFAULT '0',
  `old_is_low_quality` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curations`
--

LOCK TABLES `curations` WRITE;
/*!40000 ALTER TABLE `curations` DISABLE KEYS */;
/*!40000 ALTER TABLE `curations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `handler` text NOT NULL,
  `last_error` text,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) DEFAULT NULL,
  `queue` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identifiers`
--

DROP TABLE IF EXISTS `identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identifiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `node_id` int(11) DEFAULT NULL,
  `node_resource_pk` varchar(255) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_identifiers_on_resource_id` (`resource_id`),
  KEY `index_identifiers_on_node_id` (`node_id`),
  KEY `index_identifiers_on_node_resource_pk` (`node_resource_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identifiers`
--

LOCK TABLES `identifiers` WRITE;
/*!40000 ALTER TABLE `identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_info`
--

DROP TABLE IF EXISTS `image_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `medium_id` int(11) NOT NULL,
  `original_size` varchar(12) NOT NULL,
  `large_size` varchar(12) DEFAULT NULL,
  `medium_size` varchar(12) DEFAULT NULL,
  `small_size` varchar(12) DEFAULT NULL,
  `crop_x` decimal(5,2) DEFAULT NULL,
  `crop_y` decimal(5,2) DEFAULT NULL,
  `crop_w` decimal(5,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_image_info_on_medium_id` (`medium_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_info`
--

LOCK TABLES `image_info` WRITE;
/*!40000 ALTER TABLE `image_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_events`
--

DROP TABLE IF EXISTS `import_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_log_id` int(11) NOT NULL,
  `cat` int(11) DEFAULT NULL,
  `body` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_events`
--

LOCK TABLES `import_events` WRITE;
/*!40000 ALTER TABLE `import_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_logs`
--

DROP TABLE IF EXISTS `import_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_logs`
--

LOCK TABLES `import_logs` WRITE;
/*!40000 ALTER TABLE `import_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_runs`
--

DROP TABLE IF EXISTS `import_runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_runs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `completed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_runs`
--

LOCK TABLES `import_runs` WRITE;
/*!40000 ALTER TABLE `import_runs` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_runs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `javascripts`
--

DROP TABLE IF EXISTS `javascripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `javascripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `javascripts`
--

LOCK TABLES `javascripts` WRITE;
/*!40000 ALTER TABLE `javascripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `javascripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(12) NOT NULL,
  `group` varchar(12) NOT NULL,
  `can_browse_site` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_languages_on_code` (`code`),
  KEY `index_languages_on_group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `source_url` varchar(255) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `can_be_chosen_by_partners` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `resource_pk` varchar(255) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `source_url` varchar(4096) DEFAULT NULL,
  `description` text NOT NULL,
  `icon_url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `rights_statement` varchar(1024) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_links_on_guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `longitude` decimal(64,12) DEFAULT NULL,
  `latitude` decimal(64,12) DEFAULT NULL,
  `altitude` decimal(64,12) DEFAULT NULL,
  `spatial_location` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) NOT NULL,
  `resource_pk` varchar(255) DEFAULT NULL,
  `subclass` int(11) NOT NULL DEFAULT '0',
  `format` int(11) NOT NULL DEFAULT '0',
  `license_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `stylesheet_id` int(11) DEFAULT NULL,
  `javascript_id` int(11) DEFAULT NULL,
  `bibliographic_citation_id` int(11) DEFAULT NULL,
  `owner` text NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `source_url` varchar(4096) DEFAULT NULL,
  `description` text,
  `base_url` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `unmodified_url` varchar(255) DEFAULT NULL,
  `source_page_url` varchar(4096) DEFAULT NULL,
  `resource_id` int(11) NOT NULL,
  `rights_statement` varchar(1024) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_media_on_guid` (`guid`),
  KEY `index_media_on_subclass` (`subclass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_ancestors`
--

DROP TABLE IF EXISTS `node_ancestors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_ancestors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `node_id` int(11) DEFAULT NULL,
  `ancestor_id` int(11) DEFAULT NULL,
  `node_resource_pk` varchar(255) DEFAULT NULL,
  `ancestor_resource_pk` varchar(255) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_node_ancestors_on_node_id` (`node_id`),
  KEY `index_node_ancestors_on_ancestor_id` (`ancestor_id`),
  KEY `index_node_ancestors_on_node_resource_pk` (`node_resource_pk`),
  KEY `index_node_ancestors_on_ancestor_resource_pk` (`ancestor_resource_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_ancestors`
--

LOCK TABLES `node_ancestors` WRITE;
/*!40000 ALTER TABLE `node_ancestors` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_ancestors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `rank_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `scientific_name` varchar(255) DEFAULT NULL,
  `canonical_form` varchar(255) DEFAULT NULL,
  `resource_pk` varchar(255) NOT NULL,
  `source_url` varchar(4096) DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `in_unmapped_area` tinyint(1) NOT NULL DEFAULT '0',
  `children_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `has_breadcrumb` tinyint(1) DEFAULT '1',
  `parent_resource_pk` varchar(255) DEFAULT NULL,
  `landmark` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_nodes_on_resource_id` (`resource_id`),
  KEY `index_nodes_on_page_id` (`page_id`),
  KEY `index_nodes_on_parent_id` (`parent_id`),
  KEY `index_nodes_on_resource_pk` (`resource_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occurrence_maps`
--

DROP TABLE IF EXISTS `occurrence_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occurrence_maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occurrence_maps`
--

LOCK TABLES `occurrence_maps` WRITE;
/*!40000 ALTER TABLE `occurrence_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `occurrence_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_authentications`
--

DROP TABLE IF EXISTS `open_authentications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_authentications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_open_authentications_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_authentications`
--

LOCK TABLES `open_authentications` WRITE;
/*!40000 ALTER TABLE `open_authentications` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_authentications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_contents`
--

DROP TABLE IF EXISTS `page_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `source_page_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `content_id` int(11) NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `association_added_by_user_id` int(11) DEFAULT NULL,
  `trust` int(11) NOT NULL DEFAULT '1',
  `is_incorrect` tinyint(1) NOT NULL DEFAULT '0',
  `is_misidentified` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `is_duplicate` tinyint(1) NOT NULL DEFAULT '0',
  `is_low_quality` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `effective_pk` (`page_id`,`content_type`,`content_id`),
  KEY `index_page_contents_on_page_id` (`page_id`),
  KEY `index_page_contents_on_source_page_id` (`source_page_id`),
  KEY `index_page_contents_on_content_type_and_content_id` (`content_type`,`content_id`),
  KEY `page_content_by_type_index` (`page_id`,`content_type`),
  KEY `index_page_contents_on_content_id` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_contents`
--

LOCK TABLES `page_contents` WRITE;
/*!40000 ALTER TABLE `page_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_icons`
--

DROP TABLE IF EXISTS `page_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_icons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `medium_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_page_icons_on_page_id` (`page_id`),
  KEY `index_page_icons_on_user_id` (`user_id`),
  KEY `index_page_icons_on_medium_id` (`medium_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_icons`
--

LOCK TABLES `page_icons` WRITE;
/*!40000 ALTER TABLE `page_icons` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `native_node_id` int(11) DEFAULT NULL,
  `moved_to_page_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `page_contents_count` int(11) NOT NULL DEFAULT '0',
  `media_count` int(11) NOT NULL DEFAULT '0',
  `articles_count` int(11) NOT NULL DEFAULT '0',
  `links_count` int(11) NOT NULL DEFAULT '0',
  `maps_count` int(11) NOT NULL DEFAULT '0',
  `data_count` int(11) NOT NULL DEFAULT '0',
  `nodes_count` int(11) NOT NULL DEFAULT '0',
  `vernaculars_count` int(11) NOT NULL DEFAULT '0',
  `scientific_names_count` int(11) NOT NULL DEFAULT '0',
  `referents_count` int(11) NOT NULL DEFAULT '0',
  `species_count` int(11) NOT NULL DEFAULT '0',
  `is_extinct` tinyint(1) NOT NULL DEFAULT '0',
  `is_marine` tinyint(1) NOT NULL DEFAULT '0',
  `has_checked_extinct` tinyint(1) NOT NULL DEFAULT '0',
  `has_checked_marine` tinyint(1) NOT NULL DEFAULT '0',
  `iucn_status` varchar(255) DEFAULT NULL,
  `trophic_strategy` varchar(255) DEFAULT NULL,
  `geographic_context` varchar(255) DEFAULT NULL,
  `habitat` varchar(255) DEFAULT NULL,
  `page_richness` int(11) DEFAULT NULL,
  `medium_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_referents`
--

DROP TABLE IF EXISTS `pages_referents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_referents` (
  `page_id` int(11) NOT NULL,
  `referent_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  KEY `index_pages_referents_on_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_referents`
--

LOCK TABLES `pages_referents` WRITE;
/*!40000 ALTER TABLE `pages_referents` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_referents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `abbr` varchar(16) DEFAULT NULL,
  `short_name` varchar(255) NOT NULL,
  `homepage_url` varchar(255) DEFAULT NULL,
  `description` text,
  `notes` text,
  `links_json` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `icon_file_name` varchar(255) DEFAULT NULL,
  `icon_content_type` varchar(255) DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners_users`
--

DROP TABLE IF EXISTS `partners_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partners_users` (
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners_users`
--

LOCK TABLES `partners_users` WRITE;
/*!40000 ALTER TABLE `partners_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `treat_as` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `references`
--

DROP TABLE IF EXISTS `references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `references` (
  `parent_id` int(11) NOT NULL,
  `referent_id` int(11) NOT NULL,
  `parent_type` varchar(255) NOT NULL DEFAULT 'Article',
  `resource_id` int(11) NOT NULL,
  KEY `references_by_parent_index` (`parent_type`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `references`
--

LOCK TABLES `references` WRITE;
/*!40000 ALTER TABLE `references` DISABLE KEYS */;
/*!40000 ALTER TABLE `references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referents`
--

DROP TABLE IF EXISTS `referents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referents`
--

LOCK TABLES `referents` WRITE;
/*!40000 ALTER TABLE `referents` DISABLE KEYS */;
/*!40000 ALTER TABLE `referents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_image_translations`
--

DROP TABLE IF EXISTS `refinery_image_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_image_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_image_id` int(11) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_alt` varchar(255) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_image_translations_on_refinery_image_id` (`refinery_image_id`),
  KEY `index_refinery_image_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_image_translations`
--

LOCK TABLES `refinery_image_translations` WRITE;
/*!40000 ALTER TABLE `refinery_image_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_image_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_images`
--

DROP TABLE IF EXISTS `refinery_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_mime_type` varchar(255) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `image_width` int(11) DEFAULT NULL,
  `image_height` int(11) DEFAULT NULL,
  `image_uid` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  `image_alt` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_images`
--

LOCK TABLES `refinery_images` WRITE;
/*!40000 ALTER TABLE `refinery_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_page_part_translations`
--

DROP TABLE IF EXISTS `refinery_page_part_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_page_part_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_page_part_id` int(11) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `body` text,
  PRIMARY KEY (`id`),
  KEY `index_refinery_page_part_translations_on_refinery_page_part_id` (`refinery_page_part_id`),
  KEY `index_refinery_page_part_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_page_part_translations`
--

LOCK TABLES `refinery_page_part_translations` WRITE;
/*!40000 ALTER TABLE `refinery_page_part_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_page_part_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_page_parts`
--

DROP TABLE IF EXISTS `refinery_page_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_page_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_page_id` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `body` text,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_page_parts_on_id` (`id`),
  KEY `index_refinery_page_parts_on_refinery_page_id` (`refinery_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_page_parts`
--

LOCK TABLES `refinery_page_parts` WRITE;
/*!40000 ALTER TABLE `refinery_page_parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_page_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_page_translations`
--

DROP TABLE IF EXISTS `refinery_page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_page_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_page_id` int(11) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `custom_slug` varchar(255) DEFAULT NULL,
  `menu_title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_page_translations_on_refinery_page_id` (`refinery_page_id`),
  KEY `index_refinery_page_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_page_translations`
--

LOCK TABLES `refinery_page_translations` WRITE;
/*!40000 ALTER TABLE `refinery_page_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_pages`
--

DROP TABLE IF EXISTS `refinery_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `custom_slug` varchar(255) DEFAULT NULL,
  `show_in_menu` tinyint(1) DEFAULT '1',
  `link_url` varchar(4096) DEFAULT NULL,
  `menu_match` varchar(255) DEFAULT NULL,
  `deletable` tinyint(1) DEFAULT '1',
  `draft` tinyint(1) DEFAULT '0',
  `skip_to_first_child` tinyint(1) DEFAULT '0',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `view_template` varchar(255) DEFAULT NULL,
  `layout_template` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `show_date` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_pages_on_depth` (`depth`),
  KEY `index_refinery_pages_on_id` (`id`),
  KEY `index_refinery_pages_on_lft` (`lft`),
  KEY `index_refinery_pages_on_parent_id` (`parent_id`),
  KEY `index_refinery_pages_on_rgt` (`rgt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_pages`
--

LOCK TABLES `refinery_pages` WRITE;
/*!40000 ALTER TABLE `refinery_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_resource_translations`
--

DROP TABLE IF EXISTS `refinery_resource_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_resource_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_resource_id` int(11) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resource_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_resource_translations_on_refinery_resource_id` (`refinery_resource_id`),
  KEY `index_refinery_resource_translations_on_locale` (`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_resource_translations`
--

LOCK TABLES `refinery_resource_translations` WRITE;
/*!40000 ALTER TABLE `refinery_resource_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_resource_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_resources`
--

DROP TABLE IF EXISTS `refinery_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_mime_type` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_uid` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_resources`
--

LOCK TABLES `refinery_resources` WRITE;
/*!40000 ALTER TABLE `refinery_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `description` text,
  `notes` text,
  `nodes_count` int(11) DEFAULT NULL,
  `is_browsable` tinyint(1) NOT NULL DEFAULT '0',
  `has_duplicate_nodes` tinyint(1) NOT NULL DEFAULT '0',
  `node_source_url_template` varchar(4096) DEFAULT NULL,
  `last_published_at` datetime DEFAULT NULL,
  `last_publish_seconds` int(11) DEFAULT NULL,
  `dataset_license_id` int(11) DEFAULT NULL,
  `dataset_rights_holder` varchar(255) DEFAULT NULL,
  `dataset_rights_statement` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `icon_file_name` varchar(255) DEFAULT NULL,
  `icon_content_type` varchar(255) DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `abbr` varchar(255) DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_resources_on_partner_id` (`partner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160424085349'),('20160424112855'),('20160511092752'),('20160523131435'),('20160526120817'),('20160601060826'),('20160727180537'),('20160831205815'),('20160914205604'),('20160920195944'),('20160929193402'),('20160930155909'),('20161003163103'),('20161005184205'),('20161014194253'),('20161018075117'),('20161019184211'),('20161019185405'),('20161023050523'),('20170127154558'),('20170127204601'),('20170215170851'),('20170215193557'),('20170223062049'),('20170223062050'),('20170223062059'),('20170223062060'),('20170223062061'),('20170223062062'),('20170223062063'),('20170223062109'),('20170223062110'),('20170223062111'),('20170223062112'),('20170223062116'),('20170223062117'),('20170223063632'),('20170227172852'),('20170321164132'),('20170418135622'),('20170428193945'),('20170501133530'),('20170503080320'),('20170505135358'),('20170505144657'),('20170620131724'),('20170621154656'),('20170824195229'),('20170825181717'),('20170922173758'),('20171019144810'),('20171024181455'),('20171101173208'),('20171102151040'),('20171103165626'),('20171103181623'),('20171107164342'),('20171207160609'),('20171207161854'),('20171207170111'),('20171207180920');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scientific_names`
--

DROP TABLE IF EXISTS `scientific_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scientific_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `italicized` varchar(255) NOT NULL,
  `canonical_form` varchar(255) NOT NULL,
  `taxonomic_status_id` int(11) NOT NULL,
  `is_preferred` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `node_resource_pk` varchar(255) DEFAULT NULL,
  `source_reference` varchar(255) DEFAULT NULL,
  `genus` varchar(255) DEFAULT NULL,
  `specific_epithet` varchar(255) DEFAULT NULL,
  `infraspecific_epithet` varchar(255) DEFAULT NULL,
  `infrageneric_epithet` varchar(255) DEFAULT NULL,
  `uninomial` varchar(255) DEFAULT NULL,
  `verbatim` text,
  `authorship` text,
  `publication` text,
  `remarks` text,
  `parse_quality` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `hybrid` tinyint(1) DEFAULT NULL,
  `surrogate` tinyint(1) DEFAULT NULL,
  `virus` tinyint(1) DEFAULT NULL,
  `attribution` text,
  PRIMARY KEY (`id`),
  KEY `index_scientific_names_on_node_id` (`node_id`),
  KEY `index_scientific_names_on_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scientific_names`
--

LOCK TABLES `scientific_names` WRITE;
/*!40000 ALTER TABLE `scientific_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `scientific_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_suggestions`
--

DROP TABLE IF EXISTS `search_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `synonym_of_id` int(11) DEFAULT NULL,
  `match` varchar(255) NOT NULL,
  `object_term` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `wkt_string` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_suggestions`
--

LOCK TABLES `search_suggestions` WRITE;
/*!40000 ALTER TABLE `search_suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_meta`
--

DROP TABLE IF EXISTS `seo_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seo_meta_id` int(11) DEFAULT NULL,
  `seo_meta_type` varchar(255) DEFAULT NULL,
  `browser_title` varchar(255) DEFAULT NULL,
  `meta_description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_seo_meta_on_id` (`id`),
  KEY `id_type_index_on_seo_meta` (`seo_meta_id`,`seo_meta_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_meta`
--

LOCK TABLES `seo_meta` WRITE;
/*!40000 ALTER TABLE `seo_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stylesheets`
--

DROP TABLE IF EXISTS `stylesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stylesheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stylesheets`
--

LOCK TABLES `stylesheets` WRITE;
/*!40000 ALTER TABLE `stylesheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `stylesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_remarks`
--

DROP TABLE IF EXISTS `taxon_remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_remarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`id`),
  KEY `index_taxon_remarks_on_node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_remarks`
--

LOCK TABLES `taxon_remarks` WRITE;
/*!40000 ALTER TABLE `taxon_remarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_remarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomic_statuses`
--

DROP TABLE IF EXISTS `taxonomic_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomic_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_preferred` tinyint(1) NOT NULL DEFAULT '1',
  `is_problematic` tinyint(1) NOT NULL DEFAULT '0',
  `is_alternative_preferred` tinyint(1) NOT NULL DEFAULT '0',
  `can_merge` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomic_statuses`
--

LOCK TABLES `taxonomic_statuses` WRITE;
/*!40000 ALTER TABLE `taxonomic_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxonomic_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_queries`
--

DROP TABLE IF EXISTS `term_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pairs` varchar(255) DEFAULT NULL,
  `clade` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_queries`
--

LOCK TABLES `term_queries` WRITE;
/*!40000 ALTER TABLE `term_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_query_pairs`
--

DROP TABLE IF EXISTS `term_query_pairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_query_pairs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `predicate` varchar(255) DEFAULT NULL,
  `object` varchar(255) DEFAULT NULL,
  `term_query_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_term_query_pairs_on_term_query_id` (`term_query_id`),
  CONSTRAINT `fk_rails_9ed44c75a2` FOREIGN KEY (`term_query_id`) REFERENCES `term_queries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_query_pairs`
--

LOCK TABLES `term_query_pairs` WRITE;
/*!40000 ALTER TABLE `term_query_pairs` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_query_pairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_downloads`
--

DROP TABLE IF EXISTS `user_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `term_query_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_downloads_on_term_query_id` (`term_query_id`),
  CONSTRAINT `fk_rails_322eb81cad` FOREIGN KEY (`term_query_id`) REFERENCES `term_queries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_downloads`
--

LOCK TABLES `user_downloads` WRITE;
/*!40000 ALTER TABLE `user_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT '',
  `encrypted_password` varchar(255) DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `api_key` varchar(255) DEFAULT NULL,
  `tag_line` varchar(255) DEFAULT NULL,
  `bio` text,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `failed_attempts` int(11) NOT NULL DEFAULT '0',
  `unlock_token` varchar(255) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  UNIQUE KEY `index_users_on_unlock_token` (`unlock_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vernaculars`
--

DROP TABLE IF EXISTS `vernaculars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vernaculars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `string` varchar(255) NOT NULL,
  `language_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `is_preferred` tinyint(1) NOT NULL DEFAULT '0',
  `is_preferred_by_resource` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `trust` int(11) NOT NULL DEFAULT '0',
  `node_resource_pk` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `remarks` text,
  `source` text,
  `resource_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vernaculars_on_node_id` (`node_id`),
  KEY `index_vernaculars_on_page_id` (`page_id`),
  KEY `preferred_names_index` (`page_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vernaculars`
--

LOCK TABLES `vernaculars` WRITE;
/*!40000 ALTER TABLE `vernaculars` DISABLE KEYS */;
/*!40000 ALTER TABLE `vernaculars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `eol_test`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `eol_test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `eol_test`;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resource_pk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `stylesheet_id` int(11) DEFAULT NULL,
  `javascript_id` int(11) DEFAULT NULL,
  `bibliographic_citation_id` int(11) DEFAULT NULL,
  `owner` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_url` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `rights_statement` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_articles_on_guid` (`guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles_collected_pages`
--

DROP TABLE IF EXISTS `articles_collected_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles_collected_pages` (
  `collected_page_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  KEY `index_articles_collected_pages_on_collected_page_id` (`collected_page_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_collected_pages`
--

LOCK TABLES `articles_collected_pages` WRITE;
/*!40000 ALTER TABLE `articles_collected_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles_collected_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributions`
--

DROP TABLE IF EXISTS `attributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `url` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_id` int(11) NOT NULL,
  `resource_pk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attributions_on_content_type_and_content_id` (`content_type`,`content_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributions`
--

LOCK TABLES `attributions` WRITE;
/*!40000 ALTER TABLE `attributions` DISABLE KEYS */;
/*!40000 ALTER TABLE `attributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bibliographic_citations`
--

DROP TABLE IF EXISTS `bibliographic_citations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bibliographic_citations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bibliographic_citations`
--

LOCK TABLES `bibliographic_citations` WRITE;
/*!40000 ALTER TABLE `bibliographic_citations` DISABLE KEYS */;
/*!40000 ALTER TABLE `bibliographic_citations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `activity_id` int(11) DEFAULT NULL,
  `activity_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_changes_on_page_id` (`page_id`) USING BTREE,
  KEY `index_changes_on_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collected_pages`
--

DROP TABLE IF EXISTS `collected_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collected_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `annotation` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `enforce_unique_pairs` (`collection_id`,`page_id`) USING BTREE,
  KEY `index_collected_pages_on_collection_id` (`collection_id`) USING BTREE,
  KEY `index_collected_pages_on_page_id` (`page_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collected_pages`
--

LOCK TABLES `collected_pages` WRITE;
/*!40000 ALTER TABLE `collected_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `collected_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collected_pages_links`
--

DROP TABLE IF EXISTS `collected_pages_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collected_pages_links` (
  `collected_page_id` int(11) NOT NULL,
  `link_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  KEY `index_collected_pages_links_on_collected_page_id` (`collected_page_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collected_pages_links`
--

LOCK TABLES `collected_pages_links` WRITE;
/*!40000 ALTER TABLE `collected_pages_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `collected_pages_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collected_pages_media`
--

DROP TABLE IF EXISTS `collected_pages_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collected_pages_media` (
  `collected_page_id` int(11) NOT NULL,
  `medium_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  KEY `index_collected_pages_media_on_collected_page_id` (`collected_page_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collected_pages_media`
--

LOCK TABLES `collected_pages_media` WRITE;
/*!40000 ALTER TABLE `collected_pages_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `collected_pages_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectings`
--

DROP TABLE IF EXISTS `collectings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collectings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `content_id` int(11) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `associated_collection_id` int(11) DEFAULT NULL,
  `changed_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `changed_from` text COLLATE utf8_unicode_ci,
  `changed_to` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_collectings_on_collection_id` (`collection_id`) USING BTREE,
  KEY `index_collectings_on_content_type_and_content_id` (`content_type`,`content_id`) USING BTREE,
  KEY `index_collectings_on_page_id` (`page_id`) USING BTREE,
  KEY `index_collectings_on_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectings`
--

LOCK TABLES `collectings` WRITE;
/*!40000 ALTER TABLE `collectings` DISABLE KEYS */;
/*!40000 ALTER TABLE `collectings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_associations`
--

DROP TABLE IF EXISTS `collection_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collection_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `associated_id` int(11) DEFAULT NULL,
  `annotation` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_collection_associations_on_collection_id` (`collection_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_associations`
--

LOCK TABLES `collection_associations` WRITE;
/*!40000 ALTER TABLE `collection_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `icon_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `collected_pages_count` int(11) DEFAULT '0',
  `collection_associations_count` int(11) DEFAULT '0',
  `collection_type` int(11) DEFAULT '0',
  `default_sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections_users`
--

DROP TABLE IF EXISTS `collections_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `collections_users` (
  `user_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `is_manager` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  KEY `index_collections_users_on_collection_id` (`collection_id`) USING BTREE,
  KEY `index_collections_users_on_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections_users`
--

LOCK TABLES `collections_users` WRITE;
/*!40000 ALTER TABLE `collections_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_edits`
--

DROP TABLE IF EXISTS `content_edits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_edits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id_id` int(11) DEFAULT NULL,
  `page_content_id` int(11) DEFAULT NULL,
  `changed_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `changed_from` text COLLATE utf8_unicode_ci,
  `changed_to` text COLLATE utf8_unicode_ci,
  `comment` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_edits`
--

LOCK TABLES `content_edits` WRITE;
/*!40000 ALTER TABLE `content_edits` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_edits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_repositions`
--

DROP TABLE IF EXISTS `content_repositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_repositions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id_id` int(11) DEFAULT NULL,
  `page_content_id` int(11) DEFAULT NULL,
  `changed_from` int(11) DEFAULT NULL,
  `changed_to` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_repositions`
--

LOCK TABLES `content_repositions` WRITE;
/*!40000 ALTER TABLE `content_repositions` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_repositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_sections`
--

DROP TABLE IF EXISTS `content_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_content_sections_on_content_type_and_content_id` (`content_type`,`content_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_sections`
--

LOCK TABLES `content_sections` WRITE;
/*!40000 ALTER TABLE `content_sections` DISABLE KEYS */;
/*!40000 ALTER TABLE `content_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curations`
--

DROP TABLE IF EXISTS `curations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `page_content_id` int(11) NOT NULL,
  `trust` int(11) NOT NULL DEFAULT '0',
  `is_incorrect` tinyint(1) NOT NULL DEFAULT '0',
  `is_misidentified` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `is_duplicate` tinyint(1) NOT NULL DEFAULT '0',
  `is_low_quality` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `old_trust` int(11) NOT NULL DEFAULT '0',
  `old_is_incorrect` tinyint(1) NOT NULL DEFAULT '0',
  `old_is_misidentified` tinyint(1) NOT NULL DEFAULT '0',
  `old_is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `old_is_duplicate` tinyint(1) NOT NULL DEFAULT '0',
  `old_is_low_quality` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curations`
--

LOCK TABLES `curations` WRITE;
/*!40000 ALTER TABLE `curations` DISABLE KEYS */;
/*!40000 ALTER TABLE `curations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `handler` text COLLATE utf8_unicode_ci NOT NULL,
  `last_error` text COLLATE utf8_unicode_ci,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identifiers`
--

DROP TABLE IF EXISTS `identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identifiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `node_id` int(11) DEFAULT NULL,
  `node_resource_pk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_identifiers_on_node_id` (`node_id`) USING BTREE,
  KEY `index_identifiers_on_node_resource_pk` (`node_resource_pk`) USING BTREE,
  KEY `index_identifiers_on_resource_id` (`resource_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identifiers`
--

LOCK TABLES `identifiers` WRITE;
/*!40000 ALTER TABLE `identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_info`
--

DROP TABLE IF EXISTS `image_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `medium_id` int(11) NOT NULL,
  `original_size` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `large_size` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medium_size` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `small_size` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `crop_x` decimal(5,2) DEFAULT NULL,
  `crop_y` decimal(5,2) DEFAULT NULL,
  `crop_w` decimal(5,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_image_info_on_medium_id` (`medium_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_info`
--

LOCK TABLES `image_info` WRITE;
/*!40000 ALTER TABLE `image_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `image_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_events`
--

DROP TABLE IF EXISTS `import_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_log_id` int(11) NOT NULL,
  `cat` int(11) DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_events`
--

LOCK TABLES `import_events` WRITE;
/*!40000 ALTER TABLE `import_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_logs`
--

DROP TABLE IF EXISTS `import_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_logs`
--

LOCK TABLES `import_logs` WRITE;
/*!40000 ALTER TABLE `import_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `import_runs`
--

DROP TABLE IF EXISTS `import_runs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_runs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `completed_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `import_runs`
--

LOCK TABLES `import_runs` WRITE;
/*!40000 ALTER TABLE `import_runs` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_runs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `javascripts`
--

DROP TABLE IF EXISTS `javascripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `javascripts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `javascripts`
--

LOCK TABLES `javascripts` WRITE;
/*!40000 ALTER TABLE `javascripts` DISABLE KEYS */;
/*!40000 ALTER TABLE `javascripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `can_browse_site` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_languages_on_code` (`code`) USING BTREE,
  KEY `index_languages_on_group` (`group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `can_be_chosen_by_partners` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licenses`
--

LOCK TABLES `licenses` WRITE;
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resource_pk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_url` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `icon_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `rights_statement` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_links_on_guid` (`guid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` decimal(64,12) DEFAULT NULL,
  `latitude` decimal(64,12) DEFAULT NULL,
  `altitude` decimal(64,12) DEFAULT NULL,
  `spatial_location` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resource_pk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subclass` int(11) NOT NULL DEFAULT '0',
  `format` int(11) NOT NULL DEFAULT '0',
  `license_id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `stylesheet_id` int(11) DEFAULT NULL,
  `javascript_id` int(11) DEFAULT NULL,
  `bibliographic_citation_id` int(11) DEFAULT NULL,
  `owner` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_url` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `base_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `unmodified_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_page_url` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_id` int(11) NOT NULL,
  `rights_statement` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_media_on_guid` (`guid`) USING BTREE,
  KEY `index_media_on_subclass` (`subclass`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `node_ancestors`
--

DROP TABLE IF EXISTS `node_ancestors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_ancestors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `node_id` int(11) DEFAULT NULL,
  `ancestor_id` int(11) DEFAULT NULL,
  `node_resource_pk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ancestor_resource_pk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_node_ancestors_on_ancestor_id` (`ancestor_id`) USING BTREE,
  KEY `index_node_ancestors_on_ancestor_resource_pk` (`ancestor_resource_pk`) USING BTREE,
  KEY `index_node_ancestors_on_node_id` (`node_id`) USING BTREE,
  KEY `index_node_ancestors_on_node_resource_pk` (`node_resource_pk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `node_ancestors`
--

LOCK TABLES `node_ancestors` WRITE;
/*!40000 ALTER TABLE `node_ancestors` DISABLE KEYS */;
/*!40000 ALTER TABLE `node_ancestors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `rank_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `scientific_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `canonical_form` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_pk` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_url` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `in_unmapped_area` tinyint(1) NOT NULL DEFAULT '0',
  `children_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `has_breadcrumb` tinyint(1) DEFAULT '1',
  `parent_resource_pk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `landmark` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_nodes_on_page_id` (`page_id`) USING BTREE,
  KEY `index_nodes_on_parent_id` (`parent_id`) USING BTREE,
  KEY `index_nodes_on_resource_id` (`resource_id`) USING BTREE,
  KEY `index_nodes_on_resource_pk` (`resource_pk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occurrence_maps`
--

DROP TABLE IF EXISTS `occurrence_maps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occurrence_maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occurrence_maps`
--

LOCK TABLES `occurrence_maps` WRITE;
/*!40000 ALTER TABLE `occurrence_maps` DISABLE KEYS */;
/*!40000 ALTER TABLE `occurrence_maps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_authentications`
--

DROP TABLE IF EXISTS `open_authentications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_authentications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_open_authentications_on_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_authentications`
--

LOCK TABLES `open_authentications` WRITE;
/*!40000 ALTER TABLE `open_authentications` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_authentications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_contents`
--

DROP TABLE IF EXISTS `page_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `source_page_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `content_id` int(11) NOT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `association_added_by_user_id` int(11) DEFAULT NULL,
  `trust` int(11) NOT NULL DEFAULT '1',
  `is_incorrect` tinyint(1) NOT NULL DEFAULT '0',
  `is_misidentified` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `is_duplicate` tinyint(1) NOT NULL DEFAULT '0',
  `is_low_quality` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `effective_pk` (`page_id`,`content_type`,`content_id`) USING BTREE,
  KEY `index_page_contents_on_content_id` (`content_id`) USING BTREE,
  KEY `index_page_contents_on_content_type_and_content_id` (`content_type`,`content_id`) USING BTREE,
  KEY `page_content_by_type_index` (`page_id`,`content_type`) USING BTREE,
  KEY `index_page_contents_on_page_id` (`page_id`) USING BTREE,
  KEY `index_page_contents_on_source_page_id` (`source_page_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_contents`
--

LOCK TABLES `page_contents` WRITE;
/*!40000 ALTER TABLE `page_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_icons`
--

DROP TABLE IF EXISTS `page_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_icons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `medium_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_page_icons_on_medium_id` (`medium_id`) USING BTREE,
  KEY `index_page_icons_on_page_id` (`page_id`) USING BTREE,
  KEY `index_page_icons_on_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_icons`
--

LOCK TABLES `page_icons` WRITE;
/*!40000 ALTER TABLE `page_icons` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `native_node_id` int(11) DEFAULT NULL,
  `moved_to_page_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `page_contents_count` int(11) NOT NULL DEFAULT '0',
  `media_count` int(11) NOT NULL DEFAULT '0',
  `articles_count` int(11) NOT NULL DEFAULT '0',
  `links_count` int(11) NOT NULL DEFAULT '0',
  `maps_count` int(11) NOT NULL DEFAULT '0',
  `data_count` int(11) NOT NULL DEFAULT '0',
  `nodes_count` int(11) NOT NULL DEFAULT '0',
  `vernaculars_count` int(11) NOT NULL DEFAULT '0',
  `scientific_names_count` int(11) NOT NULL DEFAULT '0',
  `referents_count` int(11) NOT NULL DEFAULT '0',
  `species_count` int(11) NOT NULL DEFAULT '0',
  `is_extinct` tinyint(1) NOT NULL DEFAULT '0',
  `is_marine` tinyint(1) NOT NULL DEFAULT '0',
  `has_checked_extinct` tinyint(1) NOT NULL DEFAULT '0',
  `has_checked_marine` tinyint(1) NOT NULL DEFAULT '0',
  `iucn_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trophic_strategy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geographic_context` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `habitat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_richness` int(11) DEFAULT NULL,
  `medium_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_referents`
--

DROP TABLE IF EXISTS `pages_referents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages_referents` (
  `page_id` int(11) NOT NULL,
  `referent_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL,
  KEY `index_pages_referents_on_page_id` (`page_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_referents`
--

LOCK TABLES `pages_referents` WRITE;
/*!40000 ALTER TABLE `pages_referents` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_referents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `abbr` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `homepage_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `links_json` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `icon_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners_users`
--

DROP TABLE IF EXISTS `partners_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partners_users` (
  `partner_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners_users`
--

LOCK TABLES `partners_users` WRITE;
/*!40000 ALTER TABLE `partners_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `treat_as` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `references`
--

DROP TABLE IF EXISTS `references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `references` (
  `parent_id` int(11) NOT NULL,
  `referent_id` int(11) NOT NULL,
  `parent_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Article',
  `resource_id` int(11) NOT NULL,
  KEY `references_by_parent_index` (`parent_type`,`parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `references`
--

LOCK TABLES `references` WRITE;
/*!40000 ALTER TABLE `references` DISABLE KEYS */;
/*!40000 ALTER TABLE `references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referents`
--

DROP TABLE IF EXISTS `referents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resource_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referents`
--

LOCK TABLES `referents` WRITE;
/*!40000 ALTER TABLE `referents` DISABLE KEYS */;
/*!40000 ALTER TABLE `referents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_image_translations`
--

DROP TABLE IF EXISTS `refinery_image_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_image_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_image_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_image_translations_on_locale` (`locale`) USING BTREE,
  KEY `index_refinery_image_translations_on_refinery_image_id` (`refinery_image_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_image_translations`
--

LOCK TABLES `refinery_image_translations` WRITE;
/*!40000 ALTER TABLE `refinery_image_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_image_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_images`
--

DROP TABLE IF EXISTS `refinery_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `image_width` int(11) DEFAULT NULL,
  `image_height` int(11) DEFAULT NULL,
  `image_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_images`
--

LOCK TABLES `refinery_images` WRITE;
/*!40000 ALTER TABLE `refinery_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_page_part_translations`
--

DROP TABLE IF EXISTS `refinery_page_part_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_page_part_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_page_part_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `body` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_refinery_page_part_translations_on_locale` (`locale`) USING BTREE,
  KEY `index_refinery_page_part_translations_on_refinery_page_part_id` (`refinery_page_part_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_page_part_translations`
--

LOCK TABLES `refinery_page_part_translations` WRITE;
/*!40000 ALTER TABLE `refinery_page_part_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_page_part_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_page_parts`
--

DROP TABLE IF EXISTS `refinery_page_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_page_parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_page_id` int(11) DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_page_parts_on_id` (`id`) USING BTREE,
  KEY `index_refinery_page_parts_on_refinery_page_id` (`refinery_page_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_page_parts`
--

LOCK TABLES `refinery_page_parts` WRITE;
/*!40000 ALTER TABLE `refinery_page_parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_page_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_page_translations`
--

DROP TABLE IF EXISTS `refinery_page_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_page_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_page_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_page_translations_on_locale` (`locale`) USING BTREE,
  KEY `index_refinery_page_translations_on_refinery_page_id` (`refinery_page_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_page_translations`
--

LOCK TABLES `refinery_page_translations` WRITE;
/*!40000 ALTER TABLE `refinery_page_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_page_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_pages`
--

DROP TABLE IF EXISTS `refinery_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_in_menu` tinyint(1) DEFAULT '1',
  `link_url` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
  `menu_match` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletable` tinyint(1) DEFAULT '1',
  `draft` tinyint(1) DEFAULT '0',
  `skip_to_first_child` tinyint(1) DEFAULT '0',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `view_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `layout_template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `show_date` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_pages_on_depth` (`depth`) USING BTREE,
  KEY `index_refinery_pages_on_id` (`id`) USING BTREE,
  KEY `index_refinery_pages_on_lft` (`lft`) USING BTREE,
  KEY `index_refinery_pages_on_parent_id` (`parent_id`) USING BTREE,
  KEY `index_refinery_pages_on_rgt` (`rgt`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_pages`
--

LOCK TABLES `refinery_pages` WRITE;
/*!40000 ALTER TABLE `refinery_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_resource_translations`
--

DROP TABLE IF EXISTS `refinery_resource_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_resource_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refinery_resource_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resource_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_refinery_resource_translations_on_locale` (`locale`) USING BTREE,
  KEY `index_refinery_resource_translations_on_refinery_resource_id` (`refinery_resource_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_resource_translations`
--

LOCK TABLES `refinery_resource_translations` WRITE;
/*!40000 ALTER TABLE `refinery_resource_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_resource_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refinery_resources`
--

DROP TABLE IF EXISTS `refinery_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refinery_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `file_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_ext` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refinery_resources`
--

LOCK TABLES `refinery_resources` WRITE;
/*!40000 ALTER TABLE `refinery_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `refinery_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `partner_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `notes` text COLLATE utf8_unicode_ci,
  `nodes_count` int(11) DEFAULT NULL,
  `is_browsable` tinyint(1) NOT NULL DEFAULT '0',
  `has_duplicate_nodes` tinyint(1) NOT NULL DEFAULT '0',
  `node_source_url_template` varchar(4096) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_published_at` datetime DEFAULT NULL,
  `last_publish_seconds` int(11) DEFAULT NULL,
  `dataset_license_id` int(11) DEFAULT NULL,
  `dataset_rights_holder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dataset_rights_statement` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `icon_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_file_size` int(11) DEFAULT NULL,
  `icon_updated_at` datetime DEFAULT NULL,
  `abbr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_resources_on_partner_id` (`partner_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160424085349'),('20160424112855'),('20160511092752'),('20160523131435'),('20160526120817'),('20160601060826'),('20160727180537'),('20160831205815'),('20160914205604'),('20160920195944'),('20160929193402'),('20160930155909'),('20161003163103'),('20161005184205'),('20161014194253'),('20161018075117'),('20161019184211'),('20161019185405'),('20161023050523'),('20170127154558'),('20170127204601'),('20170215170851'),('20170215193557'),('20170223062049'),('20170223062050'),('20170223062059'),('20170223062060'),('20170223062061'),('20170223062062'),('20170223062063'),('20170223062109'),('20170223062110'),('20170223062111'),('20170223062112'),('20170223062116'),('20170223062117'),('20170223063632'),('20170227172852'),('20170321164132'),('20170418135622'),('20170428193945'),('20170501133530'),('20170503080320'),('20170505135358'),('20170505144657'),('20170620131724'),('20170621154656'),('20170824195229'),('20170825181717'),('20170922173758'),('20171019144810'),('20171024181455'),('20171101173208'),('20171102151040'),('20171103165626'),('20171103181623'),('20171107164342'),('20171207160609'),('20171207161854'),('20171207170111'),('20171207180920');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scientific_names`
--

DROP TABLE IF EXISTS `scientific_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scientific_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `italicized` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `canonical_form` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taxonomic_status_id` int(11) NOT NULL,
  `is_preferred` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `node_resource_pk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_reference` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `genus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `specific_epithet` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `infraspecific_epithet` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `infrageneric_epithet` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uninomial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verbatim` text COLLATE utf8_unicode_ci,
  `authorship` text COLLATE utf8_unicode_ci,
  `publication` text COLLATE utf8_unicode_ci,
  `remarks` text COLLATE utf8_unicode_ci,
  `parse_quality` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `hybrid` tinyint(1) DEFAULT NULL,
  `surrogate` tinyint(1) DEFAULT NULL,
  `virus` tinyint(1) DEFAULT NULL,
  `attribution` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_scientific_names_on_node_id` (`node_id`) USING BTREE,
  KEY `index_scientific_names_on_page_id` (`page_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scientific_names`
--

LOCK TABLES `scientific_names` WRITE;
/*!40000 ALTER TABLE `scientific_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `scientific_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_suggestions`
--

DROP TABLE IF EXISTS `search_suggestions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_suggestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `synonym_of_id` int(11) DEFAULT NULL,
  `match` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `object_term` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wkt_string` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_suggestions`
--

LOCK TABLES `search_suggestions` WRITE;
/*!40000 ALTER TABLE `search_suggestions` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_suggestions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,1,'brief_summary');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seo_meta`
--

DROP TABLE IF EXISTS `seo_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seo_meta_id` int(11) DEFAULT NULL,
  `seo_meta_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_seo_meta_on_id` (`id`) USING BTREE,
  KEY `id_type_index_on_seo_meta` (`seo_meta_id`,`seo_meta_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seo_meta`
--

LOCK TABLES `seo_meta` WRITE;
/*!40000 ALTER TABLE `seo_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `seo_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stylesheets`
--

DROP TABLE IF EXISTS `stylesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stylesheets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_id` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stylesheets`
--

LOCK TABLES `stylesheets` WRITE;
/*!40000 ALTER TABLE `stylesheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `stylesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxon_remarks`
--

DROP TABLE IF EXISTS `taxon_remarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_remarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_taxon_remarks_on_node_id` (`node_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxon_remarks`
--

LOCK TABLES `taxon_remarks` WRITE;
/*!40000 ALTER TABLE `taxon_remarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxon_remarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomic_statuses`
--

DROP TABLE IF EXISTS `taxonomic_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomic_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_preferred` tinyint(1) NOT NULL DEFAULT '1',
  `is_problematic` tinyint(1) NOT NULL DEFAULT '0',
  `is_alternative_preferred` tinyint(1) NOT NULL DEFAULT '0',
  `can_merge` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomic_statuses`
--

LOCK TABLES `taxonomic_statuses` WRITE;
/*!40000 ALTER TABLE `taxonomic_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxonomic_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_queries`
--

DROP TABLE IF EXISTS `term_queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pairs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clade` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_queries`
--

LOCK TABLES `term_queries` WRITE;
/*!40000 ALTER TABLE `term_queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_query_pairs`
--

DROP TABLE IF EXISTS `term_query_pairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_query_pairs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `predicate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `term_query_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_term_query_pairs_on_term_query_id` (`term_query_id`) USING BTREE,
  CONSTRAINT `fk_rails_9ed44c75a2` FOREIGN KEY (`term_query_id`) REFERENCES `term_queries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_query_pairs`
--

LOCK TABLES `term_query_pairs` WRITE;
/*!40000 ALTER TABLE `term_query_pairs` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_query_pairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_downloads`
--

DROP TABLE IF EXISTS `user_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `term_query_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_downloads_on_term_query_id` (`term_query_id`) USING BTREE,
  CONSTRAINT `fk_rails_322eb81cad` FOREIGN KEY (`term_query_id`) REFERENCES `term_queries` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_downloads`
--

LOCK TABLES `user_downloads` WRITE;
/*!40000 ALTER TABLE `user_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `api_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag_line` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `failed_attempts` int(11) NOT NULL DEFAULT '0',
  `unlock_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`) USING BTREE,
  UNIQUE KEY `index_users_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`) USING BTREE,
  UNIQUE KEY `index_users_on_unlock_token` (`unlock_token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vernaculars`
--

DROP TABLE IF EXISTS `vernaculars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vernaculars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `string` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `is_preferred` tinyint(1) NOT NULL DEFAULT '0',
  `is_preferred_by_resource` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `trust` int(11) NOT NULL DEFAULT '0',
  `node_resource_pk` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci,
  `source` text COLLATE utf8_unicode_ci,
  `resource_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_vernaculars_on_node_id` (`node_id`) USING BTREE,
  KEY `preferred_names_index` (`page_id`,`language_id`) USING BTREE,
  KEY `index_vernaculars_on_page_id` (`page_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vernaculars`
--

LOCK TABLES `vernaculars` WRITE;
/*!40000 ALTER TABLE `vernaculars` DISABLE KEYS */;
/*!40000 ALTER TABLE `vernaculars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `mysql`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mysql` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mysql`;

--
-- Table structure for table `columns_priv`
--

DROP TABLE IF EXISTS `columns_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `columns_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Column_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`,`Column_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columns_priv`
--

LOCK TABLES `columns_priv` WRITE;
/*!40000 ALTER TABLE `columns_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `columns_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`,`User`),
  KEY `User` (`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `execute_at` datetime DEFAULT NULL,
  `interval_value` int(11) DEFAULT NULL,
  `interval_field` enum('YEAR','QUARTER','MONTH','DAY','HOUR','MINUTE','WEEK','SECOND','MICROSECOND','YEAR_MONTH','DAY_HOUR','DAY_MINUTE','DAY_SECOND','HOUR_MINUTE','HOUR_SECOND','MINUTE_SECOND','DAY_MICROSECOND','HOUR_MICROSECOND','MINUTE_MICROSECOND','SECOND_MICROSECOND') DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_executed` datetime DEFAULT NULL,
  `starts` datetime DEFAULT NULL,
  `ends` datetime DEFAULT NULL,
  `status` enum('ENABLED','DISABLED','SLAVESIDE_DISABLED') NOT NULL DEFAULT 'ENABLED',
  `on_completion` enum('DROP','PRESERVE') NOT NULL DEFAULT 'DROP',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `originator` int(10) unsigned NOT NULL,
  `time_zone` char(64) CHARACTER SET latin1 NOT NULL DEFAULT 'SYSTEM',
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Events';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `func`
--

DROP TABLE IF EXISTS `func`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `func` (
  `name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ret` tinyint(1) NOT NULL DEFAULT '0',
  `dl` char(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` enum('function','aggregate') CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User defined functions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `func`
--

LOCK TABLES `func` WRITE;
/*!40000 ALTER TABLE `func` DISABLE KEYS */;
/*!40000 ALTER TABLE `func` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_category`
--

DROP TABLE IF EXISTS `help_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_category` (
  `help_category_id` smallint(5) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `parent_category_id` smallint(5) unsigned DEFAULT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_category_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_category`
--

LOCK TABLES `help_category` WRITE;
/*!40000 ALTER TABLE `help_category` DISABLE KEYS */;
INSERT INTO `help_category` VALUES (1,'Geographic',0,''),(2,'Polygon properties',35,''),(3,'Numeric Functions',39,''),(4,'WKT',35,''),(5,'Plugins',36,''),(6,'Control flow functions',39,''),(7,'MBR',35,''),(8,'Transactions',36,''),(9,'Help Metadata',36,''),(10,'Account Management',36,''),(11,'Point properties',35,''),(12,'Encryption Functions',39,''),(13,'LineString properties',35,''),(14,'Miscellaneous Functions',39,''),(15,'Logical operators',39,''),(16,'Functions and Modifiers for Use with GROUP BY',36,''),(17,'Information Functions',39,''),(18,'Storage Engines',36,''),(19,'Bit Functions',39,''),(20,'Comparison operators',39,''),(21,'Table Maintenance',36,''),(22,'User-Defined Functions',36,''),(23,'Data Types',36,''),(24,'Compound Statements',36,''),(25,'Geometry constructors',35,''),(26,'GeometryCollection properties',1,''),(27,'Administration',36,''),(28,'Data Manipulation',36,''),(29,'Utility',36,''),(30,'Language Structure',36,''),(31,'Geometry relations',35,''),(32,'Date and Time Functions',39,''),(33,'WKB',35,''),(34,'Procedures',36,''),(35,'Geographic Features',36,''),(36,'Contents',0,''),(37,'Geometry properties',35,''),(38,'String Functions',39,''),(39,'Functions',36,''),(40,'Data Definition',36,'');
/*!40000 ALTER TABLE `help_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_keyword`
--

DROP TABLE IF EXISTS `help_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_keyword` (
  `help_keyword_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  PRIMARY KEY (`help_keyword_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help keywords';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_keyword`
--

LOCK TABLES `help_keyword` WRITE;
/*!40000 ALTER TABLE `help_keyword` DISABLE KEYS */;
INSERT INTO `help_keyword` VALUES (0,'JOIN'),(1,'HOST'),(2,'SERIALIZABLE'),(3,'CONTAINS'),(4,'SRID'),(5,'AT'),(6,'SCHEDULE'),(7,'RETURNS'),(8,'MASTER_SSL_CA'),(9,'NCHAR'),(10,'ONLY'),(11,'WORK'),(12,'OPEN'),(13,'ESCAPE'),(14,'EVENTS'),(15,'MONTH'),(16,'PROFILES'),(17,'ISCLOSED'),(18,'DUPLICATE'),(19,'REPLICATION'),(20,'UNLOCK'),(21,'INNODB'),(22,'YEAR_MONTH'),(23,'WITHIN'),(24,'PREPARE'),(25,'LOCK'),(26,'NDB'),(27,'INT4'),(28,'POLYGON'),(29,'MINUTE'),(30,'SEPARATOR'),(31,'DELETE'),(32,'ON'),(33,'CONNECTION'),(34,'CLOSE'),(35,'USE'),(36,'PRIVILEGES'),(37,'SPATIAL'),(38,'SQL_BUFFER_RESULT'),(39,'ERROR'),(40,'SECURITY'),(41,'AUTOEXTEND_SIZE'),(42,'NDBCLUSTER'),(43,'LEVEL'),(44,'BINARY'),(45,'CURRENT_USER'),(46,'HOUR_MINUTE'),(47,'UPDATE'),(48,'PRESERVE'),(49,'INTO'),(50,'POLYFROMWKB'),(51,'VARIABLE'),(52,'ROLLBACK'),(53,'TIMESTAMP'),(54,'IMPORT'),(55,'CHECKSUM'),(56,'THEN'),(57,'ENGINES'),(58,'HANDLER'),(59,'DAY_SECOND'),(60,'HELP_DATE'),(61,'BOOLEAN'),(62,'MOD'),(63,'CLASS_ORIGIN'),(64,'MPOLYFROMWKB'),(65,'ITERATE'),(66,'DO'),(67,'DATE'),(68,'FULLTEXT'),(69,'COMMENT'),(70,'MASTER_CONNECT_RETRY'),(71,'MASTER_LOG_FILE'),(72,'PRECISION'),(73,'REQUIRE'),(74,'LONG'),(75,'OPTION'),(76,'REORGANIZE'),(77,'ELSE'),(78,'EXTERIORRING'),(79,'GEOMFROMWKB'),(80,'FROM'),(81,'MULTIPOLYGON'),(82,'LEFT'),(83,'ELSEIF'),(84,'COMPACT'),(85,'DEC'),(86,'FOR'),(87,'WARNINGS'),(88,'STRING'),(89,'CONDITION'),(90,'ENCLOSED'),(91,'AGGREGATE'),(92,'FIELDS'),(93,'KILL'),(94,'DISJOINT'),(95,'TABLESPACE'),(96,'OVERLAPS'),(97,'INFILE'),(98,'MBREQUAL'),(99,'HELP_VERSION'),(100,'ORDER'),(101,'USING'),(102,'MIDDLEINT'),(103,'GRANT'),(104,'MBRINTERSECTS'),(105,'GEOMETRYN'),(106,'GEOMETRYFROMTEXT'),(107,'FOREIGN'),(108,'CACHE'),(109,'MYSQL_ERRNO'),(110,'SCHEMAS'),(111,'LEADING'),(112,'CONSTRAINT_NAME'),(113,'CONVERT'),(114,'DYNAMIC'),(115,'POLYGONFROMTEXT'),(116,'ENVELOPE'),(117,'HAVING'),(118,'STARTING'),(119,'RELOAD'),(120,'ISSIMPLE'),(121,'AUTOCOMMIT'),(122,'REVOKE'),(123,'EXPLAIN'),(124,'CSV'),(125,'OUTFILE'),(126,'LOW_PRIORITY'),(127,'FILE'),(128,'NODEGROUP'),(129,'SCHEMA'),(130,'MLINEFROMWKB'),(131,'DUAL'),(132,'MULTIPOINTFROMWKB'),(133,'MULTIPOINTFROMTEXT'),(134,'EXTENDED'),(135,'CROSS'),(136,'CONTRIBUTORS'),(137,'NATIONAL'),(138,'GROUP'),(139,'SHA'),(140,'POINTN'),(141,'IGNORE_SERVER_IDS'),(142,'ASBINARY'),(143,'MBROVERLAPS'),(144,'GENERAL'),(145,'OWNER'),(146,'TRUE'),(147,'CHARACTER'),(148,'SCHEMA_NAME'),(149,'TABLE'),(150,'CASCADE'),(151,'RELAY_LOG_POS'),(152,'ASWKB'),(153,'LEAVE'),(154,'MODIFY'),(155,'MATCH'),(156,'MASTER_LOG_POS'),(157,'DISTINCTROW'),(158,'X'),(159,'CURSOR'),(160,'CROSSES'),(161,'GEOMETRYCOLLECTIONFROMTEXT'),(162,'CHAIN'),(163,'FLUSH'),(164,'CREATE'),(165,'DESCRIBE'),(166,'PROCESSLIST'),(167,'DISCARD'),(168,'SOUNDS'),(169,'PACK_KEYS'),(170,'MULTILINESTRINGFROMTEXT'),(171,'INTERSECTS'),(172,'FAST'),(173,'LOOP'),(174,'VARCHARACTER'),(175,'BEFORE'),(176,'ALL'),(177,'REDUNDANT'),(178,'USER_RESOURCES'),(179,'PARTIAL'),(180,'END'),(181,'SECOND'),(182,'FLOAT8'),(183,'PREV'),(184,'MBRCONTAINS'),(185,'OR'),(186,'IDENTIFIED'),(187,'POINTFROMTEXT'),(188,'MASTER_SSL_CIPHER'),(189,'SQL_SLAVE_SKIP_COUNTER'),(190,'BOTH'),(191,'YEAR'),(192,'UNIQUE'),(193,'TRIGGERS'),(194,'RESIGNAL'),(195,'MASTER_SSL'),(196,'DATE_ADD'),(197,'LIKE'),(198,'PLUGIN'),(199,'MULTIPOINT'),(200,'FETCH'),(201,'MBRWITHIN'),(202,'COLUMN'),(203,'USAGE'),(204,'MEMORY'),(205,'QUERY'),(206,'Y'),(207,'LINES'),(208,'SQL_THREAD'),(209,'INTERIORRINGN'),(210,'NUMINTERIORRINGS'),(211,'MAX_QUERIES_PER_HOUR'),(212,'TRANSACTION'),(213,'STDDEV'),(214,'NAMES'),(215,'INT1'),(216,'RIGHT'),(217,'MAX_ROWS'),(218,'ALTER'),(219,'NATURAL'),(220,'MULTILINESTRING'),(221,'VARIABLES'),(222,'ESCAPED'),(223,'KEY_BLOCK_SIZE'),(224,'MPOINTFROMTEXT'),(225,'CHAR'),(226,'UPGRADE'),(227,'INTERVAL'),(228,'NAME'),(229,'REFERENCES'),(230,'STORAGE'),(231,'ISOLATION'),(232,'EVERY'),(233,'INT8'),(234,'AUTHORS'),(235,'RESTRICT'),(236,'UNCOMMITTED'),(237,'LINESTRINGFROMTEXT'),(238,'IS'),(239,'NOT'),(240,'DATAFILE'),(241,'ANALYSE'),(242,'DES_KEY_FILE'),(243,'COMPRESSED'),(244,'START'),(245,'IF'),(246,'ROWS'),(247,'PURGE'),(248,'USER'),(249,'EXIT'),(250,'MERGE'),(251,'SQL_NO_CACHE'),(252,'DELAYED'),(253,'PROXY'),(254,'RELAY'),(255,'WRITE'),(256,'DATABASE'),(257,'NULL'),(258,'POWER'),(259,'POINTFROMWKB'),(260,'USE_FRM'),(261,'TERMINATED'),(262,'NVARCHAR'),(263,'RETURN'),(264,'DIRECTORY'),(265,'AES_DECRYPT'),(266,'GLENGTH'),(267,'SHUTDOWN'),(268,'CATALOG_NAME'),(269,'FIXED'),(270,'MULTIPOLYGONFROMTEXT'),(271,'REPLACE'),(272,'REPEAT'),(273,'STARTS'),(274,'COMPLETION'),(275,'COLUMNS'),(276,'DATETIME'),(277,'MODE'),(278,'INTEGER'),(279,'VALUE'),(280,'ASWKT'),(281,'GEOMETRYCOLLECTIONFROMWKB'),(282,'DROP'),(283,'SQL_BIG_RESULT'),(284,'MASTER_SSL_VERIFY_SERVER_CERT'),(285,'SUBJECT'),(286,'CHECK'),(287,'FULL'),(288,'BY'),(289,'NO'),(290,'DAY'),(291,'DATA'),(292,'PARTITION'),(293,'REAL'),(294,'SHARE'),(295,'LINESTRING'),(296,'MASTER_HEARTBEAT_PERIOD'),(297,'MESSAGE_TEXT'),(298,'COLUMN_NAME'),(299,'LINEFROMTEXT'),(300,'X509'),(301,'WHERE'),(302,'SUBCLASS_ORIGIN'),(303,'EVENT'),(304,'IGNORE'),(305,'SUPER'),(306,'SHA2'),(307,'QUICK'),(308,'SIGNED'),(309,'OFFLINE'),(310,'FALSE'),(311,'POLYGONFROMWKB'),(312,'FORCE'),(313,'CHANGE'),(314,'TO'),(315,'POINT'),(316,'TABLE_NAME'),(317,'SLOW'),(318,'VARYING'),(319,'FEDERATED'),(320,'MAX_SIZE'),(321,'HOUR_SECOND'),(322,'GEOMETRYCOLLECTION'),(323,'PROCEDURE'),(324,'AGAINST'),(325,'ENDPOINT'),(326,'LONGBINARY'),(327,'INSERT'),(328,'COUNT'),(329,'PORT'),(330,'MLINEFROMTEXT'),(331,'EXISTS'),(332,'MUTEX'),(333,'RELEASE'),(334,'DEFAULT'),(335,'TYPE'),(336,'NO_WRITE_TO_BINLOG'),(337,'OPTIMIZE'),(338,'SQLSTATE'),(339,'RESET'),(340,'INSTALL'),(341,'BIGINT'),(342,'SET'),(343,'ISSUER'),(344,'STATUS'),(345,'INNER'),(346,'RELAYLOG'),(347,'MRG_MYISAM'),(348,'STOP'),(349,'TRAILING'),(350,'PARTITIONS'),(351,'CASE'),(352,'IO_THREAD'),(353,'DEALLOCATE'),(354,'CIPHER'),(355,'CONTINUE'),(356,'READ'),(357,'MINUTE_SECOND'),(358,'MIN_ROWS'),(359,'FUNCTION'),(360,'CHARSET'),(361,'INT3'),(362,'ADD'),(363,'AVG_ROW_LENGTH'),(364,'ARCHIVE'),(365,'FLOAT4'),(366,'ASTEXT'),(367,'NUMGEOMETRIES'),(368,'VIEW'),(369,'REPEATABLE'),(370,'STARTPOINT'),(371,'CONSTRAINT_CATALOG'),(372,'MPOLYFROMTEXT'),(373,'UNSIGNED'),(374,'DECIMAL'),(375,'INDEXES'),(376,'HOSTS'),(377,'COMMIT'),(378,'SNAPSHOT'),(379,'DECLARE'),(380,'NUMPOINTS'),(381,'LOAD'),(382,'SQL_CACHE'),(383,'COLLATE'),(384,'BYTE'),(385,'LINESTRINGFROMWKB'),(386,'GLOBAL'),(387,'WHEN'),(388,'TOUCHES'),(389,'AS'),(390,'AUTO_INCREMENT'),(391,'GEOMCOLLFROMTEXT'),(392,'GRANTS'),(393,'OUTER'),(394,'CURSOR_NAME'),(395,'FLOOR'),(396,'WITH'),(397,'STD'),(398,'AFTER'),(399,'DISABLE'),(400,'UNINSTALL'),(401,'POW'),(402,'SONAME'),(403,'INDEX'),(404,'DEFINER'),(405,'MASTER_BIND'),(406,'REMOVE'),(407,'MULTILINESTRINGFROMWKB'),(408,'ONLINE'),(409,'UNDO'),(410,'ZEROFILL'),(411,'CLIENT'),(412,'MASTER_PASSWORD'),(413,'RELAY_LOG_FILE'),(414,'MBRTOUCHES'),(415,'MASTER_USER'),(416,'ENGINE'),(417,'INSERT_METHOD'),(418,'SQL_CALC_FOUND_ROWS'),(419,'UNION'),(420,'MYISAM'),(421,'DESC'),(422,'TIME'),(423,'EXPANSION'),(424,'NUMERIC'),(425,'CODE'),(426,'AREA'),(427,'LOGFILE'),(428,'EXTENT_SIZE'),(429,'INT2'),(430,'MAX_UPDATES_PER_HOUR'),(431,'ENDS'),(432,'ISEMPTY'),(433,'RECOVER'),(434,'LOGS'),(435,'HEAP'),(436,'BETWEEN'),(437,'REPAIR'),(438,'MBRDISJOINT'),(439,'CALL'),(440,'VALUES'),(441,'TRUNCATE'),(442,'SHOW'),(443,'BINLOG'),(444,'AND'),(445,'HOUR'),(446,'SELECT'),(447,'DATABASES'),(448,'WRAPPER'),(449,'BOOL'),(450,'MASTER_PORT'),(451,'CONCURRENT'),(452,'HELP'),(453,'OPTIONS'),(454,'PROCESS'),(455,'CONSISTENT'),(456,'MAX_CONNECTIONS_PER_HOUR'),(457,'IN'),(458,'DUMPFILE'),(459,'POLYFROMTEXT'),(460,'EXECUTE'),(461,'CEIL'),(462,'MASTER_HOST'),(463,'SERVER'),(464,'MULTIPOLYGONFROMWKB'),(465,'MASTER_SSL_CERT'),(466,'DAY_MINUTE'),(467,'DATE_SUB'),(468,'REBUILD'),(469,'GEOMETRYFROMWKB'),(470,'PARSER'),(471,'RENAME'),(472,'GEOMFROMTEXT'),(473,'SOCKET'),(474,'STRAIGHT_JOIN'),(475,'SHA1'),(476,'PASSWORD'),(477,'OFFSET'),(478,'NEXT'),(479,'ERRORS'),(480,'TEMPORARY'),(481,'SQL_LOG_BIN'),(482,'DIMENSION'),(483,'SQL_SMALL_RESULT'),(484,'COMMITTED'),(485,'EQUALS'),(486,'DELAY_KEY_WRITE'),(487,'BEGIN'),(488,'XA'),(489,'PROFILE'),(490,'CENTROID'),(491,'MEDIUM'),(492,'SSL'),(493,'DAY_HOUR'),(494,'AES_ENCRYPT'),(495,'GEOMCOLLROMWKB'),(496,'CEILING'),(497,'LINEFROMWKB'),(498,'GEOMETRYTYPE'),(499,'SIGNAL'),(500,'PLUGINS'),(501,'SAVEPOINT'),(502,'PRIMARY'),(503,'LAST'),(504,'KEYS'),(505,'MPOINTFROMWKB'),(506,'LIMIT'),(507,'KEY'),(508,'UNTIL'),(509,'CONSTRAINT_SCHEMA'),(510,'ANALYZE'),(511,'CONSTRAINT'),(512,'SERIAL'),(513,'ACTION'),(514,'INITIAL_SIZE'),(515,'SESSION'),(516,'SLAVE'),(517,'ASC'),(518,'ENABLE'),(519,'OPTIONALLY'),(520,'DISTINCT'),(521,'LOCAL'),(522,'WHILE'),(523,'MAX_USER_CONNECTIONS'),(524,'MASTER_SSL_KEY'),(525,'NONE'),(526,'TABLES'),(527,'<>'),(528,'RLIKE'),(529,'TRIGGER'),(530,'HIGH_PRIORITY'),(531,'COLLATION'),(532,'BTREE'),(533,'COALESCE'),(534,'FIRST'),(535,'WAIT'),(536,'MASTER'),(537,'ROW_FORMAT');
/*!40000 ALTER TABLE `help_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_relation`
--

DROP TABLE IF EXISTS `help_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_relation` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `help_keyword_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`help_keyword_id`,`help_topic_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='keyword-topic relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_relation`
--

LOCK TABLES `help_relation` WRITE;
/*!40000 ALTER TABLE `help_relation` DISABLE KEYS */;
INSERT INTO `help_relation` VALUES (0,0),(432,0),(239,1),(229,2),(2,3),(3,4),(300,5),(300,6),(456,6),(55,7),(349,8),(221,9),(474,10),(327,11),(13,12),(59,12),(323,12),(426,12),(196,13),(66,14),(91,14),(218,14),(195,15),(45,16),(18,17),(307,18),(106,19),(24,20),(237,21),(426,21),(195,22),(21,23),(23,24),(372,24),(474,24),(24,25),(173,25),(432,25),(237,26),(255,27),(26,28),(195,29),(433,30),(30,31),(237,31),(497,31),(0,32),(300,32),(456,32),(497,32),(93,33),(237,33),(491,33),(31,34),(59,34),(0,35),(33,35),(103,35),(102,36),(106,36),(133,36),(173,36),(110,37),(491,37),(432,38),(173,39),(106,40),(103,41),(237,42),(229,43),(25,44),(121,44),(146,44),(173,44),(300,45),(456,45),(195,46),(46,47),(307,47),(432,47),(497,47),(300,48),(456,48),(260,49),(307,49),(399,49),(432,49),(51,50),(319,51),(327,52),(474,52),(489,52),(56,53),(347,53),(464,54),(491,54),(206,55),(237,55),(491,55),(20,56),(34,56),(47,56),(390,57),(426,57),(59,58),(406,58),(195,59),(60,60),(266,61),(299,61),(63,62),(342,62),(193,63),(488,63),(67,64),(68,65),(69,66),(300,66),(456,66),(507,66),(71,67),(121,67),(195,67),(381,67),(110,68),(237,68),(491,68),(103,69),(110,69),(237,69),(300,69),(456,69),(491,69),(349,70),(349,71),(405,72),(106,73),(391,74),(106,75),(133,75),(491,76),(34,77),(47,77),(76,78),(77,79),(30,80),(66,80),(218,80),(265,80),(403,80),(426,80),(432,80),(487,80),(79,81),(0,82),(20,83),(237,84),(359,85),(344,86),(406,86),(426,86),(432,86),(465,86),(413,87),(426,87),(55,88),(344,89),(464,90),(55,91),(265,92),(426,92),(464,92),(93,93),(94,94),(103,95),(214,95),(491,95),(498,95),(96,96),(321,97),(464,97),(98,98),(100,99),(30,100),(46,100),(432,100),(433,100),(491,100),(0,101),(30,101),(48,101),(135,102),(106,103),(133,103),(107,104),(112,105),(459,106),(237,107),(239,107),(491,107),(497,107),(57,108),(81,108),(173,108),(316,108),(399,108),(193,109),(488,109),(88,110),(426,110),(487,111),(193,112),(488,112),(121,113),(442,113),(237,114),(452,115),(127,116),(432,117),(464,118),(106,119),(129,120),(327,121),(133,122),(137,123),(237,124),(464,124),(432,125),(24,126),(30,126),(46,126),(260,126),(307,126),(321,126),(464,126),(106,127),(103,128),(111,129),(330,129),(348,129),(402,129),(426,129),(149,130),(151,131),(490,132),(219,133),(137,134),(235,134),(0,135),(4,136),(426,136),(140,137),(221,137),(103,138),(122,138),(278,138),(367,138),(432,138),(467,139),(155,140),(349,141),(159,142),(163,143),(173,144),(239,145),(200,146),(111,147),(140,147),(177,147),(221,147),(237,147),(250,147),(321,147),(330,147),(426,147),(432,147),(464,147),(491,147),(193,148),(488,148),(38,149),(61,149),(114,149),(150,149),(206,149),(215,149),(235,149),(237,149),(313,149),(388,149),(410,149),(426,149),(491,149),(495,149),(237,150),(269,150),(388,150),(497,150),(349,151),(159,152),(167,153),(491,154),(299,155),(349,156),(432,157),(169,158),(465,159),(171,160),(376,161),(327,162),(81,163),(173,163),(12,164),(15,164),(38,164),(55,164),(103,164),(110,164),(150,164),(165,164),(185,164),(203,164),(237,164),(239,164),(278,164),(295,164),(300,164),(330,164),(360,164),(402,164),(426,164),(486,164),(137,165),(426,166),(484,166),(491,167),(443,168),(237,169),(491,169),(308,170),(178,171),(215,172),(179,173),(140,174),(146,175),(106,176),(133,176),(273,176),(400,176),(432,176),(237,177),(173,178),(237,179),(20,180),(34,180),(47,180),(123,180),(174,180),(179,180),(474,180),(507,180),(195,181),(405,182),(59,183),(183,184),(186,185),(106,186),(295,186),(321,186),(188,187),(349,188),(97,189),(487,190),(195,191),(491,192),(17,193),(426,193),(193,194),(349,195),(195,196),(265,197),(426,197),(443,197),(158,198),(426,198),(463,198),(197,199),(199,200),(201,201),(491,202),(106,203),(432,204),(81,205),(93,205),(173,205),(299,205),(316,205),(205,206),(321,207),(464,207),(282,208),(412,208),(208,209),(207,210),(106,211),(229,212),(327,212),(211,213),(292,214),(266,215),(0,216),(237,217),(491,217),(38,218),(87,218),(106,218),(111,218),(192,218),(226,218),(367,218),(370,218),(456,218),(491,218),(498,218),(0,219),(217,220),(426,221),(427,221),(464,222),(237,223),(491,223),(219,224),(121,225),(493,225),(111,226),(215,226),(195,227),(300,227),(111,228),(106,229),(237,229),(497,229),(390,230),(229,231),(300,232),(317,233),(7,234),(426,234),(269,235),(388,235),(497,235),(229,236),(283,237),(108,238),(191,238),(231,238),(298,238),(108,239),(298,239),(300,239),(330,239),(404,239),(103,240),(498,240),(99,241),(173,242),(237,243),(327,244),(412,244),(474,244),(6,245),(20,245),(244,245),(269,245),(300,245),(330,245),(348,245),(388,245),(397,245),(321,246),(146,247),(239,248),(295,248),(365,248),(414,248),(406,249),(237,250),(432,251),(260,252),(307,252),(501,252),(133,253),(173,254),(24,255),(474,255),(111,256),(239,256),(330,256),(348,256),(402,256),(426,256),(191,257),(298,257),(497,257),(246,258),(245,259),(235,260),(464,261),(140,262),(251,263),(111,264),(237,264),(491,264),(253,265),(256,266),(106,267),(193,268),(488,268),(237,269),(359,269),(353,270),(260,271),(321,271),(464,271),(123,272),(300,273),(300,274),(456,274),(237,275),(265,275),(426,275),(464,275),(491,275),(121,276),(299,277),(432,277),(55,278),(121,278),(255,278),(193,279),(260,279),(307,279),(374,279),(488,279),(343,280),(309,281),(6,282),(49,282),(122,282),(142,282),(210,282),(214,282),(269,282),(271,282),(348,282),(372,282),(388,282),(397,282),(414,282),(462,282),(491,282),(498,282),(432,283),(349,284),(106,285),(215,286),(237,286),(491,286),(160,287),(237,287),(265,287),(426,287),(484,287),(30,288),(46,288),(106,288),(237,288),(295,288),(321,288),(432,288),(433,288),(464,288),(491,288),(237,289),(497,289),(195,290),(111,291),(237,291),(239,291),(464,291),(491,291),(237,292),(491,292),(55,293),(405,293),(432,294),(276,295),(349,296),(193,297),(488,297),(193,298),(488,298),(283,299),(106,300),(30,301),(46,301),(59,301),(265,301),(403,301),(193,302),(488,302),(185,303),(300,303),(397,303),(456,303),(0,304),(46,304),(307,304),(321,304),(432,304),(464,304),(491,304),(106,305),(288,306),(30,307),(215,307),(235,307),(121,308),(49,309),(110,309),(491,309),(200,310),(51,311),(0,312),(349,313),(491,313),(146,314),(349,314),(489,314),(296,315),(193,316),(488,316),(173,317),(140,318),(237,319),(103,320),(195,321),(302,322),(12,323),(99,323),(165,323),(175,323),(226,323),(426,323),(432,323),(462,323),(502,323),(299,324),(305,325),(391,326),(104,327),(164,327),(307,327),(501,327),(222,328),(293,328),(413,328),(239,329),(308,330),(6,331),(269,331),(300,331),(330,331),(348,331),(388,331),(397,331),(426,332),(436,332),(327,333),(474,333),(489,333),(111,334),(237,334),(260,334),(307,334),(330,334),(354,334),(374,334),(491,334),(497,334),(491,335),(173,336),(235,336),(313,336),(495,336),(313,337),(491,337),(193,338),(488,338),(81,339),(143,339),(273,339),(316,339),(463,340),(116,341),(46,342),(97,342),(111,342),(177,342),(193,342),(237,342),(242,342),(250,342),(252,342),(260,342),(292,342),(307,342),(319,342),(321,342),(327,342),(330,342),(426,342),(432,342),(464,342),(488,342),(491,342),(497,342),(106,343),(35,344),(114,344),(117,344),(173,344),(175,344),(326,344),(417,344),(426,344),(436,344),(0,345),(218,346),(237,347),(282,348),(487,349),(137,350),(34,351),(47,351),(282,352),(412,352),(372,353),(106,354),(406,355),(24,356),(59,356),(173,356),(229,356),(474,356),(195,357),(237,358),(491,358),(55,359),(165,359),(203,359),(210,359),(271,359),(290,359),(360,359),(370,359),(417,359),(426,359),(462,359),(250,360),(135,361),(38,362),(103,362),(491,362),(498,362),(237,363),(491,363),(237,364),(338,365),(343,366),(346,367),(87,368),(269,368),(486,368),(229,369),(352,370),(193,371),(488,371),(353,372),(121,373),(255,373),(266,373),(317,373),(338,373),(359,373),(405,373),(55,374),(85,374),(121,374),(426,375),(173,376),(328,376),(426,376),(327,377),(474,377),(327,378),(474,378),(344,379),(354,379),(406,379),(465,379),(366,380),(399,381),(464,381),(432,382),(111,383),(237,383),(330,383),(491,383),(493,384),(483,385),(97,386),(229,386),(319,386),(326,386),(427,386),(34,387),(47,387),(373,388),(0,389),(24,389),(432,389),(491,390),(376,391),(350,392),(426,392),(0,393),(193,394),(488,394),(116,395),(106,396),(110,396),(173,396),(237,396),(299,396),(491,396),(380,397),(491,398),(300,399),(456,399),(491,399),(158,400),(387,401),(55,402),(0,403),(38,403),(49,403),(57,403),(110,403),(237,403),(399,403),(403,403),(426,403),(491,403),(300,404),(456,404),(349,405),(491,406),(149,407),(49,408),(110,408),(491,408),(406,409),(255,410),(266,410),(317,410),(338,410),(359,410),(405,410),(106,411),(349,412),(349,413),(396,414),(349,415),(103,416),(173,416),(214,416),(237,416),(426,416),(436,416),(491,416),(498,416),(237,417),(491,417),(432,418),(400,419),(491,419),(237,420),(137,421),(432,421),(433,421),(121,422),(194,422),(407,422),(299,423),(359,424),(290,425),(502,425),(411,426),(103,427),(122,427),(278,427),(367,427),(103,428),(124,429),(106,430),(300,431),(416,432),(474,433),(25,434),(146,434),(173,434),(426,434),(237,435),(78,436),(235,437),(491,437),(419,438),(421,439),(260,440),(307,440),(410,441),(491,441),(4,442),(7,442),(12,442),(17,442),(22,442),(25,442),(35,442),(45,442),(66,442),(88,442),(91,442),(102,442),(114,442),(117,442),(150,442),(160,442),(175,442),(177,442),(185,442),(203,442),(218,442),(248,442),(265,442),(290,442),(293,442),(323,442),(326,442),(328,442),(350,442),(390,442),(402,442),(403,442),(413,442),(417,442),(426,442),(427,442),(436,442),(484,442),(502,442),(505,442),(66,443),(428,443),(78,444),(430,444),(195,445),(137,446),(164,446),(260,446),(307,446),(432,446),(88,447),(426,447),(239,448),(62,449),(266,449),(349,450),(321,451),(464,451),(64,452),(449,452),(192,453),(239,453),(106,454),(327,455),(474,455),(106,456),(66,457),(218,457),(265,457),(299,457),(403,457),(432,457),(432,458),(452,459),(48,460),(106,460),(454,461),(349,462),(6,463),(192,463),(239,463),(67,464),(349,465),(195,466),(195,467),(491,468),(77,469),(110,470),(237,470),(491,470),(61,471),(365,471),(456,471),(491,471),(459,472),(239,473),(0,474),(432,474),(467,475),(106,476),(239,476),(242,476),(295,476),(491,476),(432,477),(59,478),(293,479),(426,479),(388,480),(252,481),(471,482),(432,483),(229,484),(473,485),(237,486),(491,486),(174,487),(327,487),(474,487),(474,488),(248,489),(475,490),(215,491),(106,492),(195,493),(478,494),(309,495),(482,496),(483,497),(485,498),(488,499),(22,500),(489,501),(491,502),(59,503),(403,504),(426,504),(491,504),(490,505),(30,506),(46,506),(59,506),(66,506),(218,506),(432,506),(38,507),(237,507),(307,507),(491,507),(497,507),(123,508),(193,509),(488,509),(491,510),(495,510),(237,511),(491,511),(237,512),(374,512),(237,513),(497,513),(103,514),(498,514),(229,515),(319,515),(326,515),(427,515),(117,516),(173,516),(273,516),(282,516),(300,516),(316,516),(328,516),(412,516),(456,516),(432,517),(433,517),(300,518),(456,518),(491,518),(464,519),(54,520),(222,520),(259,520),(393,520),(400,520),(432,520),(433,520),(445,520),(24,521),(173,521),(235,521),(313,521),(321,521),(464,521),(495,521),(507,522),(106,523),(349,524),(106,525),(24,526),(160,526),(173,526),(323,526),(426,526),(506,527),(19,528),(15,529),(142,529),(426,529),(307,530),(432,530),(426,531),(505,531),(110,532),(491,533),(59,534),(237,534),(491,534),(103,535),(498,535),(25,536),(35,536),(143,536),(146,536),(173,536),(316,536),(349,536),(237,537),(491,537);
/*!40000 ALTER TABLE `help_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `help_topic`
--

DROP TABLE IF EXISTS `help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `help_topic` (
  `help_topic_id` int(10) unsigned NOT NULL,
  `name` char(64) NOT NULL,
  `help_category_id` smallint(5) unsigned NOT NULL,
  `description` text NOT NULL,
  `example` text NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`help_topic_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='help topics';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `help_topic`
--

LOCK TABLES `help_topic` WRITE;
/*!40000 ALTER TABLE `help_topic` DISABLE KEYS */;
INSERT INTO `help_topic` VALUES (0,'JOIN',28,'MySQL supports the following JOIN syntax for the table_references part\nof SELECT statements and multiple-table DELETE and UPDATE statements:\n\ntable_references:\n    escaped_table_reference [, escaped_table_reference] ...\n\nescaped_table_reference:\n    table_reference\n  | { OJ table_reference }\n\ntable_reference:\n    table_factor\n  | join_table\n\ntable_factor:\n    tbl_name [[AS] alias] [index_hint_list]\n  | table_subquery [AS] alias\n  | ( table_references )\n\njoin_table:\n    table_reference [INNER | CROSS] JOIN table_factor [join_condition]\n  | table_reference STRAIGHT_JOIN table_factor\n  | table_reference STRAIGHT_JOIN table_factor ON conditional_expr\n  | table_reference {LEFT|RIGHT} [OUTER] JOIN table_reference join_condition\n  | table_reference NATURAL [{LEFT|RIGHT} [OUTER]] JOIN table_factor\n\njoin_condition:\n    ON conditional_expr\n  | USING (column_list)\n\nindex_hint_list:\n    index_hint [, index_hint] ...\n\nindex_hint:\n    USE {INDEX|KEY}\n      [FOR {JOIN|ORDER BY|GROUP BY}] ([index_list])\n  | IGNORE {INDEX|KEY}\n      [FOR {JOIN|ORDER BY|GROUP BY}] (index_list)\n  | FORCE {INDEX|KEY}\n      [FOR {JOIN|ORDER BY|GROUP BY}] (index_list)\n\nindex_list:\n    index_name [, index_name] ...\n\nA table reference is also known as a join expression.\n\nThe syntax of table_factor is extended in MySQL in comparison with\nstandard SQL. The standard accepts only table_reference, not a list of\nthem inside a pair of parentheses.\n\nThis is a conservative extension if each comma in a list of\ntable_reference items is considered as equivalent to an inner join. For\nexample:\n\nSELECT * FROM t1 LEFT JOIN (t2, t3, t4)\n                 ON (t2.a = t1.a AND t3.b = t1.b AND t4.c = t1.c)\n\nis equivalent to:\n\nSELECT * FROM t1 LEFT JOIN (t2 CROSS JOIN t3 CROSS JOIN t4)\n                 ON (t2.a = t1.a AND t3.b = t1.b AND t4.c = t1.c)\n\nIn MySQL, JOIN, CROSS JOIN, and INNER JOIN are syntactic equivalents\n(they can replace each other). In standard SQL, they are not\nequivalent. INNER JOIN is used with an ON clause, CROSS JOIN is used\notherwise.\n\nIn general, parentheses can be ignored in join expressions containing\nonly inner join operations. MySQL also supports nested joins. See\nhttp://dev.mysql.com/doc/refman/5.5/en/nested-join-optimization.html.\n\nIndex hints can be specified to affect how the MySQL optimizer makes\nuse of indexes. For more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/index-hints.html. The\noptimizer_switch system variable is another way to influence optimizer\nuse of indexes. See\nhttp://dev.mysql.com/doc/refman/5.5/en/switchable-optimizations.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/join.html\n\n','SELECT left_tbl.*\n  FROM left_tbl LEFT JOIN right_tbl ON left_tbl.id = right_tbl.id\n  WHERE right_tbl.id IS NULL;\n','http://dev.mysql.com/doc/refman/5.5/en/join.html'),(1,'HEX',38,'Syntax:\nHEX(str), HEX(N)\n\nFor a string argument str, HEX() returns a hexadecimal string\nrepresentation of str where each byte of each character in str is\nconverted to two hexadecimal digits. (Multibyte characters therefore\nbecome more than two digits.) The inverse of this operation is\nperformed by the UNHEX() function.\n\nFor a numeric argument N, HEX() returns a hexadecimal string\nrepresentation of the value of N treated as a longlong (BIGINT) number.\nThis is equivalent to CONV(N,10,16). The inverse of this operation is\nperformed by CONV(HEX(N),16,10).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT X\'616263\', HEX(\'abc\'), UNHEX(HEX(\'abc\'));\n        -> \'abc\', 616263, \'abc\'\nmysql> SELECT HEX(255), CONV(HEX(255),16,10);\n        -> \'FF\', 255\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(2,'CONTAINS',7,'Contains(g1, g2)\n\nReturns 1 or 0 to indicate whether g1 completely contains g2. This\ntests the opposite relationship as Within().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html'),(3,'SRID',37,'SRID(g)\n\nReturns an integer indicating the spatial reference system ID\nassociated with the geometry value g.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-general-property-functions.html\n\n','mysql> SELECT SRID(GeomFromText(\'LineString(1 1,2 2)\',101));\n+-----------------------------------------------+\n| SRID(GeomFromText(\'LineString(1 1,2 2)\',101)) |\n+-----------------------------------------------+\n|                                           101 |\n+-----------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-general-property-functions.html'),(4,'SHOW CONTRIBUTORS',27,'Syntax:\nSHOW CONTRIBUTORS\n\nThe SHOW CONTRIBUTORS statement displays information about the people\nwho contribute to MySQL source or to causes that we support. For each\ncontributor, it displays Name, Location, and Comment values.\n\nThis statement is deprecated as of MySQL 5.5.29 and is removed in MySQL\n5.6.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-contributors.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-contributors.html'),(5,'VARIANCE',16,'Syntax:\nVARIANCE(expr)\n\nReturns the population standard variance of expr. VARIANCE() is a\nsynonym for the standard SQL function VAR_POP(), provided as a MySQL\nextension.\n\nIf there are no matching rows, VARIANCE() returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(6,'DROP SERVER',40,'Syntax:\nDROP SERVER [ IF EXISTS ] server_name\n\nDrops the server definition for the server named server_name. The\ncorresponding row in the mysql.servers table is deleted. This statement\nrequires the SUPER privilege.\n\nDropping a server for a table does not affect any FEDERATED tables that\nused this connection information when they were created. See [HELP\nCREATE SERVER].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-server.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-server.html'),(7,'SHOW AUTHORS',27,'Syntax:\nSHOW AUTHORS\n\nThe SHOW AUTHORS statement displays information about the people who\nwork on MySQL. For each author, it displays Name, Location, and Comment\nvalues.\n\nThis statement is deprecated as of MySQL 5.5.29 and is removed in MySQL\n5.6.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-authors.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-authors.html'),(8,'CONCAT',38,'Syntax:\nCONCAT(str1,str2,...)\n\nReturns the string that results from concatenating the arguments. May\nhave one or more arguments. If all arguments are nonbinary strings, the\nresult is a nonbinary string. If the arguments include any binary\nstrings, the result is a binary string. A numeric argument is converted\nto its equivalent string form. This is a nonbinary string as of MySQL\n5.5.3. Before 5.5.3, it is a binary string; to avoid that and produce a\nnonbinary string, you can use an explicit type cast, as in this\nexample:\n\nSELECT CONCAT(CAST(int_col AS CHAR), char_col);\n\nCONCAT() returns NULL if any argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT CONCAT(\'My\', \'S\', \'QL\');\n        -> \'MySQL\'\nmysql> SELECT CONCAT(\'My\', NULL, \'QL\');\n        -> NULL\nmysql> SELECT CONCAT(14.3);\n        -> \'14.3\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(9,'GEOMETRY HIERARCHY',35,'Geometry is the base class. It is an abstract class. The instantiable\nsubclasses of Geometry are restricted to zero-, one-, and\ntwo-dimensional geometric objects that exist in two-dimensional\ncoordinate space. All instantiable geometry classes are defined so that\nvalid instances of a geometry class are topologically closed (that is,\nall defined geometries include their boundary).\n\nThe base Geometry class has subclasses for Point, Curve, Surface, and\nGeometryCollection:\n\no Point represents zero-dimensional objects.\n\no Curve represents one-dimensional objects, and has subclass\n  LineString, with sub-subclasses Line and LinearRing.\n\no Surface is designed for two-dimensional objects and has subclass\n  Polygon.\n\no GeometryCollection has specialized zero-, one-, and two-dimensional\n  collection classes named MultiPoint, MultiLineString, and\n  MultiPolygon for modeling geometries corresponding to collections of\n  Points, LineStrings, and Polygons, respectively. MultiCurve and\n  MultiSurface are introduced as abstract superclasses that generalize\n  the collection interfaces to handle Curves and Surfaces.\n\nGeometry, Curve, Surface, MultiCurve, and MultiSurface are defined as\nnoninstantiable classes. They define a common set of methods for their\nsubclasses and are included for extensibility.\n\nPoint, LineString, Polygon, GeometryCollection, MultiPoint,\nMultiLineString, and MultiPolygon are instantiable classes.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-geometry-class-hierarchy.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-geometry-class-hierarchy.html'),(10,'CHAR FUNCTION',38,'Syntax:\nCHAR(N,... [USING charset_name])\n\nCHAR() interprets each argument N as an integer and returns a string\nconsisting of the characters given by the code values of those\nintegers. NULL values are skipped.\nBy default, CHAR() returns a binary string. To produce a string in a\ngiven character set, use the optional USING clause:\n\nmysql> SELECT CHARSET(CHAR(X\'65\')), CHARSET(CHAR(X\'65\' USING utf8));\n+----------------------+---------------------------------+\n| CHARSET(CHAR(X\'65\')) | CHARSET(CHAR(X\'65\' USING utf8)) |\n+----------------------+---------------------------------+\n| binary               | utf8                            |\n+----------------------+---------------------------------+\n\nIf USING is given and the result string is illegal for the given\ncharacter set, a warning is issued. Also, if strict SQL mode is\nenabled, the result from CHAR() becomes NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT CHAR(77,121,83,81,\'76\');\n        -> \'MySQL\'\nmysql> SELECT CHAR(77,77.3,\'77.3\');\n        -> \'MMM\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(11,'SHOW CREATE TRIGGER',27,'Syntax:\nSHOW CREATE TRIGGER trigger_name\n\nThis statement shows the CREATE TRIGGER statement that creates the\nnamed trigger. This statement requires the TRIGGER privilege for the\ntable associated with the trigger.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-create-trigger.html'),(12,'SHOW CREATE PROCEDURE',27,'Syntax:\nSHOW CREATE PROCEDURE proc_name\n\nThis statement is a MySQL extension. It returns the exact string that\ncan be used to re-create the named stored procedure. A similar\nstatement, SHOW CREATE FUNCTION, displays information about stored\nfunctions (see [HELP SHOW CREATE FUNCTION]).\n\nTo use either statement, you must be the user named in the routine\nDEFINER clause or have SELECT access to the mysql.proc table. If you do\nnot have privileges for the routine itself, the value displayed for the\nCreate Procedure or Create Function field will be NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-procedure.html\n\n','mysql> SHOW CREATE PROCEDURE test.simpleproc\\G\n*************************** 1. row ***************************\n           Procedure: simpleproc\n            sql_mode:\n    Create Procedure: CREATE PROCEDURE `simpleproc`(OUT param1 INT)\n                      BEGIN\n                      SELECT COUNT(*) INTO param1 FROM t;\n                      END\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n\nmysql> SHOW CREATE FUNCTION test.hello\\G\n*************************** 1. row ***************************\n            Function: hello\n            sql_mode:\n     Create Function: CREATE FUNCTION `hello`(s CHAR(20))\n                      RETURNS CHAR(50)\n                      RETURN CONCAT(\'Hello, \',s,\'!\')\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n','http://dev.mysql.com/doc/refman/5.5/en/show-create-procedure.html'),(13,'OPEN',24,'Syntax:\nOPEN cursor_name\n\nThis statement opens a previously declared cursor. For an example, see\nhttp://dev.mysql.com/doc/refman/5.5/en/cursors.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/open.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/open.html'),(14,'LOWER',38,'Syntax:\nLOWER(str)\n\nReturns the string str with all characters changed to lowercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n\nmysql> SELECT LOWER(\'QUADRATICALLY\');\n        -> \'quadratically\'\n\nLOWER() (and UPPER()) are ineffective when applied to binary strings\n(BINARY, VARBINARY, BLOB). To perform lettercase conversion, convert\nthe string to a nonbinary string:\n\nmysql> SET @str = BINARY \'New York\';\nmysql> SELECT LOWER(@str), LOWER(CONVERT(@str USING latin1));\n+-------------+-----------------------------------+\n| LOWER(@str) | LOWER(CONVERT(@str USING latin1)) |\n+-------------+-----------------------------------+\n| New York    | new york                          |\n+-------------+-----------------------------------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(15,'CREATE TRIGGER',40,'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    TRIGGER trigger_name\n    trigger_time trigger_event\n    ON tbl_name FOR EACH ROW\n    trigger_body\n\ntrigger_time: { BEFORE | AFTER }\n\ntrigger_event: { INSERT | UPDATE | DELETE }\n\nThis statement creates a new trigger. A trigger is a named database\nobject that is associated with a table, and that activates when a\nparticular event occurs for the table. The trigger becomes associated\nwith the table named tbl_name, which must refer to a permanent table.\nYou cannot associate a trigger with a TEMPORARY table or a view.\n\nTrigger names exist in the schema namespace, meaning that all triggers\nmust have unique names within a schema. Triggers in different schemas\ncan have the same name.\n\nThis section describes CREATE TRIGGER syntax. For additional\ndiscussion, see\nhttp://dev.mysql.com/doc/refman/5.5/en/trigger-syntax.html.\n\nCREATE TRIGGER requires the TRIGGER privilege for the table associated\nwith the trigger. The statement might also require the SUPER privilege,\ndepending on the DEFINER value, as described later in this section. If\nbinary logging is enabled, CREATE TRIGGER might require the SUPER\nprivilege, as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-logging.html.\n\nThe DEFINER clause determines the security context to be used when\nchecking access privileges at trigger activation time, as described\nlater in this section.\n\ntrigger_time is the trigger action time. It can be BEFORE or AFTER to\nindicate that the trigger activates before or after each row to be\nmodified.\n\nBasic column value checks occur prior to trigger activation, so you\ncannot use BEFORE triggers to convert values inappropriate for the\ncolumn type to valid values.\n\ntrigger_event indicates the kind of operation that activates the\ntrigger. These trigger_event values are permitted:\n\no INSERT: The trigger activates whenever a new row is inserted into the\n  table; for example, through INSERT, LOAD DATA, and REPLACE\n  statements.\n\no UPDATE: The trigger activates whenever a row is modified; for\n  example, through UPDATE statements.\n\no DELETE: The trigger activates whenever a row is deleted from the\n  table; for example, through DELETE and REPLACE statements. DROP TABLE\n  and TRUNCATE TABLE statements on the table do not activate this\n  trigger, because they do not use DELETE. Dropping a partition does\n  not activate DELETE triggers, either.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-trigger.html'),(16,'MONTH',32,'Syntax:\nMONTH(date)\n\nReturns the month for date, in the range 1 to 12 for January to\nDecember, or 0 for dates such as \'0000-00-00\' or \'2008-00-00\' that have\na zero month part.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT MONTH(\'2008-02-03\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(17,'SHOW TRIGGERS',27,'Syntax:\nSHOW TRIGGERS\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TRIGGERS lists the triggers currently defined for tables in a\ndatabase (the default database unless a FROM clause is given). This\nstatement returns results only for databases and tables for which you\nhave the TRIGGER privilege. The LIKE clause, if present, indicates\nwhich table names to match (not trigger names) and causes the statement\nto display triggers for those tables. The WHERE clause can be given to\nselect rows using more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nFor the trigger ins_sum as defined in\nhttp://dev.mysql.com/doc/refman/5.5/en/triggers.html, the output of\nthis statement is as shown here:\n\nmysql> SHOW TRIGGERS LIKE \'acc%\'\\G\n*************************** 1. row ***************************\n             Trigger: ins_sum\n               Event: INSERT\n               Table: account\n           Statement: SET @sum = @sum + NEW.amount\n              Timing: BEFORE\n             Created: NULL\n            sql_mode:\n             Definer: myname@localhost\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-triggers.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-triggers.html'),(18,'ISCLOSED',13,'IsClosed(ls)\n\nFor a LineString value ls, IsClosed() returns 1 if ls is closed (that\nis, its StartPoint() and EndPoint() values are the same).\n\nFor a MultiLineString value ls, IsClosed() returns 1 if ls is closed\n(that is, the StartPoint() and EndPoint() values are the same for each\nLineString in ls).\n\nIsClosed() returns 0 if ls is not closed, and NULL if ls is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-linestring-property-functions.html\n\n','mysql> SET @ls1 = \'LineString(1 1,2 2,3 3,2 2)\';\nmysql> SET @ls2 = \'LineString(1 1,2 2,3 3,1 1)\';\n\nmysql> SELECT IsClosed(GeomFromText(@ls1));\n+------------------------------+\n| IsClosed(GeomFromText(@ls1)) |\n+------------------------------+\n|                            0 |\n+------------------------------+\n\nmysql> SELECT IsClosed(GeomFromText(@ls2));\n+------------------------------+\n| IsClosed(GeomFromText(@ls2)) |\n+------------------------------+\n|                            1 |\n+------------------------------+\n\nmysql> SET @ls3 = \'MultiLineString((1 1,2 2,3 3),(4 4,5 5))\';\n\nmysql> SELECT IsClosed(GeomFromText(@ls3));\n+------------------------------+\n| IsClosed(GeomFromText(@ls3)) |\n+------------------------------+\n|                            0 |\n+------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-linestring-property-functions.html'),(19,'REGEXP',38,'Syntax:\nexpr REGEXP pat, expr RLIKE pat\n\nPerforms a pattern match of a string expression expr against a pattern\npat. The pattern can be an extended regular expression, the syntax for\nwhich is discussed later in this section. Returns 1 if expr matches\npat; otherwise it returns 0. If either expr or pat is NULL, the result\nis NULL. RLIKE is a synonym for REGEXP, provided for mSQL\ncompatibility.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\n*Note*:\n\nBecause MySQL uses the C escape syntax in strings (for example, \\n to\nrepresent the newline character), you must double any \\ that you use in\nyour REGEXP strings.\n\nREGEXP is not case sensitive, except when used with binary strings.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/regexp.html\n\n','mysql> SELECT \'Michael!\' REGEXP \'.*\';\n        -> 1\nmysql> SELECT \'new*\\n*line\' REGEXP \'new\\\\*.\\\\*line\';\n        -> 1\nmysql> SELECT \'a\' REGEXP \'A\', \'a\' REGEXP BINARY \'A\';\n        -> 1  0\nmysql> SELECT \'a\' REGEXP \'^[a-d]\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/regexp.html'),(20,'IF STATEMENT',24,'Syntax:\nIF search_condition THEN statement_list\n    [ELSEIF search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND IF\n\nThe IF statement for stored programs implements a basic conditional\nconstruct.\n\n*Note*:\n\nThere is also an IF() function, which differs from the IF statement\ndescribed here. See\nhttp://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html. The\nIF statement can have THEN, ELSE, and ELSEIF clauses, and it is\nterminated with END IF.\n\nIf the search_condition evaluates to true, the corresponding THEN or\nELSEIF clause statement_list executes. If no search_condition matches,\nthe ELSE clause statement_list executes.\n\nEach statement_list consists of one or more SQL statements; an empty\nstatement_list is not permitted.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/if.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/if.html'),(21,'WITHIN',7,'Within(g1, g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially within g2. This\ntests the opposite relationship as Contains().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html'),(22,'SHOW PLUGINS',27,'Syntax:\nSHOW PLUGINS\n\nSHOW PLUGINS displays information about server plugins. Plugin\ninformation is also available in the INFORMATION_SCHEMA.PLUGINS table.\nSee http://dev.mysql.com/doc/refman/5.5/en/plugins-table.html.\n\nExample of SHOW PLUGINS output:\n\nmysql> SHOW PLUGINS\\G\n*************************** 1. row ***************************\n   Name: binlog\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 2. row ***************************\n   Name: CSV\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 3. row ***************************\n   Name: MEMORY\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n*************************** 4. row ***************************\n   Name: MyISAM\n Status: ACTIVE\n   Type: STORAGE ENGINE\nLibrary: NULL\nLicense: GPL\n...\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-plugins.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-plugins.html'),(23,'PREPARE',8,'Syntax:\nPREPARE stmt_name FROM preparable_stmt\n\nThe PREPARE statement prepares a SQL statement and assigns it a name,\nstmt_name, by which to refer to the statement later. The prepared\nstatement is executed with EXECUTE and released with DEALLOCATE\nPREPARE. For examples, see\nhttp://dev.mysql.com/doc/refman/5.5/en/sql-syntax-prepared-statements.h\ntml.\n\nStatement names are not case sensitive. preparable_stmt is either a\nstring literal or a user variable that contains the text of the SQL\nstatement. The text must represent a single statement, not multiple\nstatements. Within the statement, ? characters can be used as parameter\nmarkers to indicate where data values are to be bound to the query\nlater when you execute it. The ? characters should not be enclosed\nwithin quotation marks, even if you intend to bind them to string\nvalues. Parameter markers can be used only where data values should\nappear, not for SQL keywords, identifiers, and so forth.\n\nIf a prepared statement with the given name already exists, it is\ndeallocated implicitly before the new statement is prepared. This means\nthat if the new statement contains an error and cannot be prepared, an\nerror is returned and no statement with the given name exists.\n\nThe scope of a prepared statement is the session within which it is\ncreated, which as several implications:\n\no A prepared statement created in one session is not available to other\n  sessions.\n\no When a session ends, whether normally or abnormally, its prepared\n  statements no longer exist. If auto-reconnect is enabled, the client\n  is not notified that the connection was lost. For this reason,\n  clients may wish to disable auto-reconnect. See\n  http://dev.mysql.com/doc/refman/5.5/en/c-api-auto-reconnect.html.\n\no A prepared statement created within a stored program continues to\n  exist after the program finishes executing and can be executed\n  outside the program later.\n\no A statement prepared in stored program context cannot refer to stored\n  procedure or function parameters or local variables because they go\n  out of scope when the program ends and would be unavailable were the\n  statement to be executed later outside the program. As a workaround,\n  refer instead to user-defined variables, which also have session\n  scope; see\n  http://dev.mysql.com/doc/refman/5.5/en/user-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/prepare.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/prepare.html'),(24,'LOCK',8,'Syntax:\nLOCK TABLES\n    tbl_name [[AS] alias] lock_type\n    [, tbl_name [[AS] alias] lock_type] ...\n\nlock_type:\n    READ [LOCAL]\n  | [LOW_PRIORITY] WRITE\n\nUNLOCK TABLES\n\nMySQL enables client sessions to acquire table locks explicitly for the\npurpose of cooperating with other sessions for access to tables, or to\nprevent other sessions from modifying tables during periods when a\nsession requires exclusive access to them. A session can acquire or\nrelease locks only for itself. One session cannot acquire locks for\nanother session or release locks held by another session.\n\nLocks may be used to emulate transactions or to get more speed when\nupdating tables. This is explained in more detail later in this\nsection.\n\nLOCK TABLES explicitly acquires table locks for the current client\nsession. Table locks can be acquired for base tables or views. You must\nhave the LOCK TABLES privilege, and the SELECT privilege for each\nobject to be locked.\n\nFor view locking, LOCK TABLES adds all base tables used in the view to\nthe set of tables to be locked and locks them automatically. If you\nlock a table explicitly with LOCK TABLES, any tables used in triggers\nare also locked implicitly, as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/lock-tables-and-triggers.html.\n\nUNLOCK TABLES explicitly releases any table locks held by the current\nsession. LOCK TABLES implicitly releases any table locks held by the\ncurrent session before acquiring new locks.\n\nAnother use for UNLOCK TABLES is to release the global read lock\nacquired with the FLUSH TABLES WITH READ LOCK statement, which enables\nyou to lock all tables in all databases. See [HELP FLUSH]. (This is a\nvery convenient way to get backups if you have a file system such as\nVeritas that can take snapshots in time.)\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/lock-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/lock-tables.html'),(25,'SHOW BINARY LOGS',27,'Syntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [HELP PURGE BINARY LOGS], that shows\nhow to determine which logs can be purged.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-binary-logs.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-binary-logs.html'),(26,'POLYGON',25,'Polygon(ls1, ls2, ...)\n\nConstructs a Polygon value from a number of LineString or WKB\nLineString arguments. If any argument does not represent a LinearRing\n(that is, not a closed and simple LineString), the return value is\nNULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html'),(27,'MINUTE',32,'Syntax:\nMINUTE(time)\n\nReturns the minute for time, in the range 0 to 59.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT MINUTE(\'2008-02-03 10:05:03\');\n        -> 5\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(28,'MID',38,'Syntax:\nMID(str,pos,len)\n\nMID(str,pos,len) is a synonym for SUBSTRING(str,pos,len).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(29,'CONNECTION_ID',17,'Syntax:\nCONNECTION_ID()\n\nReturns the connection ID (thread ID) for the connection. Every\nconnection has an ID that is unique among the set of currently\nconnected clients.\n\nThe value returned by CONNECTION_ID() is the same type of value as\ndisplayed in the ID column of the INFORMATION_SCHEMA.PROCESSLIST table,\nthe Id column of SHOW PROCESSLIST output, and the PROCESSLIST_ID column\nof the Performance Schema threads table.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT CONNECTION_ID();\n        -> 23786\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(30,'DELETE',28,'Syntax:\nDELETE is a DML statement that removes rows from a table.\n\nSingle-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nMultiple-table syntax:\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    tbl_name[.*] [, tbl_name[.*]] ...\n    FROM table_references\n    [WHERE where_condition]\n\nDELETE [LOW_PRIORITY] [QUICK] [IGNORE]\n    FROM tbl_name[.*] [, tbl_name[.*]] ...\n    USING table_references\n    [WHERE where_condition]\n\nFor the single-table syntax, the DELETE statement deletes rows from\ntbl_name and returns a count of the number of deleted rows. This count\ncan be obtained by calling the ROW_COUNT() function (see\nhttp://dev.mysql.com/doc/refman/5.5/en/information-functions.html). The\nWHERE clause, if given, specifies the conditions that identify which\nrows to delete. With no WHERE clause, all rows are deleted. If the\nORDER BY clause is specified, the rows are deleted in the order that is\nspecified. The LIMIT clause places a limit on the number of rows that\ncan be deleted.\n\nFor the multiple-table syntax, DELETE deletes from each tbl_name the\nrows that satisfy the conditions. In this case, ORDER BY and LIMIT\ncannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe deleted. It is specified as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/select.html.\n\nYou cannot delete from a table and select from the same table in a\nsubquery.\n\nYou need the DELETE privilege on a table to delete rows from it. You\nneed only the SELECT privilege for any columns that are only read, such\nas those named in the WHERE clause.\n\nAs stated, a DELETE statement with no WHERE clause deletes all rows. A\nfaster way to do this, when you do not need to know the number of\ndeleted rows, is to use TRUNCATE TABLE. However, within a transaction\nor if you have a lock on the table, TRUNCATE TABLE cannot be used\nwhereas DELETE can. See [HELP TRUNCATE TABLE], and [HELP LOCK].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/delete.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/delete.html'),(31,'CLOSE',24,'Syntax:\nCLOSE cursor_name\n\nThis statement closes a previously opened cursor. For an example, see\nhttp://dev.mysql.com/doc/refman/5.5/en/cursors.html.\n\nAn error occurs if the cursor is not open.\n\nIf not closed explicitly, a cursor is closed at the end of the BEGIN\n... END block in which it was declared.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/close.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/close.html'),(32,'REPLACE FUNCTION',38,'Syntax:\nREPLACE(str,from_str,to_str)\n\nReturns the string str with all occurrences of the string from_str\nreplaced by the string to_str. REPLACE() performs a case-sensitive\nmatch when searching for from_str.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT REPLACE(\'www.mysql.com\', \'w\', \'Ww\');\n        -> \'WwWwWw.mysql.com\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(33,'USE',29,'Syntax:\nUSE db_name\n\nThe USE db_name statement tells MySQL to use the db_name database as\nthe default (current) database for subsequent statements. The database\nremains the default until the end of the session or another USE\nstatement is issued:\n\nUSE db1;\nSELECT COUNT(*) FROM mytable;   # selects from db1.mytable\nUSE db2;\nSELECT COUNT(*) FROM mytable;   # selects from db2.mytable\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/use.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/use.html'),(34,'CASE OPERATOR',6,'Syntax:\nCASE value WHEN [compare_value] THEN result [WHEN [compare_value] THEN\nresult ...] [ELSE result] END\n\nCASE WHEN [condition] THEN result [WHEN [condition] THEN result ...]\n[ELSE result] END\n\nThe first CASE syntax returns the result for the first\nvalue=compare_value comparison that is true. The second syntax returns\nthe result for the first condition that is true. If no comparison or\ncondition is true, the result after ELSE is returned, or NULL if there\nis no ELSE part.\n\n*Note*:\n\nThe syntax of the CASE expression described here differs slightly from\nthat of the SQL CASE statement described in [HELP CASE statement], for\nuse inside stored programs. The CASE statement cannot have an ELSE NULL\nclause, and it is terminated with END CASE instead of END.\n\nThe return type of a CASE expression result is the aggregated type of\nall result values.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html\n\n','mysql> SELECT CASE 1 WHEN 1 THEN \'one\'\n    ->     WHEN 2 THEN \'two\' ELSE \'more\' END;\n        -> \'one\'\nmysql> SELECT CASE WHEN 1>0 THEN \'true\' ELSE \'false\' END;\n        -> \'true\'\nmysql> SELECT CASE BINARY \'B\'\n    ->     WHEN \'a\' THEN 1 WHEN \'b\' THEN 2 END;\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html'),(35,'SHOW MASTER STATUS',27,'Syntax:\nSHOW MASTER STATUS\n\nThis statement provides status information about the binary log files\nof the master. It requires either the SUPER or REPLICATION CLIENT\nprivilege.\n\nExample:\n\nmysql> SHOW MASTER STATUS;\n+---------------+----------+--------------+------------------+\n| File          | Position | Binlog_Do_DB | Binlog_Ignore_DB |\n+---------------+----------+--------------+------------------+\n| mysql-bin.003 | 73       | test         | manual,mysql     |\n+---------------+----------+--------------+------------------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-master-status.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-master-status.html'),(36,'TO_SECONDS',32,'Syntax:\nTO_SECONDS(expr)\n\nGiven a date or datetime expr, returns a the number of seconds since\nthe year 0. If expr is not a valid date or datetime value, returns\nNULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TO_SECONDS(950501);\n        -> 62966505600\nmysql> SELECT TO_SECONDS(\'2009-11-29\');\n        -> 63426672000\nmysql> SELECT TO_SECONDS(\'2009-11-29 13:43:32\');\n        -> 63426721412\nmysql> SELECT TO_SECONDS( NOW() );\n        -> 63426721458\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(37,'TIMESTAMPDIFF',32,'Syntax:\nTIMESTAMPDIFF(unit,datetime_expr1,datetime_expr2)\n\nReturns datetime_expr2 − datetime_expr1, where datetime_expr1 and\ndatetime_expr2 are date or datetime expressions. One expression may be\na date and the other a datetime; a date value is treated as a datetime\nhaving the time part \'00:00:00\' where necessary. The unit for the\nresult (an integer) is given by the unit argument. The legal values for\nunit are the same as those listed in the description of the\nTIMESTAMPADD() function.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMPDIFF(MONTH,\'2003-02-01\',\'2003-05-01\');\n        -> 3\nmysql> SELECT TIMESTAMPDIFF(YEAR,\'2002-05-01\',\'2001-01-01\');\n        -> -1\nmysql> SELECT TIMESTAMPDIFF(MINUTE,\'2003-02-01\',\'2003-05-01 12:05:55\');\n        -> 128885\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(38,'SPATIAL',35,'For MyISAM tables, MySQL can create spatial indexes using syntax\nsimilar to that for creating regular indexes, but using the SPATIAL\nkeyword. Columns in spatial indexes must be declared NOT NULL. The\nfollowing examples demonstrate how to create spatial indexes:\n\no With CREATE TABLE:\n\nCREATE TABLE geom (g GEOMETRY NOT NULL, SPATIAL INDEX(g)) ENGINE=MyISAM;\n\no With ALTER TABLE:\n\nCREATE TABLE geom (g GEOMETRY NOT NULL) ENGINE=MyISAM;\nALTER TABLE geom ADD SPATIAL INDEX(g);\n\no With CREATE INDEX:\n\nCREATE TABLE geom (g GEOMETRY NOT NULL) ENGINE=MyISAM;\nCREATE SPATIAL INDEX g ON geom (g);\n\nSPATIAL INDEX creates an R-tree index. For storage engines that support\nnonspatial indexing of spatial columns, the engine creates a B-tree\nindex. A B-tree index on spatial values is useful for exact-value\nlookups, but not for range scans.\n\nFor more information on indexing spatial columns, see [HELP CREATE\nINDEX].\n\nTo drop spatial indexes, use ALTER TABLE or DROP INDEX:\n\no With ALTER TABLE:\n\nALTER TABLE geom DROP INDEX g;\n\no With DROP INDEX:\n\nDROP INDEX g ON geom;\n\nExample: Suppose that a table geom contains more than 32,000\ngeometries, which are stored in the column g of type GEOMETRY. The\ntable also has an AUTO_INCREMENT column fid for storing object ID\nvalues.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-indexes.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-indexes.html'),(39,'REVERSE',38,'Syntax:\nREVERSE(str)\n\nReturns the string str with the order of the characters reversed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT REVERSE(\'abc\');\n        -> \'cba\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(40,'ISNULL',20,'Syntax:\nISNULL(expr)\n\nIf expr is NULL, ISNULL() returns 1, otherwise it returns 0.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT ISNULL(1+1);\n        -> 0\nmysql> SELECT ISNULL(1/0);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(41,'BINARY',23,'BINARY(M)\n\nThe BINARY type is similar to the CHAR type, but stores binary byte\nstrings rather than nonbinary character strings. M represents the\ncolumn length in bytes.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(42,'BLOB DATA TYPE',23,'A BLOB is a binary large object that can hold a variable amount of\ndata. The four BLOB types are TINYBLOB, BLOB, MEDIUMBLOB, and LONGBLOB.\nThese differ only in the maximum length of the values they can hold.\nThe four TEXT types are TINYTEXT, TEXT, MEDIUMTEXT, and LONGTEXT. These\ncorrespond to the four BLOB types and have the same maximum lengths and\nstorage requirements. See\nhttp://dev.mysql.com/doc/refman/5.5/en/storage-requirements.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/blob.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/blob.html'),(43,'CURRENT_USER',17,'Syntax:\nCURRENT_USER, CURRENT_USER()\n\nReturns the user name and host name combination for the MySQL account\nthat the server used to authenticate the current client. This account\ndetermines your access privileges. The return value is a string in the\nutf8 character set.\n\nThe value of CURRENT_USER() can differ from the value of USER().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT USER();\n        -> \'davida@localhost\'\nmysql> SELECT * FROM mysql.user;\nERROR 1044: Access denied for user \'\'@\'localhost\' to\ndatabase \'mysql\'\nmysql> SELECT CURRENT_USER();\n        -> \'@localhost\'\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(44,'<=',20,'Syntax:\n<=\n\nLess than or equal:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 0.1 <= 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(45,'SHOW PROFILES',27,'Syntax:\nSHOW PROFILES\n\nThe SHOW PROFILES statement, together with SHOW PROFILE, displays\nprofiling information that indicates resource usage for statements\nexecuted during the course of the current session. For more\ninformation, see [HELP SHOW PROFILE].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-profiles.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-profiles.html'),(46,'UPDATE',28,'Syntax:\nUPDATE is a DML statement that modifies rows in a table.\n\nSingle-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] table_reference\n    SET assignment_list\n    [WHERE where_condition]\n    [ORDER BY ...]\n    [LIMIT row_count]\n\nvalue:\n    {expr | DEFAULT}\n\nassignment:\n    col_name = value\n\nassignment_list:\n    assignment [, assignment] ...\n\nMultiple-table syntax:\n\nUPDATE [LOW_PRIORITY] [IGNORE] table_references\n    SET assignment_list\n    [WHERE where_condition]\n\nFor the single-table syntax, the UPDATE statement updates columns of\nexisting rows in the named table with new values. The SET clause\nindicates which columns to modify and the values they should be given.\nEach value can be given as an expression, or the keyword DEFAULT to set\na column explicitly to its default value. The WHERE clause, if given,\nspecifies the conditions that identify which rows to update. With no\nWHERE clause, all rows are updated. If the ORDER BY clause is\nspecified, the rows are updated in the order that is specified. The\nLIMIT clause places a limit on the number of rows that can be updated.\n\nFor the multiple-table syntax, UPDATE updates rows in each table named\nin table_references that satisfy the conditions. Each matching row is\nupdated once, even if it matches the conditions multiple times. For\nmultiple-table syntax, ORDER BY and LIMIT cannot be used.\n\nwhere_condition is an expression that evaluates to true for each row to\nbe updated. For expression syntax, see\nhttp://dev.mysql.com/doc/refman/5.5/en/expressions.html.\n\ntable_references and where_condition are specified as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/select.html.\n\nYou need the UPDATE privilege only for columns referenced in an UPDATE\nthat are actually updated. You need only the SELECT privilege for any\ncolumns that are read but not modified.\n\nThe UPDATE statement supports the following modifiers:\n\no With the LOW_PRIORITY modifier, execution of the UPDATE is delayed\n  until no other clients are reading from the table. This affects only\n  storage engines that use only table-level locking (such as MyISAM,\n  MEMORY, and MERGE).\n\no With the IGNORE modifier, the update statement does not abort even if\n  errors occur during the update. Rows for which duplicate-key\n  conflicts occur on a unique key value are not updated. Rows updated\n  to values that would cause data conversion errors are updated to the\n  closest valid values instead.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/update.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/update.html'),(47,'CASE STATEMENT',24,'Syntax:\nCASE case_value\n    WHEN when_value THEN statement_list\n    [WHEN when_value THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nOr:\n\nCASE\n    WHEN search_condition THEN statement_list\n    [WHEN search_condition THEN statement_list] ...\n    [ELSE statement_list]\nEND CASE\n\nThe CASE statement for stored programs implements a complex conditional\nconstruct.\n\n*Note*:\n\nThere is also a CASE expression, which differs from the CASE statement\ndescribed here. See\nhttp://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html. The\nCASE statement cannot have an ELSE NULL clause, and it is terminated\nwith END CASE instead of END.\n\nFor the first syntax, case_value is an expression. This value is\ncompared to the when_value expression in each WHEN clause until one of\nthem is equal. When an equal when_value is found, the corresponding\nTHEN clause statement_list executes. If no when_value is equal, the\nELSE clause statement_list executes, if there is one.\n\nThis syntax cannot be used to test for equality with NULL because NULL\n= NULL is false. See\nhttp://dev.mysql.com/doc/refman/5.5/en/working-with-null.html.\n\nFor the second syntax, each WHEN clause search_condition expression is\nevaluated until one is true, at which point its corresponding THEN\nclause statement_list executes. If no search_condition is equal, the\nELSE clause statement_list executes, if there is one.\n\nIf no when_value or search_condition matches the value tested and the\nCASE statement contains no ELSE clause, a Case not found for CASE\nstatement error results.\n\nEach statement_list consists of one or more SQL statements; an empty\nstatement_list is not permitted.\n\nTo handle situations where no value is matched by any WHEN clause, use\nan ELSE containing an empty BEGIN ... END block, as shown in this\nexample. (The indentation used here in the ELSE clause is for purposes\nof clarity only, and is not otherwise significant.)\n\nDELIMITER |\n\nCREATE PROCEDURE p()\n  BEGIN\n    DECLARE v INT DEFAULT 1;\n\n    CASE v\n      WHEN 2 THEN SELECT v;\n      WHEN 3 THEN SELECT 0;\n      ELSE\n        BEGIN\n        END;\n    END CASE;\n  END;\n  |\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/case.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/case.html'),(48,'EXECUTE STATEMENT',8,'Syntax:\nEXECUTE stmt_name\n    [USING @var_name [, @var_name] ...]\n\nAfter preparing a statement with PREPARE, you execute it with an\nEXECUTE statement that refers to the prepared statement name. If the\nprepared statement contains any parameter markers, you must supply a\nUSING clause that lists user variables containing the values to be\nbound to the parameters. Parameter values can be supplied only by user\nvariables, and the USING clause must name exactly as many variables as\nthe number of parameter markers in the statement.\n\nYou can execute a given prepared statement multiple times, passing\ndifferent variables to it or setting the variables to different values\nbefore each execution.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/execute.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/execute.html'),(49,'DROP INDEX',40,'Syntax:\nDROP [ONLINE|OFFLINE] INDEX index_name ON tbl_name\n\nDROP INDEX drops the index named index_name from the table tbl_name.\nThis statement is mapped to an ALTER TABLE statement to drop the index.\nSee [HELP ALTER TABLE].\n\nTo drop a primary key, the index name is always PRIMARY, which must be\nspecified as a quoted identifier because PRIMARY is a reserved word:\n\nDROP INDEX `PRIMARY` ON t;\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-index.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-index.html'),(50,'ABS',3,'Syntax:\nABS(X)\n\nReturns the absolute value of X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT ABS(2);\n        -> 2\nmysql> SELECT ABS(-32);\n        -> 32\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(51,'POLYFROMWKB',33,'PolyFromWKB(wkb[, srid]), PolygonFromWKB(wkb[, srid])\n\nConstructs a Polygon value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html'),(52,'NOT LIKE',38,'Syntax:\nexpr NOT LIKE pat [ESCAPE \'escape_char\']\n\nThis is the same as NOT (expr LIKE pat [ESCAPE \'escape_char\']).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-comparison-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-comparison-functions.html'),(53,'SPACE',38,'Syntax:\nSPACE(N)\n\nReturns a string consisting of N space characters.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT SPACE(6);\n        -> \'      \'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(54,'MAX',16,'Syntax:\nMAX([DISTINCT] expr)\n\nReturns the maximum value of expr. MAX() may take a string argument; in\nsuch cases, it returns the maximum string value. See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-indexes.html. The DISTINCT\nkeyword can be used to find the maximum of the distinct values of expr,\nhowever, this produces the same result as omitting DISTINCT.\n\nIf there are no matching rows, MAX() returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','mysql> SELECT student_name, MIN(test_score), MAX(test_score)\n       FROM student\n       GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(55,'CREATE FUNCTION UDF',22,'Syntax:\nCREATE [AGGREGATE] FUNCTION function_name\n    RETURNS {STRING|INTEGER|REAL|DECIMAL}\n    SONAME shared_library_name\n\nA user-defined function (UDF) is a way to extend MySQL with a new\nfunction that works like a native (built-in) MySQL function such as\nABS() or CONCAT().\n\nfunction_name is the name that should be used in SQL statements to\ninvoke the function. The RETURNS clause indicates the type of the\nfunction\'s return value. DECIMAL is a legal value after RETURNS, but\ncurrently DECIMAL functions return string values and should be written\nlike STRING functions.\n\nshared_library_name is the base name of the shared library file that\ncontains the code that implements the function. The file must be\nlocated in the plugin directory. This directory is given by the value\nof the plugin_dir system variable. For more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/udf-compiling.html.\n\nTo create a function, you must have the INSERT privilege for the mysql\ndatabase. This is necessary because CREATE FUNCTION adds a row to the\nmysql.func system table that records the function\'s name, type, and\nshared library name. If you do not have this table, you should run the\nmysql_upgrade command to create it. See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-upgrade.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-function-udf.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-function-udf.html'),(56,'TIMESTAMP',23,'TIMESTAMP\n\nA timestamp. The range is \'1970-01-01 00:00:01\' UTC to \'2038-01-19\n03:14:07\' UTC. TIMESTAMP values are stored as the number of seconds\nsince the epoch (\'1970-01-01 00:00:00\' UTC). A TIMESTAMP cannot\nrepresent the value \'1970-01-01 00:00:00\' because that is equivalent to\n0 seconds from the epoch and the value 0 is reserved for representing\n\'0000-00-00 00:00:00\', the \"zero\" TIMESTAMP value.\n\nUnless specified otherwise, the first TIMESTAMP column in a table is\ndefined to be automatically set to the date and time of the most recent\nmodification if not explicitly assigned a value. This makes TIMESTAMP\nuseful for recording the timestamp of an INSERT or UPDATE operation.\nYou can also set any TIMESTAMP column to the current date and time by\nassigning it a NULL value, unless it has been defined with the NULL\nattribute to permit NULL values. The automatic initialization and\nupdating to the current date and time can be specified using DEFAULT\nCURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP clauses, as described\nin\nhttp://dev.mysql.com/doc/refman/5.5/en/timestamp-initialization.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html'),(57,'CACHE INDEX',27,'Syntax:\nCACHE INDEX\n  tbl_index_list [, tbl_index_list] ...\n  [PARTITION (partition_list | ALL)]\n  IN key_cache_name\n\ntbl_index_list:\n  tbl_name [[INDEX|KEY] (index_name[, index_name] ...)]\n\npartition_list:\n  partition_name[, partition_name][, ...]\n\nThe CACHE INDEX statement assigns table indexes to a specific key\ncache. It is used only for MyISAM tables. After the indexes have been\nassigned, they can be preloaded into the cache if desired with LOAD\nINDEX INTO CACHE.\n\nThe following statement assigns indexes from the tables t1, t2, and t3\nto the key cache named hot_cache:\n\nmysql> CACHE INDEX t1, t2, t3 IN hot_cache;\n+---------+--------------------+----------+----------+\n| Table   | Op                 | Msg_type | Msg_text |\n+---------+--------------------+----------+----------+\n| test.t1 | assign_to_keycache | status   | OK       |\n| test.t2 | assign_to_keycache | status   | OK       |\n| test.t3 | assign_to_keycache | status   | OK       |\n+---------+--------------------+----------+----------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/cache-index.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/cache-index.html'),(58,'COMPRESS',12,'Syntax:\nCOMPRESS(string_to_compress)\n\nCompresses a string and returns the result as a binary string. This\nfunction requires MySQL to have been compiled with a compression\nlibrary such as zlib. Otherwise, the return value is always NULL. The\ncompressed string can be uncompressed with UNCOMPRESS().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT LENGTH(COMPRESS(REPEAT(\'a\',1000)));\n        -> 21\nmysql> SELECT LENGTH(COMPRESS(\'\'));\n        -> 0\nmysql> SELECT LENGTH(COMPRESS(\'a\'));\n        -> 13\nmysql> SELECT LENGTH(COMPRESS(REPEAT(\'a\',16)));\n        -> 15\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(59,'HANDLER',28,'Syntax:\nHANDLER tbl_name OPEN [ [AS] alias]\n\nHANDLER tbl_name READ index_name { = | <= | >= | < | > } (value1,value2,...)\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ index_name { FIRST | NEXT | PREV | LAST }\n    [ WHERE where_condition ] [LIMIT ... ]\nHANDLER tbl_name READ { FIRST | NEXT }\n    [ WHERE where_condition ] [LIMIT ... ]\n\nHANDLER tbl_name CLOSE\n\nThe HANDLER statement provides direct access to table storage engine\ninterfaces. It is available for InnoDB and MyISAM tables.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/handler.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/handler.html'),(60,'HELP_DATE',9,'This help information was generated from the MySQL 5.5 Reference Manual\non: 2017-09-13\n','',''),(61,'RENAME TABLE',40,'Syntax:\nRENAME TABLE\n    tbl_name TO new_tbl_name\n    [, tbl_name2 TO new_tbl_name2] ...\n\nRENAME TABLE renames one or more tables. You must have ALTER and DROP\nprivileges for the original table, and CREATE and INSERT privileges for\nthe new table.\n\nFor example, to rename a table named old_table to to new_table, use\nthis statement:\n\nRENAME TABLE old_table TO new_table;\n\nThat statement is equivalent to the following ALTER TABLE statement:\n\nALTER TABLE old_table RENAME new_table;\n\nRENAME TABLE, unlike ALTER TABLE, can rename multiple tables within a\nsingle statement:\n\nRENAME TABLE old_table1 TO new_table1,\n             old_table2 TO new_table2,\n             old_table3 TO new_table3;\n\nRenaming operations are performed left to right. Thus, to swap two\ntable names, do this (assuming that a table with the intermediary name\ntmp_table does not already exist):\n\nRENAME TABLE old_table TO tmp_table,\n             new_table TO old_table,\n             tmp_table TO new_table;\n\nWhen you execute RENAME TABLE, you cannot have any locked tables or\nactive transactions. With that condition satisfied, the rename\noperation is done atomically; no other session can access any of the\ntables while the rename is in progress.\n\nIf any errors occur during a RENAME TABLE, the statement fails and no\nchanges are made.\n\nYou can use RENAME TABLE to move a table from one database to another:\n\nRENAME TABLE current_db.tbl_name TO other_db.tbl_name;\n\nUsing this method to move all tables from one database to a different\none in effect renames the database (an operation for which MySQL has no\nsingle statement), except that the original database continues to\nexist, albeit with no tables.\n\nLike RENAME TABLE, ALTER TABLE ... RENAME can also be used to move a\ntable to a different database. Regardless of the statement used, if the\nrename operation would move the table to a database located on a\ndifferent file system, the success of the outcome is platform specific\nand depends on the underlying operating system calls used to move the\ntable files.\n\nIf a table has triggers, attempts to rename the table into a different\ndatabase fail with a Trigger in wrong schema error.\n\nRENAME TABLE does not work for TEMPORARY tables. However, you can use\nALTER TABLE to rename TEMPORARY tables.\n\nRENAME TABLE works for views, except that views cannot be renamed into\na different database.\n\nAny privileges granted specifically for a renamed table or view are not\nmigrated to the new name. They must be changed manually.\n\nRENAME TABLE changes internally generated foreign key constraint names\nand user-defined foreign key constraint names that contain the string\n\"tbl_name_ibfk_\" to reflect the new table name. InnoDB interprets\nforeign key constraint names that contain the string \"tbl_name_ibfk_\"\nas internally generated names.\n\nForeign key constraint names that point to the renamed table are\nautomatically updated unless there is a conflict, in which case, the\nstatement fails with an error. A conflict occurs if the renamed\nconstraint name already exists. In such cases, you must drop and\nre-create the foreign keys in order for them to function properly.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/rename-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/rename-table.html'),(62,'BOOLEAN',23,'BOOL, BOOLEAN\n\nThese types are synonyms for TINYINT(1). A value of zero is considered\nfalse. Nonzero values are considered true:\n\nmysql> SELECT IF(0, \'true\', \'false\');\n+------------------------+\n| IF(0, \'true\', \'false\') |\n+------------------------+\n| false                  |\n+------------------------+\n\nmysql> SELECT IF(1, \'true\', \'false\');\n+------------------------+\n| IF(1, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nmysql> SELECT IF(2, \'true\', \'false\');\n+------------------------+\n| IF(2, \'true\', \'false\') |\n+------------------------+\n| true                   |\n+------------------------+\n\nHowever, the values TRUE and FALSE are merely aliases for 1 and 0,\nrespectively, as shown here:\n\nmysql> SELECT IF(0 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(0 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| true                           |\n+--------------------------------+\n\nmysql> SELECT IF(1 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(1 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| true                          |\n+-------------------------------+\n\nmysql> SELECT IF(2 = TRUE, \'true\', \'false\');\n+-------------------------------+\n| IF(2 = TRUE, \'true\', \'false\') |\n+-------------------------------+\n| false                         |\n+-------------------------------+\n\nmysql> SELECT IF(2 = FALSE, \'true\', \'false\');\n+--------------------------------+\n| IF(2 = FALSE, \'true\', \'false\') |\n+--------------------------------+\n| false                          |\n+--------------------------------+\n\nThe last two statements display the results shown because 2 is equal to\nneither 1 nor 0.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(63,'MOD',3,'Syntax:\nMOD(N,M), N % M, N MOD M\n\nModulo operation. Returns the remainder of N divided by M.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT MOD(234, 10);\n        -> 4\nmysql> SELECT 253 % 7;\n        -> 1\nmysql> SELECT MOD(29,9);\n        -> 2\nmysql> SELECT 29 MOD 9;\n        -> 2\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(64,'HELP STATEMENT',29,'Syntax:\nHELP \'search_string\'\n\nThe HELP statement returns online information from the MySQL Reference\nmanual. Its proper operation requires that the help tables in the mysql\ndatabase be initialized with help topic information (see\nhttp://dev.mysql.com/doc/refman/5.5/en/server-side-help-support.html).\n\nThe HELP statement searches the help tables for the given search string\nand displays the result of the search. The search string is not case\nsensitive.\n\nThe search string can contain the wildcard characters % and _. These\nhave the same meaning as for pattern-matching operations performed with\nthe LIKE operator. For example, HELP \'rep%\' returns a list of topics\nthat begin with rep.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/help.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/help.html'),(65,'UCASE',38,'Syntax:\nUCASE(str)\n\nUCASE() is a synonym for UPPER().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(66,'SHOW BINLOG EVENTS',27,'Syntax:\nSHOW BINLOG EVENTS\n   [IN \'log_name\']\n   [FROM pos]\n   [LIMIT [offset,] row_count]\n\nShows the events in the binary log. If you do not specify \'log_name\',\nthe first binary log is displayed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-binlog-events.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-binlog-events.html'),(67,'MPOLYFROMWKB',33,'MPolyFromWKB(wkb[, srid]), MultiPolygonFromWKB(wkb[, srid])\n\nConstructs a MultiPolygon value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html'),(68,'ITERATE',24,'Syntax:\nITERATE label\n\nITERATE can appear only within LOOP, REPEAT, and WHILE statements.\nITERATE means \"start the loop again.\"\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/iterate.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/iterate.html'),(69,'DO',28,'Syntax:\nDO expr [, expr] ...\n\nDO executes the expressions but does not return any results. In most\nrespects, DO is shorthand for SELECT expr, ..., but has the advantage\nthat it is slightly faster when you do not care about the result.\n\nDO is useful primarily with functions that have side effects, such as\nRELEASE_LOCK().\n\nExample: This SELECT statement pauses, but also produces a result set:\n\nmysql> SELECT SLEEP(5);\n+----------+\n| SLEEP(5) |\n+----------+\n|        0 |\n+----------+\n1 row in set (5.02 sec)\n\nDO, on the other hand, pauses without producing a result set.:\n\nmysql> DO SLEEP(5);\nQuery OK, 0 rows affected (4.99 sec)\n\nThis could be useful, for example in a stored function or trigger,\nwhich prohibit statements that produce result sets.\n\nDO only executes expressions. It cannot be used in all cases where\nSELECT can be used. For example, DO id FROM t1 is invalid because it\nreferences a table.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/do.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/do.html'),(70,'CHAR_LENGTH',38,'Syntax:\nCHAR_LENGTH(str)\n\nReturns the length of the string str, measured in characters. A\nmultibyte character counts as a single character. This means that for a\nstring containing five 2-byte characters, LENGTH() returns 10, whereas\nCHAR_LENGTH() returns 5.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(71,'DATE',23,'DATE\n\nA date. The supported range is \'1000-01-01\' to \'9999-12-31\'. MySQL\ndisplays DATE values in \'YYYY-MM-DD\' format, but permits assignment of\nvalues to DATE columns using either strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html'),(72,'EXTRACTVALUE',38,'Syntax:\nExtractValue(xml_frag, xpath_expr)\n\nExtractValue() takes two string arguments, a fragment of XML markup\nxml_frag and an XPath expression xpath_expr (also known as a locator);\nit returns the text (CDATA) of the first text node which is a child of\nthe element or elements matched by the XPath expression. In MySQL 5.5,\nthe XPath expression can contain at most 127 characters. (This\nlimitation is lifted in MySQL 5.6.)\n\nUsing this function is the equivalent of performing a match using the\nxpath_expr after appending /text(). In other words,\nExtractValue(\'<a><b>Sakila</b></a>\', \'/a/b\') and\nExtractValue(\'<a><b>Sakila</b></a>\', \'/a/b/text()\') produce the same\nresult.\n\nIf multiple matches are found, the content of the first child text node\nof each matching element is returned (in the order matched) as a\nsingle, space-delimited string.\n\nIf no matching text node is found for the expression (including the\nimplicit /text())---for whatever reason, as long as xpath_expr is\nvalid, and xml_frag consists of elements which are properly nested and\nclosed---an empty string is returned. No distinction is made between a\nmatch on an empty element and no match at all. This is by design.\n\nIf you need to determine whether no matching element was found in\nxml_frag or such an element was found but contained no child text\nnodes, you should test the result of an expression that uses the XPath\ncount() function. For example, both of these statements return an empty\nstring, as shown here:\n\nmysql> SELECT ExtractValue(\'<a><b/></a>\', \'/a/b\');\n+-------------------------------------+\n| ExtractValue(\'<a><b/></a>\', \'/a/b\') |\n+-------------------------------------+\n|                                     |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nmysql> SELECT ExtractValue(\'<a><c/></a>\', \'/a/b\');\n+-------------------------------------+\n| ExtractValue(\'<a><c/></a>\', \'/a/b\') |\n+-------------------------------------+\n|                                     |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nHowever, you can determine whether there was actually a matching\nelement using the following:\n\nmysql> SELECT ExtractValue(\'<a><b/></a>\', \'count(/a/b)\');\n+-------------------------------------+\n| ExtractValue(\'<a><b/></a>\', \'count(/a/b)\') |\n+-------------------------------------+\n| 1                                   |\n+-------------------------------------+\n1 row in set (0.00 sec)\n\nmysql> SELECT ExtractValue(\'<a><c/></a>\', \'count(/a/b)\');\n+-------------------------------------+\n| ExtractValue(\'<a><c/></a>\', \'count(/a/b)\') |\n+-------------------------------------+\n| 0                                   |\n+-------------------------------------+\n1 row in set (0.01 sec)\n\n*Important*:\n\nExtractValue() returns only CDATA, and does not return any tags that\nmight be contained within a matching tag, nor any of their content (see\nthe result returned as val1 in the following example).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/xml-functions.html\n\n','mysql> SELECT\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/a\') AS val1,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/a/b\') AS val2,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'//b\') AS val3,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b></a>\', \'/b\') AS val4,\n    ->   ExtractValue(\'<a>ccc<b>ddd</b><b>eee</b></a>\', \'//b\') AS val5;\n\n+------+------+------+------+---------+\n| val1 | val2 | val3 | val4 | val5    |\n+------+------+------+------+---------+\n| ccc  | ddd  | ddd  |      | ddd eee |\n+------+------+------+------+---------+\n','http://dev.mysql.com/doc/refman/5.5/en/xml-functions.html'),(73,'OLD_PASSWORD',12,'Syntax:\nOLD_PASSWORD(str)\n\nOLD_PASSWORD() was added when the implementation of PASSWORD() was\nchanged in MySQL 4.1 to improve security. OLD_PASSWORD() returns the\nvalue of the pre-4.1 implementation of PASSWORD() as a string, and is\nintended to permit you to reset passwords for any pre-4.1 clients that\nneed to connect to your MySQL server without locking them out. See\nhttp://dev.mysql.com/doc/refman/5.5/en/password-hashing.html.\n\nAs of MySQL 5.5.3, the return value is a nonbinary string in the\nconnection character set. Before 5.5.3, the return value is a binary\nstring.\n\n*Note*:\n\nPasswords that use the pre-4.1 hashing method are less secure than\npasswords that use the native password hashing method and should be\navoided.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(74,'FORMAT',38,'Syntax:\nFORMAT(X,D[,locale])\n\nFormats the number X to a format like \'#,###,###.##\', rounded to D\ndecimal places, and returns the result as a string. If D is 0, the\nresult has no decimal point or fractional part.\n\nThe optional third parameter enables a locale to be specified to be\nused for the result number\'s decimal point, thousands separator, and\ngrouping between separators. Permissible locale values are the same as\nthe legal values for the lc_time_names system variable (see\nhttp://dev.mysql.com/doc/refman/5.5/en/locale-support.html). If no\nlocale is specified, the default is \'en_US\'.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT FORMAT(12332.123456, 4);\n        -> \'12,332.1235\'\nmysql> SELECT FORMAT(12332.1,4);\n        -> \'12,332.1000\'\nmysql> SELECT FORMAT(12332.2,0);\n        -> \'12,332\'\nmysql> SELECT FORMAT(12332.2,2,\'de_DE\');\n        -> \'12.332,20\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(75,'BIT_LENGTH',38,'Syntax:\nBIT_LENGTH(str)\n\nReturns the length of the string str in bits.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT BIT_LENGTH(\'text\');\n        -> 32\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(76,'EXTERIORRING',2,'ExteriorRing(poly)\n\nReturns the exterior ring of the Polygon value poly as a LineString.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-polygon-property-functions.html\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT AsText(ExteriorRing(GeomFromText(@poly)));\n+-------------------------------------------+\n| AsText(ExteriorRing(GeomFromText(@poly))) |\n+-------------------------------------------+\n| LINESTRING(0 0,0 3,3 3,3 0,0 0)           |\n+-------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-polygon-property-functions.html'),(77,'GEOMFROMWKB',33,'GeomFromWKB(wkb[, srid]), GeometryFromWKB(wkb[, srid])\n\nConstructs a geometry value of any type using its WKB representation\nand SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html'),(78,'BETWEEN AND',20,'Syntax:\nexpr BETWEEN min AND max\n\nIf expr is greater than or equal to min and expr is less than or equal\nto max, BETWEEN returns 1, otherwise it returns 0. This is equivalent\nto the expression (min <= expr AND expr <= max) if all the arguments\nare of the same type. Otherwise type conversion takes place according\nto the rules described in\nhttp://dev.mysql.com/doc/refman/5.5/en/type-conversion.html, but\napplied to all the three arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 2 BETWEEN 1 AND 3, 2 BETWEEN 3 and 1;\n        -> 1, 0\nmysql> SELECT 1 BETWEEN 2 AND 3;\n        -> 0\nmysql> SELECT \'b\' BETWEEN \'a\' AND \'c\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'3\';\n        -> 1\nmysql> SELECT 2 BETWEEN 2 AND \'x-3\';\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(79,'MULTIPOLYGON',25,'MultiPolygon(poly1, poly2, ...)\n\nConstructs a MultiPolygon value from a set of Polygon or WKB Polygon\narguments.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html'),(80,'LEFT',38,'Syntax:\nLEFT(str,len)\n\nReturns the leftmost len characters from the string str, or NULL if any\nargument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT LEFT(\'foobarbar\', 5);\n        -> \'fooba\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(81,'FLUSH QUERY CACHE',27,'You can defragment the query cache to better utilize its memory with\nthe FLUSH QUERY CACHE statement. The statement does not remove any\nqueries from the cache.\n\nThe RESET QUERY CACHE statement removes all query results from the\nquery cache. The FLUSH TABLES statement also does this.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/query-cache-status-and-maintenance.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/query-cache-status-and-maintenance.html'),(82,'SET DATA TYPE',23,'SET(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA set. A string object that can have zero or more values, each of which\nmust be chosen from the list of values \'value1\', \'value2\', ... SET\nvalues are represented internally as integers.\n\nA SET column can have a maximum of 64 distinct members. A table can\nhave no more than 255 unique element list definitions among its ENUM\nand SET columns considered as a group. For more information on this\nlimit, see http://dev.mysql.com/doc/refman/5.5/en/limits-frm-file.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(83,'RAND',3,'Syntax:\nRAND([N])\n\nReturns a random floating-point value v in the range 0 <= v < 1.0. To\nobtain a random integer R in the range i <= R < j, use the expression\nFLOOR(i + RAND() * (j − i)). For example, to obtain a random integer\nin the range the range 7 <= R < 12, use the following statement:\n\nSELECT FLOOR(7 + (RAND() * 5));\n\nIf an integer argument N is specified, it is used as the seed value:\n\no With a constant initializer argument, the seed is initialized once\n  when the statement is prepared, prior to execution.\n\no With a nonconstant initializer argument (such as a column name), the\n  seed is initialized with the value for each invocation of RAND().\n\nOne implication of this behavior is that for equal argument values,\nRAND(N) returns the same value each time, and thus produces a\nrepeatable sequence of column values. In the following example, the\nsequence of values produced by RAND(3) is the same both places it\noccurs.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> CREATE TABLE t (i INT);\nQuery OK, 0 rows affected (0.42 sec)\n\nmysql> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nmysql> SELECT i, RAND() FROM t;\n+------+------------------+\n| i    | RAND()           |\n+------+------------------+\n|    1 | 0.61914388706828 |\n|    2 | 0.93845168309142 |\n|    3 | 0.83482678498591 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nmysql> SELECT i, RAND(3) FROM t;\n+------+------------------+\n| i    | RAND(3)          |\n+------+------------------+\n|    1 | 0.90576975597606 |\n|    2 | 0.37307905813035 |\n|    3 | 0.14808605345719 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nmysql> SELECT i, RAND() FROM t;\n+------+------------------+\n| i    | RAND()           |\n+------+------------------+\n|    1 | 0.35877890638893 |\n|    2 | 0.28941420772058 |\n|    3 | 0.37073435016976 |\n+------+------------------+\n3 rows in set (0.00 sec)\n\nmysql> SELECT i, RAND(3) FROM t;\n+------+------------------+\n| i    | RAND(3)          |\n+------+------------------+\n|    1 | 0.90576975597606 |\n|    2 | 0.37307905813035 |\n|    3 | 0.14808605345719 |\n+------+------------------+\n3 rows in set (0.01 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(84,'RPAD',38,'Syntax:\nRPAD(str,len,padstr)\n\nReturns the string str, right-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT RPAD(\'hi\',5,\'?\');\n        -> \'hi???\'\nmysql> SELECT RPAD(\'hi\',1,\'?\');\n        -> \'h\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(85,'DEC',23,'DEC[(M[,D])] [UNSIGNED] [ZEROFILL], NUMERIC[(M[,D])] [UNSIGNED]\n[ZEROFILL], FIXED[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nThese types are synonyms for DECIMAL. The FIXED synonym is available\nfor compatibility with other database systems.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(86,'ELT',38,'Syntax:\nELT(N,str1,str2,str3,...)\n\nELT() returns the Nth element of the list of strings: str1 if N = 1,\nstr2 if N = 2, and so on. Returns NULL if N is less than 1 or greater\nthan the number of arguments. ELT() is the complement of FIELD().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT ELT(1, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'ej\'\nmysql> SELECT ELT(4, \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> \'foo\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(87,'ALTER VIEW',40,'Syntax:\nALTER\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThis statement changes the definition of a view, which must exist. The\nsyntax is similar to that for CREATE VIEW and the effect is the same as\nfor CREATE OR REPLACE VIEW. See [HELP CREATE VIEW]. This statement\nrequires the CREATE VIEW and DROP privileges for the view, and some\nprivilege for each column referred to in the SELECT statement. ALTER\nVIEW is permitted only to the definer or users with the SUPER\nprivilege.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-view.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-view.html'),(88,'SHOW DATABASES',27,'Syntax:\nSHOW {DATABASES | SCHEMAS}\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW DATABASES lists the databases on the MySQL server host. SHOW\nSCHEMAS is a synonym for SHOW DATABASES. The LIKE clause, if present,\nindicates which database names to match. The WHERE clause can be given\nto select rows using more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nYou see only those databases for which you have some kind of privilege,\nunless you have the global SHOW DATABASES privilege. You can also get\nthis list using the mysqlshow command.\n\nIf the server was started with the --skip-show-database option, you\ncannot use this statement at all unless you have the SHOW DATABASES\nprivilege.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-databases.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-databases.html'),(89,'SEC_TO_TIME',32,'Syntax:\nSEC_TO_TIME(seconds)\n\nReturns the seconds argument, converted to hours, minutes, and seconds,\nas a TIME value. The range of the result is constrained to that of the\nTIME data type. A warning occurs if the argument corresponds to a value\noutside that range.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT SEC_TO_TIME(2378);\n        -> \'00:39:38\'\nmysql> SELECT SEC_TO_TIME(2378) + 0;\n        -> 3938\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(90,'LOCATE',38,'Syntax:\nLOCATE(substr,str), LOCATE(substr,str,pos)\n\nThe first syntax returns the position of the first occurrence of\nsubstring substr in string str. The second syntax returns the position\nof the first occurrence of substring substr in string str, starting at\nposition pos. Returns 0 if substr is not in str. Returns NULL if substr\nor str is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT LOCATE(\'bar\', \'foobarbar\');\n        -> 4\nmysql> SELECT LOCATE(\'xbar\', \'foobar\');\n        -> 0\nmysql> SELECT LOCATE(\'bar\', \'foobarbar\', 5);\n        -> 7\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(91,'SHOW EVENTS',27,'Syntax:\nSHOW EVENTS\n    [{FROM | IN} schema_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement displays information about Event Manager events. It\nrequires the EVENT privilege for the database from which the events are\nto be shown.\n\nIn its simplest form, SHOW EVENTS lists all of the events in the\ncurrent schema:\n\nmysql> SELECT CURRENT_USER(), SCHEMA();\n+----------------+----------+\n| CURRENT_USER() | SCHEMA() |\n+----------------+----------+\n| jon@ghidora    | myschema |\n+----------------+----------+\n1 row in set (0.00 sec)\n\nmysql> SHOW EVENTS\\G\n*************************** 1. row ***************************\n                  Db: myschema\n                Name: e_daily\n             Definer: jon@ghidora\n           Time zone: SYSTEM\n                Type: RECURRING\n          Execute at: NULL\n      Interval value: 10\n      Interval field: SECOND\n              Starts: 2006-02-09 10:41:23\n                Ends: NULL\n              Status: ENABLED\n          Originator: 0\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n\nTo see events for a specific schema, use the FROM clause. For example,\nto see events for the test schema, use the following statement:\n\nSHOW EVENTS FROM test;\n\nThe LIKE clause, if present, indicates which event names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-events.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-events.html'),(92,'LONGTEXT',23,'LONGTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 4,294,967,295 or 4GB (232 − 1)\ncharacters. The effective maximum length is less if the value contains\nmultibyte characters. The effective maximum length of LONGTEXT columns\nalso depends on the configured maximum packet size in the client/server\nprotocol and available memory. Each LONGTEXT value is stored using a\n4-byte length prefix that indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(93,'KILL',27,'Syntax:\nKILL [CONNECTION | QUERY] processlist_id\n\nEach connection to mysqld runs in a separate thread. You can kill a\nthread with the KILL processlist_id statement.\n\nThread processlist identifiers can be determined from the ID column of\nthe INFORMATION_SCHEMA.PROCESSLIST table, the Id column of SHOW\nPROCESSLIST output, and the PROCESSLIST_ID column of the Performance\nSchema threads table. The value for the current thread is returned by\nthe CONNECTION_ID() function.\n\nKILL permits an optional CONNECTION or QUERY modifier:\n\no KILL CONNECTION is the same as KILL with no modifier: It terminates\n  the connection associated with the given processlist_id, after\n  terminating any statement the connection is executing.\n\no KILL QUERY terminates the statement the connection is currently\n  executing, but leaves the connection itself intact.\n\nIf you have the PROCESS privilege, you can see all threads. If you have\nthe SUPER privilege, you can kill all threads and statements.\nOtherwise, you can see and kill only your own threads and statements.\n\nYou can also use the mysqladmin processlist and mysqladmin kill\ncommands to examine and kill threads.\n\n*Note*:\n\nYou cannot use KILL with the Embedded MySQL Server library because the\nembedded server merely runs inside the threads of the host application.\nIt does not create any connection threads of its own.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/kill.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/kill.html'),(94,'DISJOINT',7,'Disjoint(g1, g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially disjoint from (does\nnot intersect) g2.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html'),(95,'LPAD',38,'Syntax:\nLPAD(str,len,padstr)\n\nReturns the string str, left-padded with the string padstr to a length\nof len characters. If str is longer than len, the return value is\nshortened to len characters.\n\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT LPAD(\'hi\',4,\'??\');\n        -> \'??hi\'\nmysql> SELECT LPAD(\'hi\',1,\'??\');\n        -> \'h\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(96,'OVERLAPS',7,'Overlaps(g1, g2)\n\nTwo geometries spatially overlap if they intersect and their\nintersection results in a geometry of the same dimension but not equal\nto either of the given geometries.\n\nThis function returns 1 or 0 to indicate whether g1 spatially overlaps\ng2.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html'),(97,'SET GLOBAL SQL_SLAVE_SKIP_COUNTER',8,'Syntax:\nSET GLOBAL sql_slave_skip_counter = N\n\nThis statement skips the next N events from the master. This is useful\nfor recovering from replication stops caused by a statement.\n\nThis statement is valid only when the slave threads are not running.\nOtherwise, it produces an error.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/set-global-sql-slave-skip-counter.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/set-global-sql-slave-skip-counter.html'),(98,'MBREQUAL',7,'MBREqual(g1, g2)\n\nReturns 1 or 0 to indicate whether the minimum bounding rectangles of\nthe two geometries g1 and g2 are the same.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html'),(99,'PROCEDURE ANALYSE',34,'Syntax:\nANALYSE([max_elements[,max_memory]])\n\nANALYSE() examines the result from a query and returns an analysis of\nthe results that suggests optimal data types for each column that may\nhelp reduce table sizes. To obtain this analysis, append PROCEDURE\nANALYSE to the end of a SELECT statement:\n\nSELECT ... FROM ... WHERE ... PROCEDURE ANALYSE([max_elements,[max_memory]])\n\nFor example:\n\nSELECT col1, col2 FROM table1 PROCEDURE ANALYSE(10, 2000);\n\nThe results show some statistics for the values returned by the query,\nand propose an optimal data type for the columns. This can be helpful\nfor checking your existing tables, or after importing new data. You may\nneed to try different settings for the arguments so that PROCEDURE\nANALYSE() does not suggest the ENUM data type when it is not\nappropriate.\n\nThe arguments are optional and are used as follows:\n\no max_elements (default 256) is the maximum number of distinct values\n  that ANALYSE() notices per column. This is used by ANALYSE() to check\n  whether the optimal data type should be of type ENUM; if there are\n  more than max_elements distinct values, then ENUM is not a suggested\n  type.\n\no max_memory (default 8192) is the maximum amount of memory that\n  ANALYSE() should allocate per column while trying to find all\n  distinct values.\n\nA PROCEDURE clause is not permitted in a UNION statement.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/procedure-analyse.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/procedure-analyse.html'),(100,'HELP_VERSION',9,'This help information was generated from the MySQL 5.5 Reference Manual\non: 2017-09-13 (revision: 53919)\n\nThis information applies to MySQL 5.5 through 5.5.59.\n','',''),(101,'CHARACTER_LENGTH',38,'Syntax:\nCHARACTER_LENGTH(str)\n\nCHARACTER_LENGTH() is a synonym for CHAR_LENGTH().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(102,'SHOW PRIVILEGES',27,'Syntax:\nSHOW PRIVILEGES\n\nSHOW PRIVILEGES shows the list of system privileges that the MySQL\nserver supports. The exact list of privileges depends on the version of\nyour server.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-privileges.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-privileges.html'),(103,'CREATE TABLESPACE',40,'Syntax:\nCREATE TABLESPACE tablespace_name\n    ADD DATAFILE \'file_name\'\n    USE LOGFILE GROUP logfile_group\n    [EXTENT_SIZE [=] extent_size]\n    [INITIAL_SIZE [=] initial_size]\n    [AUTOEXTEND_SIZE [=] autoextend_size]\n    [MAX_SIZE [=] max_size]\n    [NODEGROUP [=] nodegroup_id]\n    [WAIT]\n    [COMMENT [=] comment_text]\n    ENGINE [=] engine_name\n\nThis statement is used to create a tablespace, which can contain one or\nmore data files, providing storage space for tables. One data file is\ncreated and added to the tablespace using this statement. Additional\ndata files may be added to the tablespace by using the ALTER TABLESPACE\nstatement (see [HELP ALTER TABLESPACE]). For rules covering the naming\nof tablespaces, see\nhttp://dev.mysql.com/doc/refman/5.5/en/identifiers.html.\n\n*Note*:\n\nAll NDB Cluster Disk Data objects share the same namespace. This means\nthat each Disk Data object must be uniquely named (and not merely each\nDisk Data object of a given type). For example, you cannot have a\ntablespace and a log file group with the same name, or a tablespace and\na data file with the same name.\n\nA log file group of one or more UNDO log files must be assigned to the\ntablespace to be created with the USE LOGFILE GROUP clause.\nlogfile_group must be an existing log file group created with CREATE\nLOGFILE GROUP (see [HELP CREATE LOGFILE GROUP]). Multiple tablespaces\nmay use the same log file group for UNDO logging.\n\nThe EXTENT_SIZE sets the size, in bytes, of the extents used by any\nfiles belonging to the tablespace. The default value is 1M. The minimum\nsize is 32K, and theoretical maximum is 2G, although the practical\nmaximum size depends on a number of factors. In most cases, changing\nthe extent size does not have any measurable effect on performance, and\nthe default value is recommended for all but the most unusual\nsituations.\n\nAn extent is a unit of disk space allocation. One extent is filled with\nas much data as that extent can contain before another extent is used.\nIn theory, up to 65,535 (64K) extents may used per data file; however,\nthe recommended maximum is 32,768 (32K). The recommended maximum size\nfor a single data file is 32G---that is, 32K extents x 1 MB per extent.\nIn addition, once an extent is allocated to a given partition, it\ncannot be used to store data from a different partition; an extent\ncannot store data from more than one partition. This means, for example\nthat a tablespace having a single datafile whose INITIAL_SIZE is 256 MB\nand whose EXTENT_SIZE is 128M has just two extents, and so can be used\nto store data from at most two different disk data table partitions.\n\nYou can see how many extents remain free in a given data file by\nquerying the INFORMATION_SCHEMA.FILES table, and so derive an estimate\nfor how much space remains free in the file. For further discussion and\nexamples, see http://dev.mysql.com/doc/refman/5.5/en/files-table.html.\n\nThe INITIAL_SIZE parameter sets the data file\'s total size in bytes.\nOnce the file has been created, its size cannot be changed; however,\nyou can add more data files to the tablespace using ALTER TABLESPACE\n... ADD DATAFILE. See [HELP ALTER TABLESPACE].\n\nINITIAL_SIZE is optional; its default value is 134217728 (128 MB).\n\nOn 32-bit systems, the maximum supported value for INITIAL_SIZE is\n4294967296 (4 GB). (Bug #29186)\n\nWhen setting EXTENT_SIZE, you may optionally follow the number with a\none-letter abbreviation for an order of magnitude, similar to those\nused in my.cnf. Generally, this is one of the letters M (for megabytes)\nor G (for gigabytes). In MySQL NDB Cluster 7.2.14 and later, these\nabbreviations are also supported when specifying INITIAL_SIZE as well.\n(Bug #13116514, Bug #16104705, Bug #62858)\n\nINITIAL_SIZE, EXTENT_SIZE, and UNDO_BUFFER_SIZE are subject to rounding\nas follows:\n\no EXTENT_SIZE and UNDO_BUFFER_SIZE are each rounded up to the nearest\n  whole multiple of 32K.\n\no INITIAL_SIZE is rounded down to the nearest whole multiple of 32K.\n\n  For data files, INITIAL_SIZE is subject to further rounding; the\n  result just obtained is rounded up to the nearest whole multiple of\n  EXTENT_SIZE (after any rounding).\n\nThe rounding just described is done explicitly, and a warning is issued\nby the MySQL Server when any such rounding is performed. The rounded\nvalues are also used by the NDB kernel for calculating\nINFORMATION_SCHEMA.FILES column values and other purposes. However, to\navoid an unexpected result, we suggest that you always use whole\nmultiples of 32K in specifying these options.\n\nAUTOEXTEND_SIZE, MAX_SIZE, NODEGROUP, WAIT, and COMMENT are parsed but\nignored, and so currently have no effect. These options are intended\nfor future expansion.\n\nThe ENGINE parameter determines the storage engine which uses this\ntablespace, with engine_name being the name of the storage engine.\nCurrently, engine_name must be one of the values NDB or NDBCLUSTER.\n\nWhen CREATE TABLESPACE is used with ENGINE = NDB, a tablespace and\nassociated data file are created on each Cluster data node. You can\nverify that the data files were created and obtain information about\nthem by querying the INFORMATION_SCHEMA.FILES table. For example:\n\nmysql> SELECT LOGFILE_GROUP_NAME, FILE_NAME, EXTRA\n    -> FROM INFORMATION_SCHEMA.FILES\n    -> WHERE TABLESPACE_NAME = \'newts\' AND FILE_TYPE = \'DATAFILE\';\n+--------------------+-------------+----------------+\n| LOGFILE_GROUP_NAME | FILE_NAME   | EXTRA          |\n+--------------------+-------------+----------------+\n| lg_3               | newdata.dat | CLUSTER_NODE=3 |\n| lg_3               | newdata.dat | CLUSTER_NODE=4 |\n+--------------------+-------------+----------------+\n2 rows in set (0.01 sec)\n\n(See http://dev.mysql.com/doc/refman/5.5/en/files-table.html.)\n\nCREATE TABLESPACE is useful only with Disk Data storage for NDB\nCluster. See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-cluster-disk-data.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-tablespace.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-tablespace.html'),(104,'INSERT FUNCTION',38,'Syntax:\nINSERT(str,pos,len,newstr)\n\nReturns the string str, with the substring beginning at position pos\nand len characters long replaced by the string newstr. Returns the\noriginal string if pos is not within the length of the string. Replaces\nthe rest of the string from position pos if len is not within the\nlength of the rest of the string. Returns NULL if any argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT INSERT(\'Quadratic\', 3, 4, \'What\');\n        -> \'QuWhattic\'\nmysql> SELECT INSERT(\'Quadratic\', -1, 4, \'What\');\n        -> \'Quadratic\'\nmysql> SELECT INSERT(\'Quadratic\', 3, 100, \'What\');\n        -> \'QuWhat\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(105,'XOR',15,'Syntax:\nXOR\n\nLogical XOR. Returns NULL if either operand is NULL. For non-NULL\noperands, evaluates to 1 if an odd number of operands is nonzero,\notherwise 0 is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html\n\n','mysql> SELECT 1 XOR 1;\n        -> 0\nmysql> SELECT 1 XOR 0;\n        -> 1\nmysql> SELECT 1 XOR NULL;\n        -> NULL\nmysql> SELECT 1 XOR 1 XOR 1;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html'),(106,'GRANT',10,'Syntax:\nGRANT\n    priv_type [(column_list)]\n      [, priv_type [(column_list)]] ...\n    ON [object_type] priv_level\n    TO user [auth_option] [, user [auth_option]] ...\n    [REQUIRE {NONE | tls_option [[AND] tls_option] ...}]\n    [WITH {GRANT OPTION | resource_option} ...]\n\nGRANT PROXY ON user\n    TO user [, user] ...\n    [WITH GRANT OPTION]\n\nobject_type: {\n    TABLE\n  | FUNCTION\n  | PROCEDURE\n}\n\npriv_level: {\n    *\n  | *.*\n  | db_name.*\n  | db_name.tbl_name\n  | tbl_name\n  | db_name.routine_name\n}\n\nuser:\n    (see http://dev.mysql.com/doc/refman/5.5/en/account-names.html)\n\nauth_option: {\n    IDENTIFIED BY \'auth_string\'\n  | IDENTIFIED BY PASSWORD \'hash_string\'\n  | IDENTIFIED WITH auth_plugin\n  | IDENTIFIED WITH auth_plugin AS \'hash_string\'\n}\n\ntls_option: {\n    SSL\n  | X509\n  | CIPHER \'cipher\'\n  | ISSUER \'issuer\'\n  | SUBJECT \'subject\'\n}\n\nresource_option: {\n  | MAX_QUERIES_PER_HOUR count\n  | MAX_UPDATES_PER_HOUR count\n  | MAX_CONNECTIONS_PER_HOUR count\n  | MAX_USER_CONNECTIONS count\n}\n\nThe GRANT statement grants privileges to MySQL user accounts. GRANT\nalso serves to specify other account characteristics such as use of\nsecure connections and limits on access to server resources.\n\nTo use GRANT, you must have the GRANT OPTION privilege, and you must\nhave the privileges that you are granting. When the read_only system\nvariable is enabled, GRANT additionally requires the SUPER privilege.\n\nThe REVOKE statement is related to GRANT and enables administrators to\nremove account privileges. See [HELP REVOKE].\n\nEach account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.5/en/account-names.html. For example:\n\nGRANT ALL ON db1.* TO \'jeffrey\'@\'localhost\';\n\nThe host name part of the account, if omitted, defaults to \'%\'.\n\nNormally, a database administrator first uses CREATE USER to create an\naccount, then GRANT to define its privileges and characteristics. For\nexample:\n\nCREATE USER \'jeffrey\'@\'localhost\' IDENTIFIED BY \'mypass\';\nGRANT ALL ON db1.* TO \'jeffrey\'@\'localhost\';\nGRANT SELECT ON db2.invoice TO \'jeffrey\'@\'localhost\';\nGRANT USAGE ON *.* TO \'jeffrey\'@\'localhost\' WITH MAX_QUERIES_PER_HOUR 90;\n\n*Note*:\n\nExamples shown here include no IDENTIFIED clause. It is assumed that\nyou establish passwords with CREATE USER at account-creation time to\navoid creating insecure accounts.\n\nIf an account named in a GRANT statement does not already exist, GRANT\nmay create it under the conditions described later in the discussion of\nthe NO_AUTO_CREATE_USER SQL mode.\n\nFrom the mysql program, GRANT responds with Query OK, 0 rows affected\nwhen executed successfully. To determine what privileges result from\nthe operation, use SHOW GRANTS. See [HELP SHOW GRANTS].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/grant.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/grant.html'),(107,'MBRINTERSECTS',7,'MBRIntersects(g1, g2)\n\nReturns 1 or 0 to indicate whether the minimum bounding rectangles of\nthe two geometries g1 and g2 intersect.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html'),(108,'IS NOT',20,'Syntax:\nIS NOT boolean_value\n\nTests a value against a boolean value, where boolean_value can be TRUE,\nFALSE, or UNKNOWN.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 1 IS NOT UNKNOWN, 0 IS NOT UNKNOWN, NULL IS NOT UNKNOWN;\n        -> 1, 1, 0\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(109,'SQRT',3,'Syntax:\nSQRT(X)\n\nReturns the square root of a nonnegative number X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT SQRT(4);\n        -> 2\nmysql> SELECT SQRT(20);\n        -> 4.4721359549996\nmysql> SELECT SQRT(-16);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(110,'CREATE INDEX',40,'Syntax:\nCREATE [ONLINE|OFFLINE] [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name\n    [index_type]\n    ON tbl_name (index_col_name,...)\n    [index_option] ...\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_option:\n    KEY_BLOCK_SIZE [=] value\n  | index_type\n  | WITH PARSER parser_name\n  | COMMENT \'string\'\n\nindex_type:\n    USING {BTREE | HASH}\n\nCREATE INDEX is mapped to an ALTER TABLE statement to create indexes.\nSee [HELP ALTER TABLE]. CREATE INDEX cannot be used to create a PRIMARY\nKEY; use ALTER TABLE instead. For more information about indexes, see\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-indexes.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-index.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-index.html'),(111,'ALTER DATABASE',40,'Syntax:\nALTER {DATABASE | SCHEMA} [db_name]\n    alter_specification ...\nALTER {DATABASE | SCHEMA} db_name\n    UPGRADE DATA DIRECTORY NAME\n\nalter_specification:\n    [DEFAULT] CHARACTER SET [=] charset_name\n  | [DEFAULT] COLLATE [=] collation_name\n\nALTER DATABASE enables you to change the overall characteristics of a\ndatabase. These characteristics are stored in the db.opt file in the\ndatabase directory. To use ALTER DATABASE, you need the ALTER privilege\non the database. ALTER SCHEMA is a synonym for ALTER DATABASE.\n\nThe database name can be omitted from the first syntax, in which case\nthe statement applies to the default database.\n\nNational Language Characteristics\n\nThe CHARACTER SET clause changes the default database character set.\nThe COLLATE clause changes the default database collation.\nhttp://dev.mysql.com/doc/refman/5.5/en/charset.html, discusses\ncharacter set and collation names.\n\nYou can see what character sets and collations are available using,\nrespectively, the SHOW CHARACTER SET and SHOW COLLATION statements. See\n[HELP SHOW CHARACTER SET], and [HELP SHOW COLLATION], for more\ninformation.\n\nIf you change the default character set or collation for a database,\nstored routines that use the database defaults must be dropped and\nrecreated so that they use the new defaults. (In a stored routine,\nvariables with character data types use the database defaults if the\ncharacter set or collation are not specified explicitly. See [HELP\nCREATE PROCEDURE].)\n\nUpgrading from Versions Older than MySQL 5.1\n\nThe syntax that includes the UPGRADE DATA DIRECTORY NAME clause updates\nthe name of the directory associated with the database to use the\nencoding implemented in MySQL 5.1 for mapping database names to\ndatabase directory names (see\nhttp://dev.mysql.com/doc/refman/5.5/en/identifier-mapping.html). This\nclause is for use under these conditions:\n\no It is intended when upgrading MySQL to 5.1 or later from older\n  versions.\n\no It is intended to update a database directory name to the current\n  encoding format if the name contains special characters that need\n  encoding.\n\no The statement is used by mysqlcheck (as invoked by mysql_upgrade).\n\nFor example, if a database in MySQL 5.0 has the name a-b-c, the name\ncontains instances of the - (dash) character. In MySQL 5.0, the\ndatabase directory is also named a-b-c, which is not necessarily safe\nfor all file systems. In MySQL 5.1 and later, the same database name is\nencoded as a@002db@002dc to produce a file system-neutral directory\nname.\n\nWhen a MySQL installation is upgraded to MySQL 5.1 or later from an\nolder version,the server displays a name such as a-b-c (which is in the\nold format) as #mysql50#a-b-c, and you must refer to the name using the\n#mysql50# prefix. Use UPGRADE DATA DIRECTORY NAME in this case to\nexplicitly tell the server to re-encode the database directory name to\nthe current encoding format:\n\nALTER DATABASE `#mysql50#a-b-c` UPGRADE DATA DIRECTORY NAME;\n\nAfter executing this statement, you can refer to the database as a-b-c\nwithout the special #mysql50# prefix.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-database.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-database.html'),(112,'GEOMETRYN',26,'GeometryN(gc, N)\n\nReturns the N-th geometry in the GeometryCollection value gc.\nGeometries are numbered beginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-geometrycollection-property-functions.html\n\n','mysql> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nmysql> SELECT AsText(GeometryN(GeomFromText(@gc),1));\n+----------------------------------------+\n| AsText(GeometryN(GeomFromText(@gc),1)) |\n+----------------------------------------+\n| POINT(1 1)                             |\n+----------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-geometrycollection-property-functions.html'),(113,'<<',19,'Syntax:\n<<\n\nShifts a longlong (BIGINT) number to the left.\n\nThe result is an unsigned 64-bit integer. The value is truncated to 64\nbits. In particular, if the shift count is greater or equal to the\nwidth of an unsigned 64-bit number, the result is zero.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT 1 << 2;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(114,'SHOW TABLE STATUS',27,'Syntax:\nSHOW TABLE STATUS\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLE STATUS works likes SHOW TABLES, but provides a lot of\ninformation about each non-TEMPORARY table. You can also get this list\nusing the mysqlshow --status db_name command. The LIKE clause, if\npresent, indicates which table names to match. The WHERE clause can be\ngiven to select rows using more general conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-table-status.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-table-status.html'),(115,'ASCII',38,'Syntax:\nASCII(str)\n\nReturns the numeric value of the leftmost character of the string str.\nReturns 0 if str is the empty string. Returns NULL if str is NULL.\nASCII() works for 8-bit characters.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT ASCII(\'2\');\n        -> 50\nmysql> SELECT ASCII(2);\n        -> 50\nmysql> SELECT ASCII(\'dx\');\n        -> 100\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(116,'DIV',3,'Syntax:\nDIV\n\nInteger division. Discards from the division result any fractional part\nto the right of the decimal point.\n\nAs of MySQL 5.5.3, if either operand has a noninteger type, the\noperands are converted to DECIMAL and divided using DECIMAL arithmetic\nbefore converting the result to BIGINT. If the result exceeds BIGINT\nrange, an error occurs. Before MySQL 5.5.3, incorrect results may occur\nfor noninteger operands that exceed BIGINT range.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','mysql> SELECT 5 DIV 2, -5 DIV 2, 5 DIV -2, -5 DIV -2;\n        -> 2, -2, -2, 2\n','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(117,'SHOW SLAVE STATUS',27,'Syntax:\nSHOW SLAVE STATUS\n\nThis statement provides status information on essential parameters of\nthe slave threads. It requires either the SUPER or REPLICATION CLIENT\nprivilege.\n\nIf you issue this statement using the mysql client, you can use a \\G\nstatement terminator rather than a semicolon to obtain a more readable\nvertical layout:\n\nmysql> SHOW SLAVE STATUS\\G\n*************************** 1. row ***************************\n               Slave_IO_State: Waiting for master to send event\n                  Master_Host: localhost\n                  Master_User: root\n                  Master_Port: 3306\n                Connect_Retry: 3\n              Master_Log_File: gbichot-bin.005\n          Read_Master_Log_Pos: 79\n               Relay_Log_File: gbichot-relay-bin.005\n                Relay_Log_Pos: 548\n        Relay_Master_Log_File: gbichot-bin.005\n             Slave_IO_Running: Yes\n            Slave_SQL_Running: Yes\n              Replicate_Do_DB:\n          Replicate_Ignore_DB:\n           Replicate_Do_Table:\n       Replicate_Ignore_Table:\n      Replicate_Wild_Do_Table:\n  Replicate_Wild_Ignore_Table:\n                   Last_Errno: 0\n                   Last_Error:\n                 Skip_Counter: 0\n          Exec_Master_Log_Pos: 79\n              Relay_Log_Space: 552\n              Until_Condition: None\n               Until_Log_File:\n                Until_Log_Pos: 0\n           Master_SSL_Allowed: No\n           Master_SSL_CA_File:\n           Master_SSL_CA_Path:\n              Master_SSL_Cert:\n            Master_SSL_Cipher:\n               Master_SSL_Key:\n        Seconds_Behind_Master: 8\nMaster_SSL_Verify_Server_Cert: No\n                Last_IO_Errno: 0\n                Last_IO_Error:\n               Last_SQL_Errno: 0\n               Last_SQL_Error:\n  Replicate_Ignore_Server_Ids: 0\n             Master_Server_Id: 1\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-slave-status.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-slave-status.html'),(118,'GEOMETRY',35,'MySQL provides a standard way of creating spatial columns for geometry\ntypes, for example, with CREATE TABLE or ALTER TABLE. Spatial columns\nare supported for MyISAM, InnoDB, NDB, and ARCHIVE tables. See also the\nnotes about spatial indexes under [HELP SPATIAL].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-columns.html\n\n','CREATE TABLE geom (g GEOMETRY);\n','http://dev.mysql.com/doc/refman/5.5/en/creating-spatial-columns.html'),(119,'&',19,'Syntax:\n&\n\nBitwise AND.\n\nThe result is an unsigned 64-bit integer.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT 29 & 15;\n        -> 13\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(120,'ASSIGN-EQUAL',15,'Syntax:\n=\n\nThis operator is used to perform value assignments in two cases,\ndescribed in the next two paragraphs.\n\nWithin a SET statement, = is treated as an assignment operator that\ncauses the user variable on the left hand side of the operator to take\non the value to its right. (In other words, when used in a SET\nstatement, = is treated identically to :=.) The value on the right hand\nside may be a literal value, another variable storing a value, or any\nlegal expression that yields a scalar value, including the result of a\nquery (provided that this value is a scalar value). You can perform\nmultiple assignments in the same SET statement.\n\nIn the SET clause of an UPDATE statement, = also acts as an assignment\noperator; in this case, however, it causes the column named on the left\nhand side of the operator to assume the value given to the right,\nprovided any WHERE conditions that are part of the UPDATE are met. You\ncan make multiple assignments in the same SET clause of an UPDATE\nstatement.\n\nIn any other context, = is treated as a comparison operator.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/assignment-operators.html\n\n','mysql> SELECT @var1, @var2;\n        -> NULL, NULL\nmysql> SELECT @var1 := 1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2 := @var1;\n        -> 1, 1\nmysql> SELECT @var1, @var2;\n        -> 1, 1\n','http://dev.mysql.com/doc/refman/5.5/en/assignment-operators.html'),(121,'CONVERT',38,'Syntax:\nCONVERT(expr,type), CONVERT(expr USING transcoding_name)\n\nThe CONVERT() function takes an expression of any type and produces a\nresult value of the specified type.\n\nDiscussion of CONVERT(expr, type) syntax here also applies to CAST(expr\nAS type), which is equivalent.\n\nCONVERT(... USING ...) is standard SQL syntax. The non-USING form of\nCONVERT() is ODBC syntax.\n\nCONVERT() with USING converts data between different character sets. In\nMySQL, transcoding names are the same as the corresponding character\nset names. For example, this statement converts the string \'abc\' in the\ndefault character set to the corresponding string in the utf8 character\nset:\n\nSELECT CONVERT(\'abc\' USING utf8);\n\nCONVERT() without USING and CAST() take an expression and a type value\nspecifying the result type. These type values are permitted:\n\no BINARY[(N)]\n\n  Produces a string with the BINARY data type. See\n  http://dev.mysql.com/doc/refman/5.5/en/binary-varbinary.html for a\n  description of how this affects comparisons. If the optional length N\n  is given, BINARY(N) causes the cast to use no more than N bytes of\n  the argument. Values shorter than N bytes are padded with 0x00 bytes\n  to a length of N.\n\no CHAR[(N)] [charset_info]\n\n  Produces a string with the CHAR data type. If the optional length N\n  is given, CHAR(N) causes the cast to use no more than N characters of\n  the argument. No padding occurs for values shorter than N characters.\n\n  With no charset_info clause, CHAR produces a string with the default\n  character set. To specify the character set explicitly, these\n  charset_info values are permitted:\n\n  o CHARACTER SET charset_name: Produces a string with the given\n    character set.\n\n  o ASCII: Shorthand for CHARACTER SET latin1.\n\n  o UNICODE: Shorthand for CHARACTER SET ucs2.\n\n  In all cases, the string has the default collation for the character\n  set.\n\no DATE\n\n  Produces a DATE value.\n\no DATETIME\n\n  Produces a DATETIME value.\n\no DECIMAL[(M[,D])]\n\n  Produces a DECIMAL value. If the optional M and D values are given,\n  they specify the maximum number of digits (the precision) and the\n  number of digits following the decimal point (the scale).\n\no NCHAR[(N)]\n\n  Like CHAR, but produces a string with the national character set. See\n  http://dev.mysql.com/doc/refman/5.5/en/charset-national.html.\n\n  Unlike CHAR, NCHAR does not permit trailing character set information\n  to be specified.\n\no SIGNED [INTEGER]\n\n  Produces a signed integer value.\n\no TIME\n\n  Produces a TIME value.\n\no UNSIGNED [INTEGER]\n\n  Produces an unsigned integer value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/cast-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/cast-functions.html'),(122,'DROP LOGFILE GROUP',40,'Syntax:\nDROP LOGFILE GROUP logfile_group\n    ENGINE [=] engine_name\n\nThis statement drops the log file group named logfile_group. The log\nfile group must already exist or an error results. (For information on\ncreating log file groups, see [HELP CREATE LOGFILE GROUP].)\n\n*Important*:\n\nBefore dropping a log file group, you must drop all tablespaces that\nuse that log file group for UNDO logging.\n\nThe required ENGINE clause provides the name of the storage engine used\nby the log file group to be dropped. Currently, the only permitted\nvalues for engine_name are NDB and NDBCLUSTER.\n\nDROP LOGFILE GROUP is useful only with Disk Data storage for NDB\nCluster. See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-cluster-disk-data.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-logfile-group.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-logfile-group.html'),(123,'REPEAT LOOP',24,'Syntax:\n[begin_label:] REPEAT\n    statement_list\nUNTIL search_condition\nEND REPEAT [end_label]\n\nThe statement list within a REPEAT statement is repeated until the\nsearch_condition expression is true. Thus, a REPEAT always enters the\nloop at least once. statement_list consists of one or more statements,\neach terminated by a semicolon (;) statement delimiter.\n\nA REPEAT statement can be labeled. For the rules regarding label use,\nsee [HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/repeat.html\n\n','mysql> delimiter //\n\nmysql> CREATE PROCEDURE dorepeat(p1 INT)\n    -> BEGIN\n    ->   SET @x = 0;\n    ->   REPEAT\n    ->     SET @x = @x + 1;\n    ->   UNTIL @x > p1 END REPEAT;\n    -> END\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL dorepeat(1000)//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @x//\n+------+\n| @x   |\n+------+\n| 1001 |\n+------+\n1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/repeat.html'),(124,'SMALLINT',23,'SMALLINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA small integer. The signed range is -32768 to 32767. The unsigned\nrange is 0 to 65535.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(125,'DOUBLE PRECISION',23,'DOUBLE PRECISION[(M,D)] [UNSIGNED] [ZEROFILL], REAL[(M,D)] [UNSIGNED]\n[ZEROFILL]\n\nThese types are synonyms for DOUBLE. Exception: If the REAL_AS_FLOAT\nSQL mode is enabled, REAL is a synonym for FLOAT rather than DOUBLE.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(126,'ORD',38,'Syntax:\nORD(str)\n\nIf the leftmost character of the string str is a multibyte character,\nreturns the code for that character, calculated from the numeric values\nof its constituent bytes using this formula:\n\n  (1st byte code)\n+ (2nd byte code * 256)\n+ (3rd byte code * 2562) ...\n\nIf the leftmost character is not a multibyte character, ORD() returns\nthe same value as the ASCII() function.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT ORD(\'2\');\n        -> 50\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(127,'ENVELOPE',37,'Envelope(g)\n\nReturns the minimum bounding rectangle (MBR) for the geometry value g.\nThe result is returned as a Polygon value that is defined by the corner\npoints of the bounding box:\n\nPOLYGON((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-general-property-functions.html\n\n','mysql> SELECT AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\')));\n+-------------------------------------------------------+\n| AsText(Envelope(GeomFromText(\'LineString(1 1,2 2)\'))) |\n+-------------------------------------------------------+\n| POLYGON((1 1,2 1,2 2,1 2,1 1))                        |\n+-------------------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-general-property-functions.html'),(128,'INET_ATON',14,'Syntax:\nINET_ATON(expr)\n\nGiven the dotted-quad representation of an IPv4 network address as a\nstring, returns an integer that represents the numeric value of the\naddress in network byte order (big endian). INET_ATON() returns NULL if\nit does not understand its argument.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> SELECT INET_ATON(\'10.0.5.9\');\n        -> 167773449\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(129,'ISSIMPLE',37,'IsSimple(g)\n\nIn MySQL 5.5, this function is a placeholder that always returns 0.\n\nThe description of each instantiable geometric class given earlier in\nthe chapter includes the specific conditions that cause an instance of\nthat class to be classified as not simple. (See [HELP Geometry\nhierarchy].)\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-general-property-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-general-property-functions.html'),(130,'- BINARY',3,'Syntax:\n-\n\nSubtraction:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','mysql> SELECT 3-5;\n        -> -2\n','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(131,'CURRENT_TIME',32,'Syntax:\nCURRENT_TIME, CURRENT_TIME()\n\nCURRENT_TIME and CURRENT_TIME() are synonyms for CURTIME().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(132,'WKT DEFINITION',4,'The Well-Known Text (WKT) representation of geometry values is designed\nfor exchanging geometry data in ASCII form. The OpenGIS specification\nprovides a Backus-Naur grammar that specifies the formal production\nrules for writing WKT values (see\nhttp://dev.mysql.com/doc/refman/5.5/en/spatial-extensions.html).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-data-formats.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-data-formats.html'),(133,'REVOKE',10,'Syntax:\nREVOKE\n    priv_type [(column_list)]\n      [, priv_type [(column_list)]] ...\n    ON [object_type] priv_level\n    FROM user [, user] ...\n\nREVOKE ALL [PRIVILEGES], GRANT OPTION\n    FROM user [, user] ...\n\nREVOKE PROXY ON user\n    FROM user [, user] ...\n\nThe REVOKE statement enables system administrators to revoke privileges\nfrom MySQL accounts.\n\nWhen the read_only system variable is enabled, REVOKE requires the\nSUPER privilege in addition to any other required privileges described\nin the following discussion.\n\nEach account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.5/en/account-names.html. For example:\n\nREVOKE INSERT ON *.* FROM \'jeffrey\'@\'localhost\';\n\nThe host name part of the account name, if omitted, defaults to \'%\'.\n\nFor details on the levels at which privileges exist, the permissible\npriv_type, priv_level, and object_type values, and the syntax for\nspecifying users and passwords, see [HELP GRANT]\n\nTo use the first REVOKE syntax, you must have the GRANT OPTION\nprivilege, and you must have the privileges that you are revoking.\n\nTo revoke all privileges, use the second syntax, which drops all\nglobal, database, table, column, and routine privileges for the named\nuser or users:\n\nREVOKE ALL PRIVILEGES, GRANT OPTION FROM user [, user] ...\n\nTo use this REVOKE syntax, you must have the global CREATE USER\nprivilege, or the UPDATE privilege for the mysql database.\n\nUser accounts from which privileges are to be revoked must exist.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/revoke.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/revoke.html'),(134,'LAST_DAY',32,'Syntax:\nLAST_DAY(date)\n\nTakes a date or datetime value and returns the corresponding value for\nthe last day of the month. Returns NULL if the argument is invalid.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT LAST_DAY(\'2003-02-05\');\n        -> \'2003-02-28\'\nmysql> SELECT LAST_DAY(\'2004-02-05\');\n        -> \'2004-02-29\'\nmysql> SELECT LAST_DAY(\'2004-01-01 01:01:01\');\n        -> \'2004-01-31\'\nmysql> SELECT LAST_DAY(\'2003-03-32\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(135,'MEDIUMINT',23,'MEDIUMINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA medium-sized integer. The signed range is -8388608 to 8388607. The\nunsigned range is 0 to 16777215.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(136,'RTRIM',38,'Syntax:\nRTRIM(str)\n\nReturns the string str with trailing space characters removed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT RTRIM(\'barbar   \');\n        -> \'barbar\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(137,'EXPLAIN',29,'Syntax:\n{EXPLAIN | DESCRIBE | DESC}\n    tbl_name [col_name | wild]\n\n{EXPLAIN | DESCRIBE | DESC}\n    [explain_type] SELECT select_options\n\nexplain_type: {EXTENDED | PARTITIONS}\n\nThe DESCRIBE and EXPLAIN statements are synonyms. In practice, the\nDESCRIBE keyword is more often used to obtain information about table\nstructure, whereas EXPLAIN is used to obtain a query execution plan\n(that is, an explanation of how MySQL would execute a query).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/explain.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/explain.html'),(138,'DEGREES',3,'Syntax:\nDEGREES(X)\n\nReturns the argument X, converted from radians to degrees.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT DEGREES(PI());\n        -> 180\nmysql> SELECT DEGREES(PI() / 2);\n        -> 90\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(139,'- UNARY',3,'Syntax:\n-\n\nUnary minus. This operator changes the sign of the operand.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','mysql> SELECT - 2;\n        -> -2\n','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(140,'VARCHAR',23,'[NATIONAL] VARCHAR(M) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA variable-length string. M represents the maximum column length in\ncharacters. The range of M is 0 to 65,535. The effective maximum length\nof a VARCHAR is subject to the maximum row size (65,535 bytes, which is\nshared among all columns) and the character set used. For example, utf8\ncharacters can require up to three bytes per character, so a VARCHAR\ncolumn that uses the utf8 character set can be declared to be a maximum\nof 21,844 characters. See\nhttp://dev.mysql.com/doc/refman/5.5/en/column-count-limit.html.\n\nMySQL stores VARCHAR values as a 1-byte or 2-byte length prefix plus\ndata. The length prefix indicates the number of bytes in the value. A\nVARCHAR column uses one length byte if values require no more than 255\nbytes, two length bytes if values may require more than 255 bytes.\n\n*Note*:\n\nMySQL follows the standard SQL specification, and does not remove\ntrailing spaces from VARCHAR values.\n\nVARCHAR is shorthand for CHARACTER VARYING. NATIONAL VARCHAR is the\nstandard SQL way to define that a VARCHAR column should use some\npredefined character set. MySQL uses utf8 as this predefined character\nset. http://dev.mysql.com/doc/refman/5.5/en/charset-national.html.\nNVARCHAR is shorthand for NATIONAL VARCHAR.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(141,'UNHEX',38,'Syntax:\n\nUNHEX(str)\n\nFor a string argument str, UNHEX(str) interprets each pair of\ncharacters in the argument as a hexadecimal number and converts it to\nthe byte represented by the number. The return value is a binary\nstring.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT UNHEX(\'4D7953514C\');\n        -> \'MySQL\'\nmysql> SELECT X\'4D7953514C\';\n        -> \'MySQL\'\nmysql> SELECT UNHEX(HEX(\'string\'));\n        -> \'string\'\nmysql> SELECT HEX(UNHEX(\'1267\'));\n        -> \'1267\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(142,'DROP TRIGGER',40,'Syntax:\nDROP TRIGGER [IF EXISTS] [schema_name.]trigger_name\n\nThis statement drops a trigger. The schema (database) name is optional.\nIf the schema is omitted, the trigger is dropped from the default\nschema. DROP TRIGGER requires the TRIGGER privilege for the table\nassociated with the trigger.\n\nUse IF EXISTS to prevent an error from occurring for a trigger that\ndoes not exist. A NOTE is generated for a nonexistent trigger when\nusing IF EXISTS. See [HELP SHOW WARNINGS].\n\nTriggers for a table are also dropped if you drop the table.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-trigger.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-trigger.html'),(143,'RESET MASTER',8,'Syntax:\nRESET MASTER\n\nDeletes all binary log files listed in the index file, resets the\nbinary log index file to be empty, and creates a new binary log file.\nThis statement is intended to be used only when the master is started\nfor the first time.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/reset-master.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/reset-master.html'),(144,'PI',3,'Syntax:\nPI()\n\nReturns the value of π (pi). The default number of decimal places\ndisplayed is seven, but MySQL uses the full double-precision value\ninternally.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT PI();\n        -> 3.141593\nmysql> SELECT PI()+0.000000000000000000;\n        -> 3.141592653589793116\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(145,'/',3,'Syntax:\n/\n\nDivision:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','mysql> SELECT 3/5;\n        -> 0.60\n','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(146,'PURGE BINARY LOGS',8,'Syntax:\nPURGE { BINARY | MASTER } LOGS\n    { TO \'log_name\' | BEFORE datetime_expr }\n\nThe binary log is a set of files that contain information about data\nmodifications made by the MySQL server. The log consists of a set of\nbinary log files, plus an index file (see\nhttp://dev.mysql.com/doc/refman/5.5/en/binary-log.html).\n\nThe PURGE BINARY LOGS statement deletes all the binary log files listed\nin the log index file prior to the specified log file name or date.\nBINARY and MASTER are synonyms. Deleted log files also are removed from\nthe list recorded in the index file, so that the given log file becomes\nthe first in the list.\n\nThis statement has no effect if the server was not started with the\n--log-bin option to enable binary logging.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/purge-binary-logs.html\n\n','PURGE BINARY LOGS TO \'mysql-bin.010\';\nPURGE BINARY LOGS BEFORE \'2008-04-02 22:46:26\';\n','http://dev.mysql.com/doc/refman/5.5/en/purge-binary-logs.html'),(147,'STDDEV_SAMP',16,'Syntax:\nSTDDEV_SAMP(expr)\n\nReturns the sample standard deviation of expr (the square root of\nVAR_SAMP().\n\nIf there are no matching rows, STDDEV_SAMP() returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(148,'SCHEMA',17,'Syntax:\nSCHEMA()\n\nThis function is a synonym for DATABASE().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(149,'MLINEFROMWKB',33,'MLineFromWKB(wkb[, srid]), MultiLineStringFromWKB(wkb[, srid])\n\nConstructs a MultiLineString value using its WKB representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html'),(150,'SHOW CREATE TABLE',27,'Syntax:\nSHOW CREATE TABLE tbl_name\n\nShows the CREATE TABLE statement that creates the named table. To use\nthis statement, you must have some privilege for the table. This\nstatement also works with views.\nSHOW CREATE TABLE quotes table and column names according to the value\nof the sql_quote_show_create option. See\nhttp://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html.\n\nFor information about how CREATE TABLE statements are stored by MySQL,\nsee\nhttp://dev.mysql.com/doc/refman/5.5/en/create-table-statement-retention\n.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-table.html\n\n','mysql> SHOW CREATE TABLE t\\G\n*************************** 1. row ***************************\n       Table: t\nCreate Table: CREATE TABLE `t` (\n  `id` int(11) NOT NULL AUTO_INCREMENT,\n  `s` char(60) DEFAULT NULL,\n  PRIMARY KEY (`id`)\n) ENGINE=InnoDB DEFAULT CHARSET=latin1\n','http://dev.mysql.com/doc/refman/5.5/en/show-create-table.html'),(151,'DUAL',28,'You are permitted to specify DUAL as a dummy table name in situations\nwhere no tables are referenced:\n\nmysql> SELECT 1 + 1 FROM DUAL;\n        -> 2\n\nDUAL is purely for the convenience of people who require that all\nSELECT statements should have FROM and possibly other clauses. MySQL\nmay ignore the clauses. MySQL does not require FROM DUAL if no tables\nare referenced.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/select.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/select.html'),(152,'INSTR',38,'Syntax:\nINSTR(str,substr)\n\nReturns the position of the first occurrence of substring substr in\nstring str. This is the same as the two-argument form of LOCATE(),\nexcept that the order of the arguments is reversed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT INSTR(\'foobarbar\', \'bar\');\n        -> 4\nmysql> SELECT INSTR(\'xbar\', \'foobar\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(153,'>=',20,'Syntax:\n>=\n\nGreater than or equal:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 2 >= 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(154,'EXP',3,'Syntax:\nEXP(X)\n\nReturns the value of e (the base of natural logarithms) raised to the\npower of X. The inverse of this function is LOG() (using a single\nargument only) or LN().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT EXP(2);\n        -> 7.3890560989307\nmysql> SELECT EXP(-2);\n        -> 0.13533528323661\nmysql> SELECT EXP(0);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(155,'POINTN',13,'PointN(ls, N)\n\nReturns the N-th Point in the Linestring value ls. Points are numbered\nbeginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-linestring-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(PointN(GeomFromText(@ls),2));\n+-------------------------------------+\n| AsText(PointN(GeomFromText(@ls),2)) |\n+-------------------------------------+\n| POINT(2 2)                          |\n+-------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-linestring-property-functions.html'),(156,'OCT',38,'Syntax:\nOCT(N)\n\nReturns a string representation of the octal value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,8). Returns\nNULL if N is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT OCT(12);\n        -> \'14\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(157,'SYSDATE',32,'Syntax:\nSYSDATE()\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS.uuuuuu format, depending on whether the function is\nused in a string or numeric context.\n\nSYSDATE() returns the time at which it executes. This differs from the\nbehavior for NOW(), which returns a constant time that indicates the\ntime at which the statement began to execute. (Within a stored function\nor trigger, NOW() returns the time at which the function or triggering\nstatement began to execute.)\n\nmysql> SELECT NOW(), SLEEP(2), NOW();\n+---------------------+----------+---------------------+\n| NOW()               | SLEEP(2) | NOW()               |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:36 |        0 | 2006-04-12 13:47:36 |\n+---------------------+----------+---------------------+\n\nmysql> SELECT SYSDATE(), SLEEP(2), SYSDATE();\n+---------------------+----------+---------------------+\n| SYSDATE()           | SLEEP(2) | SYSDATE()           |\n+---------------------+----------+---------------------+\n| 2006-04-12 13:47:44 |        0 | 2006-04-12 13:47:46 |\n+---------------------+----------+---------------------+\n\nIn addition, the SET TIMESTAMP statement affects the value returned by\nNOW() but not by SYSDATE(). This means that timestamp settings in the\nbinary log have no effect on invocations of SYSDATE().\n\nBecause SYSDATE() can return different values even within the same\nstatement, and is not affected by SET TIMESTAMP, it is nondeterministic\nand therefore unsafe for replication if statement-based binary logging\nis used. If that is a problem, you can use row-based logging.\n\nAlternatively, you can use the --sysdate-is-now option to cause\nSYSDATE() to be an alias for NOW(). This works if the option is used on\nboth the master and the slave.\n\nThe nondeterministic nature of SYSDATE() also means that indexes cannot\nbe used for evaluating expressions that refer to it.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(158,'UNINSTALL PLUGIN',5,'Syntax:\nUNINSTALL PLUGIN plugin_name\n\nThis statement removes an installed server plugin. It requires the\nDELETE privilege for the mysql.plugin system table. UNINSTALL PLUGIN is\nthe complement of INSTALL PLUGIN.\n\nplugin_name must be the name of some plugin that is listed in the\nmysql.plugin table. The server executes the plugin\'s deinitialization\nfunction and removes the row for the plugin from the mysql.plugin\ntable, so that subsequent server restarts will not load and initialize\nthe plugin. UNINSTALL PLUGIN does not remove the plugin\'s shared\nlibrary file.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/uninstall-plugin.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/uninstall-plugin.html'),(159,'ASBINARY',33,'AsBinary(g), AsWKB(g)\n\nConverts a value in internal geometry format to its WKB representation\nand returns the binary result.\n\nThe result is NULL if the geometry argument is NULL or not a\nsyntactically well-formed geometry.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-format-conversion-functions.html\n\n','SELECT AsBinary(g) FROM geom;\n','http://dev.mysql.com/doc/refman/5.5/en/gis-format-conversion-functions.html'),(160,'SHOW TABLES',27,'Syntax:\nSHOW [FULL] TABLES\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW TABLES lists the non-TEMPORARY tables in a given database. You can\nalso get this list using the mysqlshow db_name command. The LIKE\nclause, if present, indicates which table names to match. The WHERE\nclause can be given to select rows using more general conditions, as\ndiscussed in http://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nMatching performed by the LIKE clause is dependent on the setting of\nthe lower_case_table_names system variable.\n\nThis statement also lists any views in the database. The optional FULL\nmodifier causes SHOW TABLES to display a second output column with\nvalues of BASE TABLE for a table and VIEW for a view.\n\nIf you have no privileges for a base table or view, it does not show up\nin the output from SHOW TABLES or mysqlshow db_name.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-tables.html'),(161,'MAKEDATE',32,'Syntax:\nMAKEDATE(year,dayofyear)\n\nReturns a date, given year and day-of-year values. dayofyear must be\ngreater than 0 or the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT MAKEDATE(2011,31), MAKEDATE(2011,32);\n        -> \'2011-01-31\', \'2011-02-01\'\nmysql> SELECT MAKEDATE(2011,365), MAKEDATE(2014,365);\n        -> \'2011-12-31\', \'2014-12-31\'\nmysql> SELECT MAKEDATE(2011,0);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(162,'BINARY OPERATOR',38,'Syntax:\nBINARY expr\n\nThe BINARY operator converts the expression to a binary string. A\ncommon use for BINARY is to force a character string comparison to be\ndone byte by byte rather than character by character, in effect\nbecoming case sensitive. The BINARY operator also causes trailing\nspaces in comparisons to be significant.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/cast-functions.html\n\n','mysql> SELECT \'a\' = \'A\';\n        -> 1\nmysql> SELECT BINARY \'a\' = \'A\';\n        -> 0\nmysql> SELECT \'a\' = \'a \';\n        -> 1\nmysql> SELECT BINARY \'a\' = \'a \';\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/cast-functions.html'),(163,'MBROVERLAPS',7,'MBROverlaps(g1, g2)\n\nTwo geometries spatially overlap if they intersect and their\nintersection results in a geometry of the same dimension but not equal\nto either of the given geometries.\n\nThis function returns 1 or 0 to indicate whether the minimum bounding\nrectangles of the two geometries g1 and g2 overlap.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html'),(164,'INSERT SELECT',28,'Syntax:\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name\n    [(col_name [, col_name] ...)]\n    SELECT ...\n    [ON DUPLICATE KEY UPDATE assignment_list]\n\nvalue:\n    {expr | DEFAULT}\n\nassignment:\n    col_name = value\n\nassignment_list:\n    assignment [, assignment] ...\n\nWith INSERT ... SELECT, you can quickly insert many rows into a table\nfrom the result of a SELECT statement, which can select from one or\nmany tables. For example:\n\nINSERT INTO tbl_temp2 (fld_id)\n  SELECT tbl_temp1.fld_order_id\n  FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/insert-select.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/insert-select.html'),(165,'CREATE PROCEDURE',40,'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    PROCEDURE sp_name ([proc_parameter[,...]])\n    [characteristic ...] routine_body\n\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    FUNCTION sp_name ([func_parameter[,...]])\n    RETURNS type\n    [characteristic ...] routine_body\n\nproc_parameter:\n    [ IN | OUT | INOUT ] param_name type\n\nfunc_parameter:\n    param_name type\n\ntype:\n    Any valid MySQL data type\n\ncharacteristic:\n    COMMENT \'string\'\n  | LANGUAGE SQL\n  | [NOT] DETERMINISTIC\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nroutine_body:\n    Valid SQL routine statement\n\nThese statements create stored routines. By default, a routine is\nassociated with the default database. To associate the routine\nexplicitly with a given database, specify the name as db_name.sp_name\nwhen you create it.\n\nThe CREATE FUNCTION statement is also used in MySQL to support UDFs\n(user-defined functions). See\nhttp://dev.mysql.com/doc/refman/5.5/en/adding-functions.html. A UDF can\nbe regarded as an external stored function. Stored functions share\ntheir namespace with UDFs. See\nhttp://dev.mysql.com/doc/refman/5.5/en/function-resolution.html, for\nthe rules describing how the server interprets references to different\nkinds of functions.\n\nTo invoke a stored procedure, use the CALL statement (see [HELP CALL]).\nTo invoke a stored function, refer to it in an expression. The function\nreturns a value during expression evaluation.\n\nCREATE PROCEDURE and CREATE FUNCTION require the CREATE ROUTINE\nprivilege. They might also require the SUPER privilege, depending on\nthe DEFINER value, as described later in this section. If binary\nlogging is enabled, CREATE FUNCTION might require the SUPER privilege,\nas described in\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-logging.html.\n\nBy default, MySQL automatically grants the ALTER ROUTINE and EXECUTE\nprivileges to the routine creator. This behavior can be changed by\ndisabling the automatic_sp_privileges system variable. See\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-routines-privileges.html.\n\nThe DEFINER and SQL SECURITY clauses specify the security context to be\nused when checking access privileges at routine execution time, as\ndescribed later in this section.\n\nIf the routine name is the same as the name of a built-in SQL function,\na syntax error occurs unless you use a space between the name and the\nfollowing parenthesis when defining the routine or invoking it later.\nFor this reason, avoid using the names of existing SQL functions for\nyour own stored routines.\n\nThe IGNORE_SPACE SQL mode applies to built-in functions, not to stored\nroutines. It is always permissible to have spaces after a stored\nroutine name, regardless of whether IGNORE_SPACE is enabled.\n\nThe parameter list enclosed within parentheses must always be present.\nIf there are no parameters, an empty parameter list of () should be\nused. Parameter names are not case sensitive.\n\nEach parameter is an IN parameter by default. To specify otherwise for\na parameter, use the keyword OUT or INOUT before the parameter name.\n\n*Note*:\n\nSpecifying a parameter as IN, OUT, or INOUT is valid only for a\nPROCEDURE. For a FUNCTION, parameters are always regarded as IN\nparameters.\n\nAn IN parameter passes a value into a procedure. The procedure might\nmodify the value, but the modification is not visible to the caller\nwhen the procedure returns. An OUT parameter passes a value from the\nprocedure back to the caller. Its initial value is NULL within the\nprocedure, and its value is visible to the caller when the procedure\nreturns. An INOUT parameter is initialized by the caller, can be\nmodified by the procedure, and any change made by the procedure is\nvisible to the caller when the procedure returns.\n\nFor each OUT or INOUT parameter, pass a user-defined variable in the\nCALL statement that invokes the procedure so that you can obtain its\nvalue when the procedure returns. If you are calling the procedure from\nwithin another stored procedure or function, you can also pass a\nroutine parameter or local routine variable as an IN or INOUT\nparameter.\n\nRoutine parameters cannot be referenced in statements prepared within\nthe routine; see\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-program-restrictions.html\n.\n\nThe following example shows a simple stored procedure that uses an OUT\nparameter:\n\nmysql> delimiter //\n\nmysql> CREATE PROCEDURE simpleproc (OUT param1 INT)\n    -> BEGIN\n    ->   SELECT COUNT(*) INTO param1 FROM t;\n    -> END//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter ;\n\nmysql> CALL simpleproc(@a);\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT @a;\n+------+\n| @a   |\n+------+\n| 3    |\n+------+\n1 row in set (0.00 sec)\n\nThe example uses the mysql client delimiter command to change the\nstatement delimiter from ; to // while the procedure is being defined.\nThis enables the ; delimiter used in the procedure body to be passed\nthrough to the server rather than being interpreted by mysql itself.\nSee\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-defining.html.\n\nThe RETURNS clause may be specified only for a FUNCTION, for which it\nis mandatory. It indicates the return type of the function, and the\nfunction body must contain a RETURN value statement. If the RETURN\nstatement returns a value of a different type, the value is coerced to\nthe proper type. For example, if a function specifies an ENUM or SET\nvalue in the RETURNS clause, but the RETURN statement returns an\ninteger, the value returned from the function is the string for the\ncorresponding ENUM member of set of SET members.\n\nThe following example function takes a parameter, performs an operation\nusing an SQL function, and returns the result. In this case, it is\nunnecessary to use delimiter because the function definition contains\nno internal ; statement delimiters:\n\nmysql> CREATE FUNCTION hello (s CHAR(20))\nmysql> RETURNS CHAR(50) DETERMINISTIC\n    -> RETURN CONCAT(\'Hello, \',s,\'!\');\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT hello(\'world\');\n+----------------+\n| hello(\'world\') |\n+----------------+\n| Hello, world!  |\n+----------------+\n1 row in set (0.00 sec)\n\nParameter types and function return types can be declared to use any\nvalid data type, except that the COLLATE attribute cannot be used prior\nto MySQL 5.5.3. As of 5.5.3, COLLATE can be used if preceded by the\nCHARACTER SET attribute.\n\nThe routine_body consists of a valid SQL routine statement. This can be\na simple statement such as SELECT or INSERT, or a compound statement\nwritten using BEGIN and END. Compound statements can contain\ndeclarations, loops, and other control structure statements. The syntax\nfor these statements is described in\nhttp://dev.mysql.com/doc/refman/5.5/en/sql-syntax-compound-statements.h\ntml.\n\nMySQL permits routines to contain DDL statements, such as CREATE and\nDROP. MySQL also permits stored procedures (but not stored functions)\nto contain SQL transaction statements such as COMMIT. Stored functions\nmay not contain statements that perform explicit or implicit commit or\nrollback. Support for these statements is not required by the SQL\nstandard, which states that each DBMS vendor may decide whether to\npermit them.\n\nStatements that return a result set can be used within a stored\nprocedure but not within a stored function. This prohibition includes\nSELECT statements that do not have an INTO var_list clause and other\nstatements such as SHOW, EXPLAIN, and CHECK TABLE. For statements that\ncan be determined at function definition time to return a result set, a\nNot allowed to return a result set from a function error occurs\n(ER_SP_NO_RETSET). For statements that can be determined only at\nruntime to return a result set, a PROCEDURE %s can\'t return a result\nset in the given context error occurs (ER_SP_BADSELECT).\n\nUSE statements within stored routines are not permitted. When a routine\nis invoked, an implicit USE db_name is performed (and undone when the\nroutine terminates). The causes the routine to have the given default\ndatabase while it executes. References to objects in databases other\nthan the routine default database should be qualified with the\nappropriate database name.\n\nFor additional information about statements that are not permitted in\nstored routines, see\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-program-restrictions.html\n.\n\nFor information about invoking stored procedures from within programs\nwritten in a language that has a MySQL interface, see [HELP CALL].\n\nMySQL stores the sql_mode system variable setting in effect when a\nroutine is created or altered, and always executes the routine with\nthis setting in force, regardless of the current server SQL mode when\nthe routine begins executing.\n\nThe switch from the SQL mode of the invoker to that of the routine\noccurs after evaluation of arguments and assignment of the resulting\nvalues to routine parameters. If you define a routine in strict SQL\nmode but invoke it in nonstrict mode, assignment of arguments to\nroutine parameters does not take place in strict mode. If you require\nthat expressions passed to a routine be assigned in strict SQL mode,\nyou should invoke the routine with strict mode in effect.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-procedure.html'),(166,'NOT REGEXP',38,'Syntax:\nexpr NOT REGEXP pat, expr NOT RLIKE pat\n\nThis is the same as NOT (expr REGEXP pat).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/regexp.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/regexp.html'),(167,'LEAVE',24,'Syntax:\nLEAVE label\n\nThis statement is used to exit the flow control construct that has the\ngiven label. If the label is for the outermost stored program block,\nLEAVE exits the program.\n\nLEAVE can be used within BEGIN ... END or loop constructs (LOOP,\nREPEAT, WHILE).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/leave.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/leave.html'),(168,'NOT IN',20,'Syntax:\nexpr NOT IN (value,...)\n\nThis is the same as NOT (expr IN (value,...)).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(169,'X',11,'X(p)\n\nReturns the X-coordinate value for the Point object p as a\ndouble-precision number.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-point-property-functions.html\n\n','mysql> SELECT X(Point(56.7, 53.34));\n+-----------------------+\n| X(Point(56.7, 53.34)) |\n+-----------------------+\n|                  56.7 |\n+-----------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-point-property-functions.html'),(170,'FOUND_ROWS',17,'Syntax:\nFOUND_ROWS()\n\nA SELECT statement may include a LIMIT clause to restrict the number of\nrows the server returns to the client. In some cases, it is desirable\nto know how many rows the statement would have returned without the\nLIMIT, but without running the statement again. To obtain this row\ncount, include an SQL_CALC_FOUND_ROWS option in the SELECT statement,\nand then invoke FOUND_ROWS() afterward:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT SQL_CALC_FOUND_ROWS * FROM tbl_name\n    -> WHERE id > 100 LIMIT 10;\nmysql> SELECT FOUND_ROWS();\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(171,'CROSSES',31,'Crosses(g1, g2)\n\nThe term spatially crosses denotes a spatial relation between two given\ngeometries that has the following properties:\n\no The two geometries intersect.\n\no Their intersection results in a geometry that has a dimension that is\n  one less than the maximum dimension of the two given geometries.\n\no Their intersection is not equal to either of the two given\n  geometries.\n\nThis function returns 1 or 0 to indicate whether g1 spatially crosses\ng2. If g1 is a Polygon or a MultiPolygon, or if g2 is a Point or a\nMultiPoint, the return value is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-object-shapes.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-object-shapes.html'),(172,'BIT_XOR',16,'Syntax:\nBIT_XOR(expr)\n\nReturns the bitwise XOR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nIf there are no matching rows, BIT_XOR() returns a neutral value (all\nbits set to 0).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(173,'FLUSH',27,'Syntax:\nFLUSH [NO_WRITE_TO_BINLOG | LOCAL] {\n    flush_option [, flush_option] ...\n  | tables_option\n}\n\nflush_option: {\n    BINARY LOGS\n  | DES_KEY_FILE\n  | ENGINE LOGS\n  | ERROR LOGS\n  | GENERAL LOGS\n  | HOSTS\n  | LOGS\n  | MASTER\n  | PRIVILEGES\n  | QUERY CACHE\n  | RELAY LOGS\n  | SLAVE\n  | SLOW LOGS\n  | STATUS\n  | USER_RESOURCES\n}\n\ntables_option: {\n    TABLES\n  | TABLES tbl_name [, tbl_name] ...\n  | TABLES WITH READ LOCK\n  | TABLES tbl_name [, tbl_name] ... WITH READ LOCK\n}\n\nThe FLUSH statement has several variant forms that clear or reload\nvarious internal caches, flush tables, or acquire locks. To execute\nFLUSH, you must have the RELOAD privilege. Specific flush options might\nrequire additional privileges, as described later.\n\n*Note*:\n\nIt is not possible to issue FLUSH statements within stored functions or\ntriggers. However, you may use FLUSH in stored procedures, so long as\nthese are not called from stored functions or triggers. See\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-program-restrictions.html\n.\n\nBy default, the server writes FLUSH statements to the binary log so\nthat they replicate to replication slaves. To suppress logging, specify\nthe optional NO_WRITE_TO_BINLOG keyword or its alias LOCAL.\n\n*Note*:\n\nFLUSH LOGS, FLUSH MASTER, FLUSH SLAVE, and FLUSH TABLES WITH READ LOCK\n(with or without a table list) are not written to the binary log in any\ncase because they would cause problems if replicated to a slave.\n\nThe FLUSH statement causes an implicit commit. See\nhttp://dev.mysql.com/doc/refman/5.5/en/implicit-commit.html.\n\nThe mysqladmin utility provides a command-line interface to some flush\noperations, using commands such as flush-hosts, flush-logs,\nflush-privileges, flush-status, and flush-tables. See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysqladmin.html.\n\nSending a SIGHUP signal to the server causes several flush operations\nto occur that are similar to various forms of the FLUSH statement. See\nhttp://dev.mysql.com/doc/refman/5.5/en/server-signal-response.html.\n\nThe RESET statement is similar to FLUSH. See [HELP RESET], for\ninformation about using the RESET statement with replication.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/flush.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/flush.html'),(174,'BEGIN END',24,'Syntax:\n[begin_label:] BEGIN\n    [statement_list]\nEND [end_label]\n\nBEGIN ... END syntax is used for writing compound statements, which can\nappear within stored programs (stored procedures and functions,\ntriggers, and events). A compound statement can contain multiple\nstatements, enclosed by the BEGIN and END keywords. statement_list\nrepresents a list of one or more statements, each terminated by a\nsemicolon (;) statement delimiter. The statement_list itself is\noptional, so the empty compound statement (BEGIN END) is legal.\n\nBEGIN ... END blocks can be nested.\n\nUse of multiple statements requires that a client is able to send\nstatement strings containing the ; statement delimiter. In the mysql\ncommand-line client, this is handled with the delimiter command.\nChanging the ; end-of-statement delimiter (for example, to //) permit ;\nto be used in a program body. For an example, see\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-defining.html.\n\nA BEGIN ... END block can be labeled. See [HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/begin-end.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/begin-end.html'),(175,'SHOW PROCEDURE STATUS',27,'Syntax:\nSHOW PROCEDURE STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is a MySQL extension. It returns characteristics of a\nstored procedure, such as the database, name, type, creator, creation\nand modification dates, and character set information. A similar\nstatement, SHOW FUNCTION STATUS, displays information about stored\nfunctions (see [HELP SHOW FUNCTION STATUS]).\n\nThe LIKE clause, if present, indicates which procedure or function\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-procedure-status.html\n\n','mysql> SHOW PROCEDURE STATUS LIKE \'sp1\'\\G\n*************************** 1. row ***************************\n                  Db: test\n                Name: sp1\n                Type: PROCEDURE\n             Definer: testuser@localhost\n            Modified: 2004-08-03 15:29:37\n             Created: 2004-08-03 15:29:37\n       Security_type: DEFINER\n             Comment:\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n','http://dev.mysql.com/doc/refman/5.5/en/show-procedure-status.html'),(176,'STDDEV_POP',16,'Syntax:\nSTDDEV_POP(expr)\n\nReturns the population standard deviation of expr (the square root of\nVAR_POP()). You can also use STD() or STDDEV(), which are equivalent\nbut not standard SQL.\n\nIf there are no matching rows, STDDEV_POP() returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(177,'SHOW CHARACTER SET',27,'Syntax:\nSHOW CHARACTER SET\n    [LIKE \'pattern\' | WHERE expr]\n\nThe SHOW CHARACTER SET statement shows all available character sets.\nThe LIKE clause, if present, indicates which character set names to\nmatch. The WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html. For example:\n\nmysql> SHOW CHARACTER SET LIKE \'latin%\';\n+---------+-----------------------------+-------------------+--------+\n| Charset | Description                 | Default collation | Maxlen |\n+---------+-----------------------------+-------------------+--------+\n| latin1  | cp1252 West European        | latin1_swedish_ci |      1 |\n| latin2  | ISO 8859-2 Central European | latin2_general_ci |      1 |\n| latin5  | ISO 8859-9 Turkish          | latin5_turkish_ci |      1 |\n| latin7  | ISO 8859-13 Baltic          | latin7_general_ci |      1 |\n+---------+-----------------------------+-------------------+--------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-character-set.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-character-set.html'),(178,'INTERSECTS',7,'Intersects(g1, g2)\n\nReturns 1 or 0 to indicate whether g1 spatially intersects g2.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html'),(179,'LOOP',24,'Syntax:\n[begin_label:] LOOP\n    statement_list\nEND LOOP [end_label]\n\nLOOP implements a simple loop construct, enabling repeated execution of\nthe statement list, which consists of one or more statements, each\nterminated by a semicolon (;) statement delimiter. The statements\nwithin the loop are repeated until the loop is terminated. Usually,\nthis is accomplished with a LEAVE statement. Within a stored function,\nRETURN can also be used, which exits the function entirely.\n\nNeglecting to include a loop-termination statement results in an\ninfinite loop.\n\nA LOOP statement can be labeled. For the rules regarding label use, see\n[HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/loop.html\n\n','CREATE PROCEDURE doiterate(p1 INT)\nBEGIN\n  label1: LOOP\n    SET p1 = p1 + 1;\n    IF p1 < 10 THEN\n      ITERATE label1;\n    END IF;\n    LEAVE label1;\n  END LOOP label1;\n  SET @x = p1;\nEND;\n','http://dev.mysql.com/doc/refman/5.5/en/loop.html'),(180,'GREATEST',20,'Syntax:\nGREATEST(value1,value2,...)\n\nWith two or more arguments, returns the largest (maximum-valued)\nargument. The arguments are compared using the same rules as for\nLEAST().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT GREATEST(2,0);\n        -> 2\nmysql> SELECT GREATEST(34.0,3.0,5.0,767.0);\n        -> 767.0\nmysql> SELECT GREATEST(\'B\',\'A\',\'C\');\n        -> \'C\'\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(181,'BIT_AND',16,'Syntax:\nBIT_AND(expr)\n\nReturns the bitwise AND of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nIf there are no matching rows, BIT_AND() returns a neutral value (all\nbits set to 1).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(182,'SECOND',32,'Syntax:\nSECOND(time)\n\nReturns the second for time, in the range 0 to 59.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT SECOND(\'10:05:03\');\n        -> 3\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(183,'MBRCONTAINS',7,'MBRContains(g1, g2)\n\nReturns 1 or 0 to indicate whether the minimum bounding rectangle of g1\ncontains the minimum bounding rectangle of g2. This tests the opposite\nrelationship as MBRWithin().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html\n\n','mysql> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nmysql> SET @g2 = GeomFromText(\'Point(1 1)\');\nmysql> SELECT MBRContains(@g1,@g2), MBRWithin(@g2,@g1);\n+----------------------+--------------------+\n| MBRContains(@g1,@g2) | MBRWithin(@g2,@g1) |\n+----------------------+--------------------+\n|                    1 |                  1 |\n+----------------------+--------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html'),(184,'COT',3,'Syntax:\nCOT(X)\n\nReturns the cotangent of X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT COT(12);\n        -> -1.5726734063977\nmysql> SELECT COT(0);\n        -> out-of-range error\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(185,'SHOW CREATE EVENT',27,'Syntax:\nSHOW CREATE EVENT event_name\n\nThis statement displays the CREATE EVENT statement needed to re-create\na given event. It requires the EVENT privilege for the database from\nwhich the event is to be shown. For example (using the same event\ne_daily defined and then altered in [HELP SHOW EVENTS]):\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-event.html\n\n','mysql> SHOW CREATE EVENT test.e_daily\\G\n*************************** 1. row ***************************\n               Event: e_daily\n            sql_mode:\n           time_zone: SYSTEM\n        Create Event: CREATE EVENT `e_daily`\n                        ON SCHEDULE EVERY 1 DAY\n                        STARTS CURRENT_TIMESTAMP + INTERVAL 6 HOUR\n                        ON COMPLETION NOT PRESERVE\n                        ENABLE\n                        COMMENT \'Saves total number of sessions then\n                                clears the table each day\'\n                        DO BEGIN\n                          INSERT INTO site_activity.totals (time, total)\n                            SELECT CURRENT_TIMESTAMP, COUNT(*)\n                            FROM site_activity.sessions;\n                          DELETE FROM site_activity.sessions;\n                        END\ncharacter_set_client: latin1\ncollation_connection: latin1_swedish_ci\n  Database Collation: latin1_swedish_ci\n','http://dev.mysql.com/doc/refman/5.5/en/show-create-event.html'),(186,'OR',15,'Syntax:\nOR, ||\n\nLogical OR. When both operands are non-NULL, the result is 1 if any\noperand is nonzero, and 0 otherwise. With a NULL operand, the result is\n1 if the other operand is nonzero, and NULL otherwise. If both operands\nare NULL, the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html\n\n','mysql> SELECT 1 OR 1;\n        -> 1\nmysql> SELECT 1 OR 0;\n        -> 1\nmysql> SELECT 0 OR 0;\n        -> 0\nmysql> SELECT 0 OR NULL;\n        -> NULL\nmysql> SELECT 1 OR NULL;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html'),(187,'LOAD_FILE',38,'Syntax:\nLOAD_FILE(file_name)\n\nReads the file and returns the file contents as a string. To use this\nfunction, the file must be located on the server host, you must specify\nthe full path name to the file, and you must have the FILE privilege.\nThe file must be readable by all and its size less than\nmax_allowed_packet bytes. If the secure_file_priv system variable is\nset to a nonempty directory name, the file to be loaded must be located\nin that directory.\n\nIf the file does not exist or cannot be read because one of the\npreceding conditions is not satisfied, the function returns NULL.\n\nThe character_set_filesystem system variable controls interpretation of\nfile names that are given as literal strings.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> UPDATE t\n            SET blob_col=LOAD_FILE(\'/tmp/picture\')\n            WHERE id=1;\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(188,'POINTFROMTEXT',4,'PointFromText(wkt[, srid])\n\nConstructs a Point value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html'),(189,'DATE_FORMAT',32,'Syntax:\nDATE_FORMAT(date,format)\n\nFormats the date value according to the format string.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DATE_FORMAT(\'2009-10-04 22:23:00\', \'%W %M %Y\');\n        -> \'Sunday October 2009\'\nmysql> SELECT DATE_FORMAT(\'2007-10-04 22:23:00\', \'%H:%i:%s\');\n        -> \'22:23:00\'\nmysql> SELECT DATE_FORMAT(\'1900-10-04 22:23:00\',\n    ->                 \'%D %y %a %d %m %b %j\');\n        -> \'4th 00 Thu 04 10 Oct 277\'\nmysql> SELECT DATE_FORMAT(\'1997-10-04 22:23:00\',\n    ->                 \'%H %k %I %r %T %S %w\');\n        -> \'22 22 10 10:23:00 PM 22:23:00 00 6\'\nmysql> SELECT DATE_FORMAT(\'1999-01-01\', \'%X %V\');\n        -> \'1998 52\'\nmysql> SELECT DATE_FORMAT(\'2006-06-00\', \'%d\');\n        -> \'00\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(190,'YEAR',32,'Syntax:\nYEAR(date)\n\nReturns the year for date, in the range 1000 to 9999, or 0 for the\n\"zero\" date.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT YEAR(\'1987-01-01\');\n        -> 1987\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(191,'IS NULL',20,'Syntax:\nIS NULL\n\nTests whether a value is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;\n        -> 0, 0, 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(192,'ALTER SERVER',40,'Syntax:\nALTER SERVER  server_name\n    OPTIONS (option [, option] ...)\n\nAlters the server information for server_name, adjusting any of the\noptions permitted in the CREATE SERVER statement. The corresponding\nfields in the mysql.servers table are updated accordingly. This\nstatement requires the SUPER privilege.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-server.html\n\n','ALTER SERVER s OPTIONS (USER \'sally\');\n','http://dev.mysql.com/doc/refman/5.5/en/alter-server.html'),(193,'RESIGNAL',24,'Syntax:\nRESIGNAL [condition_value]\n    [SET signal_information_item\n    [, signal_information_item] ...]\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n\nsignal_information_item:\n    condition_information_item_name = simple_value_specification\n\ncondition_information_item_name:\n    CLASS_ORIGIN\n  | SUBCLASS_ORIGIN\n  | MESSAGE_TEXT\n  | MYSQL_ERRNO\n  | CONSTRAINT_CATALOG\n  | CONSTRAINT_SCHEMA\n  | CONSTRAINT_NAME\n  | CATALOG_NAME\n  | SCHEMA_NAME\n  | TABLE_NAME\n  | COLUMN_NAME\n  | CURSOR_NAME\n\ncondition_name, simple_value_specification:\n    (see following discussion)\n\nRESIGNAL passes on the error condition information that is available\nduring execution of a condition handler within a compound statement\ninside a stored procedure or function, trigger, or event. RESIGNAL may\nchange some or all information before passing it on. RESIGNAL is\nrelated to SIGNAL, but instead of originating a condition as SIGNAL\ndoes, RESIGNAL relays existing condition information, possibly after\nmodifying it.\n\nRESIGNAL makes it possible to both handle an error and return the error\ninformation. Otherwise, by executing an SQL statement within the\nhandler, information that caused the handler\'s activation is destroyed.\nRESIGNAL also can make some procedures shorter if a given handler can\nhandle part of a situation, then pass the condition \"up the line\" to\nanother handler.\n\nNo special privileges are required to execute the RESIGNAL statement.\n\nAll forms of RESIGNAL require that the current context be a condition\nhandler. Otherwise, RESIGNAL is illegal and a RESIGNAL when handler not\nactive error occurs.\n\nFor condition_value and signal_information_item, the definitions and\nrules are the same for RESIGNAL as for SIGNAL. For example, the\ncondition_value can be an SQLSTATE value, and the value can indicate\nerrors, warnings, or \"not found.\" For additional information, see [HELP\nSIGNAL].\n\nThe RESIGNAL statement takes condition_value and SET clauses, both of\nwhich are optional. This leads to several possible uses:\n\no RESIGNAL alone:\n\nRESIGNAL;\n\no RESIGNAL with new signal information:\n\nRESIGNAL SET signal_information_item [, signal_information_item] ...;\n\no RESIGNAL with a condition value and possibly new signal information:\n\nRESIGNAL condition_value\n    [SET signal_information_item [, signal_information_item] ...];\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/resignal.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/resignal.html'),(194,'TIME FUNCTION',32,'Syntax:\nTIME(expr)\n\nExtracts the time part of the time or datetime expression expr and\nreturns it as a string.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIME(\'2003-12-31 01:02:03\');\n        -> \'01:02:03\'\nmysql> SELECT TIME(\'2003-12-31 01:02:03.000123\');\n        -> \'01:02:03.000123\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(195,'DATE_ADD',32,'Syntax:\nDATE_ADD(date,INTERVAL expr unit), DATE_SUB(date,INTERVAL expr unit)\n\nThese functions perform date arithmetic. The date argument specifies\nthe starting date or datetime value. expr is an expression specifying\nthe interval value to be added or subtracted from the starting date.\nexpr is a string; it may start with a - for negative intervals. unit is\na keyword indicating the units in which the expression should be\ninterpreted.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT \'2008-12-31 23:59:59\' + INTERVAL 1 SECOND;\n        -> \'2009-01-01 00:00:00\'\nmysql> SELECT INTERVAL 1 DAY + \'2008-12-31\';\n        -> \'2009-01-01\'\nmysql> SELECT \'2005-01-01\' - INTERVAL 1 SECOND;\n        -> \'2004-12-31 23:59:59\'\nmysql> SELECT DATE_ADD(\'2000-12-31 23:59:59\',\n    ->                 INTERVAL 1 SECOND);\n        -> \'2001-01-01 00:00:00\'\nmysql> SELECT DATE_ADD(\'2010-12-31 23:59:59\',\n    ->                 INTERVAL 1 DAY);\n        -> \'2011-01-01 23:59:59\'\nmysql> SELECT DATE_ADD(\'2100-12-31 23:59:59\',\n    ->                 INTERVAL \'1:1\' MINUTE_SECOND);\n        -> \'2101-01-01 00:01:00\'\nmysql> SELECT DATE_SUB(\'2005-01-01 00:00:00\',\n    ->                 INTERVAL \'1 1:1:1\' DAY_SECOND);\n        -> \'2004-12-30 22:58:59\'\nmysql> SELECT DATE_ADD(\'1900-01-01 00:00:00\',\n    ->                 INTERVAL \'-1 10\' DAY_HOUR);\n        -> \'1899-12-30 14:00:00\'\nmysql> SELECT DATE_SUB(\'1998-01-02\', INTERVAL 31 DAY);\n        -> \'1997-12-02\'\nmysql> SELECT DATE_ADD(\'1992-12-31 23:59:59.000002\',\n    ->            INTERVAL \'1.999999\' SECOND_MICROSECOND);\n        -> \'1993-01-01 00:00:01.000001\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(196,'LIKE',38,'Syntax:\nexpr LIKE pat [ESCAPE \'escape_char\']\n\nPattern matching using an SQL pattern. Returns 1 (TRUE) or 0 (FALSE).\nIf either expr or pat is NULL, the result is NULL.\n\nThe pattern need not be a literal string. For example, it can be\nspecified as a string expression or table column.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-comparison-functions.html\n\n','mysql> SELECT \'David!\' LIKE \'David_\';\n        -> 1\nmysql> SELECT \'David!\' LIKE \'%D%v%\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/string-comparison-functions.html'),(197,'MULTIPOINT',25,'MultiPoint(pt1, pt2, ...)\n\nConstructs a MultiPoint value using Point or WKB Point arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html'),(198,'>>',19,'Syntax:\n>>\n\nShifts a longlong (BIGINT) number to the right.\n\nThe result is an unsigned 64-bit integer. The value is truncated to 64\nbits. In particular, if the shift count is greater or equal to the\nwidth of an unsigned 64-bit number, the result is zero.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT 4 >> 2;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(199,'FETCH',24,'Syntax:\nFETCH [[NEXT] FROM] cursor_name INTO var_name [, var_name] ...\n\nThis statement fetches the next row for the SELECT statement associated\nwith the specified cursor (which must be open), and advances the cursor\npointer. If a row exists, the fetched columns are stored in the named\nvariables. The number of columns retrieved by the SELECT statement must\nmatch the number of output variables specified in the FETCH statement.\n\nIf no more rows are available, a No Data condition occurs with SQLSTATE\nvalue \'02000\'. To detect this condition, you can set up a handler for\nit (or for a NOT FOUND condition). For an example, see\nhttp://dev.mysql.com/doc/refman/5.5/en/cursors.html.\n\nBe aware that another operation, such as a SELECT or another FETCH, may\nalso cause the handler to execute by raising the same condition. If it\nis necessary to distinguish which operation raised the condition, place\nthe operation within its own BEGIN ... END block so that it can be\nassociated with its own handler.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/fetch.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/fetch.html'),(200,'TRUE FALSE',30,'The constants TRUE and FALSE evaluate to 1 and 0, respectively. The\nconstant names can be written in any lettercase.\n\nmysql> SELECT TRUE, true, FALSE, false;\n        -> 1, 1, 0, 0\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/boolean-literals.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/boolean-literals.html'),(201,'MBRWITHIN',7,'MBRWithin(g1, g2)\n\nReturns 1 or 0 to indicate whether the minimum bounding rectangle of g1\nis within the minimum bounding rectangle of g2. This tests the opposite\nrelationship as MBRContains().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html\n\n','mysql> SET @g1 = GeomFromText(\'Polygon((0 0,0 3,3 3,3 0,0 0))\');\nmysql> SET @g2 = GeomFromText(\'Polygon((0 0,0 5,5 5,5 0,0 0))\');\nmysql> SELECT MBRWithin(@g1,@g2), MBRWithin(@g2,@g1);\n+--------------------+--------------------+\n| MBRWithin(@g1,@g2) | MBRWithin(@g2,@g1) |\n+--------------------+--------------------+\n|                  1 |                  0 |\n+--------------------+--------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html'),(202,'SESSION_USER',17,'Syntax:\nSESSION_USER()\n\nSESSION_USER() is a synonym for USER().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(203,'SHOW CREATE FUNCTION',27,'Syntax:\nSHOW CREATE FUNCTION func_name\n\nThis statement is similar to SHOW CREATE PROCEDURE but for stored\nfunctions. See [HELP SHOW CREATE PROCEDURE].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-function.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-create-function.html'),(204,'STR_TO_DATE',32,'Syntax:\nSTR_TO_DATE(str,format)\n\nThis is the inverse of the DATE_FORMAT() function. It takes a string\nstr and a format string format. STR_TO_DATE() returns a DATETIME value\nif the format string contains both date and time parts, or a DATE or\nTIME value if the string contains only date or time parts. If the date,\ntime, or datetime value extracted from str is illegal, STR_TO_DATE()\nreturns NULL and produces a warning.\n\nThe server scans str attempting to match format to it. The format\nstring can contain literal characters and format specifiers beginning\nwith %. Literal characters in format must match literally in str.\nFormat specifiers in format must match a date or time part in str. For\nthe specifiers that can be used in format, see the DATE_FORMAT()\nfunction description.\n\nmysql> SELECT STR_TO_DATE(\'01,5,2013\',\'%d,%m,%Y\');\n        -> \'2013-05-01\'\nmysql> SELECT STR_TO_DATE(\'May 1, 2013\',\'%M %d,%Y\');\n        -> \'2013-05-01\'\n\nScanning starts at the beginning of str and fails if format is found\nnot to match. Extra characters at the end of str are ignored.\n\nmysql> SELECT STR_TO_DATE(\'a09:30:17\',\'a%h:%i:%s\');\n        -> \'09:30:17\'\nmysql> SELECT STR_TO_DATE(\'a09:30:17\',\'%h:%i:%s\');\n        -> NULL\nmysql> SELECT STR_TO_DATE(\'09:30:17a\',\'%h:%i:%s\');\n        -> \'09:30:17\'\n\nUnspecified date or time parts have a value of 0, so incompletely\nspecified values in str produce a result with some or all parts set to\n0:\n\nmysql> SELECT STR_TO_DATE(\'abc\',\'abc\');\n        -> \'0000-00-00\'\nmysql> SELECT STR_TO_DATE(\'9\',\'%m\');\n        -> \'0000-09-00\'\nmysql> SELECT STR_TO_DATE(\'9\',\'%s\');\n        -> \'00:00:09\'\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(205,'Y',11,'Y(p)\n\nReturns the Y-coordinate value for the Point object p as a\ndouble-precision number.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-point-property-functions.html\n\n','mysql> SELECT Y(Point(56.7, 53.34));\n+-----------------------+\n| Y(Point(56.7, 53.34)) |\n+-----------------------+\n|                 53.34 |\n+-----------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-point-property-functions.html'),(206,'CHECKSUM TABLE',21,'Syntax:\nCHECKSUM TABLE tbl_name [, tbl_name] ... [QUICK | EXTENDED]\n\nCHECKSUM TABLE reports a table checksum.\n\nThis statement requires the SELECT privilege for the table.\n\nThis statement is not supported for views. If you run CHECKSUM TABLE\nagainst a view, the Checksum value is always NULL, and a warning is\nreturned.\n\nFor a nonexistent table, CHECKSUM TABLE returns NULL and generates a\nwarning.\n\nDuring the checksum operation, the table is locked with a read lock for\nInnoDB and MyISAM.\n\nWith QUICK, the live table checksum is reported if it is available, or\nNULL otherwise. This is very fast. A live checksum is enabled by\nspecifying the CHECKSUM=1 table option when you create the table;\ncurrently, this is supported only for MyISAM tables. The QUICK method\nis not supported with InnoDB tables. See [HELP CREATE TABLE].\n\nWith EXTENDED, the entire table is read row by row and the checksum is\ncalculated. This can be very slow for large tables.\n\nIf neither QUICK nor EXTENDED is specified, MySQL returns a live\nchecksum if the table storage engine supports it and scans the table\notherwise.\n\nIn MySQL 5.5, CHECKSUM TABLE returns 0 for partitioned tables unless\nyou include the EXTENDED option. This issue is resolved in MySQL 5.6.\n(Bug #11933226, Bug #60681)\n\nThe checksum value depends on the table row format. If the row format\nchanges, the checksum also changes. For example, the storage format for\ntemporal types such as TIME, DATETIME, and TIMESTAMP changes in MySQL\n5.6 prior to MySQL 5.6.5, so if a 5.5 table is upgraded to MySQL 5.6,\nthe checksum value may change.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/checksum-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/checksum-table.html'),(207,'NUMINTERIORRINGS',2,'NumInteriorRings(poly)\n\nReturns the number of interior rings in the Polygon value poly.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-polygon-property-functions.html\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT NumInteriorRings(GeomFromText(@poly));\n+---------------------------------------+\n| NumInteriorRings(GeomFromText(@poly)) |\n+---------------------------------------+\n|                                     1 |\n+---------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-polygon-property-functions.html'),(208,'INTERIORRINGN',2,'InteriorRingN(poly, N)\n\nReturns the N-th interior ring for the Polygon value poly as a\nLineString. Rings are numbered beginning with 1.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-polygon-property-functions.html\n\n','mysql> SET @poly =\n    -> \'Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))\';\nmysql> SELECT AsText(InteriorRingN(GeomFromText(@poly),1));\n+----------------------------------------------+\n| AsText(InteriorRingN(GeomFromText(@poly),1)) |\n+----------------------------------------------+\n| LINESTRING(1 1,1 2,2 2,2 1,1 1)              |\n+----------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-polygon-property-functions.html'),(209,'UTC_TIME',32,'Syntax:\nUTC_TIME, UTC_TIME()\n\nReturns the current UTC time as a value in \'HH:MM:SS\' or HHMMSS.uuuuuu\nformat, depending on whether the function is used in a string or\nnumeric context.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_TIME(), UTC_TIME() + 0;\n        -> \'18:07:53\', 180753.000000\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(210,'DROP FUNCTION',40,'The DROP FUNCTION statement is used to drop stored functions and\nuser-defined functions (UDFs):\n\no For information about dropping stored functions, see [HELP DROP\n  PROCEDURE].\n\no For information about dropping user-defined functions, see [HELP DROP\n  FUNCTION UDF].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-function.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-function.html'),(211,'STDDEV',16,'Syntax:\nSTDDEV(expr)\n\nReturns the population standard deviation of expr. STDDEV() is a\nsynonym for the standard SQL function STDDEV_POP(), provided for\ncompatibility with Oracle.\n\nIf there are no matching rows, STDDEV() returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(212,'PERIOD_ADD',32,'Syntax:\nPERIOD_ADD(P,N)\n\nAdds N months to period P (in the format YYMM or YYYYMM). Returns a\nvalue in the format YYYYMM. Note that the period argument P is not a\ndate value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT PERIOD_ADD(200801,2);\n        -> 200803\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(213,'RIGHT',38,'Syntax:\nRIGHT(str,len)\n\nReturns the rightmost len characters from the string str, or NULL if\nany argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT RIGHT(\'foobarbar\', 4);\n        -> \'rbar\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(214,'DROP TABLESPACE',40,'Syntax:\nDROP TABLESPACE tablespace_name\n    ENGINE [=] engine_name\n\nThis statement drops a tablespace that was previously created using\nCREATE TABLESPACE (see [HELP CREATE TABLESPACE]).\n\n*Important*:\n\nThe tablespace to be dropped must not contain any data files; in other\nwords, before you can drop a tablespace, you must first drop each of\nits data files using ALTER TABLESPACE ... DROP DATAFILE (see [HELP\nALTER TABLESPACE]).\n\nThe ENGINE clause (required) specifies the storage engine used by the\ntablespace. Currently, the only accepted values for engine_name are NDB\nand NDBCLUSTER.\n\nDROP TABLESPACE is useful only with Disk Data storage for NDB Cluster.\nSee\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-cluster-disk-data.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-tablespace.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-tablespace.html'),(215,'CHECK TABLE',21,'Syntax:\nCHECK TABLE tbl_name [, tbl_name] ... [option] ...\n\noption = {\n    FOR UPGRADE\n  | QUICK\n  | FAST\n  | MEDIUM\n  | EXTENDED\n  | CHANGED\n}\n\nCHECK TABLE checks a table or tables for errors. For MyISAM tables, the\nkey statistics are updated as well. CHECK TABLE can also check views\nfor problems, such as tables that are referenced in the view definition\nthat no longer exist.\n\nTo check a table, you must have some privilege for it.\n\nCHECK TABLE works for InnoDB, MyISAM, ARCHIVE, and CSV tables.\n\nBefore running CHECK TABLE on InnoDB tables, see\nhttp://dev.mysql.com/doc/refman/5.5/en/check-table.html#check-table-inn\nodb.\n\nCHECK TABLE is supported for partitioned tables, and you can use ALTER\nTABLE ... CHECK PARTITION to check one or more partitions; for more\ninformation, see [HELP ALTER TABLE], and\nhttp://dev.mysql.com/doc/refman/5.5/en/partitioning-maintenance.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/check-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/check-table.html'),(216,'BIN',38,'Syntax:\nBIN(N)\n\nReturns a string representation of the binary value of N, where N is a\nlonglong (BIGINT) number. This is equivalent to CONV(N,10,2). Returns\nNULL if N is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT BIN(12);\n        -> \'1100\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(217,'MULTILINESTRING',25,'MultiLineString(ls1, ls2, ...)\n\nConstructs a MultiLineString value using LineString or WKB LineString\narguments.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html'),(218,'SHOW RELAYLOG EVENTS',27,'Syntax:\nSHOW RELAYLOG EVENTS\n    [IN \'log_name\']\n    [FROM pos]\n    [LIMIT [offset,] row_count]\n\nShows the events in the relay log of a replication slave. If you do not\nspecify \'log_name\', the first relay log is displayed. This statement\nhas no effect on the master.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-relaylog-events.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-relaylog-events.html'),(219,'MPOINTFROMTEXT',4,'MPointFromText(wkt[, srid]), MultiPointFromText(wkt[, srid])\n\nConstructs a MultiPoint value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html'),(220,'SUBSTR',38,'Syntax:\nSUBSTR(str,pos), SUBSTR(str FROM pos), SUBSTR(str,pos,len), SUBSTR(str\nFROM pos FOR len)\n\nSUBSTR() is a synonym for SUBSTRING().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(221,'CHAR',23,'[NATIONAL] CHAR[(M)] [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nA fixed-length string that is always right-padded with spaces to the\nspecified length when stored. M represents the column length in\ncharacters. The range of M is 0 to 255. If M is omitted, the length is\n1.\n\n*Note*:\n\nTrailing spaces are removed when CHAR values are retrieved unless the\nPAD_CHAR_TO_FULL_LENGTH SQL mode is enabled.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(222,'COUNT DISTINCT',16,'Syntax:\nCOUNT(DISTINCT expr,[expr...])\n\nReturns a count of the number of rows with different non-NULL expr\nvalues.\n\nIf there are no matching rows, COUNT(DISTINCT) returns 0.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','mysql> SELECT COUNT(DISTINCT results) FROM student;\n','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(223,'SHOW CREATE VIEW',27,'Syntax:\nSHOW CREATE VIEW view_name\n\nThis statement shows the CREATE VIEW statement that creates the named\nview.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-view.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-create-view.html'),(224,'INTERVAL',20,'Syntax:\nINTERVAL(N,N1,N2,N3,...)\n\nReturns 0 if N < N1, 1 if N < N2 and so on or -1 if N is NULL. All\narguments are treated as integers. It is required that N1 < N2 < N3 <\n... < Nn for this function to work correctly. This is because a binary\nsearch is used (very fast).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT INTERVAL(23, 1, 15, 17, 30, 44, 200);\n        -> 3\nmysql> SELECT INTERVAL(10, 1, 10, 100, 1000);\n        -> 2\nmysql> SELECT INTERVAL(22, 23, 30, 44, 200);\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(225,'FROM_DAYS',32,'Syntax:\nFROM_DAYS(N)\n\nGiven a day number N, returns a DATE value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT FROM_DAYS(730669);\n        -> \'2007-07-03\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(226,'ALTER PROCEDURE',40,'Syntax:\nALTER PROCEDURE proc_name [characteristic ...]\n\ncharacteristic:\n    COMMENT \'string\'\n  | LANGUAGE SQL\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nThis statement can be used to change the characteristics of a stored\nprocedure. More than one change may be specified in an ALTER PROCEDURE\nstatement. However, you cannot change the parameters or body of a\nstored procedure using this statement; to make such changes, you must\ndrop and re-create the procedure using DROP PROCEDURE and CREATE\nPROCEDURE.\n\nYou must have the ALTER ROUTINE privilege for the procedure. By\ndefault, that privilege is granted automatically to the procedure\ncreator. This behavior can be changed by disabling the\nautomatic_sp_privileges system variable. See\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-routines-privileges.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-procedure.html'),(227,'BIT_COUNT',19,'Syntax:\nBIT_COUNT(N)\n\nReturns the number of bits that are set in the argument N as an\nunsigned 64-bit integer, or NULL if the argument is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT BIT_COUNT(29), BIT_COUNT(b\'101010\');\n        -> 4, 3\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(228,'ACOS',3,'Syntax:\nACOS(X)\n\nReturns the arc cosine of X, that is, the value whose cosine is X.\nReturns NULL if X is not in the range -1 to 1.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT ACOS(1);\n        -> 0\nmysql> SELECT ACOS(1.0001);\n        -> NULL\nmysql> SELECT ACOS(0);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(229,'ISOLATION',8,'Syntax:\nSET [GLOBAL | SESSION] TRANSACTION ISOLATION LEVEL\n  {\n       REPEATABLE READ\n     | READ COMMITTED\n     | READ UNCOMMITTED\n     | SERIALIZABLE\n   }\n\nThis statement sets the transaction isolation level, used for\noperations on InnoDB tables.\n\nScope of the Isolation Level\n\nYou can set the isolation level globally, for the current session, or\nfor the next transaction:\n\no With the GLOBAL keyword, the statement sets the default transaction\n  level globally for all subsequent sessions. Existing sessions are\n  unaffected.\n\no With the SESSION keyword, the statement sets the default transaction\n  level for all subsequent transactions performed within the current\n  session.\n\no Without any SESSION or GLOBAL keyword, the statement sets the\n  isolation level for the next (not started) transaction performed\n  within the current session. Subsequent transactions revert to using\n  the SESSION isolation level.\n\nA change to the global default isolation level requires the SUPER\nprivilege. Any session is free to change its session isolation level\n(even in the middle of a transaction), or the isolation level for its\nnext transaction.\n\nSET TRANSACTION ISOLATION LEVEL without GLOBAL or SESSION is not\npermitted while there is an active transaction:\n\nmysql> START TRANSACTION;\nQuery OK, 0 rows affected (0.02 sec)\n\nmysql> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;\nERROR 1568 (25001): Transaction isolation level can\'t be changed\nwhile a transaction is in progress\n\nTo set the global default isolation level at server startup, use the\n--transaction-isolation=level option to mysqld on the command line or\nin an option file. Values of level for this option use dashes rather\nthan spaces, so the permissible values are READ-UNCOMMITTED,\nREAD-COMMITTED, REPEATABLE-READ, or SERIALIZABLE. For example, to set\nthe default isolation level to REPEATABLE READ, use these lines in the\n[mysqld] section of an option file:\n\n[mysqld]\ntransaction-isolation = REPEATABLE-READ\n\nIt is possible to check or set the global and session transaction\nisolation levels at runtime by using the tx_isolation system variable:\n\nSELECT @@GLOBAL.tx_isolation, @@tx_isolation;\nSET GLOBAL tx_isolation=\'REPEATABLE-READ\';\nSET SESSION tx_isolation=\'SERIALIZABLE\';\n\nTransaction Isolation Levels\n\nFor information about transaction isolation levels, see\nhttp://dev.mysql.com/doc/refman/5.5/en/innodb-transaction-isolation-lev\nels.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/set-transaction.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/set-transaction.html'),(230,'SIN',3,'Syntax:\nSIN(X)\n\nReturns the sine of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT SIN(PI());\n        -> 1.2246063538224e-16\nmysql> SELECT ROUND(SIN(PI()));\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(231,'IS',20,'Syntax:\nIS boolean_value\n\nTests a value against a boolean value, where boolean_value can be TRUE,\nFALSE, or UNKNOWN.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 1 IS TRUE, 0 IS FALSE, NULL IS UNKNOWN;\n        -> 1, 1, 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(232,'GET_FORMAT',32,'Syntax:\nGET_FORMAT({DATE|TIME|DATETIME}, {\'EUR\'|\'USA\'|\'JIS\'|\'ISO\'|\'INTERNAL\'})\n\nReturns a format string. This function is useful in combination with\nthe DATE_FORMAT() and the STR_TO_DATE() functions.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DATE_FORMAT(\'2003-10-03\',GET_FORMAT(DATE,\'EUR\'));\n        -> \'03.10.2003\'\nmysql> SELECT STR_TO_DATE(\'10.31.2003\',GET_FORMAT(DATE,\'USA\'));\n        -> \'2003-10-31\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(233,'TINYBLOB',23,'TINYBLOB\n\nA BLOB column with a maximum length of 255 (28 − 1) bytes. Each\nTINYBLOB value is stored using a 1-byte length prefix that indicates\nthe number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(234,'USER',17,'Syntax:\nUSER()\n\nReturns the current MySQL user name and host name as a string in the\nutf8 character set.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT USER();\n        -> \'davida@localhost\'\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(235,'REPAIR TABLE',21,'Syntax:\nREPAIR [NO_WRITE_TO_BINLOG | LOCAL]\n    TABLE tbl_name [, tbl_name] ...\n    [QUICK] [EXTENDED] [USE_FRM]\n\nREPAIR TABLE repairs a possibly corrupted table, for certain storage\nengines only.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nAlthough normally you should never have to run REPAIR TABLE, if\ndisaster strikes, this statement is very likely to get back all your\ndata from a MyISAM table. If your tables become corrupted often, try to\nfind the reason for it, to eliminate the need to use REPAIR TABLE. See\nhttp://dev.mysql.com/doc/refman/5.5/en/crashing.html, and\nhttp://dev.mysql.com/doc/refman/5.5/en/myisam-table-problems.html.\n\nREPAIR TABLE checks the table to see whether an upgrade is required. If\nso, it performs the upgrade, following the same rules as CHECK TABLE\n... FOR UPGRADE. See [HELP CHECK TABLE], for more information.\n\n*Important*:\n\no Make a backup of a table before performing a table repair operation;\n  under some circumstances the operation might cause data loss.\n  Possible causes include but are not limited to file system errors.\n  See http://dev.mysql.com/doc/refman/5.5/en/backup-and-recovery.html.\n\no If the server crashes during a REPAIR TABLE operation, it is\n  essential after restarting it that you immediately execute another\n  REPAIR TABLE statement for the table before performing any other\n  operations on it. In the worst case, you might have a new clean index\n  file without information about the data file, and then the next\n  operation you perform could overwrite the data file. This is an\n  unlikely but possible scenario that underscores the value of making a\n  backup first.\n\no In the event that a table on the master becomes corrupted and you run\n  REPAIR TABLE on it, any resulting changes to the original table are\n  not propagated to slaves.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/repair-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/repair-table.html'),(236,'MERGE',18,'The MERGE storage engine, also known as the MRG_MyISAM engine, is a\ncollection of identical MyISAM tables that can be used as one.\n\"Identical\" means that all tables have identical column and index\ninformation. You cannot merge MyISAM tables in which the columns are\nlisted in a different order, do not have exactly the same columns, or\nhave the indexes in different order. However, any or all of the MyISAM\ntables can be compressed with myisampack. See\nhttp://dev.mysql.com/doc/refman/5.5/en/myisampack.html. Differences in\ntable options such as AVG_ROW_LENGTH, MAX_ROWS, or PACK_KEYS do not\nmatter.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/merge-storage-engine.html\n\n','mysql> CREATE TABLE t1 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> CREATE TABLE t2 (\n    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,\n    ->    message CHAR(20)) ENGINE=MyISAM;\nmysql> INSERT INTO t1 (message) VALUES (\'Testing\'),(\'table\'),(\'t1\');\nmysql> INSERT INTO t2 (message) VALUES (\'Testing\'),(\'table\'),(\'t2\');\nmysql> CREATE TABLE total (\n    ->    a INT NOT NULL AUTO_INCREMENT,\n    ->    message CHAR(20), INDEX(a))\n    ->    ENGINE=MERGE UNION=(t1,t2) INSERT_METHOD=LAST;\n','http://dev.mysql.com/doc/refman/5.5/en/merge-storage-engine.html'),(237,'CREATE TABLE',40,'Syntax:\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    (create_definition,...)\n    [table_options]\n    [partition_options]\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    [(create_definition,...)]\n    [table_options]\n    [partition_options]\n    [IGNORE | REPLACE]\n    [AS] query_expression\n\nCREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name\n    { LIKE old_tbl_name | (LIKE old_tbl_name) }\n\ncreate_definition:\n    col_name column_definition\n  | [CONSTRAINT [symbol]] PRIMARY KEY [index_type] (index_col_name,...)\n      [index_option] ...\n  | {INDEX|KEY} [index_name] [index_type] (index_col_name,...)\n      [index_option] ...\n  | [CONSTRAINT [symbol]] UNIQUE [INDEX|KEY]\n      [index_name] [index_type] (index_col_name,...)\n      [index_option] ...\n  | {FULLTEXT|SPATIAL} [INDEX|KEY] [index_name] (index_col_name,...)\n      [index_option] ...\n  | [CONSTRAINT [symbol]] FOREIGN KEY\n      [index_name] (index_col_name,...) reference_definition\n  | CHECK (expr)\n\ncolumn_definition:\n    data_type [NOT NULL | NULL] [DEFAULT default_value]\n      [AUTO_INCREMENT] [UNIQUE [KEY] | [PRIMARY] KEY]\n      [COMMENT \'string\']\n      [COLUMN_FORMAT {FIXED|DYNAMIC|DEFAULT}]\n      [STORAGE {DISK|MEMORY|DEFAULT}]\n      [reference_definition]\n\ndata_type:\n    BIT[(length)]\n  | TINYINT[(length)] [UNSIGNED] [ZEROFILL]\n  | SMALLINT[(length)] [UNSIGNED] [ZEROFILL]\n  | MEDIUMINT[(length)] [UNSIGNED] [ZEROFILL]\n  | INT[(length)] [UNSIGNED] [ZEROFILL]\n  | INTEGER[(length)] [UNSIGNED] [ZEROFILL]\n  | BIGINT[(length)] [UNSIGNED] [ZEROFILL]\n  | REAL[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DOUBLE[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | FLOAT[(length,decimals)] [UNSIGNED] [ZEROFILL]\n  | DECIMAL[(length[,decimals])] [UNSIGNED] [ZEROFILL]\n  | NUMERIC[(length[,decimals])] [UNSIGNED] [ZEROFILL]\n  | DATE\n  | TIME\n  | TIMESTAMP\n  | DATETIME\n  | YEAR\n  | CHAR[(length)] [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | VARCHAR(length) [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | BINARY[(length)]\n  | VARBINARY(length)\n  | TINYBLOB\n  | BLOB\n  | MEDIUMBLOB\n  | LONGBLOB\n  | TINYTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | TEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | MEDIUMTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | LONGTEXT [BINARY]\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | ENUM(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | SET(value1,value2,value3,...)\n      [CHARACTER SET charset_name] [COLLATE collation_name]\n  | spatial_type\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nindex_option:\n    KEY_BLOCK_SIZE [=] value\n  | index_type\n  | WITH PARSER parser_name\n  | COMMENT \'string\'\n\nreference_definition:\n    REFERENCES tbl_name (index_col_name,...)\n      [MATCH FULL | MATCH PARTIAL | MATCH SIMPLE]\n      [ON DELETE reference_option]\n      [ON UPDATE reference_option]\n\nreference_option:\n    RESTRICT | CASCADE | SET NULL | NO ACTION | SET DEFAULT\n\ntable_options:\n    table_option [[,] table_option] ...\n\ntable_option:\n    AUTO_INCREMENT [=] value\n  | AVG_ROW_LENGTH [=] value\n  | [DEFAULT] CHARACTER SET [=] charset_name\n  | CHECKSUM [=] {0 | 1}\n  | [DEFAULT] COLLATE [=] collation_name\n  | COMMENT [=] \'string\'\n  | CONNECTION [=] \'connect_string\'\n  | {DATA|INDEX} DIRECTORY [=] \'absolute path to directory\'\n  | DELAY_KEY_WRITE [=] {0 | 1}\n  | ENGINE [=] engine_name\n  | INSERT_METHOD [=] { NO | FIRST | LAST }\n  | KEY_BLOCK_SIZE [=] value\n  | MAX_ROWS [=] value\n  | MIN_ROWS [=] value\n  | PACK_KEYS [=] {0 | 1 | DEFAULT}\n  | PASSWORD [=] \'string\'\n  | ROW_FORMAT [=] {DEFAULT|DYNAMIC|FIXED|COMPRESSED|REDUNDANT|COMPACT}\n  | TABLESPACE tablespace_name [STORAGE {DISK|MEMORY|DEFAULT}]\n  | UNION [=] (tbl_name[,tbl_name]...)\n\npartition_options:\n    PARTITION BY\n        { [LINEAR] HASH(expr)\n        | [LINEAR] KEY [ALGORITHM={1|2}] (column_list)\n        | RANGE{(expr) | COLUMNS(column_list)}\n        | LIST{(expr) | COLUMNS(column_list)} }\n    [PARTITIONS num]\n    [SUBPARTITION BY\n        { [LINEAR] HASH(expr)\n        | [LINEAR] KEY [ALGORITHM={1|2}] (column_list) }\n      [SUBPARTITIONS num]\n    ]\n    [(partition_definition [, partition_definition] ...)]\n\npartition_definition:\n    PARTITION partition_name\n        [VALUES\n            {LESS THAN {(expr | value_list) | MAXVALUE}\n            |\n            IN (value_list)}]\n        [[STORAGE] ENGINE [=] engine_name]\n        [COMMENT [=] \'comment_text\' ]\n        [DATA DIRECTORY [=] \'data_dir\']\n        [INDEX DIRECTORY [=] \'index_dir\']\n        [MAX_ROWS [=] max_number_of_rows]\n        [MIN_ROWS [=] min_number_of_rows]\n        [TABLESPACE [=] tablespace_name]\n        [NODEGROUP [=] node_group_id]\n        [(subpartition_definition [, subpartition_definition] ...)]\n\nsubpartition_definition:\n    SUBPARTITION logical_name\n        [[STORAGE] ENGINE [=] engine_name]\n        [COMMENT [=] \'comment_text\' ]\n        [DATA DIRECTORY [=] \'data_dir\']\n        [INDEX DIRECTORY [=] \'index_dir\']\n        [MAX_ROWS [=] max_number_of_rows]\n        [MIN_ROWS [=] min_number_of_rows]\n        [TABLESPACE [=] tablespace_name]\n        [NODEGROUP [=] node_group_id]\n\nquery_expression:\n    SELECT ...   (Some valid select or union statement)\n\nCREATE TABLE creates a table with the given name. You must have the\nCREATE privilege for the table.\n\nBy default, tables are created in the default database, using the\nInnoDB storage engine. An error occurs if the table exists, if there is\nno default database, or if the database does not exist.\n\nFor information about the physical representation of a table, see\nhttp://dev.mysql.com/doc/refman/5.5/en/create-table-files.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-table.html'),(238,'MICROSECOND',32,'Syntax:\nMICROSECOND(expr)\n\nReturns the microseconds from the time or datetime expression expr as a\nnumber in the range from 0 to 999999.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT MICROSECOND(\'12:00:00.123456\');\n        -> 123456\nmysql> SELECT MICROSECOND(\'2009-12-31 23:59:59.000010\');\n        -> 10\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(239,'CREATE SERVER',40,'Syntax:\nCREATE SERVER server_name\n    FOREIGN DATA WRAPPER wrapper_name\n    OPTIONS (option [, option] ...)\n\noption:\n  { HOST character-literal\n  | DATABASE character-literal\n  | USER character-literal\n  | PASSWORD character-literal\n  | SOCKET character-literal\n  | OWNER character-literal\n  | PORT numeric-literal }\n\nThis statement creates the definition of a server for use with the\nFEDERATED storage engine. The CREATE SERVER statement creates a new row\nin the servers table in the mysql database. This statement requires the\nSUPER privilege.\n\nThe server_name should be a unique reference to the server. Server\ndefinitions are global within the scope of the server, it is not\npossible to qualify the server definition to a specific database.\nserver_name has a maximum length of 64 characters (names longer than 64\ncharacters are silently truncated), and is case insensitive. You may\nspecify the name as a quoted string.\n\nThe wrapper_name should be mysql, and may be quoted with single\nquotation marks. Other values for wrapper_name are not currently\nsupported.\n\nFor each option you must specify either a character literal or numeric\nliteral. Character literals are UTF-8, support a maximum length of 64\ncharacters and default to a blank (empty) string. String literals are\nsilently truncated to 64 characters. Numeric literals must be a number\nbetween 0 and 9999, default value is 0.\n\n*Note*:\n\nThe OWNER option is currently not applied, and has no effect on the\nownership or operation of the server connection that is created.\n\nThe CREATE SERVER statement creates an entry in the mysql.servers table\nthat can later be used with the CREATE TABLE statement when creating a\nFEDERATED table. The options that you specify will be used to populate\nthe columns in the mysql.servers table. The table columns are\nServer_name, Host, Db, Username, Password, Port and Socket.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-server.html\n\n','CREATE SERVER s\nFOREIGN DATA WRAPPER mysql\nOPTIONS (USER \'Remote\', HOST \'192.168.1.106\', DATABASE \'test\');\n','http://dev.mysql.com/doc/refman/5.5/en/create-server.html'),(240,'MAKETIME',32,'Syntax:\nMAKETIME(hour,minute,second)\n\nReturns a time value calculated from the hour, minute, and second\narguments.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT MAKETIME(12,15,30);\n        -> \'12:15:30\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(241,'CURDATE',32,'Syntax:\nCURDATE()\n\nReturns the current date as a value in \'YYYY-MM-DD\' or YYYYMMDD format,\ndepending on whether the function is used in a string or numeric\ncontext.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT CURDATE();\n        -> \'2008-06-13\'\nmysql> SELECT CURDATE() + 0;\n        -> 20080613\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(242,'SET PASSWORD',10,'Syntax:\nSET PASSWORD [FOR user] = password_option\n\npassword_option: {\n    PASSWORD(\'auth_string\')\n  | OLD_PASSWORD(\'auth_string\')\n  | \'hash_string\'\n}\n\nThe SET PASSWORD statement assigns a password to a MySQL user account,\nspecified as either a cleartext (unencrypted) or encrypted value:\n\no \'auth_string\' represents a cleartext password.\n\no \'hash_string\' represents an encrypted password.\n\n*Important*:\n\nSET PASSWORD may be recorded in server logs or on the client side in a\nhistory file such as ~/.mysql_history, which means that cleartext\npasswords may be read by anyone having read access to that information.\nFor information about password logging in the server logs, see\nhttp://dev.mysql.com/doc/refman/5.5/en/password-logging.html. For\nsimilar information about client-side logging, see\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-logging.html.\n\nSET PASSWORD can be used with or without a FOR clause that explicitly\nnames a user account:\n\no With a FOR user clause, the statement sets the password for the named\n  account, which must exist:\n\nSET PASSWORD FOR \'jeffrey\'@\'localhost\' = password_option;\n\no With no FOR user clause, the statement sets the password for the\n  current user:\n\nSET PASSWORD = password_option;\n\n  Any client who connects to the server using a nonanonymous account\n  can change the password for that account. To see which account the\n  server authenticated you as, invoke the CURRENT_USER() function:\n\nSELECT CURRENT_USER();\n\nSetting the password for a named account (with a FOR clause) requires\nthe UPDATE privilege for the mysql database. Setting the password for\nyourself (for a nonanonymous account with no FOR clause) requires no\nspecial privileges. When the read_only system variable is enabled, SET\nPASSWORD requires the SUPER privilege in addition to any other required\nprivileges.\n\nIf a FOR user clause is given, the account name uses the format\ndescribed in http://dev.mysql.com/doc/refman/5.5/en/account-names.html.\nFor example:\n\nSET PASSWORD FOR \'bob\'@\'%.example.org\' = PASSWORD(\'auth_string\');\n\nThe host name part of the account name, if omitted, defaults to \'%\'.\n\nThe password can be specified in these ways:\n\no Use the PASSWORD() function\n\n  The PASSWORD() argument is the cleartext (unencrypted) password.\n  PASSWORD() hashes the password and returns the encrypted password\n  string for storage in the mysql.user account row.\n\n  The PASSWORD() function hashes the password using the hashing method\n  determined by the value of the old_passwords system variable value.\n  It should be set to a value compatible with the hash format required\n  by the account authentication plugin. For example, if the account\n  uses the mysql_native_password authentication plugin, old_passwords\n  should be 0 for PASSWORD() to produce a hash value in the correct\n  format. For mysql_old_password, old_passwords should be 1.\n\n  Permitted old_passwords values are described later in this section.\n\no Use the OLD_PASSWORD() function:\n\n  The \'auth_string\' function argument is the cleartext (unencrypted)\n  password. OLD_PASSWORD() hashes the password using pre-4.1 hashing\n  and returns the encrypted password string for storage in the\n  mysql.user account row. This hashing method is appropriate only for\n  accounts that use the mysql_old_password authentication plugin.\n\no Use an already encrypted password string\n\n  The password is specified as a string literal. It must represent the\n  already encrypted password value, in the hash format required by the\n  authentication method used for the account.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/set-password.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/set-password.html'),(243,'DATABASE',17,'Syntax:\nDATABASE()\n\nReturns the default (current) database name as a string in the utf8\ncharacter set. If there is no default database, DATABASE() returns\nNULL. Within a stored routine, the default database is the database\nthat the routine is associated with, which is not necessarily the same\nas the database that is the default in the calling context.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT DATABASE();\n        -> \'test\'\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(244,'IF FUNCTION',6,'Syntax:\nIF(expr1,expr2,expr3)\n\nIf expr1 is TRUE (expr1 <> 0 and expr1 <> NULL), IF() returns expr2.\nOtherwise, it returns expr3.\n\n*Note*:\n\nThere is also an IF statement, which differs from the IF() function\ndescribed here. See [HELP IF statement].\n\nIf only one of expr2 or expr3 is explicitly NULL, the result type of\nthe IF() function is the type of the non-NULL expression.\n\nThe default return type of IF() (which may matter when it is stored\ninto a temporary table) is calculated as follows:\n\no If expr2 or expr3 produce a string, the result is a string.\n\n  If expr2 and expr3 are both strings, the result is case sensitive if\n  either string is case sensitive.\n\no If expr2 or expr3 produce a floating-point value, the result is a\n  floating-point value.\n\no If expr2 or expr3 produce an integer, the result is an integer.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html\n\n','mysql> SELECT IF(1>2,2,3);\n        -> 3\nmysql> SELECT IF(1<2,\'yes\',\'no\');\n        -> \'yes\'\nmysql> SELECT IF(STRCMP(\'test\',\'test1\'),\'no\',\'yes\');\n        -> \'no\'\n','http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html'),(245,'POINTFROMWKB',33,'PointFromWKB(wkb[, srid])\n\nConstructs a Point value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html'),(246,'POWER',3,'Syntax:\nPOWER(X,Y)\n\nThis is a synonym for POW().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(247,'ATAN',3,'Syntax:\nATAN(X)\n\nReturns the arc tangent of X, that is, the value whose tangent is X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT ATAN(2);\n        -> 1.1071487177941\nmysql> SELECT ATAN(-2);\n        -> -1.1071487177941\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(248,'SHOW PROFILE',27,'Syntax:\nSHOW PROFILE [type [, type] ... ]\n    [FOR QUERY n]\n    [LIMIT row_count [OFFSET offset]]\n\ntype:\n    ALL\n  | BLOCK IO\n  | CONTEXT SWITCHES\n  | CPU\n  | IPC\n  | MEMORY\n  | PAGE FAULTS\n  | SOURCE\n  | SWAPS\n\nThe SHOW PROFILE and SHOW PROFILES statements display profiling\ninformation that indicates resource usage for statements executed\nduring the course of the current session.\n\nProfiling is controlled by the profiling session variable, which has a\ndefault value of 0 (OFF). Profiling is enabled by setting profiling to\n1 or ON:\n\nmysql> SET profiling = 1;\n\nSHOW PROFILES displays a list of the most recent statements sent to the\nserver. The size of the list is controlled by the\nprofiling_history_size session variable, which has a default value of\n15. The maximum value is 100. Setting the value to 0 has the practical\neffect of disabling profiling.\n\nAll statements are profiled except SHOW PROFILE and SHOW PROFILES, so\nyou will find neither of those statements in the profile list.\nMalformed statements are profiled. For example, SHOW PROFILING is an\nillegal statement, and a syntax error occurs if you try to execute it,\nbut it will show up in the profiling list.\n\nSHOW PROFILE displays detailed information about a single statement.\nWithout the FOR QUERY n clause, the output pertains to the most\nrecently executed statement. If FOR QUERY n is included, SHOW PROFILE\ndisplays information for statement n. The values of n correspond to the\nQuery_ID values displayed by SHOW PROFILES.\n\nThe LIMIT row_count clause may be given to limit the output to\nrow_count rows. If LIMIT is given, OFFSET offset may be added to begin\nthe output offset rows into the full set of rows.\n\nBy default, SHOW PROFILE displays Status and Duration columns. The\nStatus values are like the State values displayed by SHOW PROCESSLIST,\nalthough there might be some minor differences in interpretion for the\ntwo statements for some status values (see\nhttp://dev.mysql.com/doc/refman/5.5/en/thread-information.html).\n\nOptional type values may be specified to display specific additional\ntypes of information:\n\no ALL displays all information\n\no BLOCK IO displays counts for block input and output operations\n\no CONTEXT SWITCHES displays counts for voluntary and involuntary\n  context switches\n\no CPU displays user and system CPU usage times\n\no IPC displays counts for messages sent and received\n\no MEMORY is not currently implemented\n\no PAGE FAULTS displays counts for major and minor page faults\n\no SOURCE displays the names of functions from the source code, together\n  with the name and line number of the file in which the function\n  occurs\n\no SWAPS displays swap counts\n\nProfiling is enabled per session. When a session ends, its profiling\ninformation is lost.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-profile.html\n\n','mysql> SELECT @@profiling;\n+-------------+\n| @@profiling |\n+-------------+\n|           0 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> SET profiling = 1;\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> DROP TABLE IF EXISTS t1;\nQuery OK, 0 rows affected, 1 warning (0.00 sec)\n\nmysql> CREATE TABLE T1 (id INT);\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SHOW PROFILES;\n+----------+----------+--------------------------+\n| Query_ID | Duration | Query                    |\n+----------+----------+--------------------------+\n|        0 | 0.000088 | SET PROFILING = 1        |\n|        1 | 0.000136 | DROP TABLE IF EXISTS t1  |\n|        2 | 0.011947 | CREATE TABLE t1 (id INT) |\n+----------+----------+--------------------------+\n3 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE;\n+----------------------+----------+\n| Status               | Duration |\n+----------------------+----------+\n| checking permissions | 0.000040 |\n| creating table       | 0.000056 |\n| After create         | 0.011363 |\n| query end            | 0.000375 |\n| freeing items        | 0.000089 |\n| logging slow query   | 0.000019 |\n| cleaning up          | 0.000005 |\n+----------------------+----------+\n7 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE FOR QUERY 1;\n+--------------------+----------+\n| Status             | Duration |\n+--------------------+----------+\n| query end          | 0.000107 |\n| freeing items      | 0.000008 |\n| logging slow query | 0.000015 |\n| cleaning up        | 0.000006 |\n+--------------------+----------+\n4 rows in set (0.00 sec)\n\nmysql> SHOW PROFILE CPU FOR QUERY 2;\n+----------------------+----------+----------+------------+\n| Status               | Duration | CPU_user | CPU_system |\n+----------------------+----------+----------+------------+\n| checking permissions | 0.000040 | 0.000038 |   0.000002 |\n| creating table       | 0.000056 | 0.000028 |   0.000028 |\n| After create         | 0.011363 | 0.000217 |   0.001571 |\n| query end            | 0.000375 | 0.000013 |   0.000028 |\n| freeing items        | 0.000089 | 0.000010 |   0.000014 |\n| logging slow query   | 0.000019 | 0.000009 |   0.000010 |\n| cleaning up          | 0.000005 | 0.000003 |   0.000002 |\n+----------------------+----------+----------+------------+\n7 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/show-profile.html'),(249,'LN',3,'Syntax:\nLN(X)\n\nReturns the natural logarithm of X; that is, the base-e logarithm of X.\nIf X is less than or equal to 0, then NULL is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT LN(2);\n        -> 0.69314718055995\nmysql> SELECT LN(-2);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(250,'SET CHARACTER SET',27,'Syntax:\nSET {CHARACTER SET | CHARSET}\n    {\'charset_name\' | DEFAULT}\n\nThis statement maps all strings sent between the server and the current\nclient with the given mapping. SET CHARACTER SET sets three session\nsystem variables: character_set_client and character_set_results are\nset to the given character set, and character_set_connection to the\nvalue of character_set_database. See\nhttp://dev.mysql.com/doc/refman/5.5/en/charset-connection.html.\n\ncharset_name may be quoted or unquoted.\n\nThe default character set mapping can be restored by using the value\nDEFAULT. The default depends on the server configuration.\n\nucs2, utf16, and utf32 cannot be used as a client character set, which\nmeans that they do not work for SET CHARACTER SET.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/set-character-set.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/set-character-set.html'),(251,'RETURN',24,'Syntax:\nRETURN expr\n\nThe RETURN statement terminates execution of a stored function and\nreturns the value expr to the function caller. There must be at least\none RETURN statement in a stored function. There may be more than one\nif the function has multiple exit points.\n\nThis statement is not used in stored procedures, triggers, or events.\nThe LEAVE statement can be used to exit a stored program of those\ntypes.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/return.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/return.html'),(252,'SET SQL_LOG_BIN',8,'Syntax:\nSET sql_log_bin = {0|1}\n\nThe sql_log_bin variable controls whether logging to the binary log is\ndone. The default value is 1 (do logging). To change logging for the\ncurrent session, change the session value of this variable. The session\nuser must have the SUPER privilege to set this variable. Set this\nvariable to 0 for a session to temporarily disable binary logging while\nmaking changes to the master which you do not want to replicate to the\nslave.\n\nAs of MySQL 5.5.41, the global sql_log_bin variable is read only and\ncannot be modified. The global scope is deprecated and will be removed\nin a future MySQL release. Prior to 5.5.41, sql_log_bin can be set as a\nglobal or session variable. Setting sql_log_bin globally is only\ndetected when a new session is started. Any sessions previously running\nare not impacted when setting sql_log_bin globally.\n\n*Warning*:\n\nIncorrect use of sql_log_bin with a global scope means any changes made\nin an already running session are still being recorded to the binary\nlog and therefore replicated. Exercise extreme caution using\nsql_log_bin with a global scope as the above situation could cause\nunexpected results including replication failure.\n\nIt is not possible to set @@session.sql_log_bin within a transaction or\nsubquery.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/set-sql-log-bin.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/set-sql-log-bin.html'),(253,'AES_DECRYPT',12,'Syntax:\nAES_DECRYPT(crypt_str,key_str)\n\nThis function decrypts data using the official AES (Advanced Encryption\nStandard) algorithm. For more information, see the description of\nAES_ENCRYPT().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(254,'COERCIBILITY',17,'Syntax:\nCOERCIBILITY(str)\n\nReturns the collation coercibility value of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT COERCIBILITY(\'abc\' COLLATE latin1_swedish_ci);\n        -> 0\nmysql> SELECT COERCIBILITY(USER());\n        -> 3\nmysql> SELECT COERCIBILITY(\'abc\');\n        -> 4\nmysql> SELECT COERCIBILITY(1000);\n        -> 5\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(255,'INT',23,'INT[(M)] [UNSIGNED] [ZEROFILL]\n\nA normal-size integer. The signed range is -2147483648 to 2147483647.\nThe unsigned range is 0 to 4294967295.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(256,'GLENGTH',13,'GLength(ls)\n\nReturns a double-precision number indicating the length of the\nLineString or MultiLineString value ls in its associated spatial\nreference. The length of a MultiLineString value is equal to the sum of\nthe lengths of its elements.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-linestring-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT GLength(GeomFromText(@ls));\n+----------------------------+\n| GLength(GeomFromText(@ls)) |\n+----------------------------+\n|         2.8284271247461903 |\n+----------------------------+\n\nmysql> SET @mls = \'MultiLineString((1 1,2 2,3 3),(4 4,5 5))\';\nmysql> SELECT GLength(GeomFromText(@mls));\n+-----------------------------+\n| GLength(GeomFromText(@mls)) |\n+-----------------------------+\n|           4.242640687119286 |\n+-----------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-linestring-property-functions.html'),(257,'MAKE_SET',38,'Syntax:\nMAKE_SET(bits,str1,str2,...)\n\nReturns a set value (a string containing substrings separated by ,\ncharacters) consisting of the strings that have the corresponding bit\nin bits set. str1 corresponds to bit 0, str2 to bit 1, and so on. NULL\nvalues in str1, str2, ... are not appended to the result.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT MAKE_SET(1,\'a\',\'b\',\'c\');\n        -> \'a\'\nmysql> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',\'world\');\n        -> \'hello,world\'\nmysql> SELECT MAKE_SET(1 | 4,\'hello\',\'nice\',NULL,\'world\');\n        -> \'hello\'\nmysql> SELECT MAKE_SET(0,\'a\',\'b\',\'c\');\n        -> \'\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(258,'FIND_IN_SET',38,'Syntax:\nFIND_IN_SET(str,strlist)\n\nReturns a value in the range of 1 to N if the string str is in the\nstring list strlist consisting of N substrings. A string list is a\nstring composed of substrings separated by , characters. If the first\nargument is a constant string and the second is a column of type SET,\nthe FIND_IN_SET() function is optimized to use bit arithmetic. Returns\n0 if str is not in strlist or if strlist is the empty string. Returns\nNULL if either argument is NULL. This function does not work properly\nif the first argument contains a comma (,) character.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT FIND_IN_SET(\'b\',\'a,b,c,d\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(259,'MIN',16,'Syntax:\nMIN([DISTINCT] expr)\n\nReturns the minimum value of expr. MIN() may take a string argument; in\nsuch cases, it returns the minimum string value. See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-indexes.html. The DISTINCT\nkeyword can be used to find the minimum of the distinct values of expr,\nhowever, this produces the same result as omitting DISTINCT.\n\nIf there are no matching rows, MIN() returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','mysql> SELECT student_name, MIN(test_score), MAX(test_score)\n       FROM student\n       GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(260,'REPLACE',28,'Syntax:\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name\n    [(col_name [, col_name] ...)]\n    {VALUES | VALUE} (value_list) [, (value_list)] ...\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name\n    SET assignment_list\n\nREPLACE [LOW_PRIORITY | DELAYED]\n    [INTO] tbl_name\n    [(col_name [, col_name] ...)]\n    SELECT ...\n\nvalue:\n    {expr | DEFAULT}\n\nvalue_list:\n    value [, value] ...\n\nassignment:\n    col_name = value\n\nassignment_list:\n    assignment [, assignment] ...\n\nREPLACE works exactly like INSERT, except that if an old row in the\ntable has the same value as a new row for a PRIMARY KEY or a UNIQUE\nindex, the old row is deleted before the new row is inserted. See [HELP\nINSERT].\n\nREPLACE is a MySQL extension to the SQL standard. It either inserts, or\ndeletes and inserts. For another MySQL extension to standard SQL---that\neither inserts or updates---see\nhttp://dev.mysql.com/doc/refman/5.5/en/insert-on-duplicate.html.\n\n*Note*:\n\nREPLACE makes sense only if a table has a PRIMARY KEY or UNIQUE index.\nOtherwise, it becomes equivalent to INSERT, because there is no index\nto be used to determine whether a new row duplicates another.\n\nValues for all columns are taken from the values specified in the\nREPLACE statement. Any missing columns are set to their default values,\njust as happens for INSERT. You cannot refer to values from the current\nrow and use them in the new row. If you use an assignment such as SET\ncol_name = col_name + 1, the reference to the column name on the right\nhand side is treated as DEFAULT(col_name), so the assignment is\nequivalent to SET col_name = DEFAULT(col_name) + 1.\n\nTo use REPLACE, you must have both the INSERT and DELETE privileges for\nthe table.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/replace.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/replace.html'),(261,'CURRENT_TIMESTAMP',32,'Syntax:\nCURRENT_TIMESTAMP, CURRENT_TIMESTAMP()\n\nCURRENT_TIMESTAMP and CURRENT_TIMESTAMP() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(262,'VAR_SAMP',16,'Syntax:\nVAR_SAMP(expr)\n\nReturns the sample variance of expr. That is, the denominator is the\nnumber of rows minus one.\n\nIf there are no matching rows, VAR_SAMP() returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(263,'DATETIME',23,'DATETIME\n\nA date and time combination. The supported range is \'1000-01-01\n00:00:00\' to \'9999-12-31 23:59:59\'. MySQL displays DATETIME values in\n\'YYYY-MM-DD HH:MM:SS\' format, but permits assignment of values to\nDATETIME columns using either strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html'),(264,'INTEGER',23,'INTEGER[(M)] [UNSIGNED] [ZEROFILL]\n\nThis type is a synonym for INT.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(265,'SHOW COLUMNS',27,'Syntax:\nSHOW [FULL] {COLUMNS | FIELDS}\n    {FROM | IN} tbl_name\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW COLUMNS displays information about the columns in a given table.\nIt also works for views. SHOW COLUMNS displays information only for\nthose columns for which you have some privilege.\n\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. In other words, these two statements are equivalent:\n\nSHOW COLUMNS FROM mytable FROM mydb;\nSHOW COLUMNS FROM mydb.mytable;\n\nThe optional FULL keyword causes the output to include the column\ncollation and comments, as well as the privileges you have for each\ncolumn.\n\nThe LIKE clause, if present, indicates which column names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nmysql> SHOW COLUMNS FROM City;\n+-------------+----------+------+-----+---------+----------------+\n| Field       | Type     | Null | Key | Default | Extra          |\n+-------------+----------+------+-----+---------+----------------+\n| ID          | int(11)  | NO   | PRI | NULL    | auto_increment |\n| Name        | char(35) | NO   |     |         |                |\n| CountryCode | char(3)  | NO   | MUL |         |                |\n| District    | char(20) | NO   |     |         |                |\n| Population  | int(11)  | NO   |     | 0       |                |\n+-------------+----------+------+-----+---------+----------------+\n\nThe data types may differ from what you expect them to be based on a\nCREATE TABLE statement because MySQL sometimes changes data types when\nyou create or alter a table. The conditions under which this occurs are\ndescribed in\nhttp://dev.mysql.com/doc/refman/5.5/en/silent-column-changes.html.\n\nSHOW COLUMNS displays the following values for each table column:\n\no Field\n\n  The column name.\n\no Type\n\n  The column data type.\n\no Collation\n\n  The collation for nonbinary string columns, or NULL for other\n  columns. This value is displayed only if you use the FULL keyword.\n\no Null\n\n  Column nullability. The value is YES if NULL values can be stored in\n  the column, NO if not.\n\no Key\n\n  Whether the column is indexed:\n\n  o If Key is empty, the column either is not indexed or is indexed\n    only as a secondary column in a multiple-column, nonunique index.\n\n  o If Key is PRI, the column is a PRIMARY KEY or is one of the columns\n    in a multiple-column PRIMARY KEY.\n\n  o If Key is UNI, the column is the first column of a UNIQUE index. (A\n    UNIQUE index permits multiple NULL values, but you can tell whether\n    the column permits NULL by checking the Null field.)\n\n  o If Key is MUL, the column is the first column of a nonunique index\n    in which multiple occurrences of a given value are permitted within\n    the column.\n\n  If more than one of the Key values applies to a given column of a\n  table, Key displays the one with the highest priority, in the order\n  PRI, UNI, MUL.\n\n  A UNIQUE index may be displayed as PRI if it cannot contain NULL\n  values and there is no PRIMARY KEY in the table. A UNIQUE index may\n  display as MUL if several columns form a composite UNIQUE index;\n  although the combination of the columns is unique, each column can\n  still hold multiple occurrences of a given value.\n\no Default\n\n  The default value for the column. This is NULL if the column has an\n  explicit default of NULL, or if the column definition includes no\n  DEFAULT clause.\n\no Extra\n\n  Any additional information that is available about a given column.\n  The value is nonempty in these cases: auto_increment for columns that\n  have the AUTO_INCREMENT attribute; on update CURRENT_TIMESTAMP for\n  TIMESTAMP columns that have the ON UPDATE CURRENT_TIMESTAMP\n  attribute.\n\no Privileges\n\n  The privileges you have for the column. This value is displayed only\n  if you use the FULL keyword.\n\no Comment\n\n  Any comment included in the column definition. This value is\n  displayed only if you use the FULL keyword.\n\nYou can also obtain information about table columns from\nINFORMATION_SCHEMA, which contains a COLUMNS table. See\nhttp://dev.mysql.com/doc/refman/5.5/en/columns-table.html.\n\nYou can list a table\'s columns with the mysqlshow db_name tbl_name\ncommand.\n\nThe DESCRIBE statement provides information similar to SHOW COLUMNS.\nSee http://dev.mysql.com/doc/refman/5.5/en/describe.html.\n\nThe SHOW CREATE TABLE, SHOW TABLE STATUS, and SHOW INDEX statements\nalso provide information about tables. See [HELP SHOW].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-columns.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-columns.html'),(266,'TINYINT',23,'TINYINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA very small integer. The signed range is -128 to 127. The unsigned\nrange is 0 to 255.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(267,'MASTER_POS_WAIT',14,'Syntax:\nMASTER_POS_WAIT(log_name,log_pos[,timeout])\n\nThis function is useful for control of master/slave synchronization. It\nblocks until the slave has read and applied all updates up to the\nspecified position in the master log. The return value is the number of\nlog events the slave had to wait for to advance to the specified\nposition. The function returns NULL if the slave SQL thread is not\nstarted, the slave\'s master information is not initialized, the\narguments are incorrect, or an error occurs. It returns -1 if the\ntimeout has been exceeded. If the slave SQL thread stops while\nMASTER_POS_WAIT() is waiting, the function returns NULL. If the slave\nis past the specified position, the function returns immediately.\n\nIf a timeout value is specified, MASTER_POS_WAIT() stops waiting when\ntimeout seconds have elapsed. timeout must be greater than 0; a zero or\nnegative timeout means no timeout. The lock is exclusive. While held by\none session, other sessions cannot obtain a lock of the same name.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(268,'^',19,'Syntax:\n^\n\nBitwise XOR.\n\nThe result is an unsigned 64-bit integer.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT 1 ^ 1;\n        -> 0\nmysql> SELECT 1 ^ 0;\n        -> 1\nmysql> SELECT 11 ^ 3;\n        -> 8\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(269,'DROP VIEW',40,'Syntax:\nDROP VIEW [IF EXISTS]\n    view_name [, view_name] ...\n    [RESTRICT | CASCADE]\n\nDROP VIEW removes one or more views. You must have the DROP privilege\nfor each view.\n\nIf any views named in the argument list do not exist, the statement\nreturns an error indicating by name which nonexisting views it was\nunable to drop, but also drops all views in the list that do exist.\n\nThe IF EXISTS clause prevents an error from occurring for views that\ndon\'t exist. When this clause is given, a NOTE is generated for each\nnonexistent view. See [HELP SHOW WARNINGS].\n\nRESTRICT and CASCADE, if given, are parsed and ignored.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-view.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-view.html'),(270,'WEEK',32,'Syntax:\nWEEK(date[,mode])\n\nThis function returns the week number for date. The two-argument form\nof WEEK() enables you to specify whether the week starts on Sunday or\nMonday and whether the return value should be in the range from 0 to 53\nor from 1 to 53. If the mode argument is omitted, the value of the\ndefault_week_format system variable is used. See\nhttp://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT WEEK(\'2008-02-20\');\n        -> 7\nmysql> SELECT WEEK(\'2008-02-20\',0);\n        -> 7\nmysql> SELECT WEEK(\'2008-02-20\',1);\n        -> 8\nmysql> SELECT WEEK(\'2008-12-31\',1);\n        -> 53\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(271,'DROP FUNCTION UDF',22,'Syntax:\nDROP FUNCTION function_name\n\nThis statement drops the user-defined function (UDF) named\nfunction_name.\n\nTo drop a function, you must have the DELETE privilege for the mysql\ndatabase. This is because DROP FUNCTION removes a row from the\nmysql.func system table that records the function\'s name, type, and\nshared library name.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-function-udf.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-function-udf.html'),(272,'UPDATEXML',38,'Syntax:\nUpdateXML(xml_target, xpath_expr, new_xml)\n\nThis function replaces a single portion of a given fragment of XML\nmarkup xml_target with a new XML fragment new_xml, and then returns the\nchanged XML. The portion of xml_target that is replaced matches an\nXPath expression xpath_expr supplied by the user. In MySQL 5.5, the\nXPath expression can contain at most 127 characters. (This limitation\nis lifted in MySQL 5.6.)\n\nIf no expression matching xpath_expr is found, or if multiple matches\nare found, the function returns the original xml_target XML fragment.\nAll three arguments should be strings.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/xml-functions.html\n\n','mysql> SELECT\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/a\', \'<e>fff</e>\') AS val1,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/b\', \'<e>fff</e>\') AS val2,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'//b\', \'<e>fff</e>\') AS val3,\n    ->   UpdateXML(\'<a><b>ccc</b><d></d></a>\', \'/a/d\', \'<e>fff</e>\') AS val4,\n    ->   UpdateXML(\'<a><d></d><b>ccc</b><d></d></a>\', \'/a/d\', \'<e>fff</e>\') AS val5\n    -> \\G\n\n*************************** 1. row ***************************\nval1: <e>fff</e>\nval2: <a><b>ccc</b><d></d></a>\nval3: <a><e>fff</e><d></d></a>\nval4: <a><b>ccc</b><e>fff</e></a>\nval5: <a><d></d><b>ccc</b><d></d></a>\n','http://dev.mysql.com/doc/refman/5.5/en/xml-functions.html'),(273,'RESET SLAVE',8,'Syntax:\nRESET SLAVE [ALL]\n\nRESET SLAVE makes the slave forget its replication position in the\nmaster\'s binary log. This statement is meant to be used for a clean\nstart: It deletes the master.info and relay-log.info files, all the\nrelay log files, and starts a new relay log file. To use RESET SLAVE,\nthe slave replication threads must be stopped (use STOP SLAVE if\nnecessary).\n\n*Note*:\n\nAll relay log files are deleted, even if they have not been completely\nexecuted by the slave SQL thread. (This is a condition likely to exist\non a replication slave if you have issued a STOP SLAVE statement or if\nthe slave is highly loaded.)\n\nIn MySQL 5.5 (unlike the case in MySQL 5.1 and earlier), RESET SLAVE\ndoes not change any replication connection parameters such as master\nhost, master port, master user, or master password, which are retained\nin memory. This means that START SLAVE can be issued without requiring\na CHANGE MASTER TO statement following RESET SLAVE.\n\nConnection parameters are reset if the slave mysqld is shut down\nfollowing RESET SLAVE. In MySQL 5.5.16 and later, you can instead use\nRESET SLAVE ALL to reset these connection parameters (Bug #11809016).\n\nRESET SLAVE ALL does not clear the IGNORE_SERVER_IDS list set by CHANGE\nMASTER TO. This issue is fixed in MySQL 5.7. (Bug #18816897)\n\nIf the slave SQL thread was in the middle of replicating temporary\ntables when it was stopped, and RESET SLAVE is issued, these replicated\ntemporary tables are deleted on the slave.\n\n*Note*:\n\nWhen used on an NDB Cluster replication slave SQL node, RESET SLAVE\nclears the mysql.ndb_apply_status table. You should keep in mind when\nusing this statement that ndb_apply_status uses the NDB storage engine\nand so is shared by all SQL nodes attached to the slave cluster.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/reset-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/reset-slave.html'),(274,'DAY',32,'Syntax:\nDAY(date)\n\nDAY() is a synonym for DAYOFMONTH().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(275,'UUID',14,'Syntax:\nUUID()\n\nReturns a Universal Unique Identifier (UUID) generated according to RFC\n4122, \"A Universally Unique IDentifier (UUID) URN Namespace\"\n(http://www.ietf.org/rfc/rfc4122.txt).\n\nA UUID is designed as a number that is globally unique in space and\ntime. Two calls to UUID() are expected to generate two different\nvalues, even if these calls are performed on two separate devices not\nconnected to each other.\n\n*Warning*:\n\nAlthough UUID() values are intended to be unique, they are not\nnecessarily unguessable or unpredictable. If unpredictability is\nrequired, UUID values should be generated some other way.\n\nUUID() returns a value that conforms to UUID version 1 as described in\nRFC 4122. The value is a 128-bit number represented as a utf8 string of\nfive hexadecimal numbers in aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee\nformat:\n\no The first three numbers are generated from the low, middle, and high\n  parts of a timestamp. The high part also includes the UUID version\n  number.\n\no The fourth number preserves temporal uniqueness in case the timestamp\n  value loses monotonicity (for example, due to daylight saving time).\n\no The fifth number is an IEEE 802 node number that provides spatial\n  uniqueness. A random number is substituted if the latter is not\n  available (for example, because the host device has no Ethernet card,\n  or it is unknown how to find the hardware address of an interface on\n  the host operating system). In this case, spatial uniqueness cannot\n  be guaranteed. Nevertheless, a collision should have very low\n  probability.\n\n  The MAC address of an interface is taken into account only on FreeBSD\n  and Linux. On other operating systems, MySQL uses a randomly\n  generated 48-bit number.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> SELECT UUID();\n        -> \'6ccd780c-baba-1026-9564-5b8c656024db\'\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(276,'LINESTRING',25,'LineString(pt1, pt2, ...)\n\nConstructs a LineString value from a number of Point or WKB Point\narguments. If the number of arguments is less than two, the return\nvalue is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html'),(277,'SLEEP',14,'Syntax:\nSLEEP(duration)\n\nSleeps (pauses) for the number of seconds given by the duration\nargument, then returns 0. If SLEEP() is interrupted, it returns 1. The\nduration may have a fractional part.\n\nWhen sleep returns normally (without interruption), it returns 0:\n\nmysql> SELECT SLEEP(1000);\n+-------------+\n| SLEEP(1000) |\n+-------------+\n|           0 |\n+-------------+\n\nWhen SLEEP() is the only thing invoked by a query that is interrupted,\nit returns 1 and the query itself returns no error. This statement is\ninterrupted using KILL QUERY from another session:\n\nmysql> SELECT SLEEP(1000);\n+-------------+\n| SLEEP(1000) |\n+-------------+\n|           1 |\n+-------------+\n\nWhen SLEEP() is only part of a query that is interrupted, the query\nreturns an error. This statement is interrupted using KILL QUERY from\nanother session:\n\nmysql> SELECT 1 FROM t1 WHERE SLEEP(1000);\nERROR 1317 (70100): Query execution was interrupted\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(278,'CREATE LOGFILE GROUP',40,'Syntax:\nCREATE LOGFILE GROUP logfile_group\n    ADD UNDOFILE \'undo_file\'\n    [INITIAL_SIZE [=] initial_size]\n    [UNDO_BUFFER_SIZE [=] undo_buffer_size]\n    [REDO_BUFFER_SIZE [=] redo_buffer_size]\n    [NODEGROUP [=] nodegroup_id]\n    [WAIT]\n    [COMMENT [=] comment_text]\n    ENGINE [=] engine_name\n\nThis statement creates a new log file group named logfile_group having\na single UNDO file named \'undo_file\'. A CREATE LOGFILE GROUP statement\nhas one and only one ADD UNDOFILE clause. For rules covering the naming\nof log file groups, see\nhttp://dev.mysql.com/doc/refman/5.5/en/identifiers.html.\n\n*Note*:\n\nAll NDB Cluster Disk Data objects share the same namespace. This means\nthat each Disk Data object must be uniquely named (and not merely each\nDisk Data object of a given type). For example, you cannot have a\ntablespace and a log file group with the same name, or a tablespace and\na data file with the same name.\n\nIn MySQL NDB Cluster 7.2, you can have only one log file group per\nCluster at any given time. (See Bug #16386)\n\nThe optional INITIAL_SIZE parameter sets the UNDO file\'s initial size;\nif not specified, it defaults to 128M (128 megabytes). The optional\nUNDO_BUFFER_SIZE parameter sets the size used by the UNDO buffer for\nthe log file group; The default value for UNDO_BUFFER_SIZE is 8M (eight\nmegabytes); this value cannot exceed the amount of system memory\navailable. Both of these parameters are specified in bytes. In MySQL\nNDB Cluster 7.2.14 and later, you may optionally follow either or both\nof these with a one-letter abbreviation for an order of magnitude,\nsimilar to those used in my.cnf. Generally, this is one of the letters\nM (for megabytes) or G (for gigabytes). Prior to MySQL NDB Cluster\n7.2.14, the values for these options could only be specified using\ndigits. (Bug #13116514, Bug #16104705, Bug #62858)\n\nMemory used for UNDO_BUFFER_SIZE comes from the global pool whose size\nis determined by the value of the SharedGlobalMemory data node\nconfiguration parameter. This includes any default value implied for\nthis option by the setting of the InitialLogFileGroup data node\nconfiguration parameter.\n\nThe maximum permitted for UNDO_BUFFER_SIZE is 629145600 (600 MB).\n\nOn 32-bit systems, the maximum supported value for INITIAL_SIZE is\n4294967296 (4 GB). (Bug #29186)\n\nThe minimum allowed value for INITIAL_SIZE is 1048576 (1 MB).\n\nThe ENGINE option determines the storage engine to be used by this log\nfile group, with engine_name being the name of the storage engine. In\nMySQL 5.5, this must be NDB (or NDBCLUSTER). If ENGINE is not set,\nMySQL tries to use the engine specified by the default_storage_engine\nserver system variable (formerly storage_engine). In any case, if the\nengine is not specified as NDB or NDBCLUSTER, the CREATE LOGFILE GROUP\nstatement appears to succeed but actually fails to create the log file\ngroup, as shown here:\n\nmysql> CREATE LOGFILE GROUP lg1\n    ->     ADD UNDOFILE \'undo.dat\' INITIAL_SIZE = 10M;\nQuery OK, 0 rows affected, 1 warning (0.00 sec)\n\nmysql> SHOW WARNINGS;\n+-------+------+------------------------------------------------------------------------------------------------+\n| Level | Code | Message                                                                                        |\n+-------+------+------------------------------------------------------------------------------------------------+\n| Error | 1478 | Table storage engine \'InnoDB\' does not support the create option \'TABLESPACE or LOGFILE GROUP\' |\n+-------+------+------------------------------------------------------------------------------------------------+\n1 row in set (0.00 sec)\n\nmysql> DROP LOGFILE GROUP lg1 ENGINE = NDB;            \nERROR 1529 (HY000): Failed to drop LOGFILE GROUP\n\nmysql> CREATE LOGFILE GROUP lg1\n    ->     ADD UNDOFILE \'undo.dat\' INITIAL_SIZE = 10M\n    ->     ENGINE = NDB;\nQuery OK, 0 rows affected (2.97 sec)\n\nThe fact that the CREATE LOGFILE GROUP statement does not actually\nreturn an error when a non-NDB storage engine is named, but rather\nappears to succeed, is a known issue which we hope to address in a\nfuture release of NDB Cluster.\n\nREDO_BUFFER_SIZE, NODEGROUP, WAIT, and COMMENT are parsed but ignored,\nand so have no effect in MySQL 5.5. These options are intended for\nfuture expansion.\n\nWhen used with ENGINE [=] NDB, a log file group and associated UNDO log\nfile are created on each Cluster data node. You can verify that the\nUNDO files were created and obtain information about them by querying\nthe INFORMATION_SCHEMA.FILES table. For example:\n\nmysql> SELECT LOGFILE_GROUP_NAME, LOGFILE_GROUP_NUMBER, EXTRA\n    -> FROM INFORMATION_SCHEMA.FILES\n    -> WHERE FILE_NAME = \'undo_10.dat\';\n+--------------------+----------------------+----------------+\n| LOGFILE_GROUP_NAME | LOGFILE_GROUP_NUMBER | EXTRA          |\n+--------------------+----------------------+----------------+\n| lg_3               |                   11 | CLUSTER_NODE=3 |\n| lg_3               |                   11 | CLUSTER_NODE=4 |\n+--------------------+----------------------+----------------+\n2 rows in set (0.06 sec)\n\nCREATE LOGFILE GROUP is useful only with Disk Data storage for NDB\nCluster. See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-cluster-disk-data.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-logfile-group.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-logfile-group.html'),(279,'NULLIF',6,'Syntax:\nNULLIF(expr1,expr2)\n\nReturns NULL if expr1 = expr2 is true, otherwise returns expr1. This is\nthe same as CASE WHEN expr1 = expr2 THEN NULL ELSE expr1 END.\n\nThe return value has the same type as the first argument.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html\n\n','mysql> SELECT NULLIF(1,1);\n        -> NULL\nmysql> SELECT NULLIF(1,2);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html'),(280,'ROUND',3,'Syntax:\nROUND(X), ROUND(X,D)\n\nRounds the argument X to D decimal places. The rounding algorithm\ndepends on the data type of X. D defaults to 0 if not specified. D can\nbe negative to cause D digits left of the decimal point of the value X\nto become zero.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT ROUND(-1.23);\n        -> -1\nmysql> SELECT ROUND(-1.58);\n        -> -2\nmysql> SELECT ROUND(1.58);\n        -> 2\nmysql> SELECT ROUND(1.298, 1);\n        -> 1.3\nmysql> SELECT ROUND(1.298, 0);\n        -> 1\nmysql> SELECT ROUND(23.298, -1);\n        -> 20\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(281,'TIMEDIFF',32,'Syntax:\nTIMEDIFF(expr1,expr2)\n\nTIMEDIFF() returns expr1 − expr2 expressed as a time value. expr1 and\nexpr2 are time or date-and-time expressions, but both must be of the\nsame type.\n\nThe result returned by TIMEDIFF() is limited to the range allowed for\nTIME values. Alternatively, you can use either of the functions\nTIMESTAMPDIFF() and UNIX_TIMESTAMP(), both of which return integers.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIMEDIFF(\'2000:01:01 00:00:00\',\n    ->                 \'2000:01:01 00:00:00.000001\');\n        -> \'-00:00:00.000001\'\nmysql> SELECT TIMEDIFF(\'2008-12-31 23:59:59.000001\',\n    ->                 \'2008-12-30 01:01:01.000002\');\n        -> \'46:58:57.999999\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(282,'STOP SLAVE',8,'Syntax:\nSTOP SLAVE [thread_types]\n\nthread_types:\n    [thread_type [, thread_type] ... ]\n\nthread_type: IO_THREAD | SQL_THREAD\n\nStops the slave threads. STOP SLAVE requires the SUPER privilege.\nRecommended best practice is to execute STOP SLAVE on the slave before\nstopping the slave server (see\nhttp://dev.mysql.com/doc/refman/5.5/en/server-shutdown.html, for more\ninformation).\n\nWhen using the row-based logging format: You should execute STOP SLAVE\non the slave prior to shutting down the slave server if you are\nreplicating any tables that use a nontransactional storage engine (see\nthe Note later in this section). In MySQL 5.5.9 and later, you can also\nuse STOP SLAVE SQL_THREAD for this purpose.\n\nLike START SLAVE, this statement may be used with the IO_THREAD and\nSQL_THREAD options to name the thread or threads to be stopped.\n\nIf the current replication event group has modified one or more\nnontransactional tables, STOP SLAVE waits for up to 60 seconds for the\nevent group to complete, unless you issue a KILL QUERY or KILL\nCONNECTION statement for the slave SQL thread. If the event group\nremains incomplete after the timeout, an error message is logged. (Bug\n#319, Bug #38205)\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/stop-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/stop-slave.html'),(283,'LINEFROMTEXT',4,'LineFromText(wkt[, srid]), LineStringFromText(wkt[, srid])\n\nConstructs a LineString value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html'),(284,'ADDTIME',32,'Syntax:\nADDTIME(expr1,expr2)\n\nADDTIME() adds expr2 to expr1 and returns the result. expr1 is a time\nor datetime expression, and expr2 is a time expression.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT ADDTIME(\'2007-12-31 23:59:59.999999\', \'1 1:1:1.000002\');\n        -> \'2008-01-02 01:01:01.000001\'\nmysql> SELECT ADDTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'03:00:01.999997\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(285,'UPPER',38,'Syntax:\nUPPER(str)\n\nReturns the string str with all characters changed to uppercase\naccording to the current character set mapping. The default is latin1\n(cp1252 West European).\n\nmysql> SELECT UPPER(\'Hej\');\n        -> \'HEJ\'\n\nSee the description of LOWER() for information that also applies to\nUPPER(), such as information about how to perform lettercase conversion\nof binary strings (BINARY, VARBINARY, BLOB) for which these functions\nare ineffective.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(286,'MEDIUMBLOB',23,'MEDIUMBLOB\n\nA BLOB column with a maximum length of 16,777,215 (224 − 1) bytes.\nEach MEDIUMBLOB value is stored using a 3-byte length prefix that\nindicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(287,'FROM_UNIXTIME',32,'Syntax:\nFROM_UNIXTIME(unix_timestamp), FROM_UNIXTIME(unix_timestamp,format)\n\nReturns a representation of the unix_timestamp argument as a value in\n\'YYYY-MM-DD HH:MM:SS\' or YYYYMMDDHHMMSS.uuuuuu format, depending on\nwhether the function is used in a string or numeric context. The value\nis expressed in the current time zone. unix_timestamp is an internal\ntimestamp value such as is produced by the UNIX_TIMESTAMP() function.\n\nIf format is given, the result is formatted according to the format\nstring, which is used the same way as listed in the entry for the\nDATE_FORMAT() function.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT FROM_UNIXTIME(1447430881);\n        -> \'2015-11-13 10:08:01\'\nmysql> SELECT FROM_UNIXTIME(1447430881) + 0;\n        -> 20151113100801\nmysql> SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(),\n    ->                      \'%Y %D %M %h:%i:%s %x\');\n        -> \'2015 13th November 10:08:01 2015\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(288,'SHA2',12,'Syntax:\nSHA2(str, hash_length)\n\nCalculates the SHA-2 family of hash functions (SHA-224, SHA-256,\nSHA-384, and SHA-512). The first argument is the cleartext string to be\nhashed. The second argument indicates the desired bit length of the\nresult, which must have a value of 224, 256, 384, 512, or 0 (which is\nequivalent to 256). If either argument is NULL or the hash length is\nnot one of the permitted values, the return value is NULL. Otherwise,\nthe function result is a hash value containing the desired number of\nbits. See the notes at the beginning of this section about storing hash\nvalues efficiently.\n\nAs of MySQL 5.5.6, the return value is a nonbinary string in the\nconnection character set. Before 5.5.6, the return value is a binary\nstring; see the notes at the beginning of this section about using the\nvalue as a nonbinary string.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT SHA2(\'abc\', 224);\n        -> \'23097d223405d8228642a477bda255b32aadbce4bda0b3f7e36c9da7\'\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(289,'IFNULL',6,'Syntax:\nIFNULL(expr1,expr2)\n\nIf expr1 is not NULL, IFNULL() returns expr1; otherwise it returns\nexpr2.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html\n\n','mysql> SELECT IFNULL(1,0);\n        -> 1\nmysql> SELECT IFNULL(NULL,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,10);\n        -> 10\nmysql> SELECT IFNULL(1/0,\'yes\');\n        -> \'yes\'\n','http://dev.mysql.com/doc/refman/5.5/en/control-flow-functions.html'),(290,'SHOW FUNCTION CODE',27,'Syntax:\nSHOW FUNCTION CODE func_name\n\nThis statement is similar to SHOW PROCEDURE CODE but for stored\nfunctions. See [HELP SHOW PROCEDURE CODE].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-function-code.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-function-code.html'),(291,'LEAST',20,'Syntax:\nLEAST(value1,value2,...)\n\nWith two or more arguments, returns the smallest (minimum-valued)\nargument. The arguments are compared using the following rules:\n\no If any argument is NULL, the result is NULL. No comparison is needed.\n\no If all arguments are integer-valued, they are compared as integers.\n\no If at least one argument is double precision, they are compared as\n  double-precision values. Otherwise, if at least one argument is a\n  DECIMAL value, they are compared as DECIMAL values.\n\no If the arguments comprise a mix of numbers and strings, they are\n  compared as numbers.\n\no If any argument is a nonbinary (character) string, the arguments are\n  compared as nonbinary strings.\n\no In all other cases, the arguments are compared as binary strings.\n\nThe return type of LEAST() is the aggregated type of the comparison\nargument types.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT LEAST(2,0);\n        -> 0\nmysql> SELECT LEAST(34.0,3.0,5.0,767.0);\n        -> 3.0\nmysql> SELECT LEAST(\'B\',\'A\',\'C\');\n        -> \'A\'\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(292,'SET NAMES',27,'Syntax:\nSET NAMES {\'charset_name\'\n    [COLLATE \'collation_name\'] | DEFAULT}\n\nThis statement sets the three session system variables\ncharacter_set_client, character_set_connection, and\ncharacter_set_results to the given character set. Setting\ncharacter_set_connection to charset_name also sets collation_connection\nto the default collation for charset_name. See\nhttp://dev.mysql.com/doc/refman/5.5/en/charset-connection.html.\n\nThe optional COLLATE clause may be used to specify a collation\nexplicitly. If given, the collation must one of the permitted\ncollations for charset_name.\n\ncharset_name and collation_name may be quoted or unquoted.\n\nThe default mapping can be restored by using a value of DEFAULT. The\ndefault depends on the server configuration.\n\nucs2, utf16, and utf32 cannot be used as a client character set, which\nmeans that they do not work for SET NAMES.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/set-names.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/set-names.html'),(293,'SHOW ERRORS',27,'Syntax:\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW COUNT(*) ERRORS\n\nSHOW ERRORS is a diagnostic statement that is similar to SHOW WARNINGS,\nexcept that it displays information only for errors, rather than for\nerrors, warnings, and notes.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttp://dev.mysql.com/doc/refman/5.5/en/select.html.\n\nThe SHOW COUNT(*) ERRORS statement displays the number of errors. You\ncan also retrieve this number from the error_count variable:\n\nSHOW COUNT(*) ERRORS;\nSELECT @@error_count;\n\nSHOW ERRORS and error_count apply only to errors, not warnings or\nnotes. In other respects, they are similar to SHOW WARNINGS and\nwarning_count. In particular, SHOW ERRORS cannot display information\nfor more than max_error_count messages, and error_count can exceed the\nvalue of max_error_count if the number of errors exceeds\nmax_error_count.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-errors.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-errors.html'),(294,'=',20,'=\n\nEqual:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 1 = 0;\n        -> 0\nmysql> SELECT \'0\' = 0;\n        -> 1\nmysql> SELECT \'0.0\' = 0;\n        -> 1\nmysql> SELECT \'0.01\' = 0;\n        -> 0\nmysql> SELECT \'.01\' = 0.01;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(295,'CREATE USER',10,'Syntax:\nCREATE USER\n    user [auth_option] [, user [auth_option]] ...\n\nuser:\n    (see )\n\nauth_option: {\n    IDENTIFIED BY \'auth_string\'\n  | IDENTIFIED BY PASSWORD \'hash_string\'\n  | IDENTIFIED WITH auth_plugin\n  | IDENTIFIED WITH auth_plugin AS \'hash_string\'\n}\n\nThe CREATE USER statement creates new MySQL accounts. An error occurs\nif you try to create an account that already exists.\n\nTo use CREATE USER, you must have the global CREATE USER privilege, or\nthe INSERT privilege for the mysql database. When the read_only system\nvariable is enabled, CREATE USER additionally requires the SUPER\nprivilege.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-user.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-user.html'),(296,'POINT',25,'Point(x, y)\n\nConstructs a Point using its coordinates.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html'),(297,'LCASE',38,'Syntax:\nLCASE(str)\n\nLCASE() is a synonym for LOWER().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(298,'IS NOT NULL',20,'Syntax:\nIS NOT NULL\n\nTests whether a value is not NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 1 IS NOT NULL, 0 IS NOT NULL, NULL IS NOT NULL;\n        -> 1, 1, 0\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(299,'MATCH AGAINST',38,'Syntax:\nMATCH (col1,col2,...) AGAINST (expr [search_modifier])\n\nMySQL has support for full-text indexing and searching:\n\no A full-text index in MySQL is an index of type FULLTEXT.\n\no Full-text indexes can be used only with MyISAM tables. (In MySQL 5.6\n  and up, they can also be used with InnoDB tables.) Full-text indexes\n  can be created only for CHAR, VARCHAR, or TEXT columns.\n\no A FULLTEXT index definition can be given in the CREATE TABLE\n  statement when a table is created, or added later using ALTER TABLE\n  or CREATE INDEX.\n\no For large data sets, it is much faster to load your data into a table\n  that has no FULLTEXT index and then create the index after that, than\n  to load data into a table that has an existing FULLTEXT index.\n\nFull-text searching is performed using MATCH() ... AGAINST syntax.\nMATCH() takes a comma-separated list that names the columns to be\nsearched. AGAINST takes a string to search for, and an optional\nmodifier that indicates what type of search to perform. The search\nstring must be a string value that is constant during query evaluation.\nThis rules out, for example, a table column because that can differ for\neach row.\n\nThere are three types of full-text searches:\n\no A natural language search interprets the search string as a phrase in\n  natural human language (a phrase in free text). There are no special\n  operators, with the exception of double quote (\") characters. The\n  stopword list applies. In addition, words that are present in 50% or\n  more of the rows are considered common and do not match.\n\n  Full-text searches are natural language searches if the IN NATURAL\n  LANGUAGE MODE modifier is given or if no modifier is given. For more\n  information, see\n  http://dev.mysql.com/doc/refman/5.5/en/fulltext-natural-language.html\n  .\n\no A boolean search interprets the search string using the rules of a\n  special query language. The string contains the words to search for.\n  It can also contain operators that specify requirements such that a\n  word must be present or absent in matching rows, or that it should be\n  weighted higher or lower than usual. Common words such as \"some\" or\n  \"then\" are stopwords and do not match if present in the search\n  string. The IN BOOLEAN MODE modifier specifies a boolean search. For\n  more information, see\n  http://dev.mysql.com/doc/refman/5.5/en/fulltext-boolean.html.\n\no A query expansion search is a modification of a natural language\n  search. The search string is used to perform a natural language\n  search. Then words from the most relevant rows returned by the search\n  are added to the search string and the search is done again. The\n  query returns the rows from the second search. The IN NATURAL\n  LANGUAGE MODE WITH QUERY EXPANSION or WITH QUERY EXPANSION modifier\n  specifies a query expansion search. For more information, see\n  http://dev.mysql.com/doc/refman/5.5/en/fulltext-query-expansion.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/fulltext-search.html\n\n','mysql> SELECT id, body, MATCH (title,body) AGAINST\n    -> (\'Security implications of running MySQL as root\'\n    -> IN NATURAL LANGUAGE MODE) AS score\n    -> FROM articles WHERE MATCH (title,body) AGAINST\n    -> (\'Security implications of running MySQL as root\'\n    -> IN NATURAL LANGUAGE MODE);\n+----+-------------------------------------+-----------------+\n| id | body                                | score           |\n+----+-------------------------------------+-----------------+\n|  4 | 1. Never run mysqld as root. 2. ... | 1.5219271183014 |\n|  6 | When configured properly, MySQL ... | 1.3114095926285 |\n+----+-------------------------------------+-----------------+\n2 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/fulltext-search.html'),(300,'CREATE EVENT',40,'Syntax:\nCREATE\n    [DEFINER = { user | CURRENT_USER }]\n    EVENT\n    [IF NOT EXISTS]\n    event_name\n    ON SCHEDULE schedule\n    [ON COMPLETION [NOT] PRESERVE]\n    [ENABLE | DISABLE | DISABLE ON SLAVE]\n    [COMMENT \'comment\']\n    DO event_body;\n\nschedule:\n    AT timestamp [+ INTERVAL interval] ...\n  | EVERY interval\n    [STARTS timestamp [+ INTERVAL interval] ...]\n    [ENDS timestamp [+ INTERVAL interval] ...]\n\ninterval:\n    quantity {YEAR | QUARTER | MONTH | DAY | HOUR | MINUTE |\n              WEEK | SECOND | YEAR_MONTH | DAY_HOUR | DAY_MINUTE |\n              DAY_SECOND | HOUR_MINUTE | HOUR_SECOND | MINUTE_SECOND}\n\nThis statement creates and schedules a new event. The event will not\nrun unless the Event Scheduler is enabled. For information about\nchecking Event Scheduler status and enabling it if necessary, see\nhttp://dev.mysql.com/doc/refman/5.5/en/events-configuration.html.\n\nCREATE EVENT requires the EVENT privilege for the schema in which the\nevent is to be created. It might also require the SUPER privilege,\ndepending on the DEFINER value, as described later in this section.\n\nThe minimum requirements for a valid CREATE EVENT statement are as\nfollows:\n\no The keywords CREATE EVENT plus an event name, which uniquely\n  identifies the event in a database schema.\n\no An ON SCHEDULE clause, which determines when and how often the event\n  executes.\n\no A DO clause, which contains the SQL statement to be executed by an\n  event.\n\nThis is an example of a minimal CREATE EVENT statement:\n\nCREATE EVENT myevent\n    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 HOUR\n    DO\n      UPDATE myschema.mytable SET mycol = mycol + 1;\n\nThe previous statement creates an event named myevent. This event\nexecutes once---one hour following its creation---by running an SQL\nstatement that increments the value of the myschema.mytable table\'s\nmycol column by 1.\n\nThe event_name must be a valid MySQL identifier with a maximum length\nof 64 characters. Event names are not case sensitive, so you cannot\nhave two events named myevent and MyEvent in the same schema. In\ngeneral, the rules governing event names are the same as those for\nnames of stored routines. See\nhttp://dev.mysql.com/doc/refman/5.5/en/identifiers.html.\n\nAn event is associated with a schema. If no schema is indicated as part\nof event_name, the default (current) schema is assumed. To create an\nevent in a specific schema, qualify the event name with a schema using\nschema_name.event_name syntax.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-event.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-event.html'),(301,'MBR DEFINITION',7,'Its MBR (minimum bounding rectangle), or envelope. This is the bounding\ngeometry, formed by the minimum and maximum (X,Y) coordinates:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-class-geometry.html\n\n','((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))\n','http://dev.mysql.com/doc/refman/5.5/en/gis-class-geometry.html'),(302,'GEOMETRYCOLLECTION',25,'GeometryCollection(g1, g2, ...)\n\nConstructs a GeometryCollection.\n\nIf the argument contains a nonsupported geometry, the return value is\nNULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-mysql-specific-functions.html'),(303,'*',3,'Syntax:\n*\n\nMultiplication:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','mysql> SELECT 3*5;\n        -> 15\nmysql> SELECT 18014398509481984*18014398509481984.0;\n        -> 324518553658426726783156020576256.0\nmysql> SELECT 18014398509481984*18014398509481984;\n        -> out-of-range error\n','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(304,'DES_DECRYPT',12,'Syntax:\nDES_DECRYPT(crypt_str[,key_str])\n\nDecrypts a string encrypted with DES_ENCRYPT(). If an error occurs,\nthis function returns NULL.\n\nThis function works only if MySQL has been configured with SSL support.\nSee http://dev.mysql.com/doc/refman/5.5/en/encrypted-connections.html.\n\nIf no key_str argument is given, DES_DECRYPT() examines the first byte\nof the encrypted string to determine the DES key number that was used\nto encrypt the original string, and then reads the key from the DES key\nfile to decrypt the message. For this to work, the user must have the\nSUPER privilege. The key file can be specified with the --des-key-file\nserver option.\n\nIf you pass this function a key_str argument, that string is used as\nthe key for decrypting the message.\n\nIf the crypt_str argument does not appear to be an encrypted string,\nMySQL returns the given crypt_str.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(305,'ENDPOINT',13,'EndPoint(ls)\n\nReturns the Point that is the endpoint of the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-linestring-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(EndPoint(GeomFromText(@ls)));\n+-------------------------------------+\n| AsText(EndPoint(GeomFromText(@ls))) |\n+-------------------------------------+\n| POINT(3 3)                          |\n+-------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-linestring-property-functions.html'),(306,'COUNT',16,'Syntax:\nCOUNT(expr)\n\nReturns a count of the number of non-NULL values of expr in the rows\nretrieved by a SELECT statement. The result is a BIGINT value.\n\nIf there are no matching rows, COUNT() returns 0.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','mysql> SELECT student.student_name,COUNT(*)\n       FROM student,course\n       WHERE student.student_id=course.student_id\n       GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(307,'INSERT',28,'Syntax:\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name\n    [(col_name [, col_name] ...)]\n    {VALUES | VALUE} (value_list) [, (value_list)] ...\n    [ON DUPLICATE KEY UPDATE assignment_list]\n\nINSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name\n    SET assignment_list\n    [ON DUPLICATE KEY UPDATE assignment_list]\n\nINSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]\n    [INTO] tbl_name\n    [(col_name [, col_name] ...)]\n    SELECT ...\n    [ON DUPLICATE KEY UPDATE assignment_list]\n\nvalue:\n    {expr | DEFAULT}\n\nvalue_list:\n    value [, value] ...\n\nassignment:\n    col_name = value\n\nassignment_list:\n    assignment [, assignment] ...\n\nINSERT inserts new rows into an existing table. The INSERT ... VALUES\nand INSERT ... SET forms of the statement insert rows based on\nexplicitly specified values. The INSERT ... SELECT form inserts rows\nselected from another table or tables. INSERT with an ON DUPLICATE KEY\nUPDATE clause enables existing rows to be updated if a row to be\ninserted would cause a duplicate value in a UNIQUE index or PRIMARY\nKEY.\n\nFor additional information about INSERT ... SELECT and INSERT ... ON\nDUPLICATE KEY UPDATE, see [HELP INSERT SELECT], and\nhttp://dev.mysql.com/doc/refman/5.5/en/insert-on-duplicate.html.\n\nInserting into a table requires the INSERT privilege for the table. If\nthe ON DUPLICATE KEY UPDATE clause is used and a duplicate key causes\nan UPDATE to be performed instead, the statement requires the UPDATE\nprivilege for the columns to be updated. For columns that are read but\nnot modified you need only the SELECT privilege (such as for a column\nreferenced only on the right hand side of an col_name=expr assignment\nin an ON DUPLICATE KEY UPDATE clause).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/insert.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/insert.html'),(308,'MLINEFROMTEXT',4,'MLineFromText(wkt[, srid]), MultiLineStringFromText(wkt[, srid])\n\nConstructs a MultiLineString value using its WKT representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html'),(309,'GEOMCOLLFROMWKB',33,'GeomCollFromWKB(wkb[, srid]), GeometryCollectionFromWKB(wkb[, srid])\n\nConstructs a GeometryCollection value using its WKB representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html'),(310,'TINYTEXT',23,'TINYTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 255 (28 − 1) characters. The\neffective maximum length is less if the value contains multibyte\ncharacters. Each TINYTEXT value is stored using a 1-byte length prefix\nthat indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(311,'DEFAULT',14,'Syntax:\nDEFAULT(col_name)\n\nReturns the default value for a table column. An error results if the\ncolumn has no default value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> UPDATE t SET i = DEFAULT(i)+1 WHERE id < 100;\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(312,'DECODE',12,'Syntax:\nDECODE(crypt_str,pass_str)\n\nDecrypts the encrypted string crypt_str using pass_str as the password.\ncrypt_str should be a string returned from ENCODE().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(313,'OPTIMIZE TABLE',21,'Syntax:\nOPTIMIZE [NO_WRITE_TO_BINLOG | LOCAL]\n    TABLE tbl_name [, tbl_name] ...\n\nOPTIMIZE TABLE reorganizes the physical storage of table data and\nassociated index data, to reduce storage space and improve I/O\nefficiency when accessing the table. The exact changes made to each\ntable depend on the storage engine used by that table.\n\nUse OPTIMIZE TABLE in these cases, depending on the type of table:\n\no After doing substantial insert, update, or delete operations on an\n  InnoDB table that has its own .ibd file because it was created with\n  the innodb_file_per_table option enabled. The table and indexes are\n  reorganized, and disk space can be reclaimed for use by the operating\n  system.\n\no After deleting a large part of a MyISAM or ARCHIVE table, or making\n  many changes to a MyISAM or ARCHIVE table with variable-length rows\n  (tables that have VARCHAR, VARBINARY, BLOB, or TEXT columns). Deleted\n  rows are maintained in a linked list and subsequent INSERT operations\n  reuse old row positions. You can use OPTIMIZE TABLE to reclaim the\n  unused space and to defragment the data file. After extensive changes\n  to a table, this statement may also improve performance of statements\n  that use the table, sometimes significantly.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nOPTIMIZE TABLE works for InnoDB, MyISAM, and ARCHIVE tables. OPTIMIZE\nTABLE is also supported for dynamic columns of in-memory NDB tables. It\ndoes not work for fixed-width columns of in-memory tables, nor does it\nwork for Disk Data tables. The performance of OPTIMIZE on NDB Cluster\ntables can be tuned using --ndb_optimization_delay, which controls the\nlength of time to wait between processing batches of rows by OPTIMIZE\nTABLE. For more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-cluster-limitations-resolv\ned.html.\n\nFor NDB Cluster tables, OPTIMIZE TABLE can be interrupted by (for\nexample) killing the SQL thread performing the OPTIMIZE operation.\n\nBy default, OPTIMIZE TABLE does not work for tables created using any\nother storage engine and returns a result indicating this lack of\nsupport. You can make OPTIMIZE TABLE work for other storage engines by\nstarting mysqld with the --skip-new option. In this case, OPTIMIZE\nTABLE is just mapped to ALTER TABLE.\n\nThis statement does not work with views.\n\nOPTIMIZE TABLE is supported for partitioned tables. For information\nabout using this statement with partitioned tables and table\npartitions, see\nhttp://dev.mysql.com/doc/refman/5.5/en/partitioning-maintenance.html.\n\nBy default, the server writes OPTIMIZE TABLE statements to the binary\nlog so that they replicate to replication slaves. To suppress logging,\nspecify the optional NO_WRITE_TO_BINLOG keyword or its alias LOCAL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/optimize-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/optimize-table.html'),(314,'<=>',20,'Syntax:\n<=>\n\nNULL-safe equal. This operator performs an equality comparison like the\n= operator, but returns 1 rather than NULL if both operands are NULL,\nand 0 rather than NULL if one operand is NULL.\n\nThe <=> operator is equivalent to the standard SQL IS NOT DISTINCT FROM\noperator.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 1 <=> 1, NULL <=> NULL, 1 <=> NULL;\n        -> 1, 1, 0\nmysql> SELECT 1 = 1, NULL = NULL, 1 = NULL;\n        -> 1, NULL, NULL\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(315,'GET_LOCK',14,'Syntax:\nGET_LOCK(str,timeout)\n\nTries to obtain a lock with a name given by the string str, using a\ntimeout of timeout seconds. Before MySQL 5.5.8, a negative timeout\nvalue means infinite timeout on Windows. As of 5.5.8, this behavior\napplies on all platforms.\n\nReturns 1 if the lock was obtained successfully, 0 if the attempt timed\nout (for example, because another client has previously locked the\nname), or NULL if an error occurred (such as running out of memory or\nthe thread was killed with mysqladmin kill).\n\nA lock obtained with GET_LOCK() is released explicitly by executing\nRELEASE_LOCK() or implicitly when your session terminates (either\nnormally or abnormally).\n\nLocks obtained with GET_LOCK() are not released when transactions\ncommit or roll back.\n\n*Important*:\n\nThe behavior of GET_LOCK() changes in MySQL 5.7. In consideration of\nfuture upgrades, limit the str value to 64 characters or less and do\nnot rely on subsequent calls to GET_LOCK() releasing previous locks.\n\nGET_LOCK() can be used to implement application locks or to simulate\nrecord locks. Names are locked on a server-wide basis. If a name has\nbeen locked within one session, GET_LOCK() blocks any request by\nanother session for a lock with the same name. This enables clients\nthat agree on a given lock name to use the name to perform cooperative\nadvisory locking. But be aware that it also enables a client that is\nnot among the set of cooperating clients to lock a name, either\ninadvertently or deliberately, and thus prevent any of the cooperating\nclients from locking that name. One way to reduce the likelihood of\nthis is to use lock names that are database-specific or\napplication-specific. For example, use lock names of the form\ndb_name.str or app_name.str.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> SELECT GET_LOCK(\'lock1\',10);\n        -> 1\nmysql> SELECT IS_FREE_LOCK(\'lock2\');\n        -> 1\nmysql> SELECT GET_LOCK(\'lock2\',10);\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'lock2\');\n        -> 1\nmysql> SELECT RELEASE_LOCK(\'lock1\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(316,'RESET',27,'Syntax:\nRESET reset_option [, reset_option] ...\n\nreset_option: {\n    MASTER\n  | QUERY CACHE\n  | SLAVE\n}\n\nThe RESET statement is used to clear the state of various server\noperations. You must have the RELOAD privilege to execute RESET.\n\nRESET acts as a stronger version of the FLUSH statement. See [HELP\nFLUSH].\n\nThe RESET statement causes an implicit commit. See\nhttp://dev.mysql.com/doc/refman/5.5/en/implicit-commit.html.\n\nThe following list describes the permitted RESET statement reset_option\nvalues:\n\no RESET MASTER\n\n  Deletes all binary logs listed in the index file, resets the binary\n  log index file to be empty, and creates a new binary log file.\n\no RESET QUERY CACHE\n\n  Removes all query results from the query cache.\n\no RESET SLAVE\n\n  Makes the slave forget its replication position in the master binary\n  logs. Also resets the relay log by deleting any existing relay log\n  files and beginning a new one.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/reset.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/reset.html'),(317,'BIGINT',23,'BIGINT[(M)] [UNSIGNED] [ZEROFILL]\n\nA large integer. The signed range is -9223372036854775808 to\n9223372036854775807. The unsigned range is 0 to 18446744073709551615.\n\nSERIAL is an alias for BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(318,'CURTIME',32,'Syntax:\nCURTIME()\n\nReturns the current time as a value in \'HH:MM:SS\' or HHMMSS.uuuuuu\nformat, depending on whether the function is used in a string or\nnumeric context. The value is expressed in the current time zone.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT CURTIME();\n        -> \'23:50:26\'\nmysql> SELECT CURTIME() + 0;\n        -> 235026.000000\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(319,'SET',27,'Syntax:\nSET variable_assignment [, variable_assignment] ...\n\nvariable_assignment:\n      user_var_name = expr\n    | param_name = expr\n    | local_var_name = expr\n    | [GLOBAL | SESSION]\n        system_var_name = expr\n    | [@@global. | @@session. | @@]\n        system_var_name = expr\n\nSET ONE_SHOT system_var_name = expr\n\nSET syntax for variable assignment enables you to assign values to\ndifferent types of variables that affect the operation of the server or\nclients:\n\no System variables. See\n  http://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html.\n  System variables also can be set at server startup, as described in\n  http://dev.mysql.com/doc/refman/5.5/en/using-system-variables.html.\n  (To display system variable names and values, use the SHOW VARIABLES\n  statement; see [HELP SHOW VARIABLES].)\n\no User-defined variables. See\n  http://dev.mysql.com/doc/refman/5.5/en/user-variables.html.\n\no Stored procedure and function parameters, and stored program local\n  variables. See\n  http://dev.mysql.com/doc/refman/5.5/en/stored-program-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/set-variable.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/set-variable.html'),(320,'CONV',3,'Syntax:\nCONV(N,from_base,to_base)\n\nConverts numbers between different number bases. Returns a string\nrepresentation of the number N, converted from base from_base to base\nto_base. Returns NULL if any argument is NULL. The argument N is\ninterpreted as an integer, but may be specified as an integer or a\nstring. The minimum base is 2 and the maximum base is 36. If from_base\nis a negative number, N is regarded as a signed number. Otherwise, N is\ntreated as unsigned. CONV() works with 64-bit precision.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT CONV(\'a\',16,2);\n        -> \'1010\'\nmysql> SELECT CONV(\'6E\',18,8);\n        -> \'172\'\nmysql> SELECT CONV(-17,10,-18);\n        -> \'-H\'\nmysql> SELECT CONV(10+\'10\'+\'10\'+X\'0a\',10,10);\n        -> \'40\'\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(321,'LOAD XML',28,'Syntax:\nLOAD XML [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE \'file_name\'\n    [REPLACE | IGNORE]\n    INTO TABLE [db_name.]tbl_name\n    [CHARACTER SET charset_name]\n    [ROWS IDENTIFIED BY \'<tagname>\']\n    [IGNORE number {LINES | ROWS}]\n    [(field_name_or_user_var\n        [, field_name_or_user_var] ...)]\n    [SET col_name={expr | DEFAULT},\n        [, col_name={expr | DEFAULT}] ...]\n\nThe LOAD XML statement reads data from an XML file into a table. The\nfile_name must be given as a literal string. The tagname in the\noptional ROWS IDENTIFIED BY clause must also be given as a literal\nstring, and must be surrounded by angle brackets (< and >).\n\nLOAD XML acts as the complement of running the mysql client in XML\noutput mode (that is, starting the client with the --xml option). To\nwrite data from a table to an XML file, you can invoke the mysql client\nwith the --xml and -e options from the system shell, as shown here:\n\nshell> mysql --xml -e \'SELECT * FROM mydb.mytable\' > file.xml\n\nTo read the file back into a table, use LOAD XML INFILE. By default,\nthe <row> element is considered to be the equivalent of a database\ntable row; this can be changed using the ROWS IDENTIFIED BY clause.\n\nThis statement supports three different XML formats:\n\no Column names as attributes and column values as attribute values:\n\n<row column1=\"value1\" column2=\"value2\" .../>\n\no Column names as tags and column values as the content of these tags:\n\n<row>\n  <column1>value1</column1>\n  <column2>value2</column2>\n</row>\n\no Column names are the name attributes of <field> tags, and values are\n  the contents of these tags:\n\n<row>\n  <field name=\'column1\'>value1</field>\n  <field name=\'column2\'>value2</field>\n</row>\n\n  This is the format used by other MySQL tools, such as mysqldump.\n\nAll three formats can be used in the same XML file; the import routine\nautomatically detects the format for each row and interprets it\ncorrectly. Tags are matched based on the tag or attribute name and the\ncolumn name.\n\nPrior to MySQL 5.5.46, LOAD XML did not handle empty XML elements in\nthe form <element/> correctly. (Bug #67542, Bug #16171518)\n\nThe following clauses work essentially the same way for LOAD XML as\nthey do for LOAD DATA:\n\no LOW_PRIORITY or CONCURRENT\n\no LOCAL\n\no REPLACE or IGNORE\n\no CHARACTER SET\n\no SET\n\nSee [HELP LOAD DATA], for more information about these clauses.\n\n(field_name_or_user_var, ...) is a list of one or more comma-separated\nXML fields or user variables. The name of a user variable used for this\npurpose must match the name of a field from the XML file, prefixed with\n@. You can use field names to select only desired fields. User\nvariables can be employed to store the corresponding field values for\nsubsequent re-use.\n\nThe IGNORE number LINES or IGNORE number ROWS clause causes the first\nnumber rows in the XML file to be skipped. It is analogous to the LOAD\nDATA statement\'s IGNORE ... LINES clause.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/load-xml.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/load-xml.html'),(322,'ASSIGN-VALUE',15,'Syntax:\n:=\n\nAssignment operator. Causes the user variable on the left hand side of\nthe operator to take on the value to its right. The value on the right\nhand side may be a literal value, another variable storing a value, or\nany legal expression that yields a scalar value, including the result\nof a query (provided that this value is a scalar value). You can\nperform multiple assignments in the same SET statement. You can perform\nmultiple assignments in the same statement.\n\nUnlike =, the := operator is never interpreted as a comparison\noperator. This means you can use := in any valid SQL statement (not\njust in SET statements) to assign a value to a variable.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/assignment-operators.html\n\n','mysql> SELECT @var1, @var2;\n        -> NULL, NULL\nmysql> SELECT @var1 := 1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2;\n        -> 1, NULL\nmysql> SELECT @var1, @var2 := @var1;\n        -> 1, 1\nmysql> SELECT @var1, @var2;\n        -> 1, 1\n\nmysql> SELECT @var1:=COUNT(*) FROM t1;\n        -> 4\nmysql> SELECT @var1;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.5/en/assignment-operators.html'),(323,'SHOW OPEN TABLES',27,'Syntax:\nSHOW OPEN TABLES\n    [{FROM | IN} db_name]\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW OPEN TABLES lists the non-TEMPORARY tables that are currently open\nin the table cache. See\nhttp://dev.mysql.com/doc/refman/5.5/en/table-cache.html. The FROM\nclause, if present, restricts the tables shown to those present in the\ndb_name database. The LIKE clause, if present, indicates which table\nnames to match. The WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-open-tables.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-open-tables.html'),(324,'EXTRACT',32,'Syntax:\nEXTRACT(unit FROM date)\n\nThe EXTRACT() function uses the same kinds of unit specifiers as\nDATE_ADD() or DATE_SUB(), but extracts parts from the date rather than\nperforming date arithmetic.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT EXTRACT(YEAR FROM \'2009-07-02\');\n       -> 2009\nmysql> SELECT EXTRACT(YEAR_MONTH FROM \'2009-07-02 01:02:03\');\n       -> 200907\nmysql> SELECT EXTRACT(DAY_MINUTE FROM \'2009-07-02 01:02:03\');\n       -> 20102\nmysql> SELECT EXTRACT(MICROSECOND\n    ->                FROM \'2003-01-02 10:30:00.000123\');\n        -> 123\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(325,'ENCRYPT',12,'Syntax:\nENCRYPT(str[,salt])\n\nEncrypts str using the Unix crypt() system call and returns a binary\nstring. The salt argument must be a string with at least two characters\nor the result will be NULL. If no salt argument is given, a random\nvalue is used.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT ENCRYPT(\'hello\');\n        -> \'VxuFAJXVARROc\'\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(326,'SHOW STATUS',27,'Syntax:\nSHOW [GLOBAL | SESSION] STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW STATUS provides server status information (see\nhttp://dev.mysql.com/doc/refman/5.5/en/server-status-variables.html).\nThis statement does not require any privilege. It requires only the\nability to connect to the server.\n\nStatus variable information is also available from these sources:\n\no The GLOBAL_STATUS and SESSION_STATUS tables. See\n  http://dev.mysql.com/doc/refman/5.5/en/status-table.html.\n\no The mysqladmin extended-status command. See\n  http://dev.mysql.com/doc/refman/5.5/en/mysqladmin.html.\n\nFor SHOW STATUS, a LIKE clause, if present, indicates which variable\nnames to match. A WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nSHOW STATUS accepts an optional GLOBAL or SESSION variable scope\nmodifier:\n\no With a GLOBAL modifier, the statement displays the global status\n  values. A global status variable may represent status for some aspect\n  of the server itself (for example, Aborted_connects), or the\n  aggregated status over all connections to MySQL (for example,\n  Bytes_received and Bytes_sent). If a variable has no global value,\n  the session value is displayed.\n\no With a SESSION modifier, the statement displays the status variable\n  values for the current connection. If a variable has no session\n  value, the global value is displayed. LOCAL is a synonym for SESSION.\n\no If no modifier is present, the default is SESSION.\n\nThe scope for each status variable is listed at\nhttp://dev.mysql.com/doc/refman/5.5/en/server-status-variables.html.\n\nEach invocation of the SHOW STATUS statement uses an internal temporary\ntable and increments the global Created_tmp_tables value.\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern:\n\nmysql> SHOW STATUS LIKE \'Key%\';\n+--------------------+----------+\n| Variable_name      | Value    |\n+--------------------+----------+\n| Key_blocks_used    | 14955    |\n| Key_read_requests  | 96854827 |\n| Key_reads          | 162040   |\n| Key_write_requests | 7589728  |\n| Key_writes         | 3813196  |\n+--------------------+----------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-status.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-status.html'),(327,'START TRANSACTION',8,'Syntax:\nSTART TRANSACTION [WITH CONSISTENT SNAPSHOT]\nBEGIN [WORK]\nCOMMIT [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nROLLBACK [WORK] [AND [NO] CHAIN] [[NO] RELEASE]\nSET autocommit = {0 | 1}\n\nThese statements provide control over use of transactions:\n\no START TRANSACTION or BEGIN start a new transaction.\n\no COMMIT commits the current transaction, making its changes permanent.\n\no ROLLBACK rolls back the current transaction, canceling its changes.\n\no SET autocommit disables or enables the default autocommit mode for\n  the current session.\n\nBy default, MySQL runs with autocommit mode enabled. This means that as\nsoon as you execute a statement that updates (modifies) a table, MySQL\nstores the update on disk to make it permanent. The change cannot be\nrolled back.\n\nTo disable autocommit mode implicitly for a single series of\nstatements, use the START TRANSACTION statement:\n\nSTART TRANSACTION;\nSELECT @A:=SUM(salary) FROM table1 WHERE type=1;\nUPDATE table2 SET summary=@A WHERE type=1;\nCOMMIT;\n\nWith START TRANSACTION, autocommit remains disabled until you end the\ntransaction with COMMIT or ROLLBACK. The autocommit mode then reverts\nto its previous state.\n\nYou can also begin a transaction like this:\n\nSTART TRANSACTION WITH CONSISTENT SNAPSHOT;\n\nThe WITH CONSISTENT SNAPSHOT option starts a consistent read for\nstorage engines that are capable of it. This applies only to InnoDB.\nThe effect is the same as issuing a START TRANSACTION followed by a\nSELECT from any InnoDB table. See\nhttp://dev.mysql.com/doc/refman/5.5/en/innodb-consistent-read.html. The\nWITH CONSISTENT SNAPSHOT option does not change the current transaction\nisolation level, so it provides a consistent snapshot only if the\ncurrent isolation level is one that permits a consistent read. The only\nisolation level that permits a consistent read is REPEATABLE READ. For\nall other isolation levels, the WITH CONSISTENT SNAPSHOT clause is\nignored. As of MySQL 5.5.34, a warning is generated when the WITH\nCONSISTENT SNAPSHOT is ignored.\n\n*Important*:\n\nMany APIs used for writing MySQL client applications (such as JDBC)\nprovide their own methods for starting transactions that can (and\nsometimes should) be used instead of sending a START TRANSACTION\nstatement from the client. See\nhttp://dev.mysql.com/doc/refman/5.5/en/connectors-apis.html, or the\ndocumentation for your API, for more information.\n\nTo disable autocommit mode explicitly, use the following statement:\n\nSET autocommit=0;\n\nAfter disabling autocommit mode by setting the autocommit variable to\nzero, changes to transaction-safe tables (such as those for InnoDB or\nNDBCLUSTER) are not made permanent immediately. You must use COMMIT to\nstore your changes to disk or ROLLBACK to ignore the changes.\n\nautocommit is a session variable and must be set for each session. To\ndisable autocommit mode for each new connection, see the description of\nthe autocommit system variable at\nhttp://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html.\n\nBEGIN and BEGIN WORK are supported as aliases of START TRANSACTION for\ninitiating a transaction. START TRANSACTION is standard SQL syntax and\nis the recommended way to start an ad-hoc transaction.\n\nThe BEGIN statement differs from the use of the BEGIN keyword that\nstarts a BEGIN ... END compound statement. The latter does not begin a\ntransaction. See [HELP BEGIN END].\n\n*Note*:\n\nWithin all stored programs (stored procedures and functions, triggers,\nand events), the parser treats BEGIN [WORK] as the beginning of a BEGIN\n... END block. Begin a transaction in this context with START\nTRANSACTION instead.\n\nThe optional WORK keyword is supported for COMMIT and ROLLBACK, as are\nthe CHAIN and RELEASE clauses. CHAIN and RELEASE can be used for\nadditional control over transaction completion. The value of the\ncompletion_type system variable determines the default completion\nbehavior. See\nhttp://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html.\n\nThe AND CHAIN clause causes a new transaction to begin as soon as the\ncurrent one ends, and the new transaction has the same isolation level\nas the just-terminated transaction. The new transaction also uses the\nsame access mode (READ WRITE or READ ONLY) as the just-terminated\ntransaction. The RELEASE clause causes the server to disconnect the\ncurrent client session after terminating the current transaction.\nIncluding the NO keyword suppresses CHAIN or RELEASE completion, which\ncan be useful if the completion_type system variable is set to cause\nchaining or release completion by default.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/commit.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/commit.html'),(328,'SHOW SLAVE HOSTS',27,'Syntax:\nSHOW SLAVE HOSTS\n\nDisplays a list of replication slaves currently registered with the\nmaster.\n\nSHOW SLAVE HOSTS should be executed on a server that acts as a\nreplication master. The statement displays information about servers\nthat are or have been connected as replication slaves, with each row of\nthe result corresponding to one slave server, as shown here:\n\nmysql> SHOW SLAVE HOSTS;\n+------------+-----------+------+-----------+\n| Server_id  | Host      | Port | Master_id |\n+------------+-----------+------+-----------+\n|  192168010 | iconnect2 | 3306 | 192168011 |\n| 1921680101 | athena    | 3306 | 192168011 |\n+------------+-----------+------+-----------+\n\no Server_id: The unique server ID of the slave server, as configured in\n  the slave server\'s option file, or on the command line with\n  --server-id=value.\n\no Host: The host name of the slave server as specified on the slave\n  with the --report-host option. This can differ from the machine name\n  as configured in the operating system.\n\no User: The slave server user name as, specified on the slave with the\n  --report-user option. Statement output includes this column only if\n  the master server is started with the --show-slave-auth-info option.\n\no Password: The slave server password as, specified on the slave with\n  the --report-password option. Statement output includes this column\n  only if the master server is started with the --show-slave-auth-info\n  option.\n\no Port: The port on the master to which the slave server is listening,\n  as specified on the slave with the --report-port option.\n\n  In MySQL 5.5.23 and later, a zero in this column means that the slave\n  port (--report-port) was not set. Prior to MySQL 5.5.23, 3306 was\n  used as the default in such cases (Bug #13333431).\n\no Master_id: The unique server ID of the master server that the slave\n  server is replicating from. This is the server ID of the server on\n  which SHOW SLAVE HOSTS is executed, so this same value is listed for\n  each row in the result.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-slave-hosts.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-slave-hosts.html'),(329,'TIME_FORMAT',32,'Syntax:\nTIME_FORMAT(time,format)\n\nThis is used like the DATE_FORMAT() function, but the format string may\ncontain format specifiers only for hours, minutes, seconds, and\nmicroseconds. Other specifiers produce a NULL value or 0.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIME_FORMAT(\'100:00:00\', \'%H %k %h %I %l\');\n        -> \'100 100 04 04 4\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(330,'CREATE DATABASE',40,'Syntax:\nCREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n    [create_specification] ...\n\ncreate_specification:\n    [DEFAULT] CHARACTER SET [=] charset_name\n  | [DEFAULT] COLLATE [=] collation_name\n\nCREATE DATABASE creates a database with the given name. To use this\nstatement, you need the CREATE privilege for the database. CREATE\nSCHEMA is a synonym for CREATE DATABASE.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-database.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-database.html'),(331,'VAR_POP',16,'Syntax:\nVAR_POP(expr)\n\nReturns the population standard variance of expr. It considers rows as\nthe whole population, not as a sample, so it has the number of rows as\nthe denominator. You can also use VARIANCE(), which is equivalent but\nis not standard SQL.\n\nIf there are no matching rows, VAR_POP() returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(332,'CONCAT_WS',38,'Syntax:\nCONCAT_WS(separator,str1,str2,...)\n\nCONCAT_WS() stands for Concatenate With Separator and is a special form\nof CONCAT(). The first argument is the separator for the rest of the\narguments. The separator is added between the strings to be\nconcatenated. The separator can be a string, as can the rest of the\narguments. If the separator is NULL, the result is NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT CONCAT_WS(\',\',\'First name\',\'Second name\',\'Last Name\');\n        -> \'First name,Second name,Last Name\'\nmysql> SELECT CONCAT_WS(\',\',\'First name\',NULL,\'Last Name\');\n        -> \'First name,Last Name\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(333,'TEXT',23,'TEXT[(M)] [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 65,535 (216 − 1) characters.\nThe effective maximum length is less if the value contains multibyte\ncharacters. Each TEXT value is stored using a 2-byte length prefix that\nindicates the number of bytes in the value.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest TEXT type large enough to hold\nvalues M characters long.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(334,'~',19,'Syntax:\n~\n\nInvert all bits.\n\nThe result is an unsigned 64-bit integer.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT 5 & ~1;\n        -> 4\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(335,'ASIN',3,'Syntax:\nASIN(X)\n\nReturns the arc sine of X, that is, the value whose sine is X. Returns\nNULL if X is not in the range -1 to 1.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT ASIN(0.2);\n        -> 0.20135792079033\nmysql> SELECT ASIN(\'foo\');\n\n+-------------+\n| ASIN(\'foo\') |\n+-------------+\n|           0 |\n+-------------+\n1 row in set, 1 warning (0.00 sec)\n\nmysql> SHOW WARNINGS;\n+---------+------+-----------------------------------------+\n| Level   | Code | Message                                 |\n+---------+------+-----------------------------------------+\n| Warning | 1292 | Truncated incorrect DOUBLE value: \'foo\' |\n+---------+------+-----------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(336,'ROW_COUNT',17,'Syntax:\nROW_COUNT()\n\nBefore MySQL 5.5.5, ROW_COUNT() returns the number of rows changed,\ndeleted, or inserted by the last statement if it was an UPDATE, DELETE,\nor INSERT. For other statements, the value may not be meaningful.\n\nAs of MySQL 5.5.5, ROW_COUNT() returns a value as follows:\n\no DDL statements: 0. This applies to statements such as CREATE TABLE or\n  DROP TABLE.\n\no DML statements other than SELECT: The number of affected rows. This\n  applies to statements such as UPDATE, INSERT, or DELETE (as before),\n  but now also to statements such as ALTER TABLE and LOAD DATA INFILE.\n\no SELECT: -1 if the statement returns a result set, or the number of\n  rows \"affected\" if it does not. For example, for SELECT * FROM t1,\n  ROW_COUNT() returns -1. For SELECT * FROM t1 INTO OUTFILE\n  \'file_name\', ROW_COUNT() returns the number of rows written to the\n  file.\n\no SIGNAL statements: 0.\n\nFor UPDATE statements, the affected-rows value by default is the number\nof rows actually changed. If you specify the CLIENT_FOUND_ROWS flag to\nmysql_real_connect() when connecting to mysqld, the affected-rows value\nis the number of rows \"found\"; that is, matched by the WHERE clause.\n\nFor REPLACE statements, the affected-rows value is 2 if the new row\nreplaced an old row, because in this case, one row was inserted after\nthe duplicate was deleted.\n\nFor INSERT ... ON DUPLICATE KEY UPDATE statements, the affected-rows\nvalue per row is 1 if the row is inserted as a new row, 2 if an\nexisting row is updated, and 0 if an existing row is set to its current\nvalues. If you specify the CLIENT_FOUND_ROWS flag, the affected-rows\nvalue is 1 (not 0) if an existing row is set to its current values.\n\nThe ROW_COUNT() value is similar to the value from the\nmysql_affected_rows() C API function and the row count that the mysql\nclient displays following statement execution.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> INSERT INTO t VALUES(1),(2),(3);\nQuery OK, 3 rows affected (0.00 sec)\nRecords: 3  Duplicates: 0  Warnings: 0\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           3 |\n+-------------+\n1 row in set (0.00 sec)\n\nmysql> DELETE FROM t WHERE i IN(1,2);\nQuery OK, 2 rows affected (0.00 sec)\n\nmysql> SELECT ROW_COUNT();\n+-------------+\n| ROW_COUNT() |\n+-------------+\n|           2 |\n+-------------+\n1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(337,'SIGN',3,'Syntax:\nSIGN(X)\n\nReturns the sign of the argument as -1, 0, or 1, depending on whether X\nis negative, zero, or positive.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT SIGN(-32);\n        -> -1\nmysql> SELECT SIGN(0);\n        -> 0\nmysql> SELECT SIGN(234);\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(338,'FLOAT',23,'FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA small (single-precision) floating-point number. Permissible values\nare -3.402823466E+38 to -1.175494351E-38, 0, and 1.175494351E-38 to\n3.402823466E+38. These are the theoretical limits, based on the IEEE\nstandard. The actual range might be slightly smaller depending on your\nhardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits permitted by the hardware. A single-precision floating-point\nnumber is accurate to approximately 7 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nUsing FLOAT might give you some unexpected problems because all\ncalculations in MySQL are done with double precision. See\nhttp://dev.mysql.com/doc/refman/5.5/en/no-matching-rows.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(339,'CHARSET',17,'Syntax:\nCHARSET(str)\n\nReturns the character set of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT CHARSET(\'abc\');\n        -> \'latin1\'\nmysql> SELECT CHARSET(CONVERT(\'abc\' USING utf8));\n        -> \'utf8\'\nmysql> SELECT CHARSET(USER());\n        -> \'utf8\'\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(340,'SUBDATE',32,'Syntax:\nSUBDATE(date,INTERVAL expr unit), SUBDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, SUBDATE()\nis a synonym for DATE_SUB(). For information on the INTERVAL unit\nargument, see the discussion for DATE_ADD().\n\nmysql> SELECT DATE_SUB(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2007-12-02\'\nmysql> SELECT SUBDATE(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2007-12-02\'\n\nThe second form enables the use of an integer value for days. In such\ncases, it is interpreted as the number of days to be subtracted from\nthe date or datetime expression expr.\n\nmysql> SELECT SUBDATE(\'2008-01-02 12:00:00\', 31);\n        -> \'2007-12-02 12:00:00\'\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(341,'DAYOFYEAR',32,'Syntax:\nDAYOFYEAR(date)\n\nReturns the day of the year for date, in the range 1 to 366.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFYEAR(\'2007-02-03\');\n        -> 34\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(342,'%',3,'Syntax:\nN % M, N MOD M\n\nModulo operation. Returns the remainder of N divided by M. For more\ninformation, see the description for the MOD() function in\nhttp://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(343,'ASTEXT',33,'AsText(g), AsWKT(g)\n\nConverts a value in internal geometry format to its WKT representation\nand returns the string result.\n\nThe result is NULL if the geometry argument is NULL or not a\nsyntactically well-formed geometry.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-format-conversion-functions.html\n\n','mysql> SET @g = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(GeomFromText(@g));\n+--------------------------+\n| AsText(GeomFromText(@g)) |\n+--------------------------+\n| LINESTRING(1 1,2 2,3 3)  |\n+--------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-format-conversion-functions.html'),(344,'DECLARE CONDITION',24,'Syntax:\nDECLARE condition_name CONDITION FOR condition_value\n\ncondition_value:\n    mysql_error_code\n  | SQLSTATE [VALUE] sqlstate_value\n\nThe DECLARE ... CONDITION statement declares a named error condition,\nassociating a name with a condition that needs specific handling. The\nname can be referred to in a subsequent DECLARE ... HANDLER statement\n(see [HELP DECLARE HANDLER]).\n\nCondition declarations must appear before cursor or handler\ndeclarations.\n\nThe condition_value for DECLARE ... CONDITION indicates the specific\ncondition or class of conditions to associate with the condition name.\nIt can take the following forms:\n\no mysql_error_code: An integer literal indicating a MySQL error code.\n\n  Do not use MySQL error code 0 because that indicates success rather\n  than an error condition. For a list of MySQL error codes, see\n  http://dev.mysql.com/doc/refman/5.5/en/error-messages-server.html.\n\no SQLSTATE [VALUE] sqlstate_value: A 5-character string literal\n  indicating an SQLSTATE value.\n\n  Do not use SQLSTATE values that begin with \'00\' because those\n  indicate success rather than an error condition. For a list of\n  SQLSTATE values, see\n  http://dev.mysql.com/doc/refman/5.5/en/error-messages-server.html.\n\nCondition names referred to in SIGNAL or use RESIGNAL statements must\nbe associated with SQLSTATE values, not MySQL error codes.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/declare-condition.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/declare-condition.html'),(345,'MONTHNAME',32,'Syntax:\nMONTHNAME(date)\n\nReturns the full name of the month for date. The language used for the\nname is controlled by the value of the lc_time_names system variable\n(http://dev.mysql.com/doc/refman/5.5/en/locale-support.html).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT MONTHNAME(\'2008-02-03\');\n        -> \'February\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(346,'NUMGEOMETRIES',26,'NumGeometries(gc)\n\nReturns the number of geometries in the GeometryCollection value gc.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-geometrycollection-property-functions.html\n\n','mysql> SET @gc = \'GeometryCollection(Point(1 1),LineString(2 2, 3 3))\';\nmysql> SELECT NumGeometries(GeomFromText(@gc));\n+----------------------------------+\n| NumGeometries(GeomFromText(@gc)) |\n+----------------------------------+\n|                                2 |\n+----------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-geometrycollection-property-functions.html'),(347,'TIMESTAMP FUNCTION',32,'Syntax:\nTIMESTAMP(expr), TIMESTAMP(expr1,expr2)\n\nWith a single argument, this function returns the date or datetime\nexpression expr as a datetime value. With two arguments, it adds the\ntime expression expr2 to the date or datetime expression expr1 and\nreturns the result as a datetime value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMP(\'2003-12-31\');\n        -> \'2003-12-31 00:00:00\'\nmysql> SELECT TIMESTAMP(\'2003-12-31 12:00:00\',\'12:00:00\');\n        -> \'2004-01-01 00:00:00\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(348,'DROP DATABASE',40,'Syntax:\nDROP {DATABASE | SCHEMA} [IF EXISTS] db_name\n\nDROP DATABASE drops all tables in the database and deletes the\ndatabase. Be very careful with this statement! To use DROP DATABASE,\nyou need the DROP privilege on the database. DROP SCHEMA is a synonym\nfor DROP DATABASE.\n\n*Important*:\n\nWhen a database is dropped, privileges granted specifically for the\ndatabase are not automatically dropped. They must be dropped manually.\nSee [HELP GRANT].\n\nIF EXISTS is used to prevent an error from occurring if the database\ndoes not exist.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-database.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-database.html'),(349,'CHANGE MASTER TO',8,'Syntax:\nCHANGE MASTER TO option [, option] ...\n\noption:\n    MASTER_BIND = \'interface_name\'\n  | MASTER_HOST = \'host_name\'\n  | MASTER_USER = \'user_name\'\n  | MASTER_PASSWORD = \'password\'\n  | MASTER_PORT = port_num\n  | MASTER_CONNECT_RETRY = interval\n  | MASTER_HEARTBEAT_PERIOD = interval\n  | MASTER_LOG_FILE = \'master_log_name\'\n  | MASTER_LOG_POS = master_log_pos\n  | RELAY_LOG_FILE = \'relay_log_name\'\n  | RELAY_LOG_POS = relay_log_pos\n  | MASTER_SSL = {0|1}\n  | MASTER_SSL_CA = \'ca_file_name\'\n  | MASTER_SSL_CAPATH = \'ca_directory_name\'\n  | MASTER_SSL_CERT = \'cert_file_name\'\n  | MASTER_SSL_KEY = \'key_file_name\'\n  | MASTER_SSL_CIPHER = \'cipher_list\'\n  | MASTER_SSL_VERIFY_SERVER_CERT = {0|1}\n  | IGNORE_SERVER_IDS = (server_id_list)\n\nserver_id_list:\n    [server_id [, server_id] ... ]\n\nCHANGE MASTER TO changes the parameters that the slave server uses for\nconnecting to the master server, for reading the master binary log, and\nreading the slave relay log. It also updates the contents of the\nmaster.info and relay-log.info files. CHANGE MASTER TO requires the\nSUPER privilege.\n\nTo use CHANGE MASTER TO, the slave replication threads must be stopped\n(use STOP SLAVE if necessary).\n\nOptions not specified retain their value, except as indicated in the\nfollowing discussion. Thus, in most cases, there is no need to specify\noptions that do not change. For example, if the password to connect to\nyour MySQL master has changed, you just need to issue these statements\nto tell the slave about the new password:\n\nSTOP SLAVE; -- if replication was running\nCHANGE MASTER TO MASTER_PASSWORD=\'new3cret\';\nSTART SLAVE; -- if you want to restart replication\n\nMASTER_HOST, MASTER_USER, MASTER_PASSWORD, and MASTER_PORT provide\ninformation to the slave about how to connect to its master:\n\no MASTER_HOST and MASTER_PORT are the host name (or IP address) of the\n  master host and its TCP/IP port.\n\n  *Note*:\n\n  Replication cannot use Unix socket files. You must be able to connect\n  to the master MySQL server using TCP/IP.\n\n  If you specify the MASTER_HOST or MASTER_PORT option, the slave\n  assumes that the master server is different from before (even if the\n  option value is the same as its current value.) In this case, the old\n  values for the master binary log file name and position are\n  considered no longer applicable, so if you do not specify\n  MASTER_LOG_FILE and MASTER_LOG_POS in the statement,\n  MASTER_LOG_FILE=\'\' and MASTER_LOG_POS=4 are silently appended to it.\n\n  Setting MASTER_HOST=\'\' (that is, setting its value explicitly to an\n  empty string) is not the same as not setting MASTER_HOST at all.\n  Beginning with MySQL 5.5, trying to set MASTER_HOST to an empty\n  string fails with an error. Previously, setting MASTER_HOST to an\n  empty string caused START SLAVE subsequently to fail. (Bug #28796)\n\no MASTER_USER and MASTER_PASSWORD are the user name and password of the\n  account to use for connecting to the master.\n\n  In MySQL 5.5.20 and later, MASTER_USER cannot be made empty; setting\n  MASTER_USER = \'\' or leaving it unset when setting a value for\n  MASTER_PASSWORD causes an error (Bug #13427949).\n\n  The password used for a MySQL Replication slave account in a CHANGE\n  MASTER TO statement is limited to 32 characters in length; if the\n  password is longer, the statement succeeds, but any excess characters\n  are silently truncated. This is an issue specific to MySQL\n  Replication, which is fixed in MySQL 5.7. (Bug #11752299, Bug #43439)\n\n  The text of a running CHANGE MASTER TO statement, including values\n  for MASTER_USER and MASTER_PASSWORD, can be seen in the output of a\n  concurrent SHOW PROCESSLIST statement.\n\nThe MASTER_SSL_xxx options provide information about using SSL for the\nconnection. They correspond to the --ssl-xxx options described in\nhttp://dev.mysql.com/doc/refman/5.5/en/encrypted-connection-options.htm\nl, and\nhttp://dev.mysql.com/doc/refman/5.5/en/replication-solutions-encrypted-\nconnections.html. These options can be changed even on slaves that are\ncompiled without SSL support. They are saved to the master.info file,\nbut are ignored if the slave does not have SSL support enabled.\n\nMASTER_CONNECT_RETRY specifies how many seconds to wait between connect\nretries. The default is 60. The number of reconnection attempts is\nlimited by the --master-retry-count server option; for more\ninformation, see\nhttp://dev.mysql.com/doc/refman/5.5/en/replication-options.html.\n\nThe MASTER_BIND option is available in MySQL NDB Cluster 7.2 and later,\nbut is not supported in mainline MySQL 5.5.\n\nMASTER_BIND is for use on replication slaves having multiple network\ninterfaces, and determines which of the slave\'s network interfaces is\nchosen for connecting to the master.\n\nMASTER_HEARTBEAT_PERIOD sets the interval in seconds between\nreplication heartbeats. Whenever the master\'s binary log is updated\nwith an event, the waiting period for the next heartbeat is reset.\ninterval is a decimal value having the range 0 to 4294967 seconds and a\nresolution in milliseconds; the smallest nonzero value is 0.001.\nHeartbeats are sent by the master only if there are no unsent events in\nthe binary log file for a period longer than interval.\n\nSetting interval to 0 disables heartbeats altogether. The default value\nfor interval is equal to the value of slave_net_timeout divided by 2.\n\nSetting @@global.slave_net_timeout to a value less than that of the\ncurrent heartbeat interval results in a warning being issued. The\neffect of issuing RESET SLAVE on the heartbeat interval is to reset it\nto the default value.\n\nMASTER_LOG_FILE and MASTER_LOG_POS are the coordinates at which the\nslave I/O thread should begin reading from the master the next time the\nthread starts. RELAY_LOG_FILE and RELAY_LOG_POS are the coordinates at\nwhich the slave SQL thread should begin reading from the relay log the\nnext time the thread starts. If you specify either of MASTER_LOG_FILE\nor MASTER_LOG_POS, you cannot specify RELAY_LOG_FILE or RELAY_LOG_POS.\nIf neither of MASTER_LOG_FILE or MASTER_LOG_POS is specified, the slave\nuses the last coordinates of the slave SQL thread before CHANGE MASTER\nTO was issued. This ensures that there is no discontinuity in\nreplication, even if the slave SQL thread was late compared to the\nslave I/O thread, when you merely want to change, say, the password to\nuse.\n\nCHANGE MASTER TO deletes all relay log files and starts a new one,\nunless you specify RELAY_LOG_FILE or RELAY_LOG_POS. In that case, relay\nlog files are kept; the relay_log_purge global variable is set silently\nto 0.\n\nPrior to MySQL 5.5, RELAY_LOG_FILE required an absolute path. In MySQL\n5.5, the path can be relative, in which case the path is assumed to be\nrelative to the slave\'s data directory. (Bug #12190)\n\nIGNORE_SERVER_IDS was added in MySQL 5.5. This option takes a\ncomma-separated list of 0 or more server IDs. Events originating from\nthe corresponding servers are ignored, with the exception of log\nrotation and deletion events, which are still recorded in the relay\nlog.\n\nIn circular replication, the originating server normally acts as the\nterminator of its own events, so that they are not applied more than\nonce. Thus, this option is useful in circular replication when one of\nthe servers in the circle is removed. Suppose that you have a circular\nreplication setup with 4 servers, having server IDs 1, 2, 3, and 4, and\nserver 3 fails. When bridging the gap by starting replication from\nserver 2 to server 4, you can include IGNORE_SERVER_IDS = (3) in the\nCHANGE MASTER TO statement that you issue on server 4 to tell it to use\nserver 2 as its master instead of server 3. Doing so causes it to\nignore and not to propagate any statements that originated with the\nserver that is no longer in use.\n\nWhen a CHANGE MASTER TO statement is issued without any\nIGNORE_SERVER_IDS option, any existing list is preserved. To clear the\nlist of ignored servers, it is necessary to use the option with an\nempty list:\n\nCHANGE MASTER TO IGNORE_SERVER_IDS = ();\n\nRESET SLAVE ALL has no effect on the server ID list. This issue is\nfixed in MySQL 5.7. (Bug #18816897)\n\nIf IGNORE_SERVER_IDS contains the server\'s own ID and the server was\nstarted with the --replicate-same-server-id option enabled, an error\nresults.\n\nAlso beginning with MySQL 5.5, the master.info file and the output of\nSHOW SLAVE STATUS are extended to provide the list of servers that are\ncurrently ignored. For more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/slave-logs-status.html, and\n[HELP SHOW SLAVE STATUS].\n\nBeginning with MySQL 5.5.5, invoking CHANGE MASTER TO causes the\nprevious values for MASTER_HOST, MASTER_PORT, MASTER_LOG_FILE, and\nMASTER_LOG_POS to be written to the error log, along with other\ninformation about the slave\'s state prior to execution.\n\nCHANGE MASTER TO is useful for setting up a slave when you have the\nsnapshot of the master and have recorded the master binary log\ncoordinates corresponding to the time of the snapshot. After loading\nthe snapshot into the slave to synchronize it with the master, you can\nrun CHANGE MASTER TO MASTER_LOG_FILE=\'log_name\', MASTER_LOG_POS=log_pos\non the slave to specify the coordinates at which the slave should begin\nreading the master binary log.\n\nThe following example changes the master server the slave uses and\nestablishes the master binary log coordinates from which the slave\nbegins reading. This is used when you want to set up the slave to\nreplicate the master:\n\nCHANGE MASTER TO\n  MASTER_HOST=\'master2.mycompany.com\',\n  MASTER_USER=\'replication\',\n  MASTER_PASSWORD=\'bigs3cret\',\n  MASTER_PORT=3306,\n  MASTER_LOG_FILE=\'master2-bin.001\',\n  MASTER_LOG_POS=4,\n  MASTER_CONNECT_RETRY=10;\n\nThe next example shows an operation that is less frequently employed.\nIt is used when the slave has relay log files that you want it to\nexecute again for some reason. To do this, the master need not be\nreachable. You need only use CHANGE MASTER TO and start the SQL thread\n(START SLAVE SQL_THREAD):\n\nCHANGE MASTER TO\n  RELAY_LOG_FILE=\'slave-relay-bin.006\',\n  RELAY_LOG_POS=4025;\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/change-master-to.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/change-master-to.html'),(350,'SHOW GRANTS',27,'Syntax:\nSHOW GRANTS [FOR user]\n\nThis statement displays the privileges that are assigned to a MySQL\nuser account, in the form of GRANT statements that must be executed to\nduplicate the privilege assignments.\n\nSHOW GRANTS requires the SELECT privilege for the mysql database,\nexcept to display privileges for the current user. For output that\nincludes an IDENTIFIED BY PASSWORD clause displaying an account\npassword hash value, the SUPER privilege is required to see the actual\nhash value. Otherwise, the value displays as <secret>.\n\nTo name the account for SHOW GRANTS, use the same format as for the\nGRANT statement; for example, \'jeffrey\'@\'localhost\':\n\nmysql> SHOW GRANTS FOR \'jeffrey\'@\'localhost\';\n+------------------------------------------------------------------+\n| Grants for jeffrey@localhost                                     |\n+------------------------------------------------------------------+\n| GRANT USAGE ON *.* TO `jeffrey`@`localhost`                      |\n| GRANT SELECT, INSERT, UPDATE ON `db1`.* TO `jeffrey`@`localhost` |\n+------------------------------------------------------------------+\n\nThe host part, if omitted, defaults to \'%\'. For additional information\nabout specifying account names, see\nhttp://dev.mysql.com/doc/refman/5.5/en/account-names.html.\n\nTo display the privileges granted to the current user (the account you\nare using to connect to the server), you can use any of the following\nstatements:\n\nSHOW GRANTS;\nSHOW GRANTS FOR CURRENT_USER;\nSHOW GRANTS FOR CURRENT_USER();\n\nIf SHOW GRANTS FOR CURRENT_USER (or any of the equivalent syntaxes) is\nused in definer context, such as within a stored procedure that\nexecutes with definer rather than invoker privileges), the grants\ndisplayed are those of the definer and not the invoker.\n\nSHOW GRANTS does not display privileges that are available to the named\naccount but are granted to a different account. For example, if an\nanonymous account exists, the named account might be able to use its\nprivileges, but SHOW GRANTS does not display them.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-grants.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-grants.html'),(351,'CRC32',3,'Syntax:\nCRC32(expr)\n\nComputes a cyclic redundancy check value and returns a 32-bit unsigned\nvalue. The result is NULL if the argument is NULL. The argument is\nexpected to be a string and (if possible) is treated as one if it is\nnot.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT CRC32(\'MySQL\');\n        -> 3259397556\nmysql> SELECT CRC32(\'mysql\');\n        -> 2501908538\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(352,'STARTPOINT',13,'StartPoint(ls)\n\nReturns the Point that is the start point of the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-linestring-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT AsText(StartPoint(GeomFromText(@ls)));\n+---------------------------------------+\n| AsText(StartPoint(GeomFromText(@ls))) |\n+---------------------------------------+\n| POINT(1 1)                            |\n+---------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-linestring-property-functions.html'),(353,'MPOLYFROMTEXT',4,'MPolyFromText(wkt[, srid]), MultiPolygonFromText(wkt[, srid])\n\nConstructs a MultiPolygon value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html'),(354,'DECLARE VARIABLE',24,'Syntax:\nDECLARE var_name [, var_name] ... type [DEFAULT value]\n\nThis statement declares local variables within stored programs. To\nprovide a default value for a variable, include a DEFAULT clause. The\nvalue can be specified as an expression; it need not be a constant. If\nthe DEFAULT clause is missing, the initial value is NULL.\n\nLocal variables are treated like stored routine parameters with respect\nto data type and overflow checking. See [HELP CREATE PROCEDURE].\n\nVariable declarations must appear before cursor or handler\ndeclarations.\n\nLocal variable names are not case sensitive. Permissible characters and\nquoting rules are the same as for other identifiers, as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/identifiers.html.\n\nThe scope of a local variable is the BEGIN ... END block within which\nit is declared. The variable can be referred to in blocks nested within\nthe declaring block, except those blocks that declare a variable with\nthe same name.\n\nFor examples of variable declarations, see\nhttp://dev.mysql.com/doc/refman/5.5/en/local-variable-scope.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/declare-local-variable.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/declare-local-variable.html'),(355,'NOT BETWEEN',20,'Syntax:\nexpr NOT BETWEEN min AND max\n\nThis is the same as NOT (expr BETWEEN min AND max).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(356,'YEARWEEK',32,'Syntax:\nYEARWEEK(date), YEARWEEK(date,mode)\n\nReturns year and week for a date. The year in the result may be\ndifferent from the year in the date argument for the first and the last\nweek of the year.\n\nThe mode argument works exactly like the mode argument to WEEK(). For\nthe single-argument syntax, a mode value of 0 is used. Unlike WEEK(),\nthe value of default_week_format does not influence YEARWEEK().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT YEARWEEK(\'1987-01-01\');\n        -> 198652\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(357,'BIT_OR',16,'Syntax:\nBIT_OR(expr)\n\nReturns the bitwise OR of all bits in expr. The calculation is\nperformed with 64-bit (BIGINT) precision.\n\nIf there are no matching rows, BIT_OR() returns a neutral value (all\nbits set to 0).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(358,'LOG10',3,'Syntax:\nLOG10(X)\n\nReturns the base-10 logarithm of X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT LOG10(2);\n        -> 0.30102999566398\nmysql> SELECT LOG10(100);\n        -> 2\nmysql> SELECT LOG10(-100);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(359,'DECIMAL',23,'DECIMAL[(M[,D])] [UNSIGNED] [ZEROFILL]\n\nA packed \"exact\" fixed-point number. M is the total number of digits\n(the precision) and D is the number of digits after the decimal point\n(the scale). The decimal point and (for negative numbers) the - sign\nare not counted in M. If D is 0, values have no decimal point or\nfractional part. The maximum number of digits (M) for DECIMAL is 65.\nThe maximum number of supported decimals (D) is 30. If D is omitted,\nthe default is 0. If M is omitted, the default is 10.\n\nUNSIGNED, if specified, disallows negative values.\n\nAll basic calculations (+, -, *, /) with DECIMAL columns are done with\na precision of 65 digits.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(360,'CREATE FUNCTION',40,'The CREATE FUNCTION statement is used to create stored functions and\nuser-defined functions (UDFs):\n\no For information about creating stored functions, see [HELP CREATE\n  PROCEDURE].\n\no For information about creating user-defined functions, see [HELP\n  CREATE FUNCTION UDF].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-function.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-function.html'),(361,'<',20,'Syntax:\n<\n\nLess than:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 2 < 2;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(362,'MD5',12,'Syntax:\nMD5(str)\n\nCalculates an MD5 128-bit checksum for the string. The value is\nreturned as a string of 32 hexadecimal digits, or NULL if the argument\nwas NULL. The return value can, for example, be used as a hash key. See\nthe notes at the beginning of this section about storing hash values\nefficiently.\n\nAs of MySQL 5.5.3, the return value is a nonbinary string in the\nconnection character set. Before 5.5.3, the return value is a binary\nstring; see the notes at the beginning of this section about using the\nvalue as a nonbinary string.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT MD5(\'testing\');\n        -> \'ae2b1fca515949e5d54fb22b8ed95575\'\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(363,'DAYOFMONTH',32,'Syntax:\nDAYOFMONTH(date)\n\nReturns the day of the month for date, in the range 1 to 31, or 0 for\ndates such as \'0000-00-00\' or \'2008-00-00\' that have a zero day part.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFMONTH(\'2007-02-03\');\n        -> 3\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(364,'UNIX_TIMESTAMP',32,'Syntax:\nUNIX_TIMESTAMP(), UNIX_TIMESTAMP(date)\n\nIf called with no argument, returns a Unix timestamp (seconds since\n\'1970-01-01 00:00:00\' UTC) as an unsigned integer. If UNIX_TIMESTAMP()\nis called with a date argument, it returns the value of the argument as\nseconds since \'1970-01-01 00:00:00\' UTC. The date argument may be a\nDATE, DATETIME, or TIMESTAMP string, or a number in YYMMDD,\nYYMMDDHHMMSS, YYYYMMDD, or YYYYMMDDHHMMSS format. The server interprets\ndate as a value in the current time zone and converts it to an internal\nvalue in UTC. Clients can set their time zone as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/time-zone-support.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT UNIX_TIMESTAMP();\n        -> 1447431666\nmysql> SELECT UNIX_TIMESTAMP(\'2015-11-13 10:20:19\');\n        -> 1447431619\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(365,'RENAME USER',10,'Syntax:\nRENAME USER old_user TO new_user\n    [, old_user TO new_user] ...\n\nThe RENAME USER statement renames existing MySQL accounts. An error\noccurs for old accounts that do not exist or new accounts that already\nexist.\n\nTo use RENAME USER, you must have the global CREATE USER privilege, or\nthe UPDATE privilege for the mysql database. When the read_only system\nvariable is enabled, RENAME USER additionally requires the SUPER\nprivilege.\n\nEach account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.5/en/account-names.html. For example:\n\nRENAME USER \'jeffrey\'@\'localhost\' TO \'jeff\'@\'127.0.0.1\';\n\nThe host name part of the account name, if omitted, defaults to \'%\'.\n\nRENAME USER causes the privileges held by the old user to be those held\nby the new user. However, RENAME USER does not automatically drop or\ninvalidate databases or objects within them that the old user created.\nThis includes stored programs or views for which the DEFINER attribute\nnames the old user. Attempts to access such objects may produce an\nerror if they execute in definer security context. (For information\nabout security context, see\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-security.html.)\n\nThe privilege changes take effect as indicated in\nhttp://dev.mysql.com/doc/refman/5.5/en/privilege-changes.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/rename-user.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/rename-user.html'),(366,'NUMPOINTS',13,'NumPoints(ls)\n\nReturns the number of Point objects in the LineString value ls.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-linestring-property-functions.html\n\n','mysql> SET @ls = \'LineString(1 1,2 2,3 3)\';\nmysql> SELECT NumPoints(GeomFromText(@ls));\n+------------------------------+\n| NumPoints(GeomFromText(@ls)) |\n+------------------------------+\n|                            3 |\n+------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-linestring-property-functions.html'),(367,'ALTER LOGFILE GROUP',40,'Syntax:\nALTER LOGFILE GROUP logfile_group\n    ADD UNDOFILE \'file_name\'\n    [INITIAL_SIZE [=] size]\n    [WAIT]\n    ENGINE [=] engine_name\n\nThis statement adds an UNDO file named \'file_name\' to an existing log\nfile group logfile_group. An ALTER LOGFILE GROUP statement has one and\nonly one ADD UNDOFILE clause. No DROP UNDOFILE clause is currently\nsupported.\n\n*Note*:\n\nAll NDB Cluster Disk Data objects share the same namespace. This means\nthat each Disk Data object must be uniquely named (and not merely each\nDisk Data object of a given type). For example, you cannot have a\ntablespace and an undo log file with the same name, or an undo log file\nand a data file with the same name.\n\nThe optional INITIAL_SIZE parameter sets the UNDO file\'s initial size\nin bytes; if not specified, the initial size defaults to 134217728 (128\nMB). Prior to MySQL NDB Cluster 7.2.14, this value was required to be\nspecified using digits (Bug #13116514, Bug #16104705, Bug #62858); in\nMySQL NDB Cluster 7.2.14 and later, you may optionally follow size with\na one-letter abbreviation for an order of magnitude, similar to those\nused in my.cnf. Generally, this is one of the letters M (megabytes) or\nG (gigabytes).\n\nOn 32-bit systems, the maximum supported value for INITIAL_SIZE is\n4294967296 (4 GB). (Bug #29186)\n\nThe minimum allowed value for INITIAL_SIZE is 1048576 (1 MB). (Bug\n#29574)\n\n*Note*:\n\nWAIT is parsed but otherwise ignored. This keyword currently has no\neffect, and is intended for future expansion.\n\nThe ENGINE parameter (required) determines the storage engine which is\nused by this log file group, with engine_name being the name of the\nstorage engine. Currently, the only accepted values for engine_name are\n\"NDBCLUSTER\" and \"NDB\". The two values are equivalent.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-logfile-group.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-logfile-group.html'),(368,'LOCALTIMESTAMP',32,'Syntax:\nLOCALTIMESTAMP, LOCALTIMESTAMP()\n\nLOCALTIMESTAMP and LOCALTIMESTAMP() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(369,'ADDDATE',32,'Syntax:\nADDDATE(date,INTERVAL expr unit), ADDDATE(expr,days)\n\nWhen invoked with the INTERVAL form of the second argument, ADDDATE()\nis a synonym for DATE_ADD(). The related function SUBDATE() is a\nsynonym for DATE_SUB(). For information on the INTERVAL unit argument,\nsee the discussion for DATE_ADD().\n\nmysql> SELECT DATE_ADD(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2008-02-02\'\nmysql> SELECT ADDDATE(\'2008-01-02\', INTERVAL 31 DAY);\n        -> \'2008-02-02\'\n\nWhen invoked with the days form of the second argument, MySQL treats it\nas an integer number of days to be added to expr.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT ADDDATE(\'2008-01-02\', 31);\n        -> \'2008-02-02\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(370,'ALTER FUNCTION',40,'Syntax:\nALTER FUNCTION func_name [characteristic ...]\n\ncharacteristic:\n    COMMENT \'string\'\n  | LANGUAGE SQL\n  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }\n  | SQL SECURITY { DEFINER | INVOKER }\n\nThis statement can be used to change the characteristics of a stored\nfunction. More than one change may be specified in an ALTER FUNCTION\nstatement. However, you cannot change the parameters or body of a\nstored function using this statement; to make such changes, you must\ndrop and re-create the function using DROP FUNCTION and CREATE\nFUNCTION.\n\nYou must have the ALTER ROUTINE privilege for the function. (That\nprivilege is granted automatically to the function creator.) If binary\nlogging is enabled, the ALTER FUNCTION statement might also require the\nSUPER privilege, as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-logging.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-function.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-function.html'),(371,'IS_FREE_LOCK',14,'Syntax:\nIS_FREE_LOCK(str)\n\nChecks whether the lock named str is free to use (that is, not locked).\nReturns 1 if the lock is free (no one is using the lock), 0 if the lock\nis in use, and NULL if an error occurs (such as an incorrect argument).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(372,'DEALLOCATE PREPARE',8,'Syntax:\n{DEALLOCATE | DROP} PREPARE stmt_name\n\nTo deallocate a prepared statement produced with PREPARE, use a\nDEALLOCATE PREPARE statement that refers to the prepared statement\nname. Attempting to execute a prepared statement after deallocating it\nresults in an error.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/deallocate-prepare.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/deallocate-prepare.html'),(373,'TOUCHES',31,'Touches(g1, g2)\n\nTwo geometries spatially touch if their interiors do not intersect, but\nthe boundary of one of the geometries intersects either the boundary or\nthe interior of the other.\n\nThis function returns 1 or 0 to indicate whether g1 spatially touches\ng2.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-object-shapes.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-object-shapes.html'),(374,'AUTO_INCREMENT',23,'The AUTO_INCREMENT attribute can be used to generate a unique identity\nfor new rows:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/example-auto-increment.html\n\n','CREATE TABLE animals (\n     id MEDIUMINT NOT NULL AUTO_INCREMENT,\n     name CHAR(30) NOT NULL,\n     PRIMARY KEY (id)\n);\n\nINSERT INTO animals (name) VALUES\n    (\'dog\'),(\'cat\'),(\'penguin\'),\n    (\'lax\'),(\'whale\'),(\'ostrich\');\n\nSELECT * FROM animals;\n','http://dev.mysql.com/doc/refman/5.5/en/example-auto-increment.html'),(375,'UNCOMPRESS',12,'Syntax:\nUNCOMPRESS(string_to_uncompress)\n\nUncompresses a string compressed by the COMPRESS() function. If the\nargument is not a compressed value, the result is NULL. This function\nrequires MySQL to have been compiled with a compression library such as\nzlib. Otherwise, the return value is always NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT UNCOMPRESS(COMPRESS(\'any string\'));\n        -> \'any string\'\nmysql> SELECT UNCOMPRESS(\'any string\');\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(376,'GEOMCOLLFROMTEXT',4,'GeomCollFromText(wkt[, srid]), GeometryCollectionFromText(wkt[, srid])\n\nConstructs a GeometryCollection value using its WKT representation and\nSRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html'),(377,'LAST_INSERT_ID',17,'Syntax:\nLAST_INSERT_ID(), LAST_INSERT_ID(expr)\n\nWith no argument, LAST_INSERT_ID() returns a 64-bit value representing\nthe first automatically generated value successfully inserted for an\nAUTO_INCREMENT column as a result of the most recently executed INSERT\nstatement. The value has a type of BIGINT UNSIGNED as of MySQL 5.5.29,\nBIGINT (signed) before that. The value of LAST_INSERT_ID() remains\nunchanged if no rows are successfully inserted.\n\nWith an argument, LAST_INSERT_ID() returns an unsigned integer as of\nMySQL 5.5.29, a signed integer before that.\n\nFor example, after inserting a row that generates an AUTO_INCREMENT\nvalue, you can get the value like this:\n\nmysql> SELECT LAST_INSERT_ID();\n        -> 195\n\nThe currently executing statement does not affect the value of\nLAST_INSERT_ID(). Suppose that you generate an AUTO_INCREMENT value\nwith one statement, and then refer to LAST_INSERT_ID() in a\nmultiple-row INSERT statement that inserts rows into a table with its\nown AUTO_INCREMENT column. The value of LAST_INSERT_ID() will remain\nstable in the second statement; its value for the second and later rows\nis not affected by the earlier row insertions. (However, if you mix\nreferences to LAST_INSERT_ID() and LAST_INSERT_ID(expr), the effect is\nundefined.)\n\nIf the previous statement returned an error, the value of\nLAST_INSERT_ID() is undefined. For transactional tables, if the\nstatement is rolled back due to an error, the value of LAST_INSERT_ID()\nis left undefined. For manual ROLLBACK, the value of LAST_INSERT_ID()\nis not restored to that before the transaction; it remains as it was at\nthe point of the ROLLBACK.\n\nPrior to MySQL 5.5.35, this function was not replicated correctly if\nreplication filtering rules were in use. (Bug #17234370, Bug #69861)\n\nWithin the body of a stored routine (procedure or function) or a\ntrigger, the value of LAST_INSERT_ID() changes the same way as for\nstatements executed outside the body of these kinds of objects. The\neffect of a stored routine or trigger upon the value of\nLAST_INSERT_ID() that is seen by following statements depends on the\nkind of routine:\n\no If a stored procedure executes statements that change the value of\n  LAST_INSERT_ID(), the changed value is seen by statements that follow\n  the procedure call.\n\no For stored functions and triggers that change the value, the value is\n  restored when the function or trigger ends, so following statements\n  will not see a changed value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(378,'FLOOR',3,'Syntax:\nFLOOR(X)\n\nReturns the largest integer value not greater than X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT FLOOR(1.23), FLOOR(-1.23);\n        -> 1, -2\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(379,'COS',3,'Syntax:\nCOS(X)\n\nReturns the cosine of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT COS(PI());\n        -> -1\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(380,'STD',16,'Syntax:\nSTD(expr)\n\nReturns the population standard deviation of expr. STD() is a synonym\nfor the standard SQL function STDDEV_POP(), provided as a MySQL\nextension.\n\nIf there are no matching rows, STD() returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(381,'DATE FUNCTION',32,'Syntax:\nDATE(expr)\n\nExtracts the date part of the date or datetime expression expr.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DATE(\'2003-12-31 01:02:03\');\n        -> \'2003-12-31\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(382,'TAN',3,'Syntax:\nTAN(X)\n\nReturns the tangent of X, where X is given in radians.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT TAN(PI());\n        -> -1.2246063538224e-16\nmysql> SELECT TAN(PI()+1);\n        -> 1.5574077246549\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(383,'WEEKOFYEAR',32,'Syntax:\nWEEKOFYEAR(date)\n\nReturns the calendar week of the date as a number in the range from 1\nto 53. WEEKOFYEAR() is a compatibility function that is equivalent to\nWEEK(date,3).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT WEEKOFYEAR(\'2008-02-20\');\n        -> 8\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(384,'UNCOMPRESSED_LENGTH',12,'Syntax:\nUNCOMPRESSED_LENGTH(compressed_string)\n\nReturns the length that the compressed string had before being\ncompressed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT UNCOMPRESSED_LENGTH(COMPRESS(REPEAT(\'a\',30)));\n        -> 30\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(385,'SUBTIME',32,'Syntax:\nSUBTIME(expr1,expr2)\n\nSUBTIME() returns expr1 − expr2 expressed as a value in the same\nformat as expr1. expr1 is a time or datetime expression, and expr2 is a\ntime expression.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT SUBTIME(\'2007-12-31 23:59:59.999999\',\'1 1:1:1.000002\');\n        -> \'2007-12-30 22:58:58.999997\'\nmysql> SELECT SUBTIME(\'01:00:00.999999\', \'02:00:00.999998\');\n        -> \'-00:59:59.999999\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(386,'LOG2',3,'Syntax:\nLOG2(X)\n\nReturns the base-2 logarithm of X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT LOG2(65536);\n        -> 16\nmysql> SELECT LOG2(-100);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(387,'POW',3,'Syntax:\nPOW(X,Y)\n\nReturns the value of X raised to the power of Y.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT POW(2,2);\n        -> 4\nmysql> SELECT POW(2,-2);\n        -> 0.25\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(388,'DROP TABLE',40,'Syntax:\nDROP [TEMPORARY] TABLE [IF EXISTS]\n    tbl_name [, tbl_name] ...\n    [RESTRICT | CASCADE]\n\nDROP TABLE removes one or more tables. You must have the DROP privilege\nfor each table.\n\nBe careful with this statement! It removes the table definition and all\ntable data. For a partitioned table, it permanently removes the table\ndefinition, all its partitions, and all data stored in those\npartitions. It also removes the partitioning definition (.par) file\nassociated with the dropped table.\n\nDROP TABLE causes an implicit commit, except when used with the\nTEMPORARY keyword. See\nhttp://dev.mysql.com/doc/refman/5.5/en/implicit-commit.html.\n\n*Important*:\n\nWhen a table is dropped, privileges granted specifically for the table\nare not automatically dropped. They must be dropped manually. See [HELP\nGRANT].\n\nIf any tables named in the argument list do not exist, the statement\nreturns an error indicating by name which nonexisting tables it was\nunable to drop, but also drops all tables in the list that do exist.\n\nUse IF EXISTS to prevent an error from occurring for tables that do not\nexist. Instead of an error, a NOTE is generated for each nonexistent\ntable; these notes can be displayed with SHOW WARNINGS. See [HELP SHOW\nWARNINGS].\n\nIF EXISTS can also be useful for dropping tables in unusual\ncircumstances under which there is an .frm file but no table managed by\nthe storage engine. (For example, if an abnormal server exit occurs\nafter removal of the table from the storage engine but before .frm file\nremoval.)\n\nThe TEMPORARY keyword has the following effects:\n\no The statement drops only TEMPORARY tables.\n\no The statement does not cause an implicit commit.\n\no No access rights are checked. A TEMPORARY table is visible only with\n  the session that created it, so no check is necessary.\n\nUsing TEMPORARY is a good way to ensure that you do not accidentally\ndrop a non-TEMPORARY table.\n\nThe RESTRICT and CASCADE keywords do nothing. They are permitted to\nmake porting easier from other database systems.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-table.html'),(389,'NOW',32,'Syntax:\nNOW()\n\nReturns the current date and time as a value in \'YYYY-MM-DD HH:MM:SS\'\nor YYYYMMDDHHMMSS.uuuuuu format, depending on whether the function is\nused in a string or numeric context. The value is expressed in the\ncurrent time zone.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT NOW();\n        -> \'2007-12-15 23:50:26\'\nmysql> SELECT NOW() + 0;\n        -> 20071215235026.000000\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(390,'SHOW ENGINES',27,'Syntax:\nSHOW [STORAGE] ENGINES\n\nSHOW ENGINES displays status information about the server\'s storage\nengines. This is particularly useful for checking whether a storage\nengine is supported, or to see what the default engine is. This\ninformation can also be obtained from the INFORMATION_SCHEMA ENGINES\ntable. See http://dev.mysql.com/doc/refman/5.5/en/engines-table.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-engines.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-engines.html'),(391,'LONGBLOB',23,'LONGBLOB\n\nA BLOB column with a maximum length of 4,294,967,295 or 4GB (232 − 1)\nbytes. The effective maximum length of LONGBLOB columns depends on the\nconfigured maximum packet size in the client/server protocol and\navailable memory. Each LONGBLOB value is stored using a 4-byte length\nprefix that indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(392,'YEAR DATA TYPE',23,'YEAR[(2|4)]\n\nA year in two-digit or four-digit format. The default is four-digit\nformat. YEAR(2) or YEAR(4) differ in display format, but have the same\nrange of values. In four-digit format, values display as 1901 to 2155,\nand 0000. In two-digit format, values display as 70 to 69, representing\nyears from 1970 to 2069. MySQL displays YEAR values in YYYY or YY\nformat, but permits assignment of values to YEAR columns using either\nstrings or numbers.\n\n*Note*:\n\nThe YEAR(2) data type has certain issues that you should consider\nbefore choosing to use it. As of MySQL 5.5.27, YEAR(2) is deprecated.\nFor more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/migrating-to-year4.html.\n\nFor additional information about YEAR display format and interpretation\nof input values, see http://dev.mysql.com/doc/refman/5.5/en/year.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html'),(393,'SUM',16,'Syntax:\nSUM([DISTINCT] expr)\n\nReturns the sum of expr. If the return set has no rows, SUM() returns\nNULL. The DISTINCT keyword can be used to sum only the distinct values\nof expr.\n\nIf there are no matching rows, SUM() returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(394,'REPEAT FUNCTION',38,'Syntax:\nREPEAT(str,count)\n\nReturns a string consisting of the string str repeated count times. If\ncount is less than 1, returns an empty string. Returns NULL if str or\ncount are NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT REPEAT(\'MySQL\', 3);\n        -> \'MySQLMySQLMySQL\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(395,'SOUNDEX',38,'Syntax:\nSOUNDEX(str)\n\nReturns a soundex string from str. Two strings that sound almost the\nsame should have identical soundex strings. A standard soundex string\nis four characters long, but the SOUNDEX() function returns an\narbitrarily long string. You can use SUBSTRING() on the result to get a\nstandard soundex string. All nonalphabetic characters in str are\nignored. All international alphabetic characters outside the A-Z range\nare treated as vowels.\n\n*Important*:\n\nWhen using SOUNDEX(), you should be aware of the following limitations:\n\no This function, as currently implemented, is intended to work well\n  with strings that are in the English language only. Strings in other\n  languages may not produce reliable results.\n\no This function is not guaranteed to provide consistent results with\n  strings that use multibyte character sets, including utf-8. See Bug\n  #22638 for more information.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT SOUNDEX(\'Hello\');\n        -> \'H400\'\nmysql> SELECT SOUNDEX(\'Quadratically\');\n        -> \'Q36324\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(396,'MBRTOUCHES',7,'MBRTouches(g1, g2)\n\nTwo geometries spatially touch if their interiors do not intersect, but\nthe boundary of one of the geometries intersects either the boundary or\nthe interior of the other.\n\nThis function returns 1 or 0 to indicate whether the minimum bounding\nrectangles of the two geometries g1 and g2 touch.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html'),(397,'DROP EVENT',40,'Syntax:\nDROP EVENT [IF EXISTS] event_name\n\nThis statement drops the event named event_name. The event immediately\nceases being active, and is deleted completely from the server.\n\nIf the event does not exist, the error ERROR 1517 (HY000): Unknown\nevent \'event_name\' results. You can override this and cause the\nstatement to generate a warning for nonexistent events instead using IF\nEXISTS.\n\nThis statement requires the EVENT privilege for the schema to which the\nevent to be dropped belongs.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-event.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-event.html'),(398,'VARBINARY',23,'VARBINARY(M)\n\nThe VARBINARY type is similar to the VARCHAR type, but stores binary\nbyte strings rather than nonbinary character strings. M represents the\nmaximum column length in bytes.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(399,'LOAD INDEX',27,'Syntax:\nLOAD INDEX INTO CACHE\n  tbl_index_list [, tbl_index_list] ...\n\ntbl_index_list:\n  tbl_name\n    [PARTITION (partition_list | ALL)]\n    [[INDEX|KEY] (index_name[, index_name] ...)]\n    [IGNORE LEAVES]\n\npartition_list:\n    partition_name[, partition_name][, ...]\n\nThe LOAD INDEX INTO CACHE statement preloads a table index into the key\ncache to which it has been assigned by an explicit CACHE INDEX\nstatement, or into the default key cache otherwise.\n\nLOAD INDEX INTO CACHE is used only for MyISAM tables. In MySQL 5.5, it\nis also supported for partitioned MyISAM tables; in addition, indexes\non partitioned tables can be preloaded for one, several, or all\npartitions.\n\nThe IGNORE LEAVES modifier causes only blocks for the nonleaf nodes of\nthe index to be preloaded.\n\nIGNORE LEAVES is also supported for partitioned MyISAM tables.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/load-index.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/load-index.html'),(400,'UNION',28,'Syntax:\nSELECT ...\nUNION [ALL | DISTINCT] SELECT ...\n[UNION [ALL | DISTINCT] SELECT ...]\n\nUNION is used to combine the result from multiple SELECT statements\ninto a single result set.\n\nThe column names from the first SELECT statement are used as the column\nnames for the results returned. Selected columns listed in\ncorresponding positions of each SELECT statement should have the same\ndata type. (For example, the first column selected by the first\nstatement should have the same type as the first column selected by the\nother statements.)\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/union.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/union.html'),(401,'TO_DAYS',32,'Syntax:\nTO_DAYS(date)\n\nGiven a date date, returns a day number (the number of days since year\n0).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TO_DAYS(950501);\n        -> 728779\nmysql> SELECT TO_DAYS(\'2007-10-07\');\n        -> 733321\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(402,'SHOW CREATE DATABASE',27,'Syntax:\nSHOW CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name\n\nShows the CREATE DATABASE statement that creates the named database. If\nthe SHOW statement includes an IF NOT EXISTS clause, the output too\nincludes such a clause. SHOW CREATE SCHEMA is a synonym for SHOW CREATE\nDATABASE.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-create-database.html\n\n','mysql> SHOW CREATE DATABASE test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n\nmysql> SHOW CREATE SCHEMA test\\G\n*************************** 1. row ***************************\n       Database: test\nCreate Database: CREATE DATABASE `test`\n                 /*!40100 DEFAULT CHARACTER SET latin1 */\n','http://dev.mysql.com/doc/refman/5.5/en/show-create-database.html'),(403,'SHOW INDEX',27,'Syntax:\nSHOW {INDEX | INDEXES | KEYS}\n    {FROM | IN} tbl_name\n    [{FROM | IN} db_name]\n    [WHERE expr]\n\nSHOW INDEX returns table index information. The format resembles that\nof the SQLStatistics call in ODBC. This statement requires some\nprivilege for any column in the table.\n\nYou can use db_name.tbl_name as an alternative to the tbl_name FROM\ndb_name syntax. These two statements are equivalent:\n\nSHOW INDEX FROM mytable FROM mydb;\nSHOW INDEX FROM mydb.mytable;\n\nThe WHERE clause can be given to select rows using more general\nconditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nmysql> SHOW INDEX FROM City\\G\n*************************** 1. row ***************************\n        Table: city\n   Non_unique: 0\n     Key_name: PRIMARY\n Seq_in_index: 1\n  Column_name: ID\n    Collation: A\n  Cardinality: 4321\n     Sub_part: NULL\n       Packed: NULL\n         Null: \n   Index_type: BTREE\n      Comment: \nIndex_comment: \n*************************** 2. row ***************************\n        Table: city\n   Non_unique: 1\n     Key_name: CountryCode\n Seq_in_index: 1\n  Column_name: CountryCode\n    Collation: A\n  Cardinality: 4321\n     Sub_part: NULL\n       Packed: NULL\n         Null: \n   Index_type: BTREE\n      Comment: \nIndex_comment: \n\nSHOW INDEX returns the following fields:\n\no Table\n\n  The name of the table.\n\no Non_unique\n\n  0 if the index cannot contain duplicates, 1 if it can.\n\no Key_name\n\n  The name of the index. If the index is the primary key, the name is\n  always PRIMARY.\n\no Seq_in_index\n\n  The column sequence number in the index, starting with 1.\n\no Column_name\n\n  The column name.\n\no Collation\n\n  How the column is sorted in the index. This can have values A\n  (ascending) or NULL (not sorted).\n\no Cardinality\n\n  An estimate of the number of unique values in the index. To update\n  this number, run ANALYZE TABLE or (for MyISAM tables) myisamchk -a.\n\n  Cardinality is counted based on statistics stored as integers, so the\n  value is not necessarily exact even for small tables. The higher the\n  cardinality, the greater the chance that MySQL uses the index when\n  doing joins.\n\no Sub_part\n\n  The index prefix. That is, the number of indexed characters if the\n  column is only partly indexed, NULL if the entire column is indexed.\n\n  *Note*:\n\n  Prefix limits are measured in bytes, whereas the prefix length in\n  CREATE TABLE, ALTER TABLE, and CREATE INDEX statements is interpreted\n  as number of characters for nonbinary string types (CHAR, VARCHAR,\n  TEXT) and number of bytes for binary string types (BINARY, VARBINARY,\n  BLOB). Take this into account when specifying a prefix length for a\n  nonbinary string column that uses a multibyte character set.\n\n  For additional information about index prefixes, see\n  http://dev.mysql.com/doc/refman/5.5/en/column-indexes.html, and [HELP\n  CREATE INDEX].\n\no Packed\n\n  Indicates how the key is packed. NULL if it is not.\n\no Null\n\n  Contains YES if the column may contain NULL values and \'\' if not.\n\no Index_type\n\n  The index method used (BTREE, FULLTEXT, HASH, RTREE).\n\no Comment\n\n  Information about the index not described in its own column, such as\n  disabled if the index is disabled.\n\no Index_comment\n\n  Any comment provided for the index with a COMMENT attribute when the\n  index was created.\n\nYou can also obtain information about table indexes from\nINFORMATION_SCHEMA, which contains a STATISTICS table. See\nhttp://dev.mysql.com/doc/refman/5.5/en/statistics-table.html.\n\nYou can list a table\'s indexes with the mysqlshow -k db_name tbl_name\ncommand.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-index.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-index.html'),(404,'!',15,'Syntax:\nNOT, !\n\nLogical NOT. Evaluates to 1 if the operand is 0, to 0 if the operand is\nnonzero, and NOT NULL returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html\n\n','mysql> SELECT NOT 10;\n        -> 0\nmysql> SELECT NOT 0;\n        -> 1\nmysql> SELECT NOT NULL;\n        -> NULL\nmysql> SELECT ! (1+1);\n        -> 0\nmysql> SELECT ! 1+1;\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html'),(405,'DOUBLE',23,'DOUBLE[(M,D)] [UNSIGNED] [ZEROFILL]\n\nA normal-size (double-precision) floating-point number. Permissible\nvalues are -1.7976931348623157E+308 to -2.2250738585072014E-308, 0, and\n2.2250738585072014E-308 to 1.7976931348623157E+308. These are the\ntheoretical limits, based on the IEEE standard. The actual range might\nbe slightly smaller depending on your hardware or operating system.\n\nM is the total number of digits and D is the number of digits following\nthe decimal point. If M and D are omitted, values are stored to the\nlimits permitted by the hardware. A double-precision floating-point\nnumber is accurate to approximately 15 decimal places.\n\nUNSIGNED, if specified, disallows negative values.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(406,'DECLARE HANDLER',24,'Syntax:\nDECLARE handler_action HANDLER\n    FOR condition_value [, condition_value] ...\n    statement\n\nhandler_action:\n    CONTINUE\n  | EXIT\n  | UNDO\n\ncondition_value:\n    mysql_error_code\n  | SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n  | SQLWARNING\n  | NOT FOUND\n  | SQLEXCEPTION\n\nThe DECLARE ... HANDLER statement specifies a handler that deals with\none or more conditions. If one of these conditions occurs, the\nspecified statement executes. statement can be a simple statement such\nas SET var_name = value, or a compound statement written using BEGIN\nand END (see [HELP BEGIN END]).\n\nHandler declarations must appear after variable or condition\ndeclarations.\n\nThe handler_action value indicates what action the handler takes after\nexecution of the handler statement:\n\no CONTINUE: Execution of the current program continues.\n\no EXIT: Execution terminates for the BEGIN ... END compound statement\n  in which the handler is declared. This is true even if the condition\n  occurs in an inner block.\n\no UNDO: Not supported.\n\nThe condition_value for DECLARE ... HANDLER indicates the specific\ncondition or class of conditions that activates the handler. It can\ntake the following forms:\n\no mysql_error_code: An integer literal indicating a MySQL error code,\n  such as 1051 to specify \"unknown table\":\n\nDECLARE CONTINUE HANDLER FOR 1051\n  BEGIN\n    -- body of handler\n  END;\n\n  Do not use MySQL error code 0 because that indicates success rather\n  than an error condition. For a list of MySQL error codes, see\n  http://dev.mysql.com/doc/refman/5.5/en/error-messages-server.html.\n\no SQLSTATE [VALUE] sqlstate_value: A 5-character string literal\n  indicating an SQLSTATE value, such as \'42S01\' to specify \"unknown\n  table\":\n\nDECLARE CONTINUE HANDLER FOR SQLSTATE \'42S02\'\n  BEGIN\n    -- body of handler\n  END;\n\n  Do not use SQLSTATE values that begin with \'00\' because those\n  indicate success rather than an error condition. For a list of\n  SQLSTATE values, see\n  http://dev.mysql.com/doc/refman/5.5/en/error-messages-server.html.\n\no condition_name: A condition name previously specified with DECLARE\n  ... CONDITION. A condition name can be associated with a MySQL error\n  code or SQLSTATE value. See [HELP DECLARE CONDITION].\n\no SQLWARNING: Shorthand for the class of SQLSTATE values that begin\n  with \'01\'.\n\nDECLARE CONTINUE HANDLER FOR SQLWARNING\n  BEGIN\n    -- body of handler\n  END;\n\no NOT FOUND: Shorthand for the class of SQLSTATE values that begin with\n  \'02\'. This is relevant within the context of cursors and is used to\n  control what happens when a cursor reaches the end of a data set. If\n  no more rows are available, a No Data condition occurs with SQLSTATE\n  value \'02000\'. To detect this condition, you can set up a handler for\n  it or for a NOT FOUND condition.\n\nDECLARE CONTINUE HANDLER FOR NOT FOUND\n  BEGIN\n    -- body of handler\n  END;\n\n  For another example, see\n  http://dev.mysql.com/doc/refman/5.5/en/cursors.html. The NOT FOUND\n  condition also occurs for SELECT ... INTO var_list statements that\n  retrieve no rows.\n\no SQLEXCEPTION: Shorthand for the class of SQLSTATE values that do not\n  begin with \'00\', \'01\', or \'02\'.\n\nDECLARE CONTINUE HANDLER FOR SQLEXCEPTION\n  BEGIN\n    -- body of handler\n  END;\n\nIf a condition occurs for which no handler has been declared, the\naction taken depends on the condition class:\n\no For SQLEXCEPTION conditions, the stored program terminates at the\n  statement that raised the condition, as if there were an EXIT\n  handler. If the program was called by another stored program, the\n  calling program handles the condition using the handler selection\n  rules applied to its own handlers.\n\no For SQLWARNING conditions, the program continues executing, as if\n  there were a CONTINUE handler.\n\no For NOT FOUND conditions, if the condition was raised normally, the\n  action is CONTINUE. If it was raised by SIGNAL or RESIGNAL, the\n  action is EXIT.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/declare-handler.html\n\n','mysql> CREATE TABLE test.t (s1 INT, PRIMARY KEY (s1));\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> delimiter //\n\nmysql> CREATE PROCEDURE handlerdemo ()\n    -> BEGIN\n    ->   DECLARE CONTINUE HANDLER FOR SQLSTATE \'23000\' SET @x2 = 1;\n    ->   SET @x = 1;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 2;\n    ->   INSERT INTO test.t VALUES (1);\n    ->   SET @x = 3;\n    -> END;\n    -> //\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> CALL handlerdemo()//\nQuery OK, 0 rows affected, 1 warning (0.01 sec)\n\nmysql> SHOW WARNINGS//\n+-------+------+---------------------------------------+\n| Level | Code | Message                               |\n+-------+------+---------------------------------------+\n| Error | 1062 | Duplicate entry \'1\' for key \'PRIMARY\' |\n+-------+------+---------------------------------------+\n1 row in set (0.00 sec)\n\n\nmysql> SELECT @x//\n    +------+\n    | @x   |\n    +------+\n    | 3    |\n    +------+\n    1 row in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/declare-handler.html'),(407,'TIME',23,'TIME\n\nA time. The range is \'-838:59:59\' to \'838:59:59\'. MySQL displays TIME\nvalues in \'HH:MM:SS\' format, but permits assignment of values to TIME\ncolumns using either strings or numbers.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-type-overview.html'),(408,'SYSTEM_USER',17,'Syntax:\nSYSTEM_USER()\n\nSYSTEM_USER() is a synonym for USER().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(409,'CURRENT_DATE',32,'Syntax:\nCURRENT_DATE, CURRENT_DATE()\n\nCURRENT_DATE and CURRENT_DATE() are synonyms for CURDATE().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(410,'TRUNCATE TABLE',40,'Syntax:\nTRUNCATE [TABLE] tbl_name\n\nTRUNCATE TABLE empties a table completely. It requires the DROP\nprivilege.\n\nLogically, TRUNCATE TABLE is similar to a DELETE statement that deletes\nall rows, or a sequence of DROP TABLE and CREATE TABLE statements. To\nachieve high performance, it bypasses the DML method of deleting data.\nThus, it cannot be rolled back, it does not cause ON DELETE triggers to\nfire, and it cannot be performed for InnoDB tables with parent-child\nforeign key relationships.\n\nAlthough TRUNCATE TABLE is similar to DELETE, it is classified as a DDL\nstatement rather than a DML statement. It differs from DELETE in the\nfollowing ways:\n\no Truncate operations drop and re-create the table, which is much\n  faster than deleting rows one by one, particularly for large tables.\n\no Truncate operations cause an implicit commit, and so cannot be rolled\n  back. See\n  http://dev.mysql.com/doc/refman/5.5/en/implicit-commit.html.\n\no Truncation operations cannot be performed if the session holds an\n  active table lock.\n\no TRUNCATE TABLE fails for an InnoDB table if there are any FOREIGN KEY\n  constraints from other tables that reference the table. Foreign key\n  constraints between columns of the same table are permitted.\n\no Truncation operations do not return a meaningful value for the number\n  of deleted rows. The usual result is \"0 rows affected,\" which should\n  be interpreted as \"no information.\"\n\no As long as the table format file tbl_name.frm is valid, the table can\n  be re-created as an empty table with TRUNCATE TABLE, even if the data\n  or index files have become corrupted.\n\no Any AUTO_INCREMENT value is reset to its start value. This is true\n  even for MyISAM and InnoDB, which normally do not reuse sequence\n  values.\n\no When used with partitioned tables, TRUNCATE TABLE preserves the\n  partitioning; that is, the data and index files are dropped and\n  re-created, while the partition definitions (.par) file is\n  unaffected.\n\no The TRUNCATE TABLE statement does not invoke ON DELETE triggers.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/truncate-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/truncate-table.html'),(411,'AREA',2,'Area(poly)\n\nReturns a double-precision number indicating the area of the argument,\nas measured in its spatial reference system. For arguments of dimension\n0 or 1, the result is 0.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-polygon-property-functions.html\n\n','mysql> SET @poly = \'Polygon((0 0,0 3,3 0,0 0),(1 1,1 2,2 1,1 1))\';\nmysql> SELECT Area(GeomFromText(@poly));\n+---------------------------+\n| Area(GeomFromText(@poly)) |\n+---------------------------+\n|                         4 |\n+---------------------------+\n\nmysql> SET @mpoly =\n    -> \'MultiPolygon(((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1)))\';\nmysql> SELECT Area(GeomFromText(@mpoly));\n+----------------------------+\n| Area(GeomFromText(@mpoly)) |\n+----------------------------+\n|                          8 |\n+----------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-polygon-property-functions.html'),(412,'START SLAVE',8,'Syntax:\nSTART SLAVE [thread_types]\n\nSTART SLAVE [SQL_THREAD] UNTIL\n    MASTER_LOG_FILE = \'log_name\', MASTER_LOG_POS = log_pos\n\nSTART SLAVE [SQL_THREAD] UNTIL\n    RELAY_LOG_FILE = \'log_name\', RELAY_LOG_POS = log_pos\n\nthread_types:\n    [thread_type [, thread_type] ... ]\n\nthread_type: IO_THREAD | SQL_THREAD\n\nSTART SLAVE with no thread_type options starts both of the slave\nthreads. The I/O thread reads events from the master server and stores\nthem in the relay log. The SQL thread reads events from the relay log\nand executes them. START SLAVE requires the SUPER privilege.\n\nIf START SLAVE succeeds in starting the slave threads, it returns\nwithout any error. However, even in that case, it might be that the\nslave threads start and then later stop (for example, because they do\nnot manage to connect to the master or read its binary log, or some\nother problem). START SLAVE does not warn you about this. You must\ncheck the slave\'s error log for error messages generated by the slave\nthreads, or check that they are running satisfactorily with SHOW SLAVE\nSTATUS.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/start-slave.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/start-slave.html'),(413,'SHOW WARNINGS',27,'Syntax:\nSHOW WARNINGS [LIMIT [offset,] row_count]\nSHOW COUNT(*) WARNINGS\n\nSHOW WARNINGS is a diagnostic statement that displays information about\nthe conditions (errors, warnings, and notes) resulting from executing a\nstatement in the current session. Warnings are generated for DML\nstatements such as INSERT, UPDATE, and LOAD DATA INFILE as well as DDL\nstatements such as CREATE TABLE and ALTER TABLE.\n\nThe LIMIT clause has the same syntax as for the SELECT statement. See\nhttp://dev.mysql.com/doc/refman/5.5/en/select.html.\n\nSHOW WARNINGS is also used following EXPLAIN EXTENDED, to display the\nextra information generated by EXPLAIN when the EXTENDED keyword is\nused. See http://dev.mysql.com/doc/refman/5.5/en/explain-extended.html.\n\nSHOW WARNINGS displays information about the conditions resulting from\nthe most recent statement in the current session that generated\nmessages. It shows nothing if the most recent statement used a table\nand generated no messages. (That is, statements that use a table but\ngenerate no messages clear the message list.) Statements that do not\nuse tables and do not generate messages have no effect on the message\nlist.\n\nThe SHOW COUNT(*) WARNINGS diagnostic statement displays the total\nnumber of errors, warnings, and notes. You can also retrieve this\nnumber from the warning_count system variable:\n\nSHOW COUNT(*) WARNINGS;\nSELECT @@warning_count;\n\nA related diagnostic statement, SHOW ERRORS, shows only error\nconditions (it excludes warnings and notes), and SHOW COUNT(*) ERRORS\nstatement displays the total number of errors. See [HELP SHOW ERRORS].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-warnings.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-warnings.html'),(414,'DROP USER',10,'Syntax:\nDROP USER user [, user] ...\n\nThe DROP USER statement removes one or more MySQL accounts and their\nprivileges. It removes privilege rows for the account from all grant\ntables. An error occurs for accounts that do not exist.\n\nTo use DROP USER, you must have the global CREATE USER privilege, or\nthe DELETE privilege for the mysql database. When the read_only system\nvariable is enabled, DROP USER additionally requires the SUPER\nprivilege.\n\nEach account name uses the format described in\nhttp://dev.mysql.com/doc/refman/5.5/en/account-names.html. For example:\n\nDROP USER \'jeffrey\'@\'localhost\';\n\nThe host name part of the account name, if omitted, defaults to \'%\'.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-user.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-user.html'),(415,'SUBSTRING',38,'Syntax:\nSUBSTRING(str,pos), SUBSTRING(str FROM pos), SUBSTRING(str,pos,len),\nSUBSTRING(str FROM pos FOR len)\n\nThe forms without a len argument return a substring from string str\nstarting at position pos. The forms with a len argument return a\nsubstring len characters long from string str, starting at position\npos. The forms that use FROM are standard SQL syntax. It is also\npossible to use a negative value for pos. In this case, the beginning\nof the substring is pos characters from the end of the string, rather\nthan the beginning. A negative value may be used for pos in any of the\nforms of this function.\n\nFor all forms of SUBSTRING(), the position of the first character in\nthe string from which the substring is to be extracted is reckoned as\n1.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT SUBSTRING(\'Quadratically\',5);\n        -> \'ratically\'\nmysql> SELECT SUBSTRING(\'foobarbar\' FROM 4);\n        -> \'barbar\'\nmysql> SELECT SUBSTRING(\'Quadratically\',5,6);\n        -> \'ratica\'\nmysql> SELECT SUBSTRING(\'Sakila\', -3);\n        -> \'ila\'\nmysql> SELECT SUBSTRING(\'Sakila\', -5, 3);\n        -> \'aki\'\nmysql> SELECT SUBSTRING(\'Sakila\' FROM -4 FOR 2);\n        -> \'ki\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(416,'ISEMPTY',37,'IsEmpty(g)\n\nThis function is a placeholder that returns 0 for any valid geometry\nvalue, 1 for any invalid geometry value or NULL.\n\nMySQL does not support GIS EMPTY values such as POINT EMPTY.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-general-property-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-general-property-functions.html'),(417,'SHOW FUNCTION STATUS',27,'Syntax:\nSHOW FUNCTION STATUS\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement is similar to SHOW PROCEDURE STATUS but for stored\nfunctions. See [HELP SHOW PROCEDURE STATUS].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-function-status.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-function-status.html'),(418,'LTRIM',38,'Syntax:\nLTRIM(str)\n\nReturns the string str with leading space characters removed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT LTRIM(\'  barbar\');\n        -> \'barbar\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(419,'MBRDISJOINT',7,'MBRDisjoint(g1, g2)\n\nReturns 1 or 0 to indicate whether the minimum bounding rectangles of\nthe two geometries g1 and g2 are disjoint (do not intersect).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html'),(420,'VALUES',14,'Syntax:\nVALUES(col_name)\n\nIn an INSERT ... ON DUPLICATE KEY UPDATE statement, you can use the\nVALUES(col_name) function in the UPDATE clause to refer to column\nvalues from the INSERT portion of the statement. In other words,\nVALUES(col_name) in the UPDATE clause refers to the value of col_name\nthat would be inserted, had no duplicate-key conflict occurred. This\nfunction is especially useful in multiple-row inserts. The VALUES()\nfunction is meaningful only in the ON DUPLICATE KEY UPDATE clause of\nINSERT statements and returns NULL otherwise. See\nhttp://dev.mysql.com/doc/refman/5.5/en/insert-on-duplicate.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> INSERT INTO table (a,b,c) VALUES (1,2,3),(4,5,6)\n    -> ON DUPLICATE KEY UPDATE c=VALUES(a)+VALUES(b);\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(421,'CALL',28,'Syntax:\nCALL sp_name([parameter[,...]])\nCALL sp_name[()]\n\nThe CALL statement invokes a stored procedure that was defined\npreviously with CREATE PROCEDURE.\n\nStored procedures that take no arguments can be invoked without\nparentheses. That is, CALL p() and CALL p are equivalent.\n\nCALL can pass back values to its caller using parameters that are\ndeclared as OUT or INOUT parameters. When the procedure returns, a\nclient program can also obtain the number of rows affected for the\nfinal statement executed within the routine: At the SQL level, call the\nROW_COUNT() function; from the C API, call the mysql_affected_rows()\nfunction.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/call.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/call.html'),(422,'ENCODE',12,'Syntax:\nENCODE(str,pass_str)\n\nEncrypt str using pass_str as the password. The result is a binary\nstring of the same length as str. To decrypt the result, use DECODE().\n\nThe ENCODE() function should no longer be used. If you still need to\nuse ENCODE(), a salt value must be used with it to reduce risk. For\nexample:\n\nENCODE(\'cleartext\', CONCAT(\'my_random_salt\',\'my_secret_password\'))\n\nA new random salt value must be used whenever a password is updated.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(423,'SUBSTRING_INDEX',38,'Syntax:\nSUBSTRING_INDEX(str,delim,count)\n\nReturns the substring from string str before count occurrences of the\ndelimiter delim. If count is positive, everything to the left of the\nfinal delimiter (counting from the left) is returned. If count is\nnegative, everything to the right of the final delimiter (counting from\nthe right) is returned. SUBSTRING_INDEX() performs a case-sensitive\nmatch when searching for delim.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT SUBSTRING_INDEX(\'www.mysql.com\', \'.\', 2);\n        -> \'www.mysql\'\nmysql> SELECT SUBSTRING_INDEX(\'www.mysql.com\', \'.\', -2);\n        -> \'mysql.com\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(424,'TIMESTAMPADD',32,'Syntax:\nTIMESTAMPADD(unit,interval,datetime_expr)\n\nAdds the integer expression interval to the date or datetime expression\ndatetime_expr. The unit for interval is given by the unit argument,\nwhich should be one of the following values: MICROSECOND\n(microseconds), SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, or\nYEAR.\n\nIt is possible to use FRAC_SECOND in place of MICROSECOND, but\nFRAC_SECOND is deprecated. FRAC_SECOND was removed in MySQL 5.5.3.\n\nThe unit value may be specified using one of keywords as shown, or with\na prefix of SQL_TSI_. For example, DAY and SQL_TSI_DAY both are legal.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIMESTAMPADD(MINUTE,1,\'2003-01-02\');\n        -> \'2003-01-02 00:01:00\'\nmysql> SELECT TIMESTAMPADD(WEEK,1,\'2003-01-02\');\n        -> \'2003-01-09\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(425,'TRUNCATE',3,'Syntax:\nTRUNCATE(X,D)\n\nReturns the number X, truncated to D decimal places. If D is 0, the\nresult has no decimal point or fractional part. D can be negative to\ncause D digits left of the decimal point of the value X to become zero.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT TRUNCATE(1.223,1);\n        -> 1.2\nmysql> SELECT TRUNCATE(1.999,1);\n        -> 1.9\nmysql> SELECT TRUNCATE(1.999,0);\n        -> 1\nmysql> SELECT TRUNCATE(-1.999,1);\n        -> -1.9\nmysql> SELECT TRUNCATE(122,-2);\n       -> 100\nmysql> SELECT TRUNCATE(10.28*100,0);\n       -> 1028\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(426,'SHOW',27,'SHOW has many forms that provide information about databases, tables,\ncolumns, or status information about the server. This section describes\nthose following:\n\nSHOW AUTHORS\nSHOW {BINARY | MASTER} LOGS\nSHOW BINLOG EVENTS [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\nSHOW CHARACTER SET [like_or_where]\nSHOW COLLATION [like_or_where]\nSHOW [FULL] COLUMNS FROM tbl_name [FROM db_name] [like_or_where]\nSHOW CONTRIBUTORS\nSHOW CREATE DATABASE db_name\nSHOW CREATE EVENT event_name\nSHOW CREATE FUNCTION func_name\nSHOW CREATE PROCEDURE proc_name\nSHOW CREATE TABLE tbl_name\nSHOW CREATE TRIGGER trigger_name\nSHOW CREATE VIEW view_name\nSHOW DATABASES [like_or_where]\nSHOW ENGINE engine_name {STATUS | MUTEX}\nSHOW [STORAGE] ENGINES\nSHOW ERRORS [LIMIT [offset,] row_count]\nSHOW EVENTS\nSHOW FUNCTION CODE func_name\nSHOW FUNCTION STATUS [like_or_where]\nSHOW GRANTS FOR user\nSHOW INDEX FROM tbl_name [FROM db_name]\nSHOW MASTER STATUS\nSHOW OPEN TABLES [FROM db_name] [like_or_where]\nSHOW PLUGINS\nSHOW PROCEDURE CODE proc_name\nSHOW PROCEDURE STATUS [like_or_where]\nSHOW PRIVILEGES\nSHOW [FULL] PROCESSLIST\nSHOW PROFILE [types] [FOR QUERY n] [OFFSET n] [LIMIT n]\nSHOW PROFILES\nSHOW RELAYLOG EVENTS [IN \'log_name\'] [FROM pos] [LIMIT [offset,] row_count]\nSHOW SLAVE HOSTS\nSHOW SLAVE STATUS\nSHOW [GLOBAL | SESSION] STATUS [like_or_where]\nSHOW TABLE STATUS [FROM db_name] [like_or_where]\nSHOW [FULL] TABLES [FROM db_name] [like_or_where]\nSHOW TRIGGERS [FROM db_name] [like_or_where]\nSHOW [GLOBAL | SESSION] VARIABLES [like_or_where]\nSHOW WARNINGS [LIMIT [offset,] row_count]\n\nlike_or_where:\n    LIKE \'pattern\'\n  | WHERE expr\n\nIf the syntax for a given SHOW statement includes a LIKE \'pattern\'\npart, \'pattern\' is a string that can contain the SQL % and _ wildcard\ncharacters. The pattern is useful for restricting statement output to\nmatching values.\n\nSeveral SHOW statements also accept a WHERE clause that provides more\nflexibility in specifying which rows to display. See\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show.html'),(427,'SHOW VARIABLES',27,'Syntax:\nSHOW [GLOBAL | SESSION] VARIABLES\n    [LIKE \'pattern\' | WHERE expr]\n\nSHOW VARIABLES shows the values of MySQL system variables (see\nhttp://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html).\nThis statement does not require any privilege. It requires only the\nability to connect to the server.\n\nSystem variable information is also available from these sources:\n\no The GLOBAL_VARIABLES and SESSION_VARIABLES tables. See\n  http://dev.mysql.com/doc/refman/5.5/en/variables-table.html.\n\no The mysqladmin variables command. See\n  http://dev.mysql.com/doc/refman/5.5/en/mysqladmin.html.\n\nFor SHOW VARIABLES, a LIKE clause, if present, indicates which variable\nnames to match. A WHERE clause can be given to select rows using more\ngeneral conditions, as discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html.\n\nSHOW VARIABLES accepts an optional GLOBAL or SESSION variable scope\nmodifier:\n\no With a GLOBAL modifier, the statement displays global system variable\n  values. These are the values used to initialize the corresponding\n  session variables for new connections to MySQL. If a variable has no\n  global value, no value is displayed.\n\no With a SESSION modifier, the statement displays the system varaible\n  values that are in effect for the current connection. If a variable\n  has no session value, the global value is displayed. LOCAL is a\n  synonym for SESSION.\n\no If no modifier is present, the default is SESSION.\n\nThe scope for each system variable is listed at\nhttp://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html.\n\nSHOW VARIABLES is subject to a version-dependent display-width limit.\nFor variables with very long values that are not completely displayed,\nuse SELECT as a workaround. For example:\n\nSELECT @@GLOBAL.innodb_data_file_path;\n\nMost system variables can be set at server startup (read-only variables\nsuch as version_comment are exceptions). Many can be changed at runtime\nwith the SET statement. See\nhttp://dev.mysql.com/doc/refman/5.5/en/using-system-variables.html, and\n[HELP SET].\nWith a LIKE clause, the statement displays only rows for those\nvariables with names that match the pattern. To obtain the row for a\nspecific variable, use a LIKE clause as shown:\n\nSHOW VARIABLES LIKE \'max_join_size\';\nSHOW SESSION VARIABLES LIKE \'max_join_size\';\n\nTo get a list of variables whose name match a pattern, use the %\nwildcard character in a LIKE clause:\n\nSHOW VARIABLES LIKE \'%size%\';\nSHOW GLOBAL VARIABLES LIKE \'%size%\';\n\nWildcard characters can be used in any position within the pattern to\nbe matched. Strictly speaking, because _ is a wildcard that matches any\nsingle character, you should escape it as \\_ to match it literally. In\npractice, this is rarely necessary.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-variables.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-variables.html'),(428,'BINLOG',27,'Syntax:\nBINLOG \'str\'\n\nBINLOG is an internal-use statement. It is generated by the mysqlbinlog\nprogram as the printable representation of certain events in binary log\nfiles. (See http://dev.mysql.com/doc/refman/5.5/en/mysqlbinlog.html.)\nThe \'str\' value is a base 64-encoded string the that server decodes to\ndetermine the data change indicated by the corresponding event. This\nstatement requires the SUPER privilege.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/binlog.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/binlog.html'),(429,'ATAN2',3,'Syntax:\nATAN(Y,X), ATAN2(Y,X)\n\nReturns the arc tangent of the two variables X and Y. It is similar to\ncalculating the arc tangent of Y / X, except that the signs of both\narguments are used to determine the quadrant of the result.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT ATAN(-2,2);\n        -> -0.78539816339745\nmysql> SELECT ATAN2(PI(),0);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(430,'AND',15,'Syntax:\nAND, &&\n\nLogical AND. Evaluates to 1 if all operands are nonzero and not NULL,\nto 0 if one or more operands are 0, otherwise NULL is returned.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html\n\n','mysql> SELECT 1 AND 1;\n        -> 1\nmysql> SELECT 1 AND 0;\n        -> 0\nmysql> SELECT 1 AND NULL;\n        -> NULL\nmysql> SELECT 0 AND NULL;\n        -> 0\nmysql> SELECT NULL AND 0;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/logical-operators.html'),(431,'HOUR',32,'Syntax:\nHOUR(time)\n\nReturns the hour for time. The range of the return value is 0 to 23 for\ntime-of-day values. However, the range of TIME values actually is much\nlarger, so HOUR can return values greater than 23.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT HOUR(\'10:05:03\');\n        -> 10\nmysql> SELECT HOUR(\'272:59:59\');\n        -> 272\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(432,'SELECT',28,'Syntax:\nSELECT\n    [ALL | DISTINCT | DISTINCTROW ]\n      [HIGH_PRIORITY]\n      [STRAIGHT_JOIN]\n      [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]\n      [SQL_CACHE | SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]\n    select_expr [, select_expr ...]\n    [FROM table_references\n    [WHERE where_condition]\n    [GROUP BY {col_name | expr | position}\n      [ASC | DESC], ... [WITH ROLLUP]]\n    [HAVING where_condition]\n    [ORDER BY {col_name | expr | position}\n      [ASC | DESC], ...]\n    [LIMIT {[offset,] row_count | row_count OFFSET offset}]\n    [PROCEDURE procedure_name(argument_list)]\n    [INTO OUTFILE \'file_name\'\n        [CHARACTER SET charset_name]\n        export_options\n      | INTO DUMPFILE \'file_name\'\n      | INTO var_name [, var_name]]\n    [FOR UPDATE | LOCK IN SHARE MODE]]\n\nSELECT is used to retrieve rows selected from one or more tables, and\ncan include UNION statements and subqueries. See [HELP UNION], and\nhttp://dev.mysql.com/doc/refman/5.5/en/subqueries.html.\n\nThe most commonly used clauses of SELECT statements are these:\n\no Each select_expr indicates a column that you want to retrieve. There\n  must be at least one select_expr.\n\no table_references indicates the table or tables from which to retrieve\n  rows. Its syntax is described in [HELP JOIN].\n\no The WHERE clause, if given, indicates the condition or conditions\n  that rows must satisfy to be selected. where_condition is an\n  expression that evaluates to true for each row to be selected. The\n  statement selects all rows if there is no WHERE clause.\n\n  In the WHERE expression, you can use any of the functions and\n  operators that MySQL supports, except for aggregate (summary)\n  functions. See\n  http://dev.mysql.com/doc/refman/5.5/en/expressions.html, and\n  http://dev.mysql.com/doc/refman/5.5/en/functions.html.\n\nSELECT can also be used to retrieve rows computed without reference to\nany table.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/select.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/select.html'),(433,'GROUP_CONCAT',16,'Syntax:\nGROUP_CONCAT(expr)\n\nThis function returns a string result with the concatenated non-NULL\nvalues from a group. It returns NULL if there are no non-NULL values.\nThe full syntax is as follows:\n\nGROUP_CONCAT([DISTINCT] expr [,expr ...]\n             [ORDER BY {unsigned_integer | col_name | expr}\n                 [ASC | DESC] [,col_name ...]]\n             [SEPARATOR str_val])\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','mysql> SELECT student_name,\n         GROUP_CONCAT(test_score)\n       FROM student\n       GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(434,'BENCHMARK',17,'Syntax:\nBENCHMARK(count,expr)\n\nThe BENCHMARK() function executes the expression expr repeatedly count\ntimes. It may be used to time how quickly MySQL processes the\nexpression. The result value is always 0. The intended use is from\nwithin the mysql client, which reports query execution times:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT BENCHMARK(1000000,AES_ENCRYPT(\'hello\',\'goodbye\'));\n+---------------------------------------------------+\n| BENCHMARK(1000000,AES_ENCRYPT(\'hello\',\'goodbye\')) |\n+---------------------------------------------------+\n|                                                 0 |\n+---------------------------------------------------+\n1 row in set (4.74 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(435,'NAME_CONST',14,'Syntax:\nNAME_CONST(name,value)\n\nReturns the given value. When used to produce a result set column,\nNAME_CONST() causes the column to have the given name. The arguments\nshould be constants.\n\nmysql> SELECT NAME_CONST(\'myname\', 14);\n+--------+\n| myname |\n+--------+\n|     14 |\n+--------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(436,'SHOW ENGINE',27,'Syntax:\nSHOW ENGINE engine_name {STATUS | MUTEX}\n\nSHOW ENGINE displays operational information about a storage engine. It\nrequires the PROCESS privilege. The statement has these variants:\n\nSHOW ENGINE INNODB STATUS\nSHOW ENGINE INNODB MUTEX\nSHOW ENGINE {NDB | NDBCLUSTER} STATUS\nSHOW ENGINE PERFORMANCE_SCHEMA STATUS\n\nSHOW ENGINE INNODB STATUS displays extensive information from the\nstandard InnoDB Monitor about the state of the InnoDB storage engine.\nFor information about the standard monitor and other InnoDB Monitors\nthat provide information about InnoDB processing, see\nhttp://dev.mysql.com/doc/refman/5.5/en/innodb-monitors.html.\n\nSHOW ENGINE INNODB MUTEX displays InnoDB mutex and rw-lock statistics.\nStatement output has the following columns:\n\no Type\n\n  Always InnoDB.\n\no Name\n\n  The source file where the mutex is implemented, and the line number\n  in the file where the mutex is created. The line number is specific\n  to your version of MySQL.\n\no Status\n\n  The mutex status. This field displays several values if UNIV_DEBUG\n  was defined at MySQL compilation time (for example, in include/univ.i\n  in the InnoDB part of the MySQL source tree). If UNIV_DEBUG was not\n  defined, the statement displays only the os_waits value. In the\n  latter case (without UNIV_DEBUG), the information on which the output\n  is based is insufficient to distinguish regular mutexes and mutexes\n  that protect rw-locks (which permit multiple readers or a single\n  writer). Consequently, the output may appear to contain multiple rows\n  for the same mutex.\n\n  o count indicates how many times the mutex was requested.\n\n  o spin_waits indicates how many times the spinlock had to run.\n\n  o spin_rounds indicates the number of spinlock rounds. (spin_rounds\n    divided by spin_waits provides the average round count.)\n\n  o os_waits indicates the number of operating system waits. This\n    occurs when the spinlock did not work (the mutex was not locked\n    during the spinlock and it was necessary to yield to the operating\n    system and wait).\n\n  o os_yields indicates the number of times a thread trying to lock a\n    mutex gave up its timeslice and yielded to the operating system (on\n    the presumption that permitting other threads to run will free the\n    mutex so that it can be locked).\n\n  o os_wait_times indicates the amount of time (in ms) spent in\n    operating system waits. In MySQL 5.5 timing is disabled and this\n    value is always 0.\n\nSHOW ENGINE INNODB MUTEX skips the mutexes and rw-locks of buffer pool\nblocks, as the amount of output can be overwhelming on systems with a\nlarge buffer pool. (There is one mutex and one rw-lock in each 16K\nbuffer pool block, and there are 65,536 blocks per gigabyte.) SHOW\nENGINE INNODB MUTEX also does not list any mutexes or rw-locks that\nhave never been waited on (os_waits=0). Thus, SHOW ENGINE INNODB MUTEX\nonly displays information about mutexes and rw-locks outside of the\nbuffer pool that have caused at least one OS-level wait.\n\nSHOW ENGINE INNODB MUTEX information can be used to diagnose system\nproblems. For example, large values of spin_waits and spin_rounds may\nindicate scalability problems.\n\nUse SHOW ENGINE PERFORMANCE_SCHEMA STATUS to inspect the internal\noperation of the Performance Schema code:\n\nmysql> SHOW ENGINE PERFORMANCE_SCHEMA STATUS\\G\n...\n*************************** 3. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.row_size\nStatus: 76\n*************************** 4. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.row_count\nStatus: 10000\n*************************** 5. row ***************************\n  Type: performance_schema\n  Name: events_waits_history.memory\nStatus: 760000\n...\n*************************** 57. row ***************************\n  Type: performance_schema\n  Name: performance_schema.memory\nStatus: 26459600\n...\n\nThis statement is intended to help the DBA understand the effects that\ndifferent Performance Schema options have on memory requirements.\n\nName values consist of two parts, which name an internal buffer and a\nbuffer attribute, respectively. Interpret buffer names as follows:\n\no An internal buffer that is not exposed as a table is named within\n  parentheses. Examples: (pfs_cond_class).row_size,\n  (pfs_mutex_class).memory.\n\no An internal buffer that is exposed as a table in the\n  performance_schema database is named after the table, without\n  parentheses. Examples: events_waits_history.row_size,\n  mutex_instances.row_count.\n\no A value that applies to the Performance Schema as a whole begins with\n  performance_schema. Example: performance_schema.memory.\n\nBuffer attributes have these meanings:\n\no row_size is the size of the internal record used by the\n  implementation, such as the size of a row in a table. row_size values\n  cannot be changed.\n\no row_count is the number of internal records, such as the number of\n  rows in a table. row_count values can be changed using Performance\n  Schema configuration options.\n\no For a table, tbl_name.memory is the product of row_size and\n  row_count. For the Performance Schema as a whole,\n  performance_schema.memory is the sum of all the memory used (the sum\n  of all other memory values).\n\nIn some cases, there is a direct relationship between a Performance\nSchema configuration parameter and a SHOW ENGINE value. For example,\nevents_waits_history_long.row_count corresponds to\nperformance_schema_events_waits_history_long_size. In other cases, the\nrelationship is more complex. For example,\nevents_waits_history.row_count corresponds to\nperformance_schema_events_waits_history_size (the number of rows per\nthread) multiplied by performance_schema_max_thread_instances ( the\nnumber of threads).\n\nIf the server has the NDBCLUSTER storage engine enabled, SHOW ENGINE\nNDB STATUS displays cluster status information such as the number of\nconnected data nodes, the cluster connectstring, and cluster binary log\nepochs, as well as counts of various Cluster API objects created by the\nMySQL Server when connected to the cluster. Sample output from this\nstatement is shown here:\n\nmysql> SHOW ENGINE NDB STATUS;\n+------------+-----------------------+--------------------------------------------------+\n| Type       | Name                  | Status                                           |\n+------------+-----------------------+--------------------------------------------------+\n| ndbcluster | connection            | cluster_node_id=7,\n  connected_host=192.168.0.103, connected_port=1186, number_of_data_nodes=4,\n  number_of_ready_data_nodes=3, connect_count=0                                         |\n| ndbcluster | NdbTransaction        | created=6, free=0, sizeof=212                    |\n| ndbcluster | NdbOperation          | created=8, free=8, sizeof=660                    |\n| ndbcluster | NdbIndexScanOperation | created=1, free=1, sizeof=744                    |\n| ndbcluster | NdbIndexOperation     | created=0, free=0, sizeof=664                    |\n| ndbcluster | NdbRecAttr            | created=1285, free=1285, sizeof=60               |\n| ndbcluster | NdbApiSignal          | created=16, free=16, sizeof=136                  |\n| ndbcluster | NdbLabel              | created=0, free=0, sizeof=196                    |\n| ndbcluster | NdbBranch             | created=0, free=0, sizeof=24                     |\n| ndbcluster | NdbSubroutine         | created=0, free=0, sizeof=68                     |\n| ndbcluster | NdbCall               | created=0, free=0, sizeof=16                     |\n| ndbcluster | NdbBlob               | created=1, free=1, sizeof=264                    |\n| ndbcluster | NdbReceiver           | created=4, free=0, sizeof=68                     |\n| ndbcluster | binlog                | latest_epoch=155467, latest_trans_epoch=148126,\n  latest_received_binlog_epoch=0, latest_handled_binlog_epoch=0,\n  latest_applied_binlog_epoch=0                                                         |\n+------------+-----------------------+--------------------------------------------------+\n\nThe rows with connection and binlog in the Name column were added to\nthe output of this statement in MySQL 5.1. The Status column in each of\nthese rows provides information about the MySQL server\'s connection to\nthe cluster and about the cluster binary log\'s status, respectively.\nThe Status information is in the form of comma-delimited set of\nname/value pairs.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-engine.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-engine.html'),(437,'RELEASE_LOCK',14,'Syntax:\nRELEASE_LOCK(str)\n\nReleases the lock named by the string str that was obtained with\nGET_LOCK(). Returns 1 if the lock was released, 0 if the lock was not\nestablished by this thread (in which case the lock is not released),\nand NULL if the named lock did not exist. The lock does not exist if it\nwas never obtained by a call to GET_LOCK() or if it has previously been\nreleased.\n\nThe DO statement is convenient to use with RELEASE_LOCK(). See [HELP\nDO].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(438,'WEEKDAY',32,'Syntax:\nWEEKDAY(date)\n\nReturns the weekday index for date (0 = Monday, 1 = Tuesday, ... 6 =\nSunday).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT WEEKDAY(\'2008-02-03 22:23:00\');\n        -> 6\nmysql> SELECT WEEKDAY(\'2007-11-06\');\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(439,'TIME_TO_SEC',32,'Syntax:\nTIME_TO_SEC(time)\n\nReturns the time argument, converted to seconds.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT TIME_TO_SEC(\'22:23:00\');\n        -> 80580\nmysql> SELECT TIME_TO_SEC(\'00:39:38\');\n        -> 2378\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(440,'CONVERT_TZ',32,'Syntax:\nCONVERT_TZ(dt,from_tz,to_tz)\n\nCONVERT_TZ() converts a datetime value dt from the time zone given by\nfrom_tz to the time zone given by to_tz and returns the resulting\nvalue. Time zones are specified as described in\nhttp://dev.mysql.com/doc/refman/5.5/en/time-zone-support.html. This\nfunction returns NULL if the arguments are invalid.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'GMT\',\'MET\');\n        -> \'2004-01-01 13:00:00\'\nmysql> SELECT CONVERT_TZ(\'2004-01-01 12:00:00\',\'+00:00\',\'+10:00\');\n        -> \'2004-01-01 22:00:00\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(441,'EXPORT_SET',38,'Syntax:\nEXPORT_SET(bits,on,off[,separator[,number_of_bits]])\n\nReturns a string such that for every bit set in the value bits, you get\nan on string and for every bit not set in the value, you get an off\nstring. Bits in bits are examined from right to left (from low-order to\nhigh-order bits). Strings are added to the result from left to right,\nseparated by the separator string (the default being the comma\ncharacter ,). The number of bits examined is given by number_of_bits,\nwhich has a default of 64 if not specified. number_of_bits is silently\nclipped to 64 if larger than 64. It is treated as an unsigned integer,\nso a value of −1 is effectively the same as 64.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT EXPORT_SET(5,\'Y\',\'N\',\',\',4);\n        -> \'Y,N,Y,N\'\nmysql> SELECT EXPORT_SET(6,\'1\',\'0\',\',\',10);\n        -> \'0,1,1,0,0,0,0,0,0,0\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(442,'CAST',38,'Syntax:\nCAST(expr AS type)\n\nThe CAST() function takes an expression of any type and produces a\nresult value of the specified type, similar to CONVERT(). For more\ninformation, see the description of CONVERT().\n\nCAST() is standard SQL syntax.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/cast-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/cast-functions.html'),(443,'SOUNDS LIKE',38,'Syntax:\nexpr1 SOUNDS LIKE expr2\n\nThis is the same as SOUNDEX(expr1) = SOUNDEX(expr2).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(444,'PERIOD_DIFF',32,'Syntax:\nPERIOD_DIFF(P1,P2)\n\nReturns the number of months between periods P1 and P2. P1 and P2\nshould be in the format YYMM or YYYYMM. Note that the period arguments\nP1 and P2 are not date values.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT PERIOD_DIFF(200802,200703);\n        -> 11\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(445,'AVG',16,'Syntax:\nAVG([DISTINCT] expr)\n\nReturns the average value of expr. The DISTINCT option can be used to\nreturn the average of the distinct values of expr.\n\nIf there are no matching rows, AVG() returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html\n\n','mysql> SELECT student_name, AVG(test_score)\n       FROM student\n       GROUP BY student_name;\n','http://dev.mysql.com/doc/refman/5.5/en/group-by-functions.html'),(446,'QUOTE',38,'Syntax:\nQUOTE(str)\n\nQuotes a string to produce a result that can be used as a properly\nescaped data value in an SQL statement. The string is returned enclosed\nby single quotation marks and with each instance of backslash (\\),\nsingle quote (\'), ASCII NUL, and Control+Z preceded by a backslash. If\nthe argument is NULL, the return value is the word \"NULL\" without\nenclosing single quotation marks.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT QUOTE(\'Don\\\'t!\');\n        -> \'Don\\\'t!\'\nmysql> SELECT QUOTE(NULL);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(447,'IN',20,'Syntax:\nexpr IN (value,...)\n\nReturns 1 if expr is equal to any of the values in the IN list, else\nreturns 0. If all values are constants, they are evaluated according to\nthe type of expr and sorted. The search for the item then is done using\na binary search. This means IN is very quick if the IN value list\nconsists entirely of constants. Otherwise, type conversion takes place\naccording to the rules described in\nhttp://dev.mysql.com/doc/refman/5.5/en/type-conversion.html, but\napplied to all the arguments.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 2 IN (0,3,5,7);\n        -> 0\nmysql> SELECT \'wefwf\' IN (\'wee\',\'wefwf\',\'weg\');\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(448,'QUARTER',32,'Syntax:\nQUARTER(date)\n\nReturns the quarter of the year for date, in the range 1 to 4.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT QUARTER(\'2008-04-01\');\n        -> 2\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(449,'HELP COMMAND',27,'Syntax:\nmysql> help search_string\n\nIf you provide an argument to the help command, mysql uses it as a\nsearch string to access server-side help from the contents of the MySQL\nReference Manual. The proper operation of this command requires that\nthe help tables in the mysql database be initialized with help topic\ninformation (see\nhttp://dev.mysql.com/doc/refman/5.5/en/server-side-help-support.html).\n\nIf there is no match for the search string, the search fails:\n\nmysql> help me\n\nNothing found\nPlease try to run \'help contents\' for a list of all accessible topics\n\nUse help contents to see a list of the help categories:\n\nmysql> help contents\nYou asked for help about help category: \"Contents\"\nFor more information, type \'help <item>\', where <item> is one of the\nfollowing categories:\n   Account Management\n   Administration\n   Data Definition\n   Data Manipulation\n   Data Types\n   Functions\n   Functions and Modifiers for Use with GROUP BY\n   Geographic Features\n   Language Structure\n   Plugins\n   Storage Engines\n   Stored Routines\n   Table Maintenance\n   Transactions\n   Triggers\n\nIf the search string matches multiple items, mysql shows a list of\nmatching topics:\n\nmysql> help logs\nMany help items for your request exist.\nTo make a more specific request, please type \'help <item>\',\nwhere <item> is one of the following topics:\n   SHOW\n   SHOW BINARY LOGS\n   SHOW ENGINE\n   SHOW LOGS\n\nUse a topic as the search string to see the help entry for that topic:\n\nmysql> help show binary logs\nName: \'SHOW BINARY LOGS\'\nDescription:\nSyntax:\nSHOW BINARY LOGS\nSHOW MASTER LOGS\n\nLists the binary log files on the server. This statement is used as\npart of the procedure described in [purge-binary-logs], that shows how\nto determine which logs can be purged.\n\nmysql> SHOW BINARY LOGS;\n+---------------+-----------+\n| Log_name      | File_size |\n+---------------+-----------+\n| binlog.000015 |    724935 |\n| binlog.000016 |    733481 |\n+---------------+-----------+\n\nThe search string can contain the wildcard characters % and _. These\nhave the same meaning as for pattern-matching operations performed with\nthe LIKE operator. For example, HELP rep% returns a list of topics that\nbegin with rep:\n\nmysql> HELP rep%\nMany help items for your request exist.\nTo make a more specific request, please type \'help <item>\',\nwhere <item> is one of the following\ntopics:\n   REPAIR TABLE\n   REPEAT FUNCTION\n   REPEAT LOOP\n   REPLACE\n   REPLACE FUNCTION\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mysql-server-side-help.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/mysql-server-side-help.html'),(450,'POSITION',38,'Syntax:\nPOSITION(substr IN str)\n\nPOSITION(substr IN str) is a synonym for LOCATE(substr,str).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(451,'IS_USED_LOCK',14,'Syntax:\nIS_USED_LOCK(str)\n\nChecks whether the lock named str is in use (that is, locked). If so,\nit returns the connection identifier of the client session that holds\nthe lock. Otherwise, it returns NULL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(452,'POLYFROMTEXT',4,'PolyFromText(wkt[, srid]), PolygonFromText(wkt[, srid])\n\nConstructs a Polygon value using its WKT representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html'),(453,'DES_ENCRYPT',12,'Syntax:\nDES_ENCRYPT(str[,{key_num|key_str}])\n\nEncrypts the string with the given key using the Triple-DES algorithm.\n\nThis function works only if MySQL has been configured with SSL support.\nSee http://dev.mysql.com/doc/refman/5.5/en/encrypted-connections.html.\n\nThe encryption key to use is chosen based on the second argument to\nDES_ENCRYPT(), if one was given. With no argument, the first key from\nthe DES key file is used. With a key_num argument, the given key number\n(0 to 9) from the DES key file is used. With a key_str argument, the\ngiven key string is used to encrypt str.\n\nThe key file can be specified with the --des-key-file server option.\n\nThe return string is a binary string where the first character is\nCHAR(128 | key_num). If an error occurs, DES_ENCRYPT() returns NULL.\n\nThe 128 is added to make it easier to recognize an encrypted key. If\nyou use a string key, key_num is 127.\n\nThe string length for the result is given by this formula:\n\nnew_len = orig_len + (8 - (orig_len % 8)) + 1\n\nEach line in the DES key file has the following format:\n\nkey_num des_key_str\n\nEach key_num value must be a number in the range from 0 to 9. Lines in\nthe file may be in any order. des_key_str is the string that is used to\nencrypt the message. There should be at least one space between the\nnumber and the key. The first key is the default key that is used if\nyou do not specify any key argument to DES_ENCRYPT().\n\nYou can tell MySQL to read new key values from the key file with the\nFLUSH DES_KEY_FILE statement. This requires the RELOAD privilege.\n\nOne benefit of having a set of default keys is that it gives\napplications a way to check for the existence of encrypted column\nvalues, without giving the end user the right to decrypt those values.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT customer_address FROM customer_table \n     > WHERE crypted_credit_card = DES_ENCRYPT(\'credit_card_number\');\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(454,'CEIL',3,'Syntax:\nCEIL(X)\n\nCEIL() is a synonym for CEILING().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(455,'LENGTH',38,'Syntax:\nLENGTH(str)\n\nReturns the length of the string str, measured in bytes. A multibyte\ncharacter counts as multiple bytes. This means that for a string\ncontaining five 2-byte characters, LENGTH() returns 10, whereas\nCHAR_LENGTH() returns 5.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT LENGTH(\'text\');\n        -> 4\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(456,'ALTER EVENT',40,'Syntax:\nALTER\n    [DEFINER = { user | CURRENT_USER }]\n    EVENT event_name\n    [ON SCHEDULE schedule]\n    [ON COMPLETION [NOT] PRESERVE]\n    [RENAME TO new_event_name]\n    [ENABLE | DISABLE | DISABLE ON SLAVE]\n    [COMMENT \'comment\']\n    [DO event_body]\n\nThe ALTER EVENT statement changes one or more of the characteristics of\nan existing event without the need to drop and recreate it. The syntax\nfor each of the DEFINER, ON SCHEDULE, ON COMPLETION, COMMENT, ENABLE /\nDISABLE, and DO clauses is exactly the same as when used with CREATE\nEVENT. (See [HELP CREATE EVENT].)\n\nAny user can alter an event defined on a database for which that user\nhas the EVENT privilege. When a user executes a successful ALTER EVENT\nstatement, that user becomes the definer for the affected event.\n\nALTER EVENT works only with an existing event:\n\nmysql> ALTER EVENT no_such_event \n     >     ON SCHEDULE \n     >       EVERY \'2:3\' DAY_HOUR;\nERROR 1517 (HY000): Unknown event \'no_such_event\'\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-event.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-event.html'),(457,'DATE_SUB',32,'Syntax:\nDATE_SUB(date,INTERVAL expr unit)\n\nSee the description for DATE_ADD().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(458,'|',19,'Syntax:\n|\n\nBitwise OR.\n\nThe result is an unsigned 64-bit integer.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html\n\n','mysql> SELECT 29 | 15;\n        -> 31\n','http://dev.mysql.com/doc/refman/5.5/en/bit-functions.html'),(459,'GEOMFROMTEXT',4,'GeomFromText(wkt[, srid]), GeometryFromText(wkt[, srid])\n\nConstructs a geometry value of any type using its WKT representation\nand SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkt-functions.html'),(460,'UUID_SHORT',14,'Syntax:\nUUID_SHORT()\n\nReturns a \"short\" universal identifier as a 64-bit unsigned integer.\nValues returned by UUID_SHORT() differ from the string-format 128-bit\nidentifiers returned by the UUID() function and have different\nuniqueness properties. The value of UUID_SHORT() is guaranteed to be\nunique if the following conditions hold:\n\no The server_id value of the current server is between 0 and 255 and is\n  unique among your set of master and slave servers\n\no You do not set back the system time for your server host between\n  mysqld restarts\n\no You invoke UUID_SHORT() on average fewer than 16 million times per\n  second between mysqld restarts\n\nThe UUID_SHORT() return value is constructed this way:\n\n  (server_id & 255) << 56\n+ (server_startup_time_in_seconds << 24)\n+ incremented_variable++;\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> SELECT UUID_SHORT();\n        -> 92395783831158784\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(461,'DATEDIFF',32,'Syntax:\nDATEDIFF(expr1,expr2)\n\nDATEDIFF() returns expr1 − expr2 expressed as a value in days from\none date to the other. expr1 and expr2 are date or date-and-time\nexpressions. Only the date parts of the values are used in the\ncalculation.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DATEDIFF(\'2007-12-31 23:59:59\',\'2007-12-30\');\n        -> 1\nmysql> SELECT DATEDIFF(\'2010-11-30 23:59:59\',\'2010-12-31\');\n        -> -31\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(462,'DROP PROCEDURE',40,'Syntax:\nDROP {PROCEDURE | FUNCTION} [IF EXISTS] sp_name\n\nThis statement is used to drop a stored procedure or function. That is,\nthe specified routine is removed from the server. You must have the\nALTER ROUTINE privilege for the routine. (If the\nautomatic_sp_privileges system variable is enabled, that privilege and\nEXECUTE are granted automatically to the routine creator when the\nroutine is created and dropped from the creator when the routine is\ndropped. See\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-routines-privileges.html.\n)\n\nThe IF EXISTS clause is a MySQL extension. It prevents an error from\noccurring if the procedure or function does not exist. A warning is\nproduced that can be viewed with SHOW WARNINGS.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/drop-procedure.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/drop-procedure.html'),(463,'INSTALL PLUGIN',5,'Syntax:\nINSTALL PLUGIN plugin_name SONAME \'shared_library_name\'\n\nThis statement installs a server plugin. It requires the INSERT\nprivilege for the mysql.plugin system table.\n\nplugin_name is the name of the plugin as defined in the plugin\ndescriptor structure contained in the library file (see\nhttp://dev.mysql.com/doc/refman/5.5/en/plugin-data-structures.html).\nPlugin names are not case sensitive. For maximal compatibility, plugin\nnames should be limited to ASCII letters, digits, and underscore\nbecause they are used in C source files, shell command lines, M4 and\nBourne shell scripts, and SQL environments.\n\nshared_library_name is the name of the shared library that contains the\nplugin code. The name includes the file name extension (for example,\nlibmyplugin.so, libmyplugin.dll, or libmyplugin.dylib).\n\nThe shared library must be located in the plugin directory (the\ndirectory named by the plugin_dir system variable). The library must be\nin the plugin directory itself, not in a subdirectory. By default,\nplugin_dir is the plugin directory under the directory named by the\npkglibdir configuration variable, but it can be changed by setting the\nvalue of plugin_dir at server startup. For example, set its value in a\nmy.cnf file:\n\n[mysqld]\nplugin_dir=/path/to/plugin/directory\n\nIf the value of plugin_dir is a relative path name, it is taken to be\nrelative to the MySQL base directory (the value of the basedir system\nvariable).\n\nINSTALL PLUGIN loads and initializes the plugin code to make the plugin\navailable for use. A plugin is initialized by executing its\ninitialization function, which handles any setup that the plugin must\nperform before it can be used. When the server shuts down, it executes\nthe deinitialization function for each plugin that is loaded so that\nthe plugin has a chance to perform any final cleanup.\n\nINSTALL PLUGIN also registers the plugin by adding a line that\nindicates the plugin name and library file name to the mysql.plugin\ntable. At server startup, the server loads and initializes any plugin\nthat is listed in the mysql.plugin table. This means that a plugin is\ninstalled with INSTALL PLUGIN only once, not every time the server\nstarts. Plugin loading at startup does not occur if the server is\nstarted with the --skip-grant-tables option.\n\nA plugin library can contain multiple plugins. For each of them to be\ninstalled, use a separate INSTALL PLUGIN statement. Each statement\nnames a different plugin, but all of them specify the same library\nname.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/install-plugin.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/install-plugin.html'),(464,'LOAD DATA',28,'Syntax:\nLOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE \'file_name\'\n    [REPLACE | IGNORE]\n    INTO TABLE tbl_name\n    [CHARACTER SET charset_name]\n    [{FIELDS | COLUMNS}\n        [TERMINATED BY \'string\']\n        [[OPTIONALLY] ENCLOSED BY \'char\']\n        [ESCAPED BY \'char\']\n    ]\n    [LINES\n        [STARTING BY \'string\']\n        [TERMINATED BY \'string\']\n    ]\n    [IGNORE number {LINES | ROWS}]\n    [(col_name_or_user_var\n        [, col_name_or_user_var] ...)]\n    [SET col_name={expr | DEFAULT},\n        [, col_name={expr | DEFAULT}] ...]\n\nThe LOAD DATA INFILE statement reads rows from a text file into a table\nat a very high speed. LOAD DATA INFILE is the complement of SELECT ...\nINTO OUTFILE. (See\nhttp://dev.mysql.com/doc/refman/5.5/en/select-into.html.) To write data\nfrom a table to a file, use SELECT ... INTO OUTFILE. To read the file\nback into a table, use LOAD DATA INFILE. The syntax of the FIELDS and\nLINES clauses is the same for both statements. Both clauses are\noptional, but FIELDS must precede LINES if both are specified.\n\nYou can also load data files by using the mysqlimport utility; it\noperates by sending a LOAD DATA INFILE statement to the server. The\n--local option causes mysqlimport to read data files from the client\nhost. You can specify the --compress option to get better performance\nover slow networks if the client and server support the compressed\nprotocol. See http://dev.mysql.com/doc/refman/5.5/en/mysqlimport.html.\n\nFor more information about the efficiency of INSERT versus LOAD DATA\nINFILE and speeding up LOAD DATA INFILE, see\nhttp://dev.mysql.com/doc/refman/5.5/en/insert-optimization.html.\n\nThe file name must be given as a literal string. On Windows, specify\nbackslashes in path names as forward slashes or doubled backslashes.\nThe character_set_filesystem system variable controls the\ninterpretation of the file name.\n\nThe server uses the character set indicated by the\ncharacter_set_database system variable to interpret the information in\nthe file. SET NAMES and the setting of character_set_client do not\naffect interpretation of input. If the contents of the input file use a\ncharacter set that differs from the default, it is usually preferable\nto specify the character set of the file by using the CHARACTER SET\nclause. A character set of binary specifies \"no conversion.\"\n\nLOAD DATA INFILE interprets all fields in the file as having the same\ncharacter set, regardless of the data types of the columns into which\nfield values are loaded. For proper interpretation of file contents,\nyou must ensure that it was written with the correct character set. For\nexample, if you write a data file with mysqldump -T or by issuing a\nSELECT ... INTO OUTFILE statement in mysql, be sure to use a\n--default-character-set option so that output is written in the\ncharacter set to be used when the file is loaded with LOAD DATA INFILE.\n\n*Note*:\n\nIt is not possible to load data files that use the ucs2, utf16, or\nutf32 character set.\n\nIf you use LOW_PRIORITY, execution of the LOAD DATA statement is\ndelayed until no other clients are reading from the table. This affects\nonly storage engines that use only table-level locking (such as MyISAM,\nMEMORY, and MERGE).\n\nIf you specify CONCURRENT with a MyISAM table that satisfies the\ncondition for concurrent inserts (that is, it contains no free blocks\nin the middle), other threads can retrieve data from the table while\nLOAD DATA is executing. This option affects the performance of LOAD\nDATA a bit, even if no other thread is using the table at the same\ntime.\n\nWith row-based replication, CONCURRENT is replicated regardless of\nMySQL version. With statement-based replication CONCURRENT is not\nreplicated prior to MySQL 5.5.1 (see Bug #34628). For more information,\nsee\nhttp://dev.mysql.com/doc/refman/5.5/en/replication-features-load-data.h\ntml.\n\nThe LOCAL keyword affects expected location of the file and error\nhandling, as described later. LOCAL works only if your server and your\nclient both have been configured to permit it. For example, if mysqld\nwas started with the local_infile system variable disabled, LOCAL does\nnot work. See\nhttp://dev.mysql.com/doc/refman/5.5/en/load-data-local.html.\n\nThe LOCAL keyword affects where the file is expected to be found:\n\no If LOCAL is specified, the file is read by the client program on the\n  client host and sent to the server. The file can be given as a full\n  path name to specify its exact location. If given as a relative path\n  name, the name is interpreted relative to the directory in which the\n  client program was started.\n\n  When using LOCAL with LOAD DATA, a copy of the file is created in the\n  server\'s temporary directory. This is not the directory determined by\n  the value of tmpdir or slave_load_tmpdir, but rather the operating\n  system\'s temporary directory, and is not configurable in the MySQL\n  Server. (Typically the system temporary directory is /tmp on Linux\n  systems and C:\\WINDOWS\\TEMP on Windows.) Lack of sufficient space for\n  the copy in this directory can cause the LOAD DATA LOCAL statement to\n  fail.\n\no If LOCAL is not specified, the file must be located on the server\n  host and is read directly by the server. The server uses the\n  following rules to locate the file:\n\n  o If the file name is an absolute path name, the server uses it as\n    given.\n\n  o If the file name is a relative path name with one or more leading\n    components, the server searches for the file relative to the\n    server\'s data directory.\n\n  o If a file name with no leading components is given, the server\n    looks for the file in the database directory of the default\n    database.\n\nIn the non-LOCAL case, these rules mean that a file named as\n./myfile.txt is read from the server\'s data directory, whereas the file\nnamed as myfile.txt is read from the database directory of the default\ndatabase. For example, if db1 is the default database, the following\nLOAD DATA statement reads the file data.txt from the database directory\nfor db1, even though the statement explicitly loads the file into a\ntable in the db2 database:\n\nLOAD DATA INFILE \'data.txt\' INTO TABLE db2.my_table;\n\nNon-LOCAL load operations read text files located on the server. For\nsecurity reasons, such operations require that you have the FILE\nprivilege. See\nhttp://dev.mysql.com/doc/refman/5.5/en/privileges-provided.html. Also,\nnon-LOCAL load operations are subject to the secure_file_priv system\nvariable setting. If the variable value is a nonempty directory name,\nthe file to be loaded must be located in that directory. If the\nvariable value is empty (which is insecure), the file need only be\nreadable by the server.\n\nUsing LOCAL is a bit slower than letting the server access the files\ndirectly, because the contents of the file must be sent over the\nconnection by the client to the server. On the other hand, you do not\nneed the FILE privilege to load local files.\n\nLOCAL also affects error handling:\n\no With LOAD DATA INFILE, data-interpretation and duplicate-key errors\n  terminate the operation.\n\no With LOAD DATA LOCAL INFILE, data-interpretation and duplicate-key\n  errors become warnings and the operation continues because the server\n  has no way to stop transmission of the file in the middle of the\n  operation. For duplicate-key errors, this is the same as if IGNORE is\n  specified. IGNORE is explained further later in this section.\n\nThe REPLACE and IGNORE keywords control handling of input rows that\nduplicate existing rows on unique key values:\n\no If you specify REPLACE, input rows replace existing rows. In other\n  words, rows that have the same value for a primary key or unique\n  index as an existing row. See [HELP REPLACE].\n\no If you specify IGNORE, rows that duplicate an existing row on a\n  unique key value are discarded.\n\no If you do not specify either option, the behavior depends on whether\n  the LOCAL keyword is specified. Without LOCAL, an error occurs when a\n  duplicate key value is found, and the rest of the text file is\n  ignored. With LOCAL, the default behavior is the same as if IGNORE is\n  specified; this is because the server has no way to stop transmission\n  of the file in the middle of the operation.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/load-data.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/load-data.html'),(465,'DECLARE CURSOR',24,'Syntax:\nDECLARE cursor_name CURSOR FOR select_statement\n\nThis statement declares a cursor and associates it with a SELECT\nstatement that retrieves the rows to be traversed by the cursor. To\nfetch the rows later, use a FETCH statement. The number of columns\nretrieved by the SELECT statement must match the number of output\nvariables specified in the FETCH statement.\n\nThe SELECT statement cannot have an INTO clause.\n\nCursor declarations must appear before handler declarations and after\nvariable and condition declarations.\n\nA stored program may contain multiple cursor declarations, but each\ncursor declared in a given block must have a unique name. For an\nexample, see http://dev.mysql.com/doc/refman/5.5/en/cursors.html.\n\nFor information available through SHOW statements, it is possible in\nmany cases to obtain equivalent information by using a cursor with an\nINFORMATION_SCHEMA table.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/declare-cursor.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/declare-cursor.html'),(466,'LOCALTIME',32,'Syntax:\nLOCALTIME, LOCALTIME()\n\nLOCALTIME and LOCALTIME() are synonyms for NOW().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(467,'SHA1',12,'Syntax:\nSHA1(str), SHA(str)\n\nCalculates an SHA-1 160-bit checksum for the string, as described in\nRFC 3174 (Secure Hash Algorithm). The value is returned as a string of\n40 hexadecimal digits, or NULL if the argument was NULL. One of the\npossible uses for this function is as a hash key. See the notes at the\nbeginning of this section about storing hash values efficiently. You\ncan also use SHA1() as a cryptographic function for storing passwords.\nSHA() is synonymous with SHA1().\n\nAs of MySQL 5.5.3, the return value is a nonbinary string in the\nconnection character set. Before 5.5.3, the return value is a binary\nstring; see the notes at the beginning of this section about using the\nvalue as a nonbinary string.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SELECT SHA1(\'abc\');\n        -> \'a9993e364706816aba3e25717850c26c9cd0d89d\'\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(468,'BLOB',23,'BLOB[(M)]\n\nA BLOB column with a maximum length of 65,535 (216 − 1) bytes. Each\nBLOB value is stored using a 2-byte length prefix that indicates the\nnumber of bytes in the value.\n\nAn optional length M can be given for this type. If this is done, MySQL\ncreates the column as the smallest BLOB type large enough to hold\nvalues M bytes long.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(469,'PASSWORD',12,'Syntax:\nPASSWORD(str)\n\nReturns a hashed password string calculated from the cleartext password\nstr. The return value is a nonbinary string in the connection character\nset (a binary string before MySQL 5.5.3), or NULL if the argument is\nNULL. This function is the SQL interface to the algorithm used by the\nserver to encrypt MySQL passwords for storage in the mysql.user grant\ntable.\n\nThe old_passwords system variable controls the password hashing method\nused by the PASSWORD() function. It also influences password hashing\nperformed by CREATE USER and GRANT statements that specify a password\nusing an IDENTIFIED BY clause.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','mysql> SET old_passwords = 0;\nmysql> SELECT PASSWORD(\'mypass\'), OLD_PASSWORD(\'mypass\');\n+-------------------------------------------+------------------------+\n| PASSWORD(\'mypass\')                        | OLD_PASSWORD(\'mypass\') |\n+-------------------------------------------+------------------------+\n| *6C8989366EAF75BB670AD8EA7A7FC1176A95CEF4 | 6f8c114b58f2ce9e       |\n+-------------------------------------------+------------------------+\n\nmysql> SET old_passwords = 1;\nmysql> SELECT PASSWORD(\'mypass\'), OLD_PASSWORD(\'mypass\');\n+--------------------+------------------------+\n| PASSWORD(\'mypass\') | OLD_PASSWORD(\'mypass\') |\n+--------------------+------------------------+\n| 6f8c114b58f2ce9e   | 6f8c114b58f2ce9e       |\n+--------------------+------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(470,'UTC_DATE',32,'Syntax:\nUTC_DATE, UTC_DATE()\n\nReturns the current UTC date as a value in \'YYYY-MM-DD\' or YYYYMMDD\nformat, depending on whether the function is used in a string or\nnumeric context.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_DATE(), UTC_DATE() + 0;\n        -> \'2003-08-14\', 20030814\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(471,'DIMENSION',37,'Dimension(g)\n\nReturns the inherent dimension of the geometry value g. The result can\nbe −1, 0, 1, or 2. The meaning of these values is given in\nhttp://dev.mysql.com/doc/refman/5.5/en/gis-class-geometry.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-general-property-functions.html\n\n','mysql> SELECT Dimension(GeomFromText(\'LineString(1 1,2 2)\'));\n+------------------------------------------------+\n| Dimension(GeomFromText(\'LineString(1 1,2 2)\')) |\n+------------------------------------------------+\n|                                              1 |\n+------------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-general-property-functions.html'),(472,'BIT',23,'BIT[(M)]\n\nA bit-value type. M indicates the number of bits per value, from 1 to\n64. The default is 1 if M is omitted.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/numeric-type-overview.html'),(473,'EQUALS',7,'Equals(g1, g2)\n\nReturns 1 or 0 to indicate whether g1 is spatially equal to g2.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/spatial-relation-functions-mbr.html'),(474,'XA',8,'Syntax:\nXA {START|BEGIN} xid [JOIN|RESUME]\n\nXA END xid [SUSPEND [FOR MIGRATE]]\n\nXA PREPARE xid\n\nXA COMMIT xid [ONE PHASE]\n\nXA ROLLBACK xid\n\nXA RECOVER\n\nFor XA START, the JOIN and RESUME clauses are not supported.\n\nFor XA END the SUSPEND [FOR MIGRATE] clause is not supported.\n\nEach XA statement begins with the XA keyword, and most of them require\nan xid value. An xid is an XA transaction identifier. It indicates\nwhich transaction the statement applies to. xid values are supplied by\nthe client, or generated by the MySQL server. An xid value has from one\nto three parts:\n\nxid: gtrid [, bqual [, formatID ]]\n\ngtrid is a global transaction identifier, bqual is a branch qualifier,\nand formatID is a number that identifies the format used by the gtrid\nand bqual values. As indicated by the syntax, bqual and formatID are\noptional. The default bqual value is \'\' if not given. The default\nformatID value is 1 if not given.\n\ngtrid and bqual must be string literals, each up to 64 bytes (not\ncharacters) long. gtrid and bqual can be specified in several ways. You\ncan use a quoted string (\'ab\'), hex string (X\'6162\', 0x6162), or bit\nvalue (b\'nnnn\').\n\nformatID is an unsigned integer.\n\nThe gtrid and bqual values are interpreted in bytes by the MySQL\nserver\'s underlying XA support routines. However, while an SQL\nstatement containing an XA statement is being parsed, the server works\nwith some specific character set. To be safe, write gtrid and bqual as\nhex strings.\n\nxid values typically are generated by the Transaction Manager. Values\ngenerated by one TM must be different from values generated by other\nTMs. A given TM must be able to recognize its own xid values in a list\nof values returned by the XA RECOVER statement.\n\nFor XA START xid starts an XA transaction with the given xid value.\nEach XA transaction must have a unique xid value, so the value must not\ncurrently be used by another XA transaction. Uniqueness is assessed\nusing the gtrid and bqual values. All following XA statements for the\nXA transaction must be specified using the same xid value as that given\nin the XA START statement. If you use any of those statements but\nspecify an xid value that does not correspond to some existing XA\ntransaction, an error occurs.\n\nOne or more XA transactions can be part of the same global transaction.\nAll XA transactions within a given global transaction must use the same\ngtrid value in the xid value. For this reason, gtrid values must be\nglobally unique so that there is no ambiguity about which global\ntransaction a given XA transaction is part of. The bqual part of the\nxid value must be different for each XA transaction within a global\ntransaction. (The requirement that bqual values be different is a\nlimitation of the current MySQL XA implementation. It is not part of\nthe XA specification.)\n\nThe XA RECOVER statement returns information for those XA transactions\non the MySQL server that are in the PREPARED state. (See\nhttp://dev.mysql.com/doc/refman/5.5/en/xa-states.html.) The output\nincludes a row for each such XA transaction on the server, regardless\nof which client started it.\n\nXA RECOVER output rows look like this (for an example xid value\nconsisting of the parts \'abc\', \'def\', and 7):\n\nmysql> XA RECOVER;\n+----------+--------------+--------------+--------+\n| formatID | gtrid_length | bqual_length | data   |\n+----------+--------------+--------------+--------+\n|        7 |            3 |            3 | abcdef |\n+----------+--------------+--------------+--------+\n\nThe output columns have the following meanings:\n\no formatID is the formatID part of the transaction xid\n\no gtrid_length is the length in bytes of the gtrid part of the xid\n\no bqual_length is the length in bytes of the bqual part of the xid\n\no data is the concatenation of the gtrid and bqual parts of the xid\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/xa-statements.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/xa-statements.html'),(475,'CENTROID',2,'Centroid(mpoly)\n\nReturns the mathematical centroid for the MultiPolygon value mpoly as a\nPoint. The result is not guaranteed to be on the MultiPolygon.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-polygon-property-functions.html\n\n','mysql> SET @poly =\n    -> GeomFromText(\'POLYGON((0 0,10 0,10 10,0 10,0 0),(5 5,7 5,7 7,5 7,5 5))\');\nmysql> SELECT GeometryType(@poly),AsText(Centroid(@poly));\n+---------------------+--------------------------------------------+\n| GeometryType(@poly) | AsText(Centroid(@poly))                    |\n+---------------------+--------------------------------------------+\n| POLYGON             | POINT(4.958333333333333 4.958333333333333) |\n+---------------------+--------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-polygon-property-functions.html'),(476,'OCTET_LENGTH',38,'Syntax:\nOCTET_LENGTH(str)\n\nOCTET_LENGTH() is a synonym for LENGTH().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(477,'UTC_TIMESTAMP',32,'Syntax:\nUTC_TIMESTAMP, UTC_TIMESTAMP()\n\nReturns the current UTC date and time as a value in \'YYYY-MM-DD\nHH:MM:SS\' or YYYYMMDDHHMMSS.uuuuuu format, depending on whether the\nfunction is used in a string or numeric context.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT UTC_TIMESTAMP(), UTC_TIMESTAMP() + 0;\n        -> \'2003-08-14 18:08:04\', 20030814180804.000000\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(478,'AES_ENCRYPT',12,'Syntax:\nAES_ENCRYPT(str,key_str)\n\nAES_ENCRYPT() and AES_DECRYPT() implement encryption and decryption of\ndata using the official AES (Advanced Encryption Standard) algorithm,\npreviously known as \"Rijndael.\" The AES standard permits various key\nlengths. These functions implement AES with a 128-bit key length, but\nyou can extend them to 256 bits by modifying the source. The key length\nis a trade off between performance and security.\n\nAES_ENCRYPT() encrypts the string str using the key string key_str and\nreturns a binary string containing the encrypted output. AES_DECRYPT()\ndecrypts the encrypted string crypt_str using the key string key_str\nand returns the original cleartext string. If either function argument\nis NULL, the function returns NULL.\n\nThe str and crypt_str arguments can be any length, and padding is\nautomatically added to str so it is a multiple of a block as required\nby block-based algorithms such as AES. This padding is automatically\nremoved by the AES_DECRYPT() function. The length of crypt_str can be\ncalculated using this formula:\n\n16 * (trunc(string_length / 16) + 1)\n\nFor a key length of 128 bits, the most secure way to pass a key to the\nkey_str argument is to create a truly random 128-bit value and pass it\nas a binary value. For example:\n\nINSERT INTO t\nVALUES (1,AES_ENCRYPT(\'text\',UNHEX(\'F3229A0B371ED2D9441B830D21A390C3\')));\n\nA passphrase can be used to generate an AES key by hashing the\npassphrase. For example:\n\nINSERT INTO t\nVALUES (1,AES_ENCRYPT(\'text\', UNHEX(SHA2(\'My secret passphrase\',512))));\n\nDo not pass a password or passphrase directly to crypt_str, hash it\nfirst. Previous versions of this documentation suggested the former\napproach, but it is no longer recommended as the examples shown here\nare more secure.\n\nIf AES_DECRYPT() detects invalid data or incorrect padding, it returns\nNULL. However, it is possible for AES_DECRYPT() to return a non-NULL\nvalue (possibly garbage) if the input data or the key is invalid.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/encryption-functions.html'),(479,'+',3,'Syntax:\n+\n\nAddition:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html\n\n','mysql> SELECT 3+5;\n        -> 8\n','http://dev.mysql.com/doc/refman/5.5/en/arithmetic-functions.html'),(480,'INET_NTOA',14,'Syntax:\nINET_NTOA(expr)\n\nGiven a numeric IPv4 network address in network byte order, returns the\ndotted-quad representation of the address as a string. INET_NTOA()\nreturns NULL if it does not understand its argument.\n\nAs of MySQL 5.5.3, the return value is a nonbinary string in the\nconnection character set. Before 5.5.3, the return value is a binary\nstring.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html\n\n','mysql> SELECT INET_NTOA(167773449);\n        -> \'10.0.5.9\'\n','http://dev.mysql.com/doc/refman/5.5/en/miscellaneous-functions.html'),(481,'DAYOFWEEK',32,'Syntax:\nDAYOFWEEK(date)\n\nReturns the weekday index for date (1 = Sunday, 2 = Monday, ..., 7 =\nSaturday). These index values correspond to the ODBC standard.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DAYOFWEEK(\'2007-02-03\');\n        -> 7\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(482,'CEILING',3,'Syntax:\nCEILING(X)\n\nReturns the smallest integer value not less than X.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT CEILING(1.23);\n        -> 2\nmysql> SELECT CEILING(-1.23);\n        -> -1\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(483,'LINEFROMWKB',33,'LineFromWKB(wkb[, srid]), LineStringFromWKB(wkb[, srid])\n\nConstructs a LineString value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html'),(484,'SHOW PROCESSLIST',27,'Syntax:\nSHOW [FULL] PROCESSLIST\n\nSHOW PROCESSLIST shows you which threads are running. You can also get\nthis information from the INFORMATION_SCHEMA PROCESSLIST table or the\nmysqladmin processlist command. If you have the PROCESS privilege, you\ncan see all threads. Otherwise, you can see only your own threads (that\nis, threads associated with the MySQL account that you are using). If\nyou do not use the FULL keyword, only the first 100 characters of each\nstatement are shown in the Info field.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-processlist.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-processlist.html'),(485,'GEOMETRYTYPE',37,'GeometryType(g)\n\nReturns a binary string indicating the name of the geometry type of\nwhich the geometry instance g is a member. The name corresponds to one\nof the instantiable Geometry subclasses.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-general-property-functions.html\n\n','mysql> SELECT GeometryType(GeomFromText(\'POINT(1 1)\'));\n+------------------------------------------+\n| GeometryType(GeomFromText(\'POINT(1 1)\')) |\n+------------------------------------------+\n| POINT                                    |\n+------------------------------------------+\n','http://dev.mysql.com/doc/refman/5.5/en/gis-general-property-functions.html'),(486,'CREATE VIEW',40,'Syntax:\nCREATE\n    [OR REPLACE]\n    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]\n    [DEFINER = { user | CURRENT_USER }]\n    [SQL SECURITY { DEFINER | INVOKER }]\n    VIEW view_name [(column_list)]\n    AS select_statement\n    [WITH [CASCADED | LOCAL] CHECK OPTION]\n\nThe CREATE VIEW statement creates a new view, or replaces an existing\nview if the OR REPLACE clause is given. If the view does not exist,\nCREATE OR REPLACE VIEW is the same as CREATE VIEW. If the view does\nexist, CREATE OR REPLACE VIEW is the same as ALTER VIEW.\n\nFor information about restrictions on view use, see\nhttp://dev.mysql.com/doc/refman/5.5/en/view-restrictions.html.\n\nThe select_statement is a SELECT statement that provides the definition\nof the view. (Selecting from the view selects, in effect, using the\nSELECT statement.) The select_statement can select from base tables or\nother views.\n\nThe view definition is \"frozen\" at creation time and is not affected by\nsubsequent changes to the definitions of the underlying tables. For\nexample, if a view is defined as SELECT * on a table, new columns added\nto the table later do not become part of the view, and columns dropped\nfrom the table will result in an error when selecting from the view.\n\nThe ALGORITHM clause affects how MySQL processes the view. The DEFINER\nand SQL SECURITY clauses specify the security context to be used when\nchecking access privileges at view invocation time. The WITH CHECK\nOPTION clause can be given to constrain inserts or updates to rows in\ntables referenced by the view. These clauses are described later in\nthis section.\n\nThe CREATE VIEW statement requires the CREATE VIEW privilege for the\nview, and some privilege for each column selected by the SELECT\nstatement. For columns used elsewhere in the SELECT statement, you must\nhave the SELECT privilege. If the OR REPLACE clause is present, you\nmust also have the DROP privilege for the view. CREATE VIEW might also\nrequire the SUPER privilege, depending on the DEFINER value, as\ndescribed later in this section.\n\nWhen a view is referenced, privilege checking occurs as described later\nin this section.\n\nA view belongs to a database. By default, a new view is created in the\ndefault database. To create the view explicitly in a given database,\nuse db_name.view_name syntax to qualify the view name with the database\nname:\n\nCREATE VIEW test.v AS SELECT * FROM t;\n\nUnqualified table or view names in the SELECT statement are also\ninterpreted with respect to the default database. A view can refer to\ntables or views in other databases by qualifying the table or view name\nwith the appropriate database name.\n\nWithin a database, base tables and views share the same namespace, so a\nbase table and a view cannot have the same name.\n\nColumns retrieved by the SELECT statement can be simple references to\ntable columns, or expressions that use functions, constant values,\noperators, and so forth.\n\nA view must have unique column names with no duplicates, just like a\nbase table. By default, the names of the columns retrieved by the\nSELECT statement are used for the view column names. To define explicit\nnames for the view columns, specify the optional column_list clause as\na list of comma-separated identifiers. The number of names in\ncolumn_list must be the same as the number of columns retrieved by the\nSELECT statement.\n\nA view can be created from many kinds of SELECT statements. It can\nrefer to base tables or other views. It can use joins, UNION, and\nsubqueries. The SELECT need not even refer to any tables:\n\nCREATE VIEW v_today (today) AS SELECT CURRENT_DATE;\n\nThe following example defines a view that selects two columns from\nanother table as well as an expression calculated from those columns:\n\nmysql> CREATE TABLE t (qty INT, price INT);\nmysql> INSERT INTO t VALUES(3, 50);\nmysql> CREATE VIEW v AS SELECT qty, price, qty*price AS value FROM t;\nmysql> SELECT * FROM v;\n+------+-------+-------+\n| qty  | price | value |\n+------+-------+-------+\n|    3 |    50 |   150 |\n+------+-------+-------+\n\nA view definition is subject to the following restrictions:\n\no The SELECT statement cannot contain a subquery in the FROM clause.\n\no The SELECT statement cannot refer to system variables or user-defined\n  variables.\n\no Within a stored program, the SELECT statement cannot refer to program\n  parameters or local variables.\n\no The SELECT statement cannot refer to prepared statement parameters.\n\no Any table or view referred to in the definition must exist. If, after\n  the view has been created, a table or view that the definition refers\n  to is dropped, use of the view results in an error. To check a view\n  definition for problems of this kind, use the CHECK TABLE statement.\n\no The definition cannot refer to a TEMPORARY table, and you cannot\n  create a TEMPORARY view.\n\no You cannot associate a trigger with a view.\n\no Aliases for column names in the SELECT statement are checked against\n  the maximum column length of 64 characters (not the maximum alias\n  length of 256 characters).\n\nORDER BY is permitted in a view definition, but it is ignored if you\nselect from a view using a statement that has its own ORDER BY or\nfiltering or grouping. When ORDER BY is combined with LIMIT or OFFSET\nin a view definition, the ordering is always enforced before the query\nresult is used by the outer query, but it does not guarantee that the\nsame ordering is used in the end result. As a workaround, add an ORDER\nBY clause to the outer query.\n\nFor other options or clauses in the definition, they are added to the\noptions or clauses of the statement that references the view, but the\neffect is undefined. For example, if a view definition includes a LIMIT\nclause, and you select from the view using a statement that has its own\nLIMIT clause, it is undefined which limit applies. This same principle\napplies to options such as ALL, DISTINCT, or SQL_SMALL_RESULT that\nfollow the SELECT keyword, and to clauses such as INTO, FOR UPDATE,\nLOCK IN SHARE MODE, and PROCEDURE.\n\nThe results obtained from a view may be affected if you change the\nquery processing environment by changing system variables:\n\nmysql> CREATE VIEW v (mycol) AS SELECT \'abc\';\nQuery OK, 0 rows affected (0.01 sec)\n\nmysql> SET sql_mode = \'\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT \"mycol\" FROM v;\n+-------+\n| mycol |\n+-------+\n| mycol |\n+-------+\n1 row in set (0.01 sec)\n\nmysql> SET sql_mode = \'ANSI_QUOTES\';\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SELECT \"mycol\" FROM v;\n+-------+\n| mycol |\n+-------+\n| abc   |\n+-------+\n1 row in set (0.00 sec)\n\nThe DEFINER and SQL SECURITY clauses determine which MySQL account to\nuse when checking access privileges for the view when a statement is\nexecuted that references the view. The valid SQL SECURITY\ncharacteristic values are DEFINER (the default) and INVOKER. These\nindicate that the required privileges must be held by the user who\ndefined or invoked the view, respectively.\n\nIf a user value is given for the DEFINER clause, it should be a MySQL\naccount specified as \'user_name\'@\'host_name\', CURRENT_USER, or\nCURRENT_USER(). The default DEFINER value is the user who executes the\nCREATE VIEW statement. This is the same as specifying DEFINER =\nCURRENT_USER explicitly.\n\nIf the DEFINER clause is present, these rules determine the valid\nDEFINER user values:\n\no If you do not have the SUPER privilege, the only valid user value is\n  your own account, either specified literally or by using\n  CURRENT_USER. You cannot set the definer to some other account.\n\no If you have the SUPER privilege, you can specify any syntactically\n  valid account name. If the account does not exist, a warning is\n  generated.\n\no Although it is possible to create a view with a nonexistent DEFINER\n  account, an error occurs when the view is referenced if the SQL\n  SECURITY value is DEFINER but the definer account does not exist.\n\nFor more information about view security, see\nhttp://dev.mysql.com/doc/refman/5.5/en/stored-programs-security.html.\n\nWithin a view definition, CURRENT_USER returns the view\'s DEFINER value\nby default. For views defined with the SQL SECURITY INVOKER\ncharacteristic, CURRENT_USER returns the account for the view\'s\ninvoker. For information about user auditing within views, see\nhttp://dev.mysql.com/doc/refman/5.5/en/account-activity-auditing.html.\n\nWithin a stored routine that is defined with the SQL SECURITY DEFINER\ncharacteristic, CURRENT_USER returns the routine\'s DEFINER value. This\nalso affects a view defined within such a routine, if the view\ndefinition contains a DEFINER value of CURRENT_USER.\n\nMySQL checks view privileges like this:\n\no At view definition time, the view creator must have the privileges\n  needed to use the top-level objects accessed by the view. For\n  example, if the view definition refers to table columns, the creator\n  must have some privilege for each column in the select list of the\n  definition, and the SELECT privilege for each column used elsewhere\n  in the definition. If the definition refers to a stored function,\n  only the privileges needed to invoke the function can be checked. The\n  privileges required at function invocation time can be checked only\n  as it executes: For different invocations, different execution paths\n  within the function might be taken.\n\no The user who references a view must have appropriate privileges to\n  access it (SELECT to select from it, INSERT to insert into it, and so\n  forth.)\n\no When a view has been referenced, privileges for objects accessed by\n  the view are checked against the privileges held by the view DEFINER\n  account or invoker, depending on whether the SQL SECURITY\n  characteristic is DEFINER or INVOKER, respectively.\n\no If reference to a view causes execution of a stored function,\n  privilege checking for statements executed within the function depend\n  on whether the function SQL SECURITY characteristic is DEFINER or\n  INVOKER. If the security characteristic is DEFINER, the function runs\n  with the privileges of the DEFINER account. If the characteristic is\n  INVOKER, the function runs with the privileges determined by the\n  view\'s SQL SECURITY characteristic.\n\nExample: A view might depend on a stored function, and that function\nmight invoke other stored routines. For example, the following view\ninvokes a stored function f():\n\nCREATE VIEW v AS SELECT * FROM t WHERE t.id = f(t.name);\n\nSuppose that f() contains a statement such as this:\n\nIF name IS NULL then\n  CALL p1();\nELSE\n  CALL p2();\nEND IF;\n\nThe privileges required for executing statements within f() need to be\nchecked when f() executes. This might mean that privileges are needed\nfor p1() or p2(), depending on the execution path within f(). Those\nprivileges must be checked at runtime, and the user who must possess\nthe privileges is determined by the SQL SECURITY values of the view v\nand the function f().\n\nThe DEFINER and SQL SECURITY clauses for views are extensions to\nstandard SQL. In standard SQL, views are handled using the rules for\nSQL SECURITY DEFINER. The standard says that the definer of the view,\nwhich is the same as the owner of the view\'s schema, gets applicable\nprivileges on the view (for example, SELECT) and may grant them. MySQL\nhas no concept of a schema \"owner\", so MySQL adds a clause to identify\nthe definer. The DEFINER clause is an extension where the intent is to\nhave what the standard has; that is, a permanent record of who defined\nthe view. This is why the default DEFINER value is the account of the\nview creator.\n\nThe optional ALGORITHM clause is a MySQL extension to standard SQL. It\naffects how MySQL processes the view. ALGORITHM takes three values:\nMERGE, TEMPTABLE, or UNDEFINED. The default algorithm is UNDEFINED if\nno ALGORITHM clause is present. For more information, see\nhttp://dev.mysql.com/doc/refman/5.5/en/view-algorithms.html, as well as\nOptimizing Derived Tables\n(http://dev.mysql.com/doc/refman/5.6/en/derived-table-optimization.html\n).\n\nSome views are updatable. That is, you can use them in statements such\nas UPDATE, DELETE, or INSERT to update the contents of the underlying\ntable. For a view to be updatable, there must be a one-to-one\nrelationship between the rows in the view and the rows in the\nunderlying table. There are also certain other constructs that make a\nview nonupdatable.\n\nThe WITH CHECK OPTION clause can be given for an updatable view to\nprevent inserts or updates to rows except those for which the WHERE\nclause in the select_statement is true.\n\nIn a WITH CHECK OPTION clause for an updatable view, the LOCAL and\nCASCADED keywords determine the scope of check testing when the view is\ndefined in terms of another view. The LOCAL keyword restricts the CHECK\nOPTION only to the view being defined. CASCADED causes the checks for\nunderlying views to be evaluated as well. When neither keyword is\ngiven, the default is CASCADED.\n\nFor more information about updatable views and the WITH CHECK OPTION\nclause, see\nhttp://dev.mysql.com/doc/refman/5.5/en/view-updatability.html, and\nhttp://dev.mysql.com/doc/refman/5.5/en/view-check-option.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-view.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/create-view.html'),(487,'TRIM',38,'Syntax:\nTRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str), TRIM([remstr\nFROM] str)\n\nReturns the string str with all remstr prefixes or suffixes removed. If\nnone of the specifiers BOTH, LEADING, or TRAILING is given, BOTH is\nassumed. remstr is optional and, if not specified, spaces are removed.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT TRIM(\'  bar   \');\n        -> \'bar\'\nmysql> SELECT TRIM(LEADING \'x\' FROM \'xxxbarxxx\');\n        -> \'barxxx\'\nmysql> SELECT TRIM(BOTH \'x\' FROM \'xxxbarxxx\');\n        -> \'bar\'\nmysql> SELECT TRIM(TRAILING \'xyz\' FROM \'barxxyz\');\n        -> \'barx\'\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(488,'SIGNAL',24,'Syntax:\nSIGNAL condition_value\n    [SET signal_information_item\n    [, signal_information_item] ...]\n\ncondition_value:\n    SQLSTATE [VALUE] sqlstate_value\n  | condition_name\n\nsignal_information_item:\n    condition_information_item_name = simple_value_specification\n\ncondition_information_item_name:\n    CLASS_ORIGIN\n  | SUBCLASS_ORIGIN\n  | MESSAGE_TEXT\n  | MYSQL_ERRNO\n  | CONSTRAINT_CATALOG\n  | CONSTRAINT_SCHEMA\n  | CONSTRAINT_NAME\n  | CATALOG_NAME\n  | SCHEMA_NAME\n  | TABLE_NAME\n  | COLUMN_NAME\n  | CURSOR_NAME\n\ncondition_name, simple_value_specification:\n    (see following discussion)\n\nSIGNAL is the way to \"return\" an error. SIGNAL provides error\ninformation to a handler, to an outer portion of the application, or to\nthe client. Also, it provides control over the error\'s characteristics\n(error number, SQLSTATE value, message). Without SIGNAL, it is\nnecessary to resort to workarounds such as deliberately referring to a\nnonexistent table to cause a routine to return an error.\n\nNo special privileges are required to execute the SIGNAL statement.\n\nThe condition_value in a SIGNAL statement indicates the error value to\nbe returned. It can be an SQLSTATE value (a 5-character string literal)\nor a condition_name that refers to a named condition previously defined\nwith DECLARE ... CONDITION (see [HELP DECLARE CONDITION]).\n\nAn SQLSTATE value can indicate errors, warnings, or \"not found.\" The\nfirst two characters of the value indicate its error class, as\ndiscussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/signal.html#signal-condition-inf\normation-items. Some signal values cause statement termination; see\nhttp://dev.mysql.com/doc/refman/5.5/en/signal.html#signal-effects.\n\nThe SQLSTATE value for a SIGNAL statement should not start with \'00\'\nbecause such values indicate success and are not valid for signaling an\nerror. This is true whether the SQLSTATE value is specified directly in\nthe SIGNAL statement or in a named condition referred to in the\nstatement. If the value is invalid, a Bad SQLSTATE error occurs.\n\nTo signal a generic SQLSTATE value, use \'45000\', which means \"unhandled\nuser-defined exception.\"\n\nThe SIGNAL statement optionally includes a SET clause that contains\nmultiple signal items, in a comma-separated list of\ncondition_information_item_name = simple_value_specification\nassignments.\n\nEach condition_information_item_name may be specified only once in the\nSET clause. Otherwise, a Duplicate condition information item error\noccurs.\n\nValid simple_value_specification designators can be specified using\nstored procedure or function parameters, stored program local variables\ndeclared with DECLARE, user-defined variables, system variables, or\nliterals. A character literal may include a _charset introducer.\n\nFor information about permissible condition_information_item_name\nvalues, see\nhttp://dev.mysql.com/doc/refman/5.5/en/signal.html#signal-condition-inf\normation-items.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/signal.html\n\n','CREATE PROCEDURE p (pval INT)\nBEGIN\n  DECLARE specialty CONDITION FOR SQLSTATE \'45000\';\n  IF pval = 0 THEN\n    SIGNAL SQLSTATE \'01000\';\n  ELSEIF pval = 1 THEN\n    SIGNAL SQLSTATE \'45000\'\n      SET MESSAGE_TEXT = \'An error occurred\';\n  ELSEIF pval = 2 THEN\n    SIGNAL specialty\n      SET MESSAGE_TEXT = \'An error occurred\';\n  ELSE\n    SIGNAL SQLSTATE \'01000\'\n      SET MESSAGE_TEXT = \'A warning occurred\', MYSQL_ERRNO = 1000;\n    SIGNAL SQLSTATE \'45000\'\n      SET MESSAGE_TEXT = \'An error occurred\', MYSQL_ERRNO = 1001;\n  END IF;\nEND;\n','http://dev.mysql.com/doc/refman/5.5/en/signal.html'),(489,'SAVEPOINT',8,'Syntax:\nSAVEPOINT identifier\nROLLBACK [WORK] TO [SAVEPOINT] identifier\nRELEASE SAVEPOINT identifier\n\nInnoDB supports the SQL statements SAVEPOINT, ROLLBACK TO SAVEPOINT,\nRELEASE SAVEPOINT and the optional WORK keyword for ROLLBACK.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/savepoint.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/savepoint.html'),(490,'MPOINTFROMWKB',33,'MPointFromWKB(wkb[, srid]), MultiPointFromWKB(wkb[, srid])\n\nConstructs a MultiPoint value using its WKB representation and SRID.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/gis-wkb-functions.html'),(491,'ALTER TABLE',40,'Syntax:\nALTER [ONLINE|OFFLINE] [IGNORE] TABLE tbl_name\n    [alter_specification [, alter_specification] ...]\n    [partition_options]\n\nalter_specification:\n    table_options\n  | ADD [COLUMN] col_name column_definition\n        [FIRST | AFTER col_name]\n  | ADD [COLUMN] (col_name column_definition,...)\n  | ADD {INDEX|KEY} [index_name]\n        [index_type] (index_col_name,...) [index_option] ...\n  | ADD [CONSTRAINT [symbol]] PRIMARY KEY\n        [index_type] (index_col_name,...) [index_option] ...\n  | ADD [CONSTRAINT [symbol]]\n        UNIQUE [INDEX|KEY] [index_name]\n        [index_type] (index_col_name,...) [index_option] ...\n  | ADD FULLTEXT [INDEX|KEY] [index_name]\n        (index_col_name,...) [index_option] ...\n  | ADD SPATIAL [INDEX|KEY] [index_name]\n        (index_col_name,...) [index_option] ...\n  | ADD [CONSTRAINT [symbol]]\n        FOREIGN KEY [index_name] (index_col_name,...)\n        reference_definition\n  | ALTER [COLUMN] col_name {SET DEFAULT literal | DROP DEFAULT}\n  | CHANGE [COLUMN] old_col_name new_col_name column_definition\n        [FIRST|AFTER col_name]\n  | [DEFAULT] CHARACTER SET [=] charset_name [COLLATE [=] collation_name]\n  | CONVERT TO CHARACTER SET charset_name [COLLATE collation_name]\n  | {DISABLE|ENABLE} KEYS\n  | {DISCARD|IMPORT} TABLESPACE\n  | DROP [COLUMN] col_name\n  | DROP {INDEX|KEY} index_name\n  | DROP PRIMARY KEY\n  | DROP FOREIGN KEY fk_symbol\n  | FORCE\n  | MODIFY [COLUMN] col_name column_definition\n        [FIRST | AFTER col_name]\n  | ORDER BY col_name [, col_name] ...\n  | RENAME [TO|AS] new_tbl_name\n  | ADD PARTITION (partition_definition)\n  | DROP PARTITION partition_names\n  | TRUNCATE PARTITION {partition_names | ALL}\n  | COALESCE PARTITION number\n  | REORGANIZE PARTITION [partition_names INTO (partition_definitions)]\n  | ANALYZE PARTITION {partition_names | ALL}\n  | CHECK PARTITION {partition_names | ALL}\n  | OPTIMIZE PARTITION {partition_names | ALL}\n  | REBUILD PARTITION {partition_names | ALL}\n  | REPAIR PARTITION {partition_names | ALL}\n  | PARTITION BY partitioning_expression\n  | REMOVE PARTITIONING\n\nindex_col_name:\n    col_name [(length)] [ASC | DESC]\n\nindex_type:\n    USING {BTREE | HASH}\n\nindex_option:\n    KEY_BLOCK_SIZE [=] value\n  | index_type\n  | WITH PARSER parser_name\n  | COMMENT \'string\'\n\ntable_options:\n    table_option [[,] table_option] ...\n\ntable_option:\n    AUTO_INCREMENT [=] value\n  | AVG_ROW_LENGTH [=] value\n  | [DEFAULT] CHARACTER SET [=] charset_name\n  | CHECKSUM [=] {0 | 1}\n  | [DEFAULT] COLLATE [=] collation_name\n  | COMMENT [=] \'string\'\n  | CONNECTION [=] \'connect_string\'\n  | {DATA|INDEX} DIRECTORY [=] \'absolute path to directory\'\n  | DELAY_KEY_WRITE [=] {0 | 1}\n  | ENGINE [=] engine_name\n  | INSERT_METHOD [=] { NO | FIRST | LAST }\n  | KEY_BLOCK_SIZE [=] value\n  | MAX_ROWS [=] value\n  | MIN_ROWS [=] value\n  | PACK_KEYS [=] {0 | 1 | DEFAULT}\n  | PASSWORD [=] \'string\'\n  | ROW_FORMAT [=] {DEFAULT|DYNAMIC|FIXED|COMPRESSED|REDUNDANT|COMPACT}\n  | TABLESPACE tablespace_name [STORAGE {DISK|MEMORY|DEFAULT}]\n  | UNION [=] (tbl_name[,tbl_name]...)\n\nALTER TABLE changes the structure of a table. For example, you can add\nor delete columns, create or destroy indexes, change the type of\nexisting columns, or rename columns or the table itself. You can also\nchange characteristics such as the storage engine used for the table or\nthe table comment.\n\no To use ALTER TABLE, you need ALTER, CREATE, and INSERT privileges for\n  the table. Renaming a table requires ALTER and DROP on the old table,\n  ALTER, CREATE, and INSERT on the new table.\n\no Following the table name, specify the alterations to be made. If none\n  are given, ALTER TABLE does nothing.\n\no The syntax for many of the permissible alterations is similar to\n  clauses of the CREATE TABLE statement. column_definition clauses use\n  the same syntax for ADD and CHANGE as for CREATE TABLE. For more\n  information, see [HELP CREATE TABLE].\n\no The word COLUMN is optional and can be omitted.\n\no Multiple ADD, ALTER, DROP, and CHANGE clauses are permitted in a\n  single ALTER TABLE statement, separated by commas. This is a MySQL\n  extension to standard SQL, which permits only one of each clause per\n  ALTER TABLE statement. For example, to drop multiple columns in a\n  single statement, do this:\n\nALTER TABLE t2 DROP COLUMN c, DROP COLUMN d;\n\no If a storage engine does not support an attempted ALTER TABLE\n  operation, a warning may result. Such warnings can be displayed with\n  SHOW WARNINGS. See [HELP SHOW WARNINGS]. For information on\n  troubleshooting ALTER TABLE, see\n  http://dev.mysql.com/doc/refman/5.5/en/alter-table-problems.html.\n\no For usage examples, see\n  http://dev.mysql.com/doc/refman/5.5/en/alter-table-examples.html.\n\no With the mysql_info() C API function, you can find out how many rows\n  were copied by ALTER TABLE, and (when IGNORE is used) how many rows\n  were deleted due to duplication of unique key values. See\n  http://dev.mysql.com/doc/refman/5.5/en/mysql-info.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-table.html'),(492,'LABELS',24,'Syntax:\n[begin_label:] BEGIN\n    [statement_list]\nEND [end_label]\n\n[begin_label:] LOOP\n    statement_list\nEND LOOP [end_label]\n\n[begin_label:] REPEAT\n    statement_list\nUNTIL search_condition\nEND REPEAT [end_label]\n\n[begin_label:] WHILE search_condition DO\n    statement_list\nEND WHILE [end_label]\n\nLabels are permitted for BEGIN ... END blocks and for the LOOP, REPEAT,\nand WHILE statements. Label use for those statements follows these\nrules:\n\no begin_label must be followed by a colon.\n\no begin_label can be given without end_label. If end_label is present,\n  it must be the same as begin_label.\n\no end_label cannot be given without begin_label.\n\no Labels at the same nesting level must be distinct.\n\no Labels can be up to 16 characters long.\n\nTo refer to a label within the labeled construct, use an ITERATE or\nLEAVE statement. The following example uses those statements to\ncontinue iterating or terminate the loop:\n\nCREATE PROCEDURE doiterate(p1 INT)\nBEGIN\n  label1: LOOP\n    SET p1 = p1 + 1;\n    IF p1 < 10 THEN ITERATE label1; END IF;\n    LEAVE label1;\n  END LOOP label1;\nEND;\n\nThe scope of a block label does not include the code for handlers\ndeclared within the block. For details, see [HELP DECLARE HANDLER].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/statement-labels.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/statement-labels.html'),(493,'CHAR BYTE',23,'The CHAR BYTE data type is an alias for the BINARY data type. This is a\ncompatibility feature.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(494,'>',20,'Syntax:\n>\n\nGreater than:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT 2 > 2;\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(495,'ANALYZE TABLE',21,'Syntax:\nANALYZE [NO_WRITE_TO_BINLOG | LOCAL]\n    TABLE tbl_name [, tbl_name] ...\n\nANALYZE TABLE performs a key distribution analysis and stores the\ndistribution for the named table or tables. For MyISAM tables, this\nstatement is equivalent to using myisamchk --analyze.\n\nThis statement requires SELECT and INSERT privileges for the table.\n\nANALYZE TABLE works with InnoDB, NDB, and MyISAM tables. It does not\nwork with views.\n\nANALYZE TABLE is supported for partitioned tables, and you can use\nALTER TABLE ... ANALYZE PARTITION to analyze one or more partitions;\nfor more information, see [HELP ALTER TABLE], and\nhttp://dev.mysql.com/doc/refman/5.5/en/partitioning-maintenance.html.\n\nDuring the analysis, the table is locked with a read lock for InnoDB\nand MyISAM.\n\nBy default, the server writes ANALYZE TABLE statements to the binary\nlog so that they replicate to replication slaves. To suppress logging,\nspecify the optional NO_WRITE_TO_BINLOG keyword or its alias LOCAL.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/analyze-table.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/analyze-table.html'),(496,'FIELD',38,'Syntax:\nFIELD(str,str1,str2,str3,...)\n\nReturns the index (position) of str in the str1, str2, str3, ... list.\nReturns 0 if str is not found.\n\nIf all arguments to FIELD() are strings, all arguments are compared as\nstrings. If all arguments are numbers, they are compared as numbers.\nOtherwise, the arguments are compared as double.\n\nIf str is NULL, the return value is 0 because NULL fails equality\ncomparison with any value. FIELD() is the complement of ELT().\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-functions.html\n\n','mysql> SELECT FIELD(\'ej\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 2\nmysql> SELECT FIELD(\'fo\', \'Hej\', \'ej\', \'Heja\', \'hej\', \'foo\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/string-functions.html'),(497,'CONSTRAINT',40,'MySQL supports foreign keys, which let you cross-reference related data\nacross tables, and foreign key constraints, which help keep this\nspread-out data consistent. The essential syntax for a foreign key\nconstraint definition in a CREATE TABLE or ALTER TABLE statement looks\nlike this:\n\n[CONSTRAINT [symbol]] FOREIGN KEY\n    [index_name] (index_col_name, ...)\n    REFERENCES tbl_name (index_col_name,...)\n    [ON DELETE reference_option]\n    [ON UPDATE reference_option]\n\nreference_option:\n    RESTRICT | CASCADE | SET NULL | NO ACTION | SET DEFAULT\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/create-table-foreign-keys.html\n\n','CREATE TABLE product (\n    category INT NOT NULL, id INT NOT NULL,\n    price DECIMAL,\n    PRIMARY KEY(category, id)\n)   ENGINE=INNODB;\n\nCREATE TABLE customer (\n    id INT NOT NULL,\n    PRIMARY KEY (id)\n)   ENGINE=INNODB;\n\nCREATE TABLE product_order (\n    no INT NOT NULL AUTO_INCREMENT,\n    product_category INT NOT NULL,\n    product_id INT NOT NULL,\n    customer_id INT NOT NULL,\n\n    PRIMARY KEY(no),\n    INDEX (product_category, product_id),\n    INDEX (customer_id),\n\n    FOREIGN KEY (product_category, product_id)\n      REFERENCES product(category, id)\n      ON UPDATE CASCADE ON DELETE RESTRICT,\n\n    FOREIGN KEY (customer_id)\n      REFERENCES customer(id)\n)   ENGINE=INNODB;\n','http://dev.mysql.com/doc/refman/5.5/en/create-table-foreign-keys.html'),(498,'ALTER TABLESPACE',40,'Syntax:\nALTER TABLESPACE tablespace_name\n    {ADD|DROP} DATAFILE \'file_name\'\n    [INITIAL_SIZE [=] size]\n    [WAIT]\n    ENGINE [=] engine_name\n\nThis statement can be used either to add a new data file, or to drop a\ndata file from a tablespace.\n\nThe ADD DATAFILE variant enables you to specify an initial size using\nan INITIAL_SIZE clause, where size is measured in bytes; the default\nvalue is 134217728 (128 MB). Prior to MySQL NDB Cluster 7.2.14, this\nvalue was required to be specified using digits (Bug #13116514, Bug\n#16104705, Bug #62858); in MySQL NDB Cluster 7.2.14 and later, you may\noptionally follow size with a one-letter abbreviation for an order of\nmagnitude, similar to those used in my.cnf. Generally, this is one of\nthe letters M (megabytes) or G (gigabytes).\n\n*Note*:\n\nAll NDB Cluster Disk Data objects share the same namespace. This means\nthat each Disk Data object must be uniquely named (and not merely each\nDisk Data object of a given type). For example, you cannot have a\ntablespace and an data file with the same name, or an undo log file and\na tablespace with the same name.\n\nOn 32-bit systems, the maximum supported value for INITIAL_SIZE is\n4294967296 (4 GB). (Bug #29186)\n\nINITIAL_SIZE is rounded, explicitly, as for CREATE TABLESPACE.\n\nOnce a data file has been created, its size cannot be changed; however,\nyou can add more data files to the tablespace using additional ALTER\nTABLESPACE ... ADD DATAFILE statements.\n\nUsing DROP DATAFILE with ALTER TABLESPACE drops the data file\n\'file_name\' from the tablespace. You cannot drop a data file from a\ntablespace which is in use by any table; in other words, the data file\nmust be empty (no extents used). See\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-cluster-disk-data-objects.\nhtml. In addition, any data file to be dropped must previously have\nbeen added to the tablespace with CREATE TABLESPACE or ALTER\nTABLESPACE.\n\nBoth ALTER TABLESPACE ... ADD DATAFILE and ALTER TABLESPACE ... DROP\nDATAFILE require an ENGINE clause which specifies the storage engine\nused by the tablespace. Currently, the only accepted values for\nengine_name are NDB and NDBCLUSTER.\n\nWAIT is parsed but otherwise ignored, and so has no effect in MySQL\n5.5. It is intended for future expansion.\n\nWhen ALTER TABLESPACE ... ADD DATAFILE is used with ENGINE = NDB, a\ndata file is created on each Cluster data node. You can verify that the\ndata files were created and obtain information about them by querying\nthe INFORMATION_SCHEMA.FILES table. For example, the following query\nshows all data files belonging to the tablespace named newts:\n\nmysql> SELECT LOGFILE_GROUP_NAME, FILE_NAME, EXTRA\n    -> FROM INFORMATION_SCHEMA.FILES\n    -> WHERE TABLESPACE_NAME = \'newts\' AND FILE_TYPE = \'DATAFILE\';\n+--------------------+--------------+----------------+\n| LOGFILE_GROUP_NAME | FILE_NAME    | EXTRA          |\n+--------------------+--------------+----------------+\n| lg_3               | newdata.dat  | CLUSTER_NODE=3 |\n| lg_3               | newdata.dat  | CLUSTER_NODE=4 |\n| lg_3               | newdata2.dat | CLUSTER_NODE=3 |\n| lg_3               | newdata2.dat | CLUSTER_NODE=4 |\n+--------------------+--------------+----------------+\n2 rows in set (0.03 sec)\n\nSee http://dev.mysql.com/doc/refman/5.5/en/files-table.html.\n\nALTER TABLESPACE is useful only with Disk Data storage for NDB Cluster.\nSee\nhttp://dev.mysql.com/doc/refman/5.5/en/mysql-cluster-disk-data.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/alter-tablespace.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/alter-tablespace.html'),(499,'ENUM',23,'ENUM(\'value1\',\'value2\',...) [CHARACTER SET charset_name] [COLLATE\ncollation_name]\n\nAn enumeration. A string object that can have only one value, chosen\nfrom the list of values \'value1\', \'value2\', ..., NULL or the special \'\'\nerror value. ENUM values are represented internally as integers.\n\nAn ENUM column can have a maximum of 65,535 distinct elements. (The\npractical limit is less than 3000.) A table can have no more than 255\nunique element list definitions among its ENUM and SET columns\nconsidered as a group. For more information on these limits, see\nhttp://dev.mysql.com/doc/refman/5.5/en/limits-frm-file.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(500,'STRCMP',38,'Syntax:\nSTRCMP(expr1,expr2)\n\nSTRCMP() returns 0 if the strings are the same, -1 if the first\nargument is smaller than the second according to the current sort\norder, and 1 otherwise.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-comparison-functions.html\n\n','mysql> SELECT STRCMP(\'text\', \'text2\');\n        -> -1\nmysql> SELECT STRCMP(\'text2\', \'text\');\n        -> 1\nmysql> SELECT STRCMP(\'text\', \'text\');\n        -> 0\n','http://dev.mysql.com/doc/refman/5.5/en/string-comparison-functions.html'),(501,'INSERT DELAYED',28,'Syntax:\nINSERT DELAYED ...\n\nThe DELAYED option for the INSERT statement is a MySQL extension to\nstandard SQL that is very useful if you have clients that cannot or\nneed not wait for the INSERT to complete. This is a common situation\nwhen you use MySQL for logging and you also periodically run SELECT and\nUPDATE statements that take a long time to complete.\n\nWhen a client uses INSERT DELAYED, it gets an okay from the server at\nonce, and the row is queued to be inserted when the table is not in use\nby any other thread.\n\nAnother major benefit of using INSERT DELAYED is that inserts from many\nclients are bundled together and written in one block. This is much\nfaster than performing many separate inserts.\n\n*Note*:\n\nINSERT DELAYED is slower than a normal INSERT if the table is not\notherwise in use. There is also the additional overhead for the server\nto handle a separate thread for each table for which there are delayed\nrows. This means that you should use INSERT DELAYED only when you are\nreally sure that you need it.\n\nThe queued rows are held only in memory until they are inserted into\nthe table. This means that if you terminate mysqld forcibly (for\nexample, with kill -9) or if mysqld dies unexpectedly, any queued rows\nthat have not been written to disk are lost.\n\nThere are some constraints on the use of DELAYED:\n\no INSERT DELAYED works only with MyISAM, MEMORY, ARCHIVE, and BLACKHOLE\n  tables. For engines that do not support DELAYED, an error occurs.\n\no An error occurs for INSERT DELAYED if used with a table that has been\n  locked with LOCK TABLES because the insert must be handled by a\n  separate thread, not by the session that holds the lock.\n\no For MyISAM tables, if there are no free blocks in the middle of the\n  data file, concurrent SELECT and INSERT statements are supported.\n  Under these circumstances, you very seldom need to use INSERT DELAYED\n  with MyISAM.\n\no INSERT DELAYED should be used only for INSERT statements that specify\n  value lists. The server ignores DELAYED for INSERT ... SELECT or\n  INSERT ... ON DUPLICATE KEY UPDATE statements.\n\no Because the INSERT DELAYED statement returns immediately, before the\n  rows are inserted, you cannot use LAST_INSERT_ID() to get the\n  AUTO_INCREMENT value that the statement might generate.\n\no DELAYED rows are not visible to SELECT statements until they actually\n  have been inserted.\n\no INSERT DELAYED is handled as a simple INSERT (that is, without the\n  DELAYED option) whenever the value of binlog_format is STATEMENT or\n  MIXED. (In the latter case, the statement does not trigger a switch\n  to row-based logging, and so is logged using the statement-based\n  format.)\n\n  This does not apply when using row-based binary logging mode\n  (binlog_format set to ROW), in which INSERT DELAYED statements are\n  always executed using the DELAYED option as specified, and logged as\n  row-update events.\n\no DELAYED is ignored on slave replication servers, so that INSERT\n  DELAYED is treated as a normal INSERT on slaves. This is because\n  DELAYED could cause the slave to have different data than the master.\n\no Pending INSERT DELAYED statements are lost if a table is write locked\n  and ALTER TABLE is used to modify the table structure.\n\no INSERT DELAYED is not supported for views.\n\no INSERT DELAYED is not supported for partitioned tables.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/insert-delayed.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/insert-delayed.html'),(502,'SHOW PROCEDURE CODE',27,'Syntax:\nSHOW PROCEDURE CODE proc_name\n\nThis statement is a MySQL extension that is available only for servers\nthat have been built with debugging support. It displays a\nrepresentation of the internal implementation of the named stored\nprocedure. A similar statement, SHOW FUNCTION CODE, displays\ninformation about stored functions (see [HELP SHOW FUNCTION CODE]).\n\nTo use either statement, you must be the owner of the routine or have\nSELECT access to the mysql.proc table.\n\nIf the named routine is available, each statement produces a result\nset. Each row in the result set corresponds to one \"instruction\" in the\nroutine. The first column is Pos, which is an ordinal number beginning\nwith 0. The second column is Instruction, which contains an SQL\nstatement (usually changed from the original source), or a directive\nwhich has meaning only to the stored-routine handler.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-procedure-code.html\n\n','mysql> DELIMITER //\nmysql> CREATE PROCEDURE p1 ()\n    -> BEGIN\n    ->   DECLARE fanta INT DEFAULT 55;\n    ->   DROP TABLE t2;\n    ->   LOOP\n    ->     INSERT INTO t3 VALUES (fanta);\n    ->     END LOOP;\n    ->   END//\nQuery OK, 0 rows affected (0.00 sec)\n\nmysql> SHOW PROCEDURE CODE p1//\n+-----+----------------------------------------+\n| Pos | Instruction                            |\n+-----+----------------------------------------+\n|   0 | set fanta@0 55                         |\n|   1 | stmt 9 \"DROP TABLE t2\"                 |\n|   2 | stmt 5 \"INSERT INTO t3 VALUES (fanta)\" |\n|   3 | jump 2                                 |\n+-----+----------------------------------------+\n4 rows in set (0.00 sec)\n','http://dev.mysql.com/doc/refman/5.5/en/show-procedure-code.html'),(503,'MEDIUMTEXT',23,'MEDIUMTEXT [CHARACTER SET charset_name] [COLLATE collation_name]\n\nA TEXT column with a maximum length of 16,777,215 (224 − 1)\ncharacters. The effective maximum length is less if the value contains\nmultibyte characters. Each MEDIUMTEXT value is stored using a 3-byte\nlength prefix that indicates the number of bytes in the value.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/string-type-overview.html'),(504,'LOG',3,'Syntax:\nLOG(X), LOG(B,X)\n\nIf called with one parameter, this function returns the natural\nlogarithm of X. If X is less than or equal to 0, then NULL is returned.\n\nThe inverse of this function (when called with a single argument) is\nthe EXP() function.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT LOG(2);\n        -> 0.69314718055995\nmysql> SELECT LOG(-2);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(505,'SHOW COLLATION',27,'Syntax:\nSHOW COLLATION\n    [LIKE \'pattern\' | WHERE expr]\n\nThis statement lists collations supported by the server. By default,\nthe output from SHOW COLLATION includes all available collations. The\nLIKE clause, if present, indicates which collation names to match. The\nWHERE clause can be given to select rows using more general conditions,\nas discussed in\nhttp://dev.mysql.com/doc/refman/5.5/en/extended-show.html. For example:\n\nmysql> SHOW COLLATION WHERE Charset = \'latin1\';\n+-------------------+---------+----+---------+----------+---------+\n| Collation         | Charset | Id | Default | Compiled | Sortlen |\n+-------------------+---------+----+---------+----------+---------+\n| latin1_german1_ci | latin1  |  5 |         | Yes      |       1 |\n| latin1_swedish_ci | latin1  |  8 | Yes     | Yes      |       1 |\n| latin1_danish_ci  | latin1  | 15 |         | Yes      |       1 |\n| latin1_german2_ci | latin1  | 31 |         | Yes      |       2 |\n| latin1_bin        | latin1  | 47 |         | Yes      |       1 |\n| latin1_general_ci | latin1  | 48 |         | Yes      |       1 |\n| latin1_general_cs | latin1  | 49 |         | Yes      |       1 |\n| latin1_spanish_ci | latin1  | 94 |         | Yes      |       1 |\n+-------------------+---------+----+---------+----------+---------+\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/show-collation.html\n\n','','http://dev.mysql.com/doc/refman/5.5/en/show-collation.html'),(506,'!=',20,'Syntax:\n<>, !=\n\nNot equal:\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT \'.01\' <> \'0.01\';\n        -> 1\nmysql> SELECT .01 <> \'0.01\';\n        -> 0\nmysql> SELECT \'zapp\' <> \'zappp\';\n        -> 1\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(507,'WHILE',24,'Syntax:\n[begin_label:] WHILE search_condition DO\n    statement_list\nEND WHILE [end_label]\n\nThe statement list within a WHILE statement is repeated as long as the\nsearch_condition expression is true. statement_list consists of one or\nmore SQL statements, each terminated by a semicolon (;) statement\ndelimiter.\n\nA WHILE statement can be labeled. For the rules regarding label use,\nsee [HELP labels].\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/while.html\n\n','CREATE PROCEDURE dowhile()\nBEGIN\n  DECLARE v1 INT DEFAULT 5;\n\n  WHILE v1 > 0 DO\n    ...\n    SET v1 = v1 - 1;\n  END WHILE;\nEND;\n','http://dev.mysql.com/doc/refman/5.5/en/while.html'),(508,'DAYNAME',32,'Syntax:\nDAYNAME(date)\n\nReturns the name of the weekday for date. The language used for the\nname is controlled by the value of the lc_time_names system variable\n(http://dev.mysql.com/doc/refman/5.5/en/locale-support.html).\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html\n\n','mysql> SELECT DAYNAME(\'2007-02-03\');\n        -> \'Saturday\'\n','http://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html'),(509,'RADIANS',3,'Syntax:\nRADIANS(X)\n\nReturns the argument X, converted from degrees to radians. (Note that\nπ radians equals 180 degrees.)\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html\n\n','mysql> SELECT RADIANS(90);\n        -> 1.5707963267949\n','http://dev.mysql.com/doc/refman/5.5/en/mathematical-functions.html'),(510,'COLLATION',17,'Syntax:\nCOLLATION(str)\n\nReturns the collation of the string argument.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT COLLATION(\'abc\');\n        -> \'latin1_swedish_ci\'\nmysql> SELECT COLLATION(_utf8\'abc\');\n        -> \'utf8_general_ci\'\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html'),(511,'COALESCE',20,'Syntax:\nCOALESCE(value,...)\n\nReturns the first non-NULL value in the list, or NULL if there are no\nnon-NULL values.\n\nThe return type of COALESCE() is the aggregated type of the argument\ntypes.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html\n\n','mysql> SELECT COALESCE(NULL,1);\n        -> 1\nmysql> SELECT COALESCE(NULL,NULL,NULL);\n        -> NULL\n','http://dev.mysql.com/doc/refman/5.5/en/comparison-operators.html'),(512,'VERSION',17,'Syntax:\nVERSION()\n\nReturns a string that indicates the MySQL server version. The string\nuses the utf8 character set. The value might have a suffix in addition\nto the version number. See the description of the version system\nvariable in\nhttp://dev.mysql.com/doc/refman/5.5/en/server-system-variables.html.\n\nURL: http://dev.mysql.com/doc/refman/5.5/en/information-functions.html\n\n','mysql> SELECT VERSION();\n        -> \'5.5.59-standard\'\n','http://dev.mysql.com/doc/refman/5.5/en/information-functions.html');
/*!40000 ALTER TABLE `help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `host` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Host`,`Db`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Host privileges;  Merged with database privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ndb_binlog_index`
--

DROP TABLE IF EXISTS `ndb_binlog_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ndb_binlog_index` (
  `Position` bigint(20) unsigned NOT NULL,
  `File` varchar(255) NOT NULL,
  `epoch` bigint(20) unsigned NOT NULL,
  `inserts` bigint(20) unsigned NOT NULL,
  `updates` bigint(20) unsigned NOT NULL,
  `deletes` bigint(20) unsigned NOT NULL,
  `schemaops` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`epoch`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ndb_binlog_index`
--

LOCK TABLES `ndb_binlog_index` WRITE;
/*!40000 ALTER TABLE `ndb_binlog_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `ndb_binlog_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `name` varchar(64) NOT NULL DEFAULT '',
  `dl` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proc`
--

DROP TABLE IF EXISTS `proc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proc` (
  `db` char(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `name` char(64) NOT NULL DEFAULT '',
  `type` enum('FUNCTION','PROCEDURE') NOT NULL,
  `specific_name` char(64) NOT NULL DEFAULT '',
  `language` enum('SQL') NOT NULL DEFAULT 'SQL',
  `sql_data_access` enum('CONTAINS_SQL','NO_SQL','READS_SQL_DATA','MODIFIES_SQL_DATA') NOT NULL DEFAULT 'CONTAINS_SQL',
  `is_deterministic` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `security_type` enum('INVOKER','DEFINER') NOT NULL DEFAULT 'DEFINER',
  `param_list` blob NOT NULL,
  `returns` longblob NOT NULL,
  `body` longblob NOT NULL,
  `definer` char(77) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sql_mode` set('REAL_AS_FLOAT','PIPES_AS_CONCAT','ANSI_QUOTES','IGNORE_SPACE','NOT_USED','ONLY_FULL_GROUP_BY','NO_UNSIGNED_SUBTRACTION','NO_DIR_IN_CREATE','POSTGRESQL','ORACLE','MSSQL','DB2','MAXDB','NO_KEY_OPTIONS','NO_TABLE_OPTIONS','NO_FIELD_OPTIONS','MYSQL323','MYSQL40','ANSI','NO_AUTO_VALUE_ON_ZERO','NO_BACKSLASH_ESCAPES','STRICT_TRANS_TABLES','STRICT_ALL_TABLES','NO_ZERO_IN_DATE','NO_ZERO_DATE','INVALID_DATES','ERROR_FOR_DIVISION_BY_ZERO','TRADITIONAL','NO_AUTO_CREATE_USER','HIGH_NOT_PRECEDENCE','NO_ENGINE_SUBSTITUTION','PAD_CHAR_TO_FULL_LENGTH') NOT NULL DEFAULT '',
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `character_set_client` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `collation_connection` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `db_collation` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `body_utf8` longblob,
  PRIMARY KEY (`db`,`name`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stored Procedures';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proc`
--

LOCK TABLES `proc` WRITE;
/*!40000 ALTER TABLE `proc` DISABLE KEYS */;
INSERT INTO `proc` VALUES ('eol','harvestResource','PROCEDURE','harvestResource','SQL','CONTAINS_SQL','NO','DEFINER','IN cDate datetime','','begin\n SELECT * FROM resource\n    WHERE  `type` = \'file\' AND `is_paused` = \'0\' AND is_harvest_inprogress != \'1\' AND (`last_harvested_at` IS NULL OR `forced_internally` = \'1\' OR  `day_of_month` = DAY(cDate) OR\n    `is_forced` = \'1\')\n    UNION\n    SELECT * FROM resource\n    WHERE  `type` = \'url\' AND `is_paused` = \'0\' AND is_harvest_inprogress != \'1\' AND (`last_harvested_at` IS NULL OR `forced_internally` = \'1\' OR  `day_of_month` = DAY(cDate) OR\n    `is_forced` = \'1\' OR DATE_ADD(`last_harvested_at`,INTERVAL `harvest_frequency` DAY) = cDate) ;\n\n\n\n\nend','root@localhost','2018-07-03 13:49:24','2018-07-03 13:49:24','','','utf8','utf8_general_ci','latin1_swedish_ci','begin\n SELECT * FROM resource\n    WHERE  `type` = \'file\' AND `is_paused` = \'0\' AND is_harvest_inprogress != \'1\' AND (`last_harvested_at` IS NULL OR `forced_internally` = \'1\' OR  `day_of_month` = DAY(cDate) OR\n    `is_forced` = \'1\')\n    UNION\n    SELECT * FROM resource\n    WHERE  `type` = \'url\' AND `is_paused` = \'0\' AND is_harvest_inprogress != \'1\' AND (`last_harvested_at` IS NULL OR `forced_internally` = \'1\' OR  `day_of_month` = DAY(cDate) OR\n    `is_forced` = \'1\' OR DATE_ADD(`last_harvested_at`,INTERVAL `harvest_frequency` DAY) = cDate) ;\n\n\n\n\nend'),('eol','getHarvestedResources','PROCEDURE','getHarvestedResources','SQL','CONTAINS_SQL','NO','DEFINER','IN cDate datetime','','begin\n SELECT count(*) FROM resource\n    WHERE `last_harvested_at` >= cDate AND is_harvest_inprogress != \'1\' ;\nend','root@localhost','2018-07-03 13:49:24','2018-07-03 13:49:24','','','utf8','utf8_general_ci','latin1_swedish_ci','begin\n SELECT count(*) FROM resource\n    WHERE `last_harvested_at` >= cDate AND is_harvest_inprogress != \'1\' ;\nend');
/*!40000 ALTER TABLE `proc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procs_priv`
--

DROP TABLE IF EXISTS `procs_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procs_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Routine_name` char(64) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Routine_type` enum('FUNCTION','PROCEDURE') COLLATE utf8_bin NOT NULL,
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proc_priv` set('Execute','Alter Routine','Grant') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`Db`,`User`,`Routine_name`,`Routine_type`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Procedure privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procs_priv`
--

LOCK TABLES `procs_priv` WRITE;
/*!40000 ALTER TABLE `procs_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `procs_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxies_priv`
--

DROP TABLE IF EXISTS `proxies_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxies_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Proxied_user` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `With_grant` tinyint(1) NOT NULL DEFAULT '0',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Host`,`User`,`Proxied_host`,`Proxied_user`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User proxy privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxies_priv`
--

LOCK TABLES `proxies_priv` WRITE;
/*!40000 ALTER TABLE `proxies_priv` DISABLE KEYS */;
INSERT INTO `proxies_priv` VALUES ('localhost','root','','',1,'','2017-12-10 09:28:35'),('eol-pub01-dev-l','root','','',1,'','2017-12-10 09:28:35');
/*!40000 ALTER TABLE `proxies_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servers`
--

DROP TABLE IF EXISTS `servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servers` (
  `Server_name` char(64) NOT NULL DEFAULT '',
  `Host` char(64) NOT NULL DEFAULT '',
  `Db` char(64) NOT NULL DEFAULT '',
  `Username` char(64) NOT NULL DEFAULT '',
  `Password` char(64) NOT NULL DEFAULT '',
  `Port` int(4) NOT NULL DEFAULT '0',
  `Socket` char(64) NOT NULL DEFAULT '',
  `Wrapper` char(64) NOT NULL DEFAULT '',
  `Owner` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`Server_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='MySQL Foreign Servers table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servers`
--

LOCK TABLES `servers` WRITE;
/*!40000 ALTER TABLE `servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables_priv`
--

DROP TABLE IF EXISTS `tables_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables_priv` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Db` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Table_name` char(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Grantor` char(77) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Table_priv` set('Select','Insert','Update','Delete','Create','Drop','Grant','References','Index','Alter','Create View','Show view','Trigger') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `Column_priv` set('Select','Insert','Update','References') CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`Host`,`Db`,`User`,`Table_name`),
  KEY `Grantor` (`Grantor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables_priv`
--

LOCK TABLES `tables_priv` WRITE;
/*!40000 ALTER TABLE `tables_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone`
--

DROP TABLE IF EXISTS `time_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone` (
  `Time_zone_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Use_leap_seconds` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`Time_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone`
--

LOCK TABLES `time_zone` WRITE;
/*!40000 ALTER TABLE `time_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_leap_second`
--

DROP TABLE IF EXISTS `time_zone_leap_second`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_leap_second` (
  `Transition_time` bigint(20) NOT NULL,
  `Correction` int(11) NOT NULL,
  PRIMARY KEY (`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Leap seconds information for time zones';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_leap_second`
--

LOCK TABLES `time_zone_leap_second` WRITE;
/*!40000 ALTER TABLE `time_zone_leap_second` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_leap_second` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_name`
--

DROP TABLE IF EXISTS `time_zone_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_name` (
  `Name` char(64) NOT NULL,
  `Time_zone_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_name`
--

LOCK TABLES `time_zone_name` WRITE;
/*!40000 ALTER TABLE `time_zone_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition`
--

DROP TABLE IF EXISTS `time_zone_transition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_time` bigint(20) NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Time_zone_id`,`Transition_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transitions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition`
--

LOCK TABLES `time_zone_transition` WRITE;
/*!40000 ALTER TABLE `time_zone_transition` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_zone_transition_type`
--

DROP TABLE IF EXISTS `time_zone_transition_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_zone_transition_type` (
  `Time_zone_id` int(10) unsigned NOT NULL,
  `Transition_type_id` int(10) unsigned NOT NULL,
  `Offset` int(11) NOT NULL DEFAULT '0',
  `Is_DST` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Abbreviation` char(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`Time_zone_id`,`Transition_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Time zone transition types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_zone_transition_type`
--

LOCK TABLES `time_zone_transition_type` WRITE;
/*!40000 ALTER TABLE `time_zone_transition_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_zone_transition_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Host` char(60) COLLATE utf8_bin NOT NULL DEFAULT '',
  `User` char(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `Password` char(41) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `Select_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Insert_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Update_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Delete_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Drop_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Reload_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Shutdown_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Process_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `File_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Grant_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `References_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Index_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_db_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Super_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tmp_table_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Lock_tables_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Execute_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_slave_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Repl_client_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Show_view_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Alter_routine_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_user_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Event_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Trigger_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `Create_tablespace_priv` enum('N','Y') CHARACTER SET utf8 NOT NULL DEFAULT 'N',
  `ssl_type` enum('','ANY','X509','SPECIFIED') CHARACTER SET utf8 NOT NULL DEFAULT '',
  `ssl_cipher` blob NOT NULL,
  `x509_issuer` blob NOT NULL,
  `x509_subject` blob NOT NULL,
  `max_questions` int(11) unsigned NOT NULL DEFAULT '0',
  `max_updates` int(11) unsigned NOT NULL DEFAULT '0',
  `max_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `max_user_connections` int(11) unsigned NOT NULL DEFAULT '0',
  `plugin` char(64) COLLATE utf8_bin DEFAULT '',
  `authentication_string` text COLLATE utf8_bin,
  PRIMARY KEY (`Host`,`User`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and global privileges';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('localhost','root','*E7F70B6F495A2089CB90A0A0D9EF874A1DA80C4B','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'','*2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19'),('eol-pub01-dev-l','root','*E7F70B6F495A2089CB90A0A0D9EF874A1DA80C4B','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'','*2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19'),('127.0.0.1','root','*E7F70B6F495A2089CB90A0A0D9EF874A1DA80C4B','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'','*2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19'),('::1','root','*E7F70B6F495A2089CB90A0A0D9EF874A1DA80C4B','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'','*2470C0C06DEE42FD1618BB99005ADCA2EC9D1E19'),('localhost','debian-sys-maint','*1315955E062CC916A1171D620FAFE54C2B0A55C6','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','','','','',0,0,0,0,'',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `general_log` (
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `thread_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `command_type` varchar(64) NOT NULL,
  `argument` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='General log';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `slow_log`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `slow_log` (
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_host` mediumtext NOT NULL,
  `query_time` time NOT NULL,
  `lock_time` time NOT NULL,
  `rows_sent` int(11) NOT NULL,
  `rows_examined` int(11) NOT NULL,
  `db` varchar(512) NOT NULL,
  `last_insert_id` int(11) NOT NULL,
  `insert_id` int(11) NOT NULL,
  `server_id` int(10) unsigned NOT NULL,
  `sql_text` mediumtext NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8 COMMENT='Slow log';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-08 17:23:35

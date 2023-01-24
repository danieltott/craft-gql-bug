-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.26-MariaDB-1:10.4.26+maria~ubu2004-log

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ioeuvkvcdyzimjnjvlbgqecwayhwdtyqxknm` (`ownerId`),
  CONSTRAINT `fk_bntjmuutbmeoocxqsqyegjuiolbcmhoywzzb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ioeuvkvcdyzimjnjvlbgqecwayhwdtyqxknm` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vdmzjnycpudbuyvequeovfeqwdyperwcybwn` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_jmkcvjkesaclamynrbuwplelnhhdnokzmfgy` (`dateRead`),
  KEY `fk_ckhvmvmnthlmjnqotrktvqhxbcmooicouppy` (`pluginId`),
  CONSTRAINT `fk_ckhvmvmnthlmjnqotrktvqhxbcmooicouppy` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_survkrradfzhasqavgrofackojpkqvrdyogp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mypvtrghavcxyzltvzzfhwtywccqqpabyuuz` (`sessionId`,`volumeId`),
  KEY `idx_hzfiknordqivjufchrgyqhpimiatmfehzcne` (`volumeId`),
  CONSTRAINT `fk_swktlyjhfppjhqwxqzqwnlgclstutqyirgtc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wrqztbhijbfkqxonrbmeekzpytnlstzfmiyd` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tbwcjdvdhlwgylimzldqlkakkxqgagxtohlw` (`filename`,`folderId`),
  KEY `idx_ogqlqfevwfxoajrkmcovhphdboepziwjlcnv` (`folderId`),
  KEY `idx_utpqxywthqokinwclbljgorxcxngxcqvsepi` (`volumeId`),
  KEY `fk_yhgzkjpgcrhpfilqycdcnpkhgadldznmptue` (`uploaderId`),
  CONSTRAINT `fk_hwdviusfymlyruyaaioxggoesehidtkptlsj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jthxukljtsaklwwmuqerlxfesbbshklialby` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_noxcadicekcybgpkpgfxdwdqztfhxficlnpl` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yhgzkjpgcrhpfilqycdcnpkhgadldznmptue` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pzofzvqpiavrbveklqbncnwgznbluxszzgss` (`groupId`),
  KEY `fk_qzcorasgfduyllzurzemlwousrpvyjrfjgrv` (`parentId`),
  CONSTRAINT `fk_crrqezlxegtgorxevcxbxnpabzmxzceiqufu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mxuvaosjiifcmnptlbgmaddrsjwusdeydefc` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qzcorasgfduyllzurzemlwousrpvyjrfjgrv` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_toifehxihpzlggdtzbmuznmzgclaxhfgxvwt` (`name`),
  KEY `idx_wenynwwmommwyhtfimrjzzylbptznusutepn` (`handle`),
  KEY `idx_pxdmcxnlwjhktrukymztezlwssethhbchfrc` (`structureId`),
  KEY `idx_schjvjzithwqllofkcponmafekwjaravwvtx` (`fieldLayoutId`),
  KEY `idx_mefljggfwarrkdcydmdpkytoanzlxbxmkxrg` (`dateDeleted`),
  CONSTRAINT `fk_amhctxeafjftjoisypxvdwaikpinmfiqwmnm` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vnolfdjbglcrcffegpxzmefwoedijrgjveop` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ffhwuatcrdwswzuaunsdjtqjviiagsqvcfje` (`groupId`,`siteId`),
  KEY `idx_hflcxmhurkxrkinebuknjohqpnwtjtmsjvur` (`siteId`),
  CONSTRAINT `fk_cxrijfvwjbgbcehxbulgzwwxnoqrflyjjiqu` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kagxswsukbnerawuxhmnblimbamqoadwnhiz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_kpcgyfocflzrmwnromivlywcfyxpyvhlefee` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_tmkcjriygdareeqerufzpzaafxcwuogjnrko` (`siteId`),
  KEY `fk_tsydyejsydtosnsyyuzppnspxkwekikixqtd` (`userId`),
  CONSTRAINT `fk_odiecqvpznanrmcucaunoqzhuoprbhivoznf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tmkcjriygdareeqerufzpzaafxcwuogjnrko` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tsydyejsydtosnsyyuzppnspxkwekikixqtd` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_iyxgertgceqhwbebqjqwbzaxahtdblosriuk` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_pcndvcqlkxlhxjjximehuuhuuyghxgdbrnyb` (`siteId`),
  KEY `fk_ceymkztrizjvsoekzavtwtdveszdenwopghh` (`fieldId`),
  KEY `fk_fovrnwtraxiaeddfqfzuyxsfwsjckqadeoyc` (`userId`),
  CONSTRAINT `fk_ceymkztrizjvsoekzavtwtdveszdenwopghh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_fovrnwtraxiaeddfqfzuyxsfwsjckqadeoyc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_iqutokushhejchjkzlmicsaxfvdsnuegiquf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pcndvcqlkxlhxjjximehuuhuuyghxgdbrnyb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_testPrivateField_dcldtget` text DEFAULT NULL,
  `field_testPublicField_bpjixvbv` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qoldtkmeothbfiwnpytxvztnhxmhjwhnyrkl` (`elementId`,`siteId`),
  KEY `idx_uvvnqfhooibuvznygwxdgntpkvrgcqtskdxi` (`siteId`),
  KEY `idx_ebojhdpxqpyjjigyrxjtxalkutkcfvnidyrk` (`title`),
  CONSTRAINT `fk_foixlnvcsralnafxckvvxzvonvqmmbbremsq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uixmruucvjhwbfxzzqbisflrsxtpyokxmgrw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_metbekcyuhgggokdcptltqsdlaquflhhxpct` (`userId`),
  CONSTRAINT `fk_metbekcyuhgggokdcptltqsdlaquflhhxpct` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kjsroqccvmzbnqnvxsvfqswicyiycrwrtlvx` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_aaxdjpcqgrrcoffzrihviqwvkentcxhgqosq` (`creatorId`,`provisional`),
  KEY `idx_fdoequghofuxtszmkljygsxjuepsjjyvdhby` (`saved`),
  KEY `fk_wdwrhedaerfzfgsvqsstycvwtnnrzgkpnfrf` (`canonicalId`),
  CONSTRAINT `fk_gumarhsmbfnsdylaxxseqqwmfedgvmnhxudc` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wdwrhedaerfzfgsvqsstycvwtnnrzgkpnfrf` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bmuzissjfajaodgdeoxfspcbqpwyackrjhiy` (`dateDeleted`),
  KEY `idx_nbqjtxfrgbakvnklyftcchnpwbeakeonrujb` (`fieldLayoutId`),
  KEY `idx_lbfuvxfbwrkhdtuzndcqrshijfagevwwbhdm` (`type`),
  KEY `idx_seckicdjjswlvujbwgbitnxokhhjtedjqosr` (`enabled`),
  KEY `idx_gneovgudwefkvvjxwznshmrckdszpctlwogy` (`archived`,`dateCreated`),
  KEY `idx_qmifdrzaoxnhqauixnssyvunjlqifsyiakzx` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_aajgtrwweedovrdzbvavtkqsfljagyujheyx` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_thxwkgpxxppexfhbidzmakzzwkntgsduvggx` (`canonicalId`),
  KEY `fk_drwobrdjafsxyhrombxddsunxmndkzdquymt` (`draftId`),
  KEY `fk_nfumpzozdxprxyopaxfwyiofkhuohxygapaq` (`revisionId`),
  CONSTRAINT `fk_drwobrdjafsxyhrombxddsunxmndkzdquymt` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gkdrblivkmrdwmenombihmeadkmzunrvdfdd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nfumpzozdxprxyopaxfwyiofkhuohxygapaq` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_thxwkgpxxppexfhbidzmakzzwkntgsduvggx` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_eocyvnsdiaveppgxveiqvabjfnbhlqfhbsqk` (`elementId`,`siteId`),
  KEY `idx_zxelhmaqlgilszhwouddcncfpsccocqjztps` (`siteId`),
  KEY `idx_racxfxhcpozfsqoednyddzatxrzwpcorstkd` (`slug`,`siteId`),
  KEY `idx_sswxvnrvosobhaajjrktowyaiaywgyxbsasw` (`enabled`),
  KEY `idx_vlzbkieznqhfvtsvxbvmnixjiosmnzshdpip` (`uri`,`siteId`),
  CONSTRAINT `fk_itxlfmlfwaqplgwyvtvjqnaajthagelxyyur` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nsmxocqyjrxjcwpmkostynncpwrbebrmalld` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_utmxfrolbsseddiynqconmsmikzcqokyanzu` (`postDate`),
  KEY `idx_bzjhbzmixrugsrrhigkhdqizdxpphnoalnmv` (`expiryDate`),
  KEY `idx_syewopsxbpxqdecdyjrevgmzwdgxnbuapiot` (`authorId`),
  KEY `idx_tjmrjtnkowdfxxdjkwyttoinphbcisgumauw` (`sectionId`),
  KEY `idx_toofonmyogwnvwuyrafnqaujjnwlwjnzpiwm` (`typeId`),
  KEY `fk_fczrbazdsfzbbqspnmkodptyxzmngdeutauj` (`parentId`),
  CONSTRAINT `fk_fczrbazdsfzbbqspnmkodptyxzmngdeutauj` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rgcgpdnedyosuohywsdbxccxmwjcnuevzxqw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xvvouelqsryiwuuduwsaopvwqeexuyuijnpm` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xxzkhatbbxcbxgblfrkndcdgahkkwachkqbn` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zsygidjyperiffsuyfbzmtbvgrzxhhncntsy` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gcgrzzyoaavkvvfgscpnmuhmrgseoagabmgl` (`name`,`sectionId`),
  KEY `idx_fvmcndskllipfjplwtirnsvwpwfmivtbyofj` (`handle`,`sectionId`),
  KEY `idx_ojingwoimeeoasdonheeavuzzrpvjbxxgqqv` (`sectionId`),
  KEY `idx_mwcljhrufqikakmotiexmrhvruxgecbdcbyx` (`fieldLayoutId`),
  KEY `idx_tetogyfcrtiyxwmmvobijkqppxmcveekcpln` (`dateDeleted`),
  CONSTRAINT `fk_dznpiynqgoonkpmwxhaevjbunlcwwpuirzfp` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vhsdbabuuogjofstxbabwezjfxbhvcrfvehr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qqhbuxwqevvxipmawbhctfwqxhpgvhvhifuk` (`name`),
  KEY `idx_axzzqvuwaqsfhkoawfuhavjygcmdllussaeg` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uhsiyqhrgsqbvkpbgxbiafmqetqwxrjqarox` (`layoutId`,`fieldId`),
  KEY `idx_aabmfvbrmdwpjcyatcicixwnxnreiwxeapkf` (`sortOrder`),
  KEY `idx_rmhpejwrjfgozrjdpbsubktanbngaqtxwikp` (`tabId`),
  KEY `idx_ufvtgrsajggrxiyshsmdvmrplfmuwjmcojgq` (`fieldId`),
  CONSTRAINT `fk_oyvwenpsghjqiasrdvwlvytafiqvpggsedlc` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pbrzrbrvzlgfyofcapouqhrzrgyhwvjktfqh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zdmynokabsfgjewfkgslawmfvtylriuazvyl` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bccrwqanrwonyriiaicyrgbmgmntgkuqwbsp` (`dateDeleted`),
  KEY `idx_qlbqbhuhjyjbpxyruvuonpigndtmtlamonaf` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uslhdlplaimczbuwlaxvxlbexdojmknmrgpc` (`sortOrder`),
  KEY `idx_mxmlbmgwxyxysyzivobpchyldkrcmysrmiqn` (`layoutId`),
  CONSTRAINT `fk_ihkhsfbprttgclihusgqfgyaeycdeeemmpvs` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_psndfwyvwklseakdclyorgztnezyoyuljucc` (`handle`,`context`),
  KEY `idx_nkcggofxqfxuitjozklnrqdiewluyqtklivk` (`groupId`),
  KEY `idx_dgaokunvjvtazvnkecualafbqrxdnbfnqjhd` (`context`),
  CONSTRAINT `fk_kpdvzobvifmkexzgfbdwyhmlzbfjgmtuhmnv` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_sbjjpsmwowyateosaeyhgwcwksrskvrgfeqw` (`name`),
  KEY `idx_oxhtizmbzktukwexufzskbyxmmzdihvzrcgy` (`handle`),
  KEY `idx_hlnvthdwwyknyjlnruuqlxeorxqlbliqdnpe` (`fieldLayoutId`),
  KEY `idx_jcdqtkqjksgyyozwsbmalvjgpnlnkpqhpjma` (`sortOrder`),
  CONSTRAINT `fk_pgevrlytglwiqmulovjnaktijyutewjmighl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vfjluopjbaatselwfkkpsvmpqdczfmidbcfx` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gql_magic_codes`
--

DROP TABLE IF EXISTS `gql_magic_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gql_magic_codes` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `schemaId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `expiryDate` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ynsusuahiqptvzcuyueanbfljlsporvbbyct` (`userId`),
  CONSTRAINT `fk_xxviloehaepzbnhhyktnjghrbrqraduvfvpm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ynsusuahiqptvzcuyueanbfljlsporvbbyct` FOREIGN KEY (`userId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gql_refresh_tokens`
--

DROP TABLE IF EXISTS `gql_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gql_refresh_tokens` (
  `id` int(11) NOT NULL,
  `token` text NOT NULL,
  `userId` int(11) NOT NULL,
  `schemaId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `expiryDate` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_xdpodnvtubqusrymzvzouuuesakwejjmelne` (`userId`),
  CONSTRAINT `fk_khizcyywjxtxookrzmynlmluzqldpaafnjwr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xdpodnvtubqusrymzvzouuuesakwejjmelne` FOREIGN KEY (`userId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kpiwtgdrlgriptesxibevudxnxfuqktfruha` (`accessToken`),
  UNIQUE KEY `idx_awshucjjumvpvyjyrbnnzbcmtmpzfkwjzqpi` (`name`),
  KEY `fk_yhcajlkrabtbysehhzbcuodsiksozdrfuxjg` (`schemaId`),
  CONSTRAINT `fk_yhcajlkrabtbysehhzbcuodsiksozdrfuxjg` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ypbspqppatkyqpxqrsfvenaxagcnvzabwbcr` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ylvulsiomenlnjvknishqrggmocmuczqclwm` (`name`),
  KEY `idx_odhppgmmwvfqtijekollyvhhaulxjzoxgrzg` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dkojfakidygqudmlsperuireckwspsckuqjg` (`primaryOwnerId`),
  KEY `idx_ofnvchpnddivolyeerrmpbykwufwqggrfqhi` (`fieldId`),
  KEY `idx_mdmkfnobpkelytvmgckcgtsdtxvyydlwtwno` (`typeId`),
  CONSTRAINT `fk_amggqssuxxxtfwnrfvealvvvkrvwojhxbhin` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gembveruqbqnazfpjgeiaydofdrlgwzfreiw` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rtztddybnqkdlxfnkwtntrugbtlgonbbpoqz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xwtihwlivtjzhswjzdbcadvspuhjzjihlxnn` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_yfamnwyvxhssipnstpaahiwxmretpjdosamr` (`ownerId`),
  CONSTRAINT `fk_itlijdukcppwqudgdgdizufyqtzgfzcsfugn` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yfamnwyvxhssipnstpaahiwxmretpjdosamr` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tgjnfrunosfqsbpbqcahbbvtyararonbmivg` (`name`,`fieldId`),
  KEY `idx_uejqkdcbgmczxnesveyyfcfvpsslejaltejq` (`handle`,`fieldId`),
  KEY `idx_hmkdcttlqvgunelnhnhinnaddxbfllohgupz` (`fieldId`),
  KEY `idx_sfvxccqblsrinturgbsezsexzyqrlcfntygl` (`fieldLayoutId`),
  CONSTRAINT `fk_esyfcanipcpcmuuminjthoizsgosotoksfwm` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wqovuzdghzxrkbppvlhbpuqcxfuqdrrhbazz` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vhxoeypobrjqjxbkpevyjdxlorjnijfnsahq` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cttlthvsrrjmmqxdihxftyzmogbmcrrkkjnx` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lgyudzgvnsidaqvhcmfmgfbwjtunylhdlrkn` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_izzrazsejzbapnsosanqysugqieqsfwhwdcp` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hotccdjjwprhktgezpbyqlruwejhahplrmmp` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_trozmxsetxlctydqtmdntavxbfochpbthijk` (`sourceId`),
  KEY `idx_lfwkulydmoygavwurosttdtdwpdeocvhpkhi` (`targetId`),
  KEY `idx_qmslmerwerkvlycalrlrklpkqlrxxslglqtl` (`sourceSiteId`),
  CONSTRAINT `fk_jfaynyhseqeuiwdjgysnkxxyvkckpoobckmt` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kjbekuiqwbesfnzgxanazkvnwkxrmzwdhjon` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_lrjaisvbklthjmtykacbcmvdqfhsnxfcrlbk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_myqimxvwlpyaenazhtwskgioihjywlerveag` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gkbqhlqlchiylbqpeiernbwtmklhhaybapyb` (`canonicalId`,`num`),
  KEY `fk_glvdxhujlubmoacngtuvwlkopzcspmwtclpb` (`creatorId`),
  CONSTRAINT `fk_glvdxhujlubmoacngtuvwlkopzcspmwtclpb` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mqfvmdzcukgrnnjzhygmmcypdmvcbhyqleuk` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_dllsuaqlaqgejrobskwhzuycjzrbeahpsybc` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uadjnpqnudddtokidvipnkesqkgkhkbkgbny` (`handle`),
  KEY `idx_jcogdmrjdctfccphtkuiidyynsuzhcbjxrsx` (`name`),
  KEY `idx_oznklnmrzooyiwrjmgotzwamvutuzyhfrppe` (`structureId`),
  KEY `idx_lmdecltcpnmkaiymnsqextmqityzqeddsssm` (`dateDeleted`),
  CONSTRAINT `fk_lycjqowlmbqwkcvayvmnmzcnvpsrusjckriy` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cveitqnkbqzxcdldebzxesjthulgwsuuaild` (`sectionId`,`siteId`),
  KEY `idx_qnugwkjfxqhqtdmupmxfjknfozaclkaqlsko` (`siteId`),
  CONSTRAINT `fk_iopbqlisxsqxpvdhajefreuhbkimycfkkgdy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rlruyciwchoiuxngsedmofiwcxxebxvqhzhh` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mcbvjrybclkcidblqhuskglgmbuliohcnbrg` (`uid`),
  KEY `idx_bvkdymnnvpcfsggfomjdirzqxvreqbtzoape` (`token`),
  KEY `idx_acewrvmgbyepviaswzhoouhyvaztktiykdfu` (`dateUpdated`),
  KEY `idx_wokxgtqqycbwguzoqefkbthbxcphdtulfoqv` (`userId`),
  CONSTRAINT `fk_tiefxlobcgbnquszyfrwtvuaelmvvelvedzn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jxltsgeolwbsstftqmhlafydzgmhjeoehhmr` (`userId`,`message`),
  CONSTRAINT `fk_kflqpgehqtpqxacsfjnjvnjucbokjanthgrc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bkakinaqlwqwizeeuogxyamzrfzqeokbvkrl` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fgevyqnozjclattuqjvfjrvuullezqpoekrg` (`dateDeleted`),
  KEY `idx_gvsvpoowwoyzxtmqophclyqgzbxvdlxvywgc` (`handle`),
  KEY `idx_rpqsqfbmxicujdlzlnkngpkcwzdlpgkocahd` (`sortOrder`),
  KEY `fk_otgvhzzoxrcsnsgkdhirlnqljxiorftubhvh` (`groupId`),
  CONSTRAINT `fk_otgvhzzoxrcsnsgkdhirlnqljxiorftubhvh` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uesxdukpvynrcdjsbjxvabmacszvqarkvhxa` (`structureId`,`elementId`),
  KEY `idx_qterdeuyenluvvyjenbphwjckqdhjdpilrxj` (`root`),
  KEY `idx_pholsqpdhkwyabrmexcsjeuwpmnohuvpwfim` (`lft`),
  KEY `idx_ccuwnvecopisicodsfpbjlajnodmsyxdwrrh` (`rgt`),
  KEY `idx_xgnawrumxfeplmtzcnuspkkpwkcivphurbit` (`level`),
  KEY `idx_xistpwdvitycvmvcpawtshjvthutjqpclxkn` (`elementId`),
  CONSTRAINT `fk_ieaubvlutoqpimugzcbzhqjpwzszqntzvlbh` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ylqyxjztjfprlxcbeevgjzvojjmkanecmvzs` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zucbfhptppfxqeolzcdlawixlthvkvvkmrmp` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pkhnlkdfdgwkijhpnufyfcsdiqtlpqmhjmrq` (`key`,`language`),
  KEY `idx_cplpsgfyuttglpltypafbeaguxggvmhuvfoq` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cqlsfdgnatbpvwhjqgkijnovgdxkweflctkc` (`name`),
  KEY `idx_xdjiddqyhrgnlgosevkldwqapeuzzibirxan` (`handle`),
  KEY `idx_immsgabibmxneugkgczesuedakbtxchxmvwr` (`dateDeleted`),
  KEY `fk_zjvztmqlcjhdnicdttlhizrpdtqbbwdtgqad` (`fieldLayoutId`),
  CONSTRAINT `fk_zjvztmqlcjhdnicdttlhizrpdtqbbwdtgqad` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tuwuyaikizkicjykhkefmkgssgtugwnojbbt` (`groupId`),
  CONSTRAINT `fk_tghgifppyvtnmltcepyswvgfksjpnkzfcybh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_thibhzvkwjiiwisxkzemnvdtimkqqvdfhuqe` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gxzpptpffxfxiavmtikdzopjsefslcekppnh` (`token`),
  KEY `idx_szmvveygboycqisfrgxxtmibcjhqwtnjidgq` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zscaijyjhnvdiuahrjgytfizkpqdsbxjyihd` (`handle`),
  KEY `idx_gwugnotbljoopluiwygudgwfcxbpuonmerjk` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wxedywvhmcztjoyymncgmcfmogwrodmzvjsn` (`groupId`,`userId`),
  KEY `idx_ezoygvepccjgoxuilmjcpkozvlxxqloziqcj` (`userId`),
  CONSTRAINT `fk_bqiifbweibvlwebnpwqjrutkdrvrgkdwxmcx` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rqzvzakczlmxxdomeifpxttaxoyfdntxpdwo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ralftdzmfkvbsrofkucrscvzydaozfjpwzjx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_buzmbxskmcciqybondacemyqsqspyhsvwzvs` (`permissionId`,`groupId`),
  KEY `idx_hgjlnaqfhtegvyxnskudnxluvanupmhmthsv` (`groupId`),
  CONSTRAINT `fk_bxyfbiaapugkmjvggcangrsbgirkytzvttux` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ipczrhwrhbscsdyetrymzgtusxckboeuxflk` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vpbeqikrprcsujyidsfgzuzmawbhgfrrhmdn` (`permissionId`,`userId`),
  KEY `idx_syurzsjnywrslbzylffxnwqifyekiqcvfuuw` (`userId`),
  CONSTRAINT `fk_bhzosqdmqqygyleqydnnsgursjfjzlszpgpf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fnctimknncblrtnlfpotwwlzotlvzrzvkpoc` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_fndziusiztlouafazpkkombcinnompbywngb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_deybmacjrgrozujkbbeumzmqhfxzblldsjnx` (`active`),
  KEY `idx_hkmqdqijsgjvtbheyzblbdopgpxbowdozeoa` (`locked`),
  KEY `idx_gxmibfjiqwnoxiutymqewodpxyhjrsvaqzqh` (`pending`),
  KEY `idx_awswxmvltklmpdxluaebnmqjitqkaiifwajq` (`suspended`),
  KEY `idx_wpprlybupinyuvfywqdkpevmzupqjtzyfjjv` (`verificationCode`),
  KEY `idx_ifhgylcufdlimepqksbzmchrfgolqkqsmrnz` (`email`),
  KEY `idx_itvxqeqgbxvyhmfqkcikjplfciqtvywrmany` (`username`),
  KEY `fk_wcbpxnzxbsarxbzglwxevkvawtjkxfdvmrhm` (`photoId`),
  CONSTRAINT `fk_wcbpxnzxbsarxbzglwxevkvawtjkxfdvmrhm` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xjdotoqiydeotbttfqjagqrlhqziiuthxtqp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_trpkgxayjpryqjwosdrqxpqfcsaqknvsyaol` (`name`,`parentId`,`volumeId`),
  KEY `idx_cunjerzlsqoyygtqrgtnmcrodeczujytqeac` (`parentId`),
  KEY `idx_xrqyjmdinhhzkikzhoholnjzbjcenandnzox` (`volumeId`),
  CONSTRAINT `fk_qshfjlphaaulogukmdtxokjfymsridplvxas` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zidyiearyatccfjhnukbczyteaphmupfyvyv` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_majonyyhncduhbsputzsjboxlqxucfgwbkej` (`name`),
  KEY `idx_gxboomztotgtidiqjqhtbvwfjsiptziltcfl` (`handle`),
  KEY `idx_szjnoakkkbwjnbgwobicnpjhekstbuyaxaob` (`fieldLayoutId`),
  KEY `idx_hdbmtakvsrjxbtknpnpkbawfwfhxlgmlulpd` (`dateDeleted`),
  CONSTRAINT `fk_zfezdvzwpchxgfoaptotjjbnftfjmxtobgrv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bvzzlhiggkxylsvlgaaoizzsmyhodqthilzj` (`userId`),
  CONSTRAINT `fk_myghoggilgfzdswxgliisbgghhwspshduhpx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-24 15:48:27
-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.26-MariaDB-1:10.4.26+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'email','2023-01-24 15:32:51',0,1),(1,1,'fullName','2023-01-24 15:32:08',0,1),(1,1,'lastPasswordChangeDate','2023-01-24 15:32:08',0,1),(1,1,'password','2023-01-24 15:32:08',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (2,1,1,'2023-01-24 15:25:19',0,1),(2,1,2,'2023-01-24 15:25:19',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2023-01-24 15:04:06','2023-01-24 15:32:51','bd60aae9-eeb6-4f80-ae9b-83113471046a',NULL,NULL),(2,2,1,'Test Page','2023-01-24 15:04:55','2023-01-24 15:25:19','d5be69a0-0b31-4ab0-9c9f-e9bedd840669','I should be Private but visible when using the Private Schema token','I should always be visible'),(3,3,1,'Test Page','2023-01-24 15:04:55','2023-01-24 15:04:55','9b059085-2668-4c0c-b56e-2bd1001147b3',NULL,NULL),(4,4,1,'Test Page','2023-01-24 15:04:55','2023-01-24 15:04:55','36648a40-0547-4007-936c-c395462d2400',NULL,NULL),(5,5,1,'Test Page','2023-01-24 15:05:01','2023-01-24 15:05:01','30e3fb52-ee9c-40df-9155-ceee768335db',NULL,NULL),(7,7,1,'Test Page','2023-01-24 15:05:11','2023-01-24 15:05:11','34742302-0315-462f-a69c-c462ed0bdde0','Hello!',NULL),(8,8,1,'Test Page','2023-01-24 15:23:56','2023-01-24 15:23:56','ff9e6931-4ea2-4e0f-a958-ef7260c6401e','Hello!',NULL),(10,10,1,'Test Page','2023-01-24 15:25:19','2023-01-24 15:25:19','03187140-f1fb-4a12-a6e6-993840df2482','I should be Private but visible when using the Private Schema token','I should always be visible');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-01-24 15:04:06','2023-01-24 15:32:51',NULL,NULL,'6da46519-cbe2-4169-8d8b-1fb2b7a9faa0'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-01-24 15:04:55','2023-01-24 15:25:19',NULL,NULL,'c945459f-f49f-4bc6-a593-d123f46f6d10'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2023-01-24 15:04:55','2023-01-24 15:04:55',NULL,NULL,'abf31b9f-b64d-49a5-8287-5dffa1604f04'),(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2023-01-24 15:04:55','2023-01-24 15:04:55',NULL,NULL,'c4606bc4-3da5-452a-8156-8cf69d5b541b'),(5,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2023-01-24 15:05:01','2023-01-24 15:05:01',NULL,NULL,'027fcece-4dd7-429b-a481-394868df9e7a'),(7,2,NULL,4,1,'craft\\elements\\Entry',1,0,'2023-01-24 15:05:11','2023-01-24 15:05:11',NULL,NULL,'01f0248c-10a1-4cb1-8ffa-c9d713add618'),(8,2,NULL,5,1,'craft\\elements\\Entry',1,0,'2023-01-24 15:23:56','2023-01-24 15:23:56',NULL,NULL,'54f4b851-f4ea-4ea1-b916-a8f13e98703a'),(10,2,NULL,6,1,'craft\\elements\\Entry',1,0,'2023-01-24 15:25:19','2023-01-24 15:25:19',NULL,NULL,'5efe8151-3131-457e-b199-c8015d7e295d');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-01-24 15:04:06','2023-01-24 15:04:06','c6a942b3-5cda-43b6-a38e-b106fb598621'),(2,2,1,'test-page','test-page',1,'2023-01-24 15:04:55','2023-01-24 15:04:55','5a4306bd-a0ec-4386-baaa-d2e0aceafe85'),(3,3,1,'test-page','test-page',1,'2023-01-24 15:04:55','2023-01-24 15:04:55','b55523f8-6075-49e9-a674-71247f42738c'),(4,4,1,'test-page','test-page',1,'2023-01-24 15:04:55','2023-01-24 15:04:55','25ef663c-0c1e-4733-b115-aa69b260b28b'),(5,5,1,'test-page','test-page',1,'2023-01-24 15:05:01','2023-01-24 15:05:01','b0a6f977-01b1-4f9a-907f-5fbc467436cd'),(7,7,1,'test-page','test-page',1,'2023-01-24 15:05:11','2023-01-24 15:05:11','75a83d2f-951a-42db-90c0-f35a4734540e'),(8,8,1,'test-page','test-page',1,'2023-01-24 15:23:56','2023-01-24 15:23:56','6a154a87-84df-4b1d-b331-86257b3bd262'),(10,10,1,'test-page','test-page',1,'2023-01-24 15:25:19','2023-01-24 15:25:19','79ee0d6b-b2cd-4545-9dec-2c26eec3fc22');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2023-01-24 15:04:00',NULL,NULL,'2023-01-24 15:04:55','2023-01-24 15:04:55'),(3,1,NULL,1,NULL,'2023-01-24 15:04:00',NULL,NULL,'2023-01-24 15:04:55','2023-01-24 15:04:55'),(4,1,NULL,1,NULL,'2023-01-24 15:04:00',NULL,NULL,'2023-01-24 15:04:55','2023-01-24 15:04:55'),(5,1,NULL,1,NULL,'2023-01-24 15:04:00',NULL,NULL,'2023-01-24 15:05:01','2023-01-24 15:05:01'),(7,1,NULL,1,NULL,'2023-01-24 15:04:00',NULL,NULL,'2023-01-24 15:05:11','2023-01-24 15:05:11'),(8,1,NULL,1,NULL,'2023-01-24 15:04:00',NULL,NULL,'2023-01-24 15:23:56','2023-01-24 15:23:56'),(10,1,NULL,1,NULL,'2023-01-24 15:04:00',NULL,NULL,'2023-01-24 15:25:19','2023-01-24 15:25:19');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Test Page','testPage',0,'site',NULL,'{section.name|raw}',1,'2023-01-24 15:04:55','2023-01-24 15:04:55',NULL,'17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2023-01-24 15:04:06','2023-01-24 15:04:06',NULL,'aed66229-2bb7-47f2-9f7d-f66d0a51ce74');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (2,1,3,1,0,1,'2023-01-24 15:23:56','2023-01-24 15:23:56','e1c0e6d4-1720-4efb-ae82-416ffb6f73d4'),(3,1,3,2,0,2,'2023-01-24 15:23:56','2023-01-24 15:23:56','b6e93482-9c6c-4b26-a629-233f40030906');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2023-01-24 15:04:55','2023-01-24 15:04:55',NULL,'1641f902-613a-499c-ae3a-f3db23590dcd');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (3,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"2a9fc2f5-6110-436c-be30-e7ca8076a4c4\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"95bdb63a-36a4-4f85-89c5-d157a9a9377a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"5225a655-7b1b-4da7-8cb4-690fc30967cd\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"5f1a38ca-aedd-4d8d-bc03-91bfbb42f824\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"19dcf35e-63cf-4989-a784-8f62b4930aa8\"}]',1,'2023-01-24 15:23:56','2023-01-24 15:23:56','2599de40-9db9-4cd0-a998-b8dc92ac1ce0');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,1,'Test Private Field','testPrivateField','global','dcldtget',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-01-24 15:04:39','2023-01-24 15:23:40','5225a655-7b1b-4da7-8cb4-690fc30967cd'),(2,1,'Test Public Field','testPublicField','global','bpjixvbv',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-01-24 15:23:47','2023-01-24 15:23:47','19dcf35e-63cf-4989-a784-8f62b4930aa8');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gql_magic_codes`
--

LOCK TABLES `gql_magic_codes` WRITE;
/*!40000 ALTER TABLE `gql_magic_codes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gql_magic_codes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gql_refresh_tokens`
--

LOCK TABLES `gql_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `gql_refresh_tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gql_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[]',1,'2023-01-24 15:07:14','2023-01-24 15:07:14','baac8502-66f9-4dd2-81f6-c3dea4ae2db0'),(2,'Private Schema','[\"sites.2b197910-efe0-427f-8de6-0b76806ac38e:read\",\"elements.drafts:read\",\"elements.revisions:read\",\"elements.inactive:read\",\"sections.a4ac5263-3c77-4687-8fd9-690347916188:read\",\"entrytypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc:read\"]',0,'2023-01-24 15:07:41','2023-01-24 15:07:41','14408bdf-46de-4327-83e0-3031dc8dcdd1');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqltokens` VALUES (1,'Private Token','_AZL0f9hx95QXMNYDPxEzTSJBU2MnxMf',1,NULL,'2023-01-24 15:33:54',2,'2023-01-24 15:11:50','2023-01-24 15:33:54','cacf4a4f-1fe4-49bb-94c8-63b0cb19a0b9');
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.3.6.1','4.0.0.9',0,'pmoyeqvieekm','3@vxspyofvxh','2023-01-24 15:04:06','2023-01-24 15:24:18','ea465c2b-cdba-4d88-aa88-d25b45b0222c');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','7c1c75fe-4a3c-4e3d-b3a3-83a156cdf596'),(2,'craft','m210121_145800_asset_indexing_changes','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','0d11b731-4a90-4c28-9b9a-d70407b75832'),(3,'craft','m210624_222934_drop_deprecated_tables','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','5eecdc30-2b8e-44de-87f9-df1a13406824'),(4,'craft','m210724_180756_rename_source_cols','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','57650735-ee83-4d31-8e0b-f97ff79127b8'),(5,'craft','m210809_124211_remove_superfluous_uids','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','99f6f972-855b-40a0-a477-f9c785814288'),(6,'craft','m210817_014201_universal_users','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','5a237ff4-4bc6-4be0-8572-a3df45d3a25d'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','d5bc3635-8d81-4a10-a7d3-c352b6413a65'),(8,'craft','m211115_135500_image_transformers','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','2b482c22-7be4-4707-b106-031eee641def'),(9,'craft','m211201_131000_filesystems','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','d619f608-8833-483b-9b74-e49219be04e2'),(10,'craft','m220103_043103_tab_conditions','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','96f6dedc-455f-4110-88fa-f7be49094b1b'),(11,'craft','m220104_003433_asset_alt_text','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','d3987151-d44a-4a0c-a093-0bd2fe9f9489'),(12,'craft','m220123_213619_update_permissions','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','3a274e0e-6dca-4ace-899f-2fc4cf11c16d'),(13,'craft','m220126_003432_addresses','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','fbf71284-04f8-421c-9a66-f30522c0a69d'),(14,'craft','m220209_095604_add_indexes','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','6a05a936-bd0d-457d-9ebb-ea5101cb9d17'),(15,'craft','m220213_015220_matrixblocks_owners_table','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','23aa8e3a-f60d-4cc5-a07b-19cb35291fc9'),(16,'craft','m220214_000000_truncate_sessions','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','0cf8ee47-7465-4cb9-a8fa-39bc4f5eb40c'),(17,'craft','m220222_122159_full_names','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','a4540a3d-578d-4ac9-af12-d3f250e15d25'),(18,'craft','m220223_180559_nullable_address_owner','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','85f26b91-d998-4c60-bd0a-c6aa0380ce95'),(19,'craft','m220225_165000_transform_filesystems','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','ee4cd366-22a9-451b-909c-954ed115bcbf'),(20,'craft','m220309_152006_rename_field_layout_elements','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','cce3fe33-583a-40b9-8ea3-864bf3ef8637'),(21,'craft','m220314_211928_field_layout_element_uids','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','92d6cf04-14a7-4aa6-9c74-468372202755'),(22,'craft','m220316_123800_transform_fs_subpath','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','50f3be29-f8a2-4d1c-861e-54d275d1bdf7'),(23,'craft','m220317_174250_release_all_jobs','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','9eaa569d-65c6-401e-8071-bc97d96e74d7'),(24,'craft','m220330_150000_add_site_gql_schema_components','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','76ad0906-140c-4434-9cc4-934821df9ecc'),(25,'craft','m220413_024536_site_enabled_string','2023-01-24 15:04:07','2023-01-24 15:04:07','2023-01-24 15:04:07','a4b67884-6dc6-47b1-83b3-6f98b80f30b0'),(26,'plugin:graphql-authentication','Install','2023-01-24 15:14:33','2023-01-24 15:14:33','2023-01-24 15:14:33','410223c5-4ffc-4fdd-b4b4-e538273f7a02'),(27,'plugin:graphql-authentication','m201129_224453_create_refresh_tokens','2023-01-24 15:14:33','2023-01-24 15:14:33','2023-01-24 15:14:33','41148335-8097-4565-89b9-23cd419fd703'),(28,'plugin:graphql-authentication','m211014_234909_schema_id_to_schema_name','2023-01-24 15:14:33','2023-01-24 15:14:33','2023-01-24 15:14:33','6a09d0b9-8dff-4532-8814-8fa4fbb1828a'),(29,'plugin:graphql-authentication','m230116_000217_create_magic_codes','2023-01-24 15:14:33','2023-01-24 15:14:33','2023-01-24 15:14:33','571f3dd7-f525-4e02-8c67-cd0ffaf2e380');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'graphql-authentication','2.3.0','1.3.0','trial',NULL,'2023-01-24 15:14:33','2023-01-24 15:14:33','2023-01-24 15:18:55','707fdecf-c6b1-49a9-aa05-c23dd2f43762');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1674573858'),('email.fromEmail','\"test@fakedomain.com\"'),('email.fromName','\"gql-bug-test\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elementCondition','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.autocapitalize','true'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.autocomplete','false'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.autocorrect','true'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.class','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.disabled','false'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.elementCondition','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.id','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.instructions','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.label','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.max','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.min','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.name','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.orientation','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.placeholder','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.readonly','false'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.requirable','false'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.size','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.step','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.tip','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.title','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.uid','\"2a9fc2f5-6110-436c-be30-e7ca8076a4c4\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.userCondition','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.warning','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.0.width','100'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.1.elementCondition','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.1.fieldUid','\"5225a655-7b1b-4da7-8cb4-690fc30967cd\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.1.instructions','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.1.label','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.1.required','false'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.1.tip','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.1.uid','\"95bdb63a-36a4-4f85-89c5-d157a9a9377a\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.1.userCondition','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.1.warning','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.1.width','100'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.2.elementCondition','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.2.fieldUid','\"19dcf35e-63cf-4989-a784-8f62b4930aa8\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.2.instructions','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.2.label','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.2.required','false'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.2.tip','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.2.uid','\"5f1a38ca-aedd-4d8d-bc03-91bfbb42f824\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.2.userCondition','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.2.warning','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.elements.2.width','100'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.name','\"Content\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.uid','\"2599de40-9db9-4cd0-a998-b8dc92ac1ce0\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.fieldLayouts.1641f902-613a-499c-ae3a-f3db23590dcd.tabs.0.userCondition','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.handle','\"testPage\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.hasTitleField','false'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.name','\"Test Page\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.section','\"a4ac5263-3c77-4687-8fd9-690347916188\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.sortOrder','1'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.titleFormat','\"{section.name|raw}\"'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.titleTranslationKeyFormat','null'),('entryTypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc.titleTranslationMethod','\"site\"'),('fieldGroups.aed66229-2bb7-47f2-9f7d-f66d0a51ce74.name','\"Common\"'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.columnSuffix','\"bpjixvbv\"'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.contentColumnType','\"text\"'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.fieldGroup','\"aed66229-2bb7-47f2-9f7d-f66d0a51ce74\"'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.handle','\"testPublicField\"'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.instructions','null'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.name','\"Test Public Field\"'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.searchable','false'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.settings.byteLimit','null'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.settings.charLimit','null'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.settings.code','false'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.settings.columnType','null'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.settings.initialRows','4'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.settings.multiline','false'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.settings.placeholder','null'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.settings.uiMode','\"normal\"'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.translationKeyFormat','null'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.translationMethod','\"none\"'),('fields.19dcf35e-63cf-4989-a784-8f62b4930aa8.type','\"craft\\\\fields\\\\PlainText\"'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.columnSuffix','\"dcldtget\"'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.contentColumnType','\"text\"'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.fieldGroup','\"aed66229-2bb7-47f2-9f7d-f66d0a51ce74\"'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.handle','\"testPrivateField\"'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.instructions','null'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.name','\"Test Private Field\"'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.searchable','false'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.settings.byteLimit','null'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.settings.charLimit','null'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.settings.code','false'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.settings.columnType','null'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.settings.initialRows','4'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.settings.multiline','false'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.settings.placeholder','null'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.settings.uiMode','\"normal\"'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.translationKeyFormat','null'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.translationMethod','\"none\"'),('fields.5225a655-7b1b-4da7-8cb4-690fc30967cd.type','\"craft\\\\fields\\\\PlainText\"'),('graphql.schemas.14408bdf-46de-4327-83e0-3031dc8dcdd1.isPublic','false'),('graphql.schemas.14408bdf-46de-4327-83e0-3031dc8dcdd1.name','\"Private Schema\"'),('graphql.schemas.14408bdf-46de-4327-83e0-3031dc8dcdd1.scope.0','\"sites.2b197910-efe0-427f-8de6-0b76806ac38e:read\"'),('graphql.schemas.14408bdf-46de-4327-83e0-3031dc8dcdd1.scope.1','\"elements.drafts:read\"'),('graphql.schemas.14408bdf-46de-4327-83e0-3031dc8dcdd1.scope.2','\"elements.revisions:read\"'),('graphql.schemas.14408bdf-46de-4327-83e0-3031dc8dcdd1.scope.3','\"elements.inactive:read\"'),('graphql.schemas.14408bdf-46de-4327-83e0-3031dc8dcdd1.scope.4','\"sections.a4ac5263-3c77-4687-8fd9-690347916188:read\"'),('graphql.schemas.14408bdf-46de-4327-83e0-3031dc8dcdd1.scope.5','\"entrytypes.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc:read\"'),('graphql.schemas.baac8502-66f9-4dd2-81f6-c3dea4ae2db0.isPublic','true'),('graphql.schemas.baac8502-66f9-4dd2-81f6-c3dea4ae2db0.name','\"Public Schema\"'),('meta.__names__.14408bdf-46de-4327-83e0-3031dc8dcdd1','\"Private Schema\"'),('meta.__names__.17f3ca50-39d1-4ea1-a7c1-d420bc7d57dc','\"Test Page\"'),('meta.__names__.19dcf35e-63cf-4989-a784-8f62b4930aa8','\"Test Public Field\"'),('meta.__names__.2b197910-efe0-427f-8de6-0b76806ac38e','\"gql-bug-test\"'),('meta.__names__.5225a655-7b1b-4da7-8cb4-690fc30967cd','\"Test Private Field\"'),('meta.__names__.a4ac5263-3c77-4687-8fd9-690347916188','\"Test Page\"'),('meta.__names__.aed66229-2bb7-47f2-9f7d-f66d0a51ce74','\"Common\"'),('meta.__names__.baac8502-66f9-4dd2-81f6-c3dea4ae2db0','\"Public Schema\"'),('meta.__names__.df0698ff-0b95-4bee-910d-1c2f73aa8707','\"gql-bug-test\"'),('plugins.graphql-authentication.edition','\"standard\"'),('plugins.graphql-authentication.enabled','true'),('plugins.graphql-authentication.licenseKey','\"NO8MZYCH17KKV9PVDTCOUTKW\"'),('plugins.graphql-authentication.schemaVersion','\"1.3.0\"'),('plugins.graphql-authentication.settings.accountDeleted','\"Successfully deleted account\"'),('plugins.graphql-authentication.settings.activationEmailSent','\"You will receive an email if it matches an account in our system\"'),('plugins.graphql-authentication.settings.allowedFacebookDomains','null'),('plugins.graphql-authentication.settings.allowedGoogleDomains','null'),('plugins.graphql-authentication.settings.allowedMicrosoftDomains','null'),('plugins.graphql-authentication.settings.allowedTwitterDomains','null'),('plugins.graphql-authentication.settings.allowMagicAuthentication','null'),('plugins.graphql-authentication.settings.allowRegistration','\"1\"'),('plugins.graphql-authentication.settings.appleClientId','null'),('plugins.graphql-authentication.settings.appleClientSecret','null'),('plugins.graphql-authentication.settings.appleRedirectUrl','null'),('plugins.graphql-authentication.settings.appleServiceId','null'),('plugins.graphql-authentication.settings.appleServiceSecret','null'),('plugins.graphql-authentication.settings.assetMutations','null'),('plugins.graphql-authentication.settings.assetNotFound','\"We couldn\'t find any matching assets\"'),('plugins.graphql-authentication.settings.assetQueries','null'),('plugins.graphql-authentication.settings.emailNotInScope','\"No email in scope\"'),('plugins.graphql-authentication.settings.entryMutations','null'),('plugins.graphql-authentication.settings.entryNotFound','\"We couldn\'t find any matching entries\"'),('plugins.graphql-authentication.settings.entryQueries','null'),('plugins.graphql-authentication.settings.facebookAppId','null'),('plugins.graphql-authentication.settings.facebookAppSecret','null'),('plugins.graphql-authentication.settings.facebookEmailMismatch','\"Email address doesn\'t match allowed Facebook domains\"'),('plugins.graphql-authentication.settings.facebookRedirectUrl','null'),('plugins.graphql-authentication.settings.fieldRestrictions.__assoc__.0.0','\"schema-1\"'),('plugins.graphql-authentication.settings.fieldRestrictions.__assoc__.0.1.__assoc__.0.0','\"testPrivateField\"'),('plugins.graphql-authentication.settings.fieldRestrictions.__assoc__.0.1.__assoc__.0.1','\"private\"'),('plugins.graphql-authentication.settings.fieldRestrictions.__assoc__.0.1.__assoc__.1.0','\"testPublicField\"'),('plugins.graphql-authentication.settings.fieldRestrictions.__assoc__.0.1.__assoc__.1.1','\"query\"'),('plugins.graphql-authentication.settings.fieldRestrictions.__assoc__.1.0','\"schema-Private Schema\"'),('plugins.graphql-authentication.settings.fieldRestrictions.__assoc__.1.1.__assoc__.0.0','\"testPrivateField\"'),('plugins.graphql-authentication.settings.fieldRestrictions.__assoc__.1.1.__assoc__.0.1','\"queryMutate\"'),('plugins.graphql-authentication.settings.fieldRestrictions.__assoc__.1.1.__assoc__.1.0','\"testPublicField\"'),('plugins.graphql-authentication.settings.fieldRestrictions.__assoc__.1.1.__assoc__.1.1','\"queryMutate\"'),('plugins.graphql-authentication.settings.forbiddenField','\"User doesn\'t have permission to access requested field(s)\"'),('plugins.graphql-authentication.settings.forbiddenMutation','\"User doesn\'t have permission to perform this mutation\"'),('plugins.graphql-authentication.settings.googleClientId','null'),('plugins.graphql-authentication.settings.googleEmailMismatch','\"Email address doesn\'t match allowed Google domains\"'),('plugins.graphql-authentication.settings.googleTokenIdInvalid','\"Invalid Google Token ID\"'),('plugins.graphql-authentication.settings.granularSchemas','null'),('plugins.graphql-authentication.settings.invalidEmailAddress','\"Invalid email address\"'),('plugins.graphql-authentication.settings.invalidHeader','\"Invalid Authorization Header\"'),('plugins.graphql-authentication.settings.invalidJwtSecretKey','\"Invalid JWT Secret Key\"'),('plugins.graphql-authentication.settings.invalidLogin','\"We couldn\'t log you in with the provided details\"'),('plugins.graphql-authentication.settings.invalidMagicCode','\"Invalid magic code\"'),('plugins.graphql-authentication.settings.invalidOauthToken','\"Invalid OAuth Token\"'),('plugins.graphql-authentication.settings.invalidPasswordMatch','\"Passwords do not match\"'),('plugins.graphql-authentication.settings.invalidPasswordUpdate','\"We couldn\'t update the password with the provided details\"'),('plugins.graphql-authentication.settings.invalidRefreshToken','\"Invalid Refresh Token\"'),('plugins.graphql-authentication.settings.invalidRequest','\"Cannot validate request\"'),('plugins.graphql-authentication.settings.invalidSchema','\"No schema has been set for this user group\"'),('plugins.graphql-authentication.settings.invalidUserUpdate','\"We couldn\'t update the user with the provided details\"'),('plugins.graphql-authentication.settings.jwtExpiration','\"30 minutes\"'),('plugins.graphql-authentication.settings.jwtRefreshExpiration','\"3 months\"'),('plugins.graphql-authentication.settings.jwtSecretKey','\"v_o-CHfya3yPNLzWjMJ0u2ZOGXOaNItW\"'),('plugins.graphql-authentication.settings.magicLinkSent','\"You will receive an email if it matches an account in our system\"'),('plugins.graphql-authentication.settings.microsoftAppId','null'),('plugins.graphql-authentication.settings.microsoftAppSecret','null'),('plugins.graphql-authentication.settings.microsoftEmailMismatch','\"Email address doesn\'t match allowed Microsoft domains\"'),('plugins.graphql-authentication.settings.microsoftRedirectUrl','null'),('plugins.graphql-authentication.settings.passwordResetRequired','\"Password reset required; please check your email\"'),('plugins.graphql-authentication.settings.passwordResetSent','\"You will receive an email if it matches an account in our system\"'),('plugins.graphql-authentication.settings.passwordSaved','\"Successfully saved password\"'),('plugins.graphql-authentication.settings.passwordUpdated','\"Successfully updated password\"'),('plugins.graphql-authentication.settings.permissionType','\"single\"'),('plugins.graphql-authentication.settings.sameSitePolicy','\"strict\"'),('plugins.graphql-authentication.settings.schemaId','null'),('plugins.graphql-authentication.settings.schemaName','null'),('plugins.graphql-authentication.settings.siteId','null'),('plugins.graphql-authentication.settings.skipSocialActivation','null'),('plugins.graphql-authentication.settings.tokenNotFound','\"We couldn\'t find any matching tokens\"'),('plugins.graphql-authentication.settings.twitterApiKey','null'),('plugins.graphql-authentication.settings.twitterApiKeySecret','null'),('plugins.graphql-authentication.settings.twitterEmailMismatch','\"Email address doesn\'t match allowed Twitter domains\"'),('plugins.graphql-authentication.settings.twitterRedirectUrl','null'),('plugins.graphql-authentication.settings.userActivated','\"Successfully activated user\"'),('plugins.graphql-authentication.settings.userGroup','null'),('plugins.graphql-authentication.settings.userHasPassword','\"User not password-less\"'),('plugins.graphql-authentication.settings.userNotActivated','\"Please activate your account\"'),('plugins.graphql-authentication.settings.userNotFound','\"We couldn\'t find any matching users\"'),('plugins.graphql-authentication.settings.volumeNotFound','\"We couldn\'t find any matching volumes\"'),('sections.a4ac5263-3c77-4687-8fd9-690347916188.defaultPlacement','\"end\"'),('sections.a4ac5263-3c77-4687-8fd9-690347916188.enableVersioning','true'),('sections.a4ac5263-3c77-4687-8fd9-690347916188.handle','\"testPage\"'),('sections.a4ac5263-3c77-4687-8fd9-690347916188.name','\"Test Page\"'),('sections.a4ac5263-3c77-4687-8fd9-690347916188.propagationMethod','\"all\"'),('sections.a4ac5263-3c77-4687-8fd9-690347916188.siteSettings.2b197910-efe0-427f-8de6-0b76806ac38e.enabledByDefault','true'),('sections.a4ac5263-3c77-4687-8fd9-690347916188.siteSettings.2b197910-efe0-427f-8de6-0b76806ac38e.hasUrls','true'),('sections.a4ac5263-3c77-4687-8fd9-690347916188.siteSettings.2b197910-efe0-427f-8de6-0b76806ac38e.template','\"test-page/_entry\"'),('sections.a4ac5263-3c77-4687-8fd9-690347916188.siteSettings.2b197910-efe0-427f-8de6-0b76806ac38e.uriFormat','\"test-page\"'),('sections.a4ac5263-3c77-4687-8fd9-690347916188.type','\"single\"'),('siteGroups.df0698ff-0b95-4bee-910d-1c2f73aa8707.name','\"gql-bug-test\"'),('sites.2b197910-efe0-427f-8de6-0b76806ac38e.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.2b197910-efe0-427f-8de6-0b76806ac38e.handle','\"default\"'),('sites.2b197910-efe0-427f-8de6-0b76806ac38e.hasUrls','true'),('sites.2b197910-efe0-427f-8de6-0b76806ac38e.language','\"en-US\"'),('sites.2b197910-efe0-427f-8de6-0b76806ac38e.name','\"gql-bug-test\"'),('sites.2b197910-efe0-427f-8de6-0b76806ac38e.primary','true'),('sites.2b197910-efe0-427f-8de6-0b76806ac38e.siteGroup','\"df0698ff-0b95-4bee-910d-1c2f73aa8707\"'),('sites.2b197910-efe0-427f-8de6-0b76806ac38e.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"gql-bug-test\"'),('system.schemaVersion','\"4.0.0.9\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,NULL),(4,2,1,4,'Applied “Draft 1”'),(5,2,1,5,NULL),(6,2,1,6,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' test fakedomain com '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' test page '),(2,'title',0,1,' test page ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Test Page','testPage','single',1,'all','end',NULL,'2023-01-24 15:04:55','2023-01-24 15:04:55',NULL,'a4ac5263-3c77-4687-8fd9-690347916188');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'test-page','test-page/_entry',1,'2023-01-24 15:04:55','2023-01-24 15:04:55','4e18e88a-0caf-4293-bc08-6e485f437bc0');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'gql-bug-test','2023-01-24 15:04:06','2023-01-24 15:04:06',NULL,'df0698ff-0b95-4bee-910d-1c2f73aa8707');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','gql-bug-test','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-01-24 15:04:06','2023-01-24 15:04:06',NULL,'2b197910-efe0-427f-8de6-0b76806ac38e');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"notificationDuration\":\"5000\",\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'admin','',NULL,NULL,'test@fakedomain.com','$2y$13$HOBsZu8hYSyChoZ8MVVgAOOkUcGZuSazH38TiPJyf1fakXhxWr4DW','2023-01-24 15:04:28',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2023-01-24 15:32:08','2023-01-24 15:04:07','2023-01-24 15:32:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-01-24 15:04:28','2023-01-24 15:04:28','d40403d0-9d50-49ee-8d8e-79d2fa2f7642'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-01-24 15:04:28','2023-01-24 15:04:28','d99af272-e5d1-4f7b-b234-2e6e1abc19c9'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-01-24 15:04:28','2023-01-24 15:04:28','d9fb00bf-1ccd-4bd9-b9b1-7c61174e5bea'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-01-24 15:04:28','2023-01-24 15:04:28','fcff5ea6-a7d6-4831-8055-4153dfd5b3a0');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-24 15:48:27

/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: intranet
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aniversariantes`
--

DROP TABLE IF EXISTS `aniversariantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `aniversariantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagem` varchar(255) NOT NULL,
  `data_upload` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aniversariantes`
--

LOCK TABLES `aniversariantes` WRITE;
/*!40000 ALTER TABLE `aniversariantes` DISABLE KEYS */;
INSERT INTO `aniversariantes` VALUES
(5,'uploads/aff06353-dca0-4843-9249-b37da9ea3cab.png','2025-06-06 14:46:03'),
(6,'uploads/af932b3f-d8dd-4f2f-a298-0d846b8c3ae2.png','2025-06-06 14:53:17');
/*!40000 ALTER TABLE `aniversariantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliance`
--

DROP TABLE IF EXISTS `compliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `compliance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagem` varchar(255) NOT NULL,
  `data_upload` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliance`
--

LOCK TABLES `compliance` WRITE;
/*!40000 ALTER TABLE `compliance` DISABLE KEYS */;
INSERT INTO `compliance` VALUES
(2,'uploads/a29daac6-754a-4a4c-997d-477418fafef5.png','2025-06-06 12:02:58');
/*!40000 ALTER TABLE `compliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links_rapidos`
--

DROP TABLE IF EXISTS `links_rapidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `links_rapidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `url` varchar(512) NOT NULL,
  `tipo` enum('slide','pdf','forms','doc','video','link') DEFAULT 'link',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links_rapidos`
--

LOCK TABLES `links_rapidos` WRITE;
/*!40000 ALTER TABLE `links_rapidos` DISABLE KEYS */;
INSERT INTO `links_rapidos` VALUES
(7,'Solicitação de acesso PSDRM','https://forms.gle/4mpMW3ZCxQrNSxEx9','forms'),
(8,'RAMAIS','http://172.16.10.131/intranet/ramais.html','link');
/*!40000 ALTER TABLE `links_rapidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticias_externas`
--

DROP TABLE IF EXISTS `noticias_externas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticias_externas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `link` varchar(500) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `data_publicacao` date DEFAULT NULL,
  `criado_em` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticias_externas`
--

LOCK TABLES `noticias_externas` WRITE;
/*!40000 ALTER TABLE `noticias_externas` DISABLE KEYS */;
INSERT INTO `noticias_externas` VALUES
(1,'Pronto-Socorro Dr. Roberto Macedo chega a 500 mil atendimentos realizados','https://diariodopara.com.br/belem/pronto-socorro-dr-roberto-macedo-chega-a-500-mil-atendimentos-realizados/','O Pronto-Socorro Dr. Roberto Macedo (PSRM), localizado na avenida Augusto Montenegro, em Belém, completa um ano de funcionamento neste domingo (18), com um marco expressivo: aproximadamente 500 mil atendimentos realizados entre internações, cirurgias, triagens, urgências e serviços de diagnóstico e terapêutica, nas áreas adulto e pediátrica.','uploads/111c39e9-12c6-4a91-8055-d83758b8217d.webp','2025-05-18','2025-06-04 13:41:22'),
(2,'Pronto-Socorro Estadual realiza primeira captação de órgãos para transplante','https://www.agenciapara.com.br/noticia/67495/pronto-socorro-estadual-realiza-primeira-captacao-de-orgaos-para-transplante','O Pronto-Socorro Dr. Roberto Macedo (PSRM) realizou, na noite de quarta-feira (28), a primeira captação de órgãos para transplante, da unidade de saúde, após autorização dos familiares do paciente, que em gesto solidário transformaram a dor da perda em esperança para pacientes que contam com a doação para a manutenção e qualidade de suas vidas.','uploads/cd8dbf0b-8a8a-49ee-bab9-35e38981f3f9.webp','2025-05-29','2025-06-04 13:42:37'),
(3,'Pronto-Socorro Estadual inaugura ‘Biblioteca Itinerante Hospitalar’ para ajudar no processo de recuperação dos pacientes','https://agenciapara.com.br/noticia/67599/pronto-socorro-estadual-inaugura-biblioteca-itinerante-hospitalar-para-ajudar-no-processo-de-recuperacao-dos-pacientes','Encantados e com olhares atentos, os pacientes internados nas enfermarias do Pronto-Socorro Dr. Roberto Macedo (PSRM), em Belém, desfrutaram de uma tarde muito especial por meio da primeira experiência com a “Biblioteca Itinerante Hospitalar” à beira leito. A experiência foi vivenciada pelos pacientes nesta segunda-feira (2).','uploads/65a55940-4c74-4d59-972b-00bd391f9aaa.webp','2025-06-02','2025-06-04 13:49:12'),
(4,'Atendimento humanizado qualifica assistência no Pronto-Socorro Estadual, em Belém','https://agenciapara.com.br/noticia/67682/atendimento-humanizado-qualifica-assistencia-no-pronto-socorro-estadual-em-belem','Por trás de números e estatísticas, há vidas transformadas. Como a de Makel Silva, de 42 anos, moradora de Vigia de Nazaré, que desde março vive uma internação de longa permanência no Pronto-Socorro Dr. Roberto Macedo (PSRM), em Belém. A experiência, que poderia ser marcada por medo e insegurança, tornou-se um ponto positivo. “Antes de ser atendida no Hospital, eu ouvia bastante as pessoas falarem muito bem do atendimento do Pronto-Socorro Estadual. Eu achava que era mentira”, conta emocionada.','uploads/77e152ab-1159-4e85-a013-00b283b37c67.webp','2025-06-05','2025-06-06 14:56:17');
/*!40000 ALTER TABLE `noticias_externas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacoes`
--

DROP TABLE IF EXISTS `publicacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(100) DEFAULT NULL,
  `conteudo` text NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `data_publicacao` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacoes`
--

LOCK TABLES `publicacoes` WRITE;
/*!40000 ALTER TABLE `publicacoes` DISABLE KEYS */;
INSERT INTO `publicacoes` VALUES
(9,'UTI PSDRM conquista certificado!','Gabriel Nicolas','Conquista certificado de Gestão de Indicadores','uploads/33b27136-b3bd-498b-ac8e-7b752a438e79.jpg',NULL,'2025-06-04 10:34:17'),
(10,'Organograma PSDRM','Gabriel Nicolas','Prezados colaboradores, este organograma foi elaborado para afim de exemplificar os níveis hierárquicos dos setores do pronto socorro. Em caso de dúvidas, consulte o supervisor/coordenador do seu setor.','uploads/62188bd5-79b9-4fe9-9e9b-7896a98aeb84.png',NULL,'2025-06-06 14:52:00');
/*!40000 ALTER TABLE `publicacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ramais`
--

DROP TABLE IF EXISTS `ramais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ramais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `andar` varchar(10) DEFAULT NULL,
  `setor` varchar(100) DEFAULT NULL,
  `ramal` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ramais`
--

LOCK TABLES `ramais` WRITE;
/*!40000 ALTER TABLE `ramais` DISABLE KEYS */;
INSERT INTO `ramais` VALUES
(1,'Térreo','Sala Amarela Adulto','2050'),
(45,'Térreo','Sala Amarela Pediátrica','2085'),
(46,'Térreo','Sala Vermelha Adulto A','2053');
/*!40000 ALTER TABLE `ramais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha_hash` varchar(255) NOT NULL,
  `tipo` enum('comunicacao','admin') DEFAULT 'comunicacao',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,'Gabriel Nicolas','gnicolasdev@hotmail.com','scrypt:32768:8:1$WtvblpdMp60ocpl7$84764c05f91a2be9cc9df30d4e7548cf64a95dea79ec97f7e5231557fa3a55ae128d4295bf3eb5540756246872e69ec9742d8145d0f5156788b6eed08dfa648e','admin'),
(2,'Anderson Sodré','anderson.sodre@institutoacqua.org.br','scrypt:32768:8:1$v26ZpethISy5iIvQ$3772c6b6421292798305849bf9cd10b6d07c93b8f5902696b3371f23b123003cb5f007a67476dc5f47db657e4b1a12242d97edaafd55734fafed973f2ea85f65','admin');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'intranet'
--

--
-- Dumping routines for database 'intranet'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-06 15:14:19

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
(4,'Atendimento humanizado qualifica assistência no Pronto-Socorro Estadual, em Belém','https://agenciapara.com.br/noticia/67682/atendimento-humanizado-qualifica-assistencia-no-pronto-socorro-estadual-em-belem','Por trás de números e estatísticas, há vidas transformadas. Como a de Makel Silva, de 42 anos, moradora de Vigia de Nazaré, que desde março vive uma internação de longa permanência no Pronto-Socorro Dr. Roberto Macedo (PSRM), em Belém. A experiência, que poderia ser marcada por medo e insegurança, tornou-se um ponto positivo. “Antes de ser atendida no Hospital, eu ouvia bastante as pessoas falarem muito bem do atendimento do Pronto-Socorro Estadual. Eu achava que era mentira”, conta emocionada.','uploads/77e152ab-1159-4e85-a013-00b283b37c67.webp','2025-06-05','2025-06-06 14:56:17'),
(5,'PSRM relaciona educação ambiental e saúde durante ‘Semana do Meio Ambiente’','https://www.agenciapara.com.br/noticia/67720/psrm-relaciona-educacao-ambiental-e-saude-durante-semana-do-meio-ambiente','Comissão de Sustentabilidade promoveu ações sobre o tema “Acabar com a poluição plástica” envolvendo na abordagem as crianças e acompanhantes','uploads/ed4886df-327c-4b09-ab68-d138b1d15c2b.webp','2025-06-06','2025-06-12 16:16:15'),
(6,'Hospitais estaduais e Corpo de Bombeiros garantem atendimento médico e segurança durante o Pararraiá 2025','https://agenciapara.com.br/noticia/67927/hospitais-estaduais-e-corpo-de-bombeiros-garantem-atendimento-medico-e-seguranca-durante-o-pararraia-2025','Operação estratégica une saúde e prevenção de riscos no maior arraial da Amazônia','uploads/ae93f88b-0f9f-4ab6-a413-66427f6896fa.jpg','2025-06-12','2025-06-14 10:23:08'),
(7,'Pronto-Socorro Estadual é pioneiro em cirurgias no tórax na assistência de urgência e emergência','https://agenciapara.com.br/noticia/67968/pronto-socorro-estadual-e-pioneiro-em-cirurgias-no-torax-na-assistencia-de-urgencia-e-emergencia','Procedimento é indicado a pacientes que têm processos inflamatórios ou infecciosos graves, a exemplo da pneumonia','uploads/b9656402-0221-4f4e-a705-5691c051e0d5.webp','2025-06-14','2025-06-16 11:52:29'),
(8,'Pronto-Socorro estadual promove ação educativa sobre prescrição e administração de medicamentos','https://agenciapara.com.br/noticia/68316/pronto-socorro-estadual-promove-acao-educativa-sobre-prescricao-e-administracao-de-medicamentos','O Pronto-Socorro Dr. Roberto Macedo quer fortalecer a aplicação das metas internacionais de segurança nas rotinas e fluxos assistenciais','uploads/00af0dd1-09df-48aa-a837-6e331ba7cb98.webp','2025-06-26','2025-07-02 10:26:08'),
(9,'PSRM discute diariamente estratégias de segurança para melhoria do atendimento de urgência e emergência','https://agenciapara.com.br/noticia/68468/psrm-discute-diariamente-estrategias-de-seguranca-para-melhoria-do-atendimento-de-urgencia-e-emergencia','Encontros rápidos entre equipes assistenciais ajudam a prevenir riscos e garantir qualidade nos serviços de urgência e emergência','uploads/3bc42c55-125c-499a-8c2e-c919b761a554.webp','2025-07-01','2025-07-02 10:26:56'),
(10,'Pronto-Socorro estadual é selecionado para Programa de Gerenciamento de Antimicrobianos','https://www.agenciapara.com.br/noticia/68663/pronto-socorro-estadual-e-selecionado-paraprograma-de-gerenciamento-de-antimicrobianos','A iniciativa fortalece a implementação de práticas para o uso racional de antimicrobianos em unidades que atendem ao Sistema Único de Saúde','uploads/cf852ccd-32a3-4ef4-97fe-4871ace86778.webp','2025-07-08','2025-07-14 10:21:28'),
(11,'Projeto \'Sextou na Pediatria\' promove colônia de férias para crianças internadas no PSRM','https://agenciapara.com.br/noticia/68778/projeto-sextou-na-pediatria-promove-colonia-de-ferias-para-criancas-internadas-no-psrm','Administrado pelo Instituto Acqua, em parceria com a Secretaria de Estado de Saúde Pública (Sespa), o PSRM se firmou como um símbolo da reconfiguração da saúde pública no Pará','uploads/716e5e31-d221-426d-a9ec-01180c4cf5e0.webp','2025-07-11','2025-07-14 10:22:36'),
(12,'Hospitais estaduais superam 50 mil atendimentos pediátricos na Região Metropolitana de Belém no primeiro semestre','https://agenciapara.com.br/noticia/68824/hospitais-estaduais-superam-50-mil-atendimentos-pediatricos-na-regiao-metropolitana-de-belem-no-primeiro-semestre','Hospital Abelardo Santos e Pronto-Socorro Dr. Roberto Macedo são referências em urgência e emergência clínica infantil','uploads/d16af4c4-8cb1-466b-a6ea-6ea5394b5515.jpg','2025-07-15','2025-07-16 13:11:33'),
(13,'Pronto-Socorro Estadual Dr. Roberto Macedo alcança mais de 97% de aprovação entre pacientes','https://agenciapara.com.br/noticia/68870/pronto-socorro-estadual-dr.-roberto-macedo-alcanca-mais-de-97-de-aprovacao-entre-pacientes','Com pouco mais de um ano de funcionamento, unidade já realizou mais de 42 mil atendimentos no pronto-atendimento adulto só em 2025','uploads/84a8a1b7-6665-4545-bee0-1dbe9e0968ab.webp','2025-07-15','2025-07-16 13:12:09'),
(14,'Ampliação de leitos com UTI Adulto PSRM completa um ano e se consolida como referência em assistência intensiva','https://agenciapara.com.br/noticia/68903/ampliacao-de-leitos-com-uti-adulto-psrm-completa-um-ano-e-se-consolida-como-referencia-em-assistencia-intensiva','No primeiro ano de funcionamento, aproximadamente 450 pacientes foram assistidas no setor, composto com 10 leitos.','uploads/90bbb971-26e0-4906-a637-9213684f19c4.webp','2025-07-16','2025-07-17 17:54:51'),
(15,'Ampliação de leitos com UTI Adulto PSRM completa um ano e se consolida como referência em assistência intensiva','https://www.agenciapara.com.br/noticia/68903/ampliacao-de-leitos-com-uti-adulto-psrm-completa-um-ano-e-se-consolida-como-referencia-em-assistencia-intensiva','No primeiro ano de funcionamento, aproximadamente 450 pacientes foram assistidas no setor, composto com 10 leitos','uploads/bb609c73-48c7-4eac-b3df-98ef49da6c89.webp','2025-07-16','2025-07-22 17:33:02'),
(16,'Em Belém, campanha de doação de sangue mobiliza colaboradores e usuários do Pronto-Socorro estadual','https://agenciapara.com.br/pauta/11081/em-belem-campanha-de-doacao-de-sangue-mobiliza-colaboradores-e-usuarios-do-pronto-socorro-estadual','O Pronto-Socorro Dr.Roberto Macedo, por meio do Grupo de Trabalho de Humanização (GTH), promove, na próxima quarta-feira (23), a 2ª campanha institucional de doação de sangue de 2025. A ação tem a parceria da Fundação Hemopa, e será realizada das 8h às 16h',NULL,'2025-07-21','2025-07-22 17:34:26'),
(17,'Pronto-Socorro Dr. Roberto Macedo reúne pais e filhos internados em programação interativa','https://www.agenciapara.com.br/noticia/69517/pronto-socorro-dr.-roberto-macedo-reune-pais-e-filhos-internados-em-programacao-interativa','Relatos de histórias pessoais levaram a momentos de emoção, alternando lágrimas e sorrisos, importantes para a estabilidade emocional no ambiente hospitalar','uploads/a5242ca5-8e1a-47b2-a87b-2e748b6ad398.webp','2025-08-08','2025-08-09 10:44:08'),
(18,'Pronto Atendimento do PSRM completa um ano de atendimento com avanços e inovações na assistência prestada','https://agenciapara.com.br/noticia/69745/pronto-atendimento-do-psrm-completa-um-ano-de-atendimento-com-avancos-e-inovacoes-na-assistencia-prestada','Unidade do Governo do Pará se consolidou como referência em urgência e emergência para a Região Metropolitana, com resolutividade e acolhimento humanizado','uploads/a77331db-789e-45aa-bf49-c893a939fe8e.webp','2025-08-16','2025-08-17 10:24:30'),
(19,'Pronto-Socorro Dr. Roberto Macedo é referência em ultrassonografia cinesiológica no Pará','https://agenciapara.com.br/noticia/69932/pronto-socorro-dr.-roberto-macedo-e-referencia-em-ultrassonografia-cinesiologica-no-para','Equipamento auxilia na identificação de lesões e na escolha do tratamento mais adequado, e também no processo de desmame da ventilação mecânica','uploads/01c5032f-5223-430e-bc20-6c01d5b8c18b.webp','2025-08-26','2025-08-29 20:47:38'),
(20,'Pronto Socorro Estadual aprimora assistência de urgência e emergência à população','https://agenciapara.com.br/noticia/70009/pronto-socorro-estadual-aprimora-assistencia-de-urgencia-e-emergencia-a-populacao','Capacitação concluída neste sábado (23) qualifica atuação de profissionais do Pronto-Socorro Dr.Roberto Macedo (PSRM) com ciclo de treinamentos','uploads/5fcfe103-294e-481e-8ad1-c756887554b8.webp','2025-08-23','2025-08-29 20:50:34'),
(21,'Pronto-Socorro Dr. Roberto Macedo amplia qualidade de vida com cuidados paliativos','https://agenciapara.com.br/noticia/70063/pronto-socorro-dr.-roberto-macedo-amplia-qualidade-de-vida-com-cuidados-paliativos','Serviço garante atuação de forma integrada, assegurando manejo adequado dos sintomas, e suporte às famílias em situações de maior complexidade','uploads/4610033d-7201-4691-a6c8-e920c9620344.webp','2025-08-26','2025-08-29 20:51:55'),
(22,'Pronto-Socorro Dr. Roberto Macedo realiza captação de órgãos e reforça importância da doação','https://agenciapara.com.br/noticia/70312/pronto-socorro-dr.-roberto-macedo-realiza-captacao-de-orgaos-e-reforca-importancia-da-doacao','A segunda captação de órgãos para transplante foi autorizada pela mãe de uma paciente da UTI pediátrica','uploads/14c4ea39-eb30-45bd-8815-4054f8c28df9.webp','2025-09-02','2025-09-03 17:50:28'),
(23,'Pronto-Socorro Dr. Roberto Macedo investe na melhoria contínua da assistência à população','https://agenciapara.com.br/noticia/70349/pronto-socorro-dr.-roberto-macedo-investe-na-melhoria-continua-da-assistencia-a-populacao','Hospital, em Belém, promove ações de educação em saúde aos profissionais','uploads/5e397e2a-eebe-469f-aef0-bc8035b19eae.webp','2025-09-10','2025-09-10 19:14:46'),
(24,'Serviço de Atendimento ao Usuário/Ouvidoria do PSRM tem 98,11% de satisfação dos usuários','https://agenciapara.com.br/noticia/70694/servico-de-atendimento-ao-usuarioouvidoria-do-psrm-tem-9811-de-satisfacao-dos-usuarios','Canal de comunicação comemora um ano de funcionamento com destaque para o excelente índice de aprovação do público assistido','uploads/d2f22abd-ff32-41e5-8c64-9a1092c44755.webp','2025-09-17','2025-09-17 16:53:45');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacoes`
--

LOCK TABLES `publicacoes` WRITE;
/*!40000 ALTER TABLE `publicacoes` DISABLE KEYS */;
INSERT INTO `publicacoes` VALUES
(9,'UTI PSDRM conquista certificado!','Gabriel Nicolas','Conquista certificado de Gestão de Indicadores','uploads/33b27136-b3bd-498b-ac8e-7b752a438e79.jpg',NULL,'2025-06-04 10:34:17'),
(10,'Organograma PSDRM','Gabriel Nicolas','Prezados colaboradores, este organograma foi elaborado para afim de exemplificar os níveis hierárquicos dos setores do pronto socorro. Em caso de dúvidas, consulte o supervisor/coordenador do seu setor.','uploads/62188bd5-79b9-4fe9-9e9b-7896a98aeb84.png',NULL,'2025-06-06 14:52:00'),
(11,'TREINAMENTO HIPODERMOCLISE | 2 DE JULHO','Gabriel Nicolas','Treinamento sobre Hipodermóclise - uma técnica de administração de fluidos e medicamentos por via subcutânea, ou seja, através da pele, onde uma solução é infundida no tecido subcutâneo (hipoderme). É usada quando o acesso venoso é difícil ou impossível, como em pacientes idosos com veias frágeis ou em cuidados paliativos.  \r\n\r\n O link será enviado no dia do treinamento','uploads/0a2dd275-9fe0-4ecd-9564-cc4c812f3897.jpg',NULL,'2025-07-02 11:02:52'),
(12,'TREINAMENTO PROTOCOLO DE TRANSPORTE SEGURO | 2 e 3 DE JULHO','Gabriel Nicolas','O  Protocolo de Transporte Seguro refere-se às diretrizes e procedimentos estabelecidos para garantir que o transporte de pacientes, equipamentos ou materiais seja realizado de forma segura, minimizando riscos e evitando agravamentos clínicos ou danos. \r\nCompartilhem com o público do treinamento.','uploads/f9c6b19b-eb58-412f-9ab5-78e4005306d0.jpg',NULL,'2025-07-02 11:03:56'),
(13,'TREINAMENTO PROTOCOLO DE FLEBITE | 09 E 10 DE JULHO','Luiza Braga','O Protocolo de Flebite visa reduzir a incidência de flebite, melhorar os cuidados com o paciente e otimizar o uso de dispositivos intravenosos. Ele descreve as etapas e medidas para prevenir e tratar a inflamação das veias (flebite), especialmente em pacientes com cateteres intravenosos. \r\n\r\nCompartilhe para chegar ao público do treinamento. Agradecemos o apoio.','uploads/285322ec-e916-43e6-92b5-a99822f93e1c.jpg',NULL,'2025-07-16 16:30:00'),
(16,'2ª Campanha de doação de sangue','Luiza Braga','O Pronto-Socorro Dr. Roberto Macedo, realiza a sua II Campanha Interna de Doação de Sangue na unidade, que tem como tema: Verão da Solidariedade. Neste Verão, salve vidas! Doe sangue! \r\nA ação tem o objetivo de auxiliar o Hemopa na manutenção do estoque de sangue, para suprir a necessidade dos hemocomponentes diante dos atendimentos de urgência e emergência, e assegurar a vida dos nossos pacientes.\r\n\r\nGostaríamos de anunciar que nossa doação contará com uma apresentação especial do \"Projeto Musical Embalando a Alma\" , que abrilhantará o evento com sua música e talento, composto pelos músicos:\r\n\r\n1. Paulo Levi - Saxofone\r\n2. Felipe Sequeiro - Baixo\r\n\r\nJunte-se a nós, nesta corrente solidária de amor ao próximo. \r\n\r\nQuem trouxer mais doadores externos, ganhará prêmio especial da Diretoria. \r\n\r\nNão esqueça de levar documento original com foto (em mãos), no dia da doação. A falta do documento (com foto) inviabiliza a doação de sangue.','uploads/fe5e1a9e-947a-40bb-99a0-3f09932ed100.jpeg',NULL,'2025-07-16 16:37:00'),
(17,'PROCESSO DE SEGURANÇA TRANSFUSIONAL','Luiza Braga','O processo de segurança transfusional engloba uma série de medidas e procedimentos que visam garantir a segurança do paciente durante a transfusão de sangue e seus componentes. Essas medidas abrangem desde a seleção e avaliação do doador até a administração do hemocomponente no receptor, com o objetivo de prevenir reações transfusionais. Reforçando nosso compromisso com a qualificação contínua da equipe, que repercute na qualidade da assistência à saúde da população, contamos com a participação de todos os profissionais do público do treinamento.','uploads/a534676b-a0ec-4d3d-8a13-56c99bc1fd16.jpeg',NULL,'2025-07-16 16:41:02'),
(18,'2ª Campanha Interna de Vacinação','Luiza Braga','A campanha, promovida pelo Serviço Especializado em Engenharia de Segurança e Medicina do Trabalho- tem o objetivo de promover a saúde e segurança de todos que atuam no ambiente hospitalar, por meio da imunização de doenças, visando um ambiente saudável e seguro para todos. ','uploads/20db9c8d-a305-45cf-965f-234c17887f67.jpeg',NULL,'2025-07-17 17:51:14'),
(19,'TREINAMENTO DE COLETAS DE CULTURAS MICROBIOLOGICAS','Gabriel Nicolas','Contamos com a participação de todos os profissionais que fazem parte do público do treinamento,\r\nreforçando assim, o nosso compromisso com a qualificação contínua da equipe PSRM.','uploads/b8967633-dc40-408f-9140-d0c7ce5a782c.jpg',NULL,'2025-08-05 16:19:00'),
(20,'CUIDADOS PALIATIVOS','Gabriel Nicolas','TREINAMENTO ONLINE','uploads/ce33ae3e-d70c-464f-ac96-23b528fb2da8.jpg',NULL,'2025-08-05 21:27:46'),
(22,'Comunicação, Escuta e Feedback no ambiente hospitalar foi tema de evento para gestores do PRSM','Joelza Silva','No ambiente hospitalar, a comunicação, a escuta e o feedback eficazes são cruciais para melhorar a segurança do paciente e para gerar entendimento entre os profissionais, repercutindo na qualidade do atendimento. Esses foram alguns dos assuntos abordados na manhã desta sexta-feira (29), no evento presencial de tema \"Comunicação, Escuta e Feedback no Ambiente Hospitalar. O evento foi promovido pela gestão do Pronto-Socorro Dr. Roberto Macedo (PSRM), e teve como facilitador, Felipe Mendes, enfermeiro, por meio do Instituto do Desenvolvimento Humano e Social (IDHS).','uploads/07c99600-cba4-40e4-a0c0-db75453569a4.jpg',NULL,'2025-08-29 22:03:33'),
(23,'Treinamento Curativo de Acesso Central','Joelza Silva','O curativo de acesso central é feito com material estéril usado para cobrir e proteger o local de inserção do cateter venoso central (CVC), prevenindo infecções e garantindo sua fixação. A escolha do curativo e a frequência de sua troca dependem do estado clínico do paciente e do local do cateter, sendo a troca realizada sob técnica asséptica pelo enfermeiro. ','uploads/34aca423-5d00-4036-a57d-818e0008e3bd.jpg',NULL,'2025-08-29 20:37:31'),
(24,'O Perigo Invisível: Contaminação e Risco Biológico. NR 32','Joelza Silva','A NR 32 é a Norma Regulamentadora nº 32, que estabelece as diretrizes básicas para a proteção da segurança e saúde dos trabalhadores em serviços de saúde, bem como de quem atua em atividades de promoção e assistência à saúde. Seu objetivo é prevenir acidentes e doenças no ambiente de trabalho, estabelecendo procedimentos, riscos e medidas de controle para os profissionais.','uploads/1c0fe142-eb5e-4902-9583-9b581333dd05.jpg',NULL,'2025-09-10 19:11:01'),
(25,' SESMT treina colaboradores sobre NR 32','Joelza Silva','Nos dias 8, 9, 10 e 11 deste mês de agosto, por meio do treinamento \"O perigo invisível: contaminação e riscos biológicos\", colaboradores do PSRM foram orientados sobre a Norma Regulamentadora (32 (NR 32), que estabelece as diretrizes básicas para a proteção da segurança e saúde dos trabalhadores em serviços de saúde, bem como de quem atua em atividades de promoção e assistência à saúde. No treinamento, entre outros assuntos, foi discutido entre os colaboradores na nossa unidade de saúde pelo facilitador, engenheiro de Segurança do Serviço de Medicina e Segurança do Trabalho (SESMT), Vinícius Dias, sobre o objetivo da NR 32, que é prevenir acidentes e doenças no ambiente de trabalho, estabelecendo procedimentos, riscos e medidas de controle para os profissionais.','uploads/ed3d04f3-aab3-48dc-9989-ffc8ad9249ae.jpg',NULL,'2025-09-11 20:13:01'),
(26,'TREINAMENTO SOBRE VIGILÂNCIA DE GERMES MULTIRRESISTENTES E PRECAUÇÕES ESPECÍFICAS. ','Joelza Silva','Práticas de higiene das mãos, uso correto de equipamentos de proteção individual (EPIs) como luvas e aventais, e na implementação de medidas de isolamento e controle ambiental, são importantes na vigilância de germes multirresistentes e precauções específicas.  Esses e outros assuntos relacionados ao tema serão abordados no TREINAMENTO SOBRE VIGILÂNCIA DE GERMES MULTIRRESISTENTES E PRECAUÇÕES ESPECÍFICAS. \r\n','uploads/a7a3a001-daf3-444d-8ad7-04f879cb4850.jpg',NULL,'2025-09-15 21:39:12'),
(27,'ALERTA DE E-MAIL FALSO','Joelza Silva','Recebimento de mensagem fraudulentas por meio do e-mail de Samir Siviero, diretor-presidente do Instituto Acqua. ','uploads/75b25f16-2f8b-48f9-a254-7f34912ca7a4.jpg',NULL,'2025-09-15 21:42:07'),
(28,'Núcleo de Qualidade e Segurança do Paciente do PSRM promove gincanas para colaboradores em Dia Mundial da Segurança do Paciente','Joelza Silva','\"Cuidado Seguro para Todo Recém-Nascido e Criança\" é o tema do Dia Mundial da Segurança do Paciente 2025, promovido pela Organização Mundial da Saúde (OMS), com o lema \"Segurança do paciente desde o início!\" A campanha, apoiada pela Sociedade Brasileira de  Segurança para a Qualidade do Cuidado e Segurança do Paciente (SOBRASP), e outras instituições, visa conscientizar profissionais de saúde, gestores e a sociedade sobre a importância da segurança do paciente desde os primeiros momentos de vida. Na nossa unidade de saúde, o Dia Mundial da Segurança do Paciente também adotará o tema, e marcará esse dia com gincanas, que terá como público, todos os colaboradores. ','uploads/92807c46-b672-4fb0-b454-77ecd8de5790.jpg',NULL,'2025-09-15 21:56:01'),
(29,'Pronto-Socorro Dr. Roberto Macedo recebe visita de imagem de Nossa Senhora de Nazaré','Joelza Silva','O Pronto-Socorro Dr. Roberto Macedo (PSRM) recebeu, na tarde desta segunda-feira (15)- a imagem de Nossa Senhora de Nazaré, com celebração, cânticos, alegria e fé. Após o momento devocional, realizado na Recepção Eletiva, a imagem foi conduzida ao Pronto Atendimento Adulto, UTI\'s e Unidades de Internação, em revezamento entre gestores e colaboradores. A programação, promovida pela Humanização Hospitalar, é alusiva às atividades do Círio de Nazaré, festa que acontece anualmente, no segundo domingo de outubro. A presença da imagem de Nossa Senhora de Nazaré levou esperança e fé aos pacientes, gerando grande emoção e interação entre a comunidade hospitalar e a padroeira dos paraenses','uploads/0d35676b-e3dd-40ba-8d1a-d4a61f0baa2d.jpg',NULL,'2025-09-15 22:50:59'),
(30,'CRM EMPOSSA COMISSÃO DE ÉTICA MÉDICA DO PSRM','Joelza Silva','A Comissão de Ética Médica do Pronto-Socorro Dr. Roberto Macedo (PSRM) foi empossada nessa terça-feira (16), pelo Conselho Regional de Medicina do Pará (CRM-PA), com os membros efetivos: Dra. Letícia Figueiredo Gomes, Dra. Káthia de Oliveira Harada e Dra. Natália Marques Rodrigues, e com membros suplentes: Dr. Leonardo de Oliveira Rodrigues da Silva e Dr. Elder Barbosa Nylander Aguiar e Dra. Ádria Suelen Cohen de Aguiar.\r\n\r\nA solenidade de posse, realizada na sede do Conselho Regional de Medicina Médica do Pronto Socorro Dr. Roberto Macedo, contou com a presença da presidente do CRM-PA, Dra. Tereza Cristina de Brito Azevedo, e da coordenadora das Comissões de Ética, Dra. Maria do Carmo de Lima Mendes Lobato da entidade. Além dos médicos empossados do PSRM, estiveram presentes o diretor técnico da instituição, Fábio Daniel Pereira Sampaio, e a coordenadora médica da Pediatria, Amely Pinheiro Nogueira.\r\n\r\nSaiba mais: De acordo com o Conselho Federal de Medicina, o papel da comissão de ética médica hospitalar é fiscalizar, educar e orientar sobre o exercício ético e legal da medicina dentro da instituição, atuando como um órgão de apoio aos Conselhos Regionais de Medicina (CRMs) e garantindo a qualidade do atendimento ao paciente, o cumprimento das normas do Código de Ética Médica e a defesa dos direitos dos médicos, segundo a Resolução CFM n.º 2.152/2016. ','uploads/92bdb23d-836d-4e1a-84f2-58f9d79440df.jpg',NULL,'2025-09-17 17:20:59'),
(31,'DIA MUNDIAL DA SEGURANÇA DO PACIENTE','Joelza Silva','O Dia Mundial Da Segurança Do Paciente no PSRM, realizado no dia 17, foi marcado por momentos de aprendizado e reforço sobre as Metas Internacionais de Segurança do Paciente, por meio de dinâmicas que resultou na interação entre profissionais de diversos setores, contribuindo e reforçando a importância de colocar a segurança do paciente em primeiro  lugar, para repercutir na qualidade da assistência aos nossos pacientes, já que cuidar da segurança é um compromisso de todos, todos os dias.','uploads/a1aac5cd-024b-46bf-9eab-e5a1ed74de31.jpg',NULL,'2025-09-19 20:23:29');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES
(1,'Gabriel Nicolas','gnicolasdev@hotmail.com','scrypt:32768:8:1$WtvblpdMp60ocpl7$84764c05f91a2be9cc9df30d4e7548cf64a95dea79ec97f7e5231557fa3a55ae128d4295bf3eb5540756246872e69ec9742d8145d0f5156788b6eed08dfa648e','admin'),
(2,'Anderson Sodré','anderson.sodre@institutoacqua.org.br','scrypt:32768:8:1$v26ZpethISy5iIvQ$3772c6b6421292798305849bf9cd10b6d07c93b8f5902696b3371f23b123003cb5f007a67476dc5f47db657e4b1a12242d97edaafd55734fafed973f2ea85f65','admin'),
(4,'Luiza Braga','luiza@comunicacao.com','scrypt:32768:8:1$xwDBlF7DppLcfTlV$49fb654ca59af9f6e5177fa3f73ccc29b4f122e09a983aac8d832b3363f2772bb0c09af4882db4ce2c4fa47e284959195f76970567ed548f22f796a631c7fd40','comunicacao'),
(5,'Aristonico Neto','aristonico.neto@institutoacqua.org.br','scrypt:32768:8:1$TMRRJrYB9abiW57L$a0772612ae07b872a123f811e06d1d5f2449253e0f3ccab7d5ddfda755fc253e5dc1f34e3d0e79d2c443cf38665e6bc5c665ed9d079f518bd6f9c853533a7c64','comunicacao'),
(6,'Joelza Silva','joelza.silva@institutoacqua.org.br','scrypt:32768:8:1$ZBsgvRQvf0VOISch$c0a35ad65f7145cd907de4b58bfb1819d6ff5b226e08d328b33eba01da88884421a48b94cd2eae0aeece46cb8b7967c31c883468077081df47ef88f166386501','comunicacao');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-20 15:05:38

/*Este dump contiene información de las tablas:
-Admins
-Books
-Carts
-Newsletter
-Orders
-Pricechange
-Users

Y de las vistas:
-brandon_books
-clients
-low_stock
-past_century
-short_books
*/

-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Julián','Lowe','julianlowe@mail.com','contra123'),(2,'Romina','Serrano','romi_serrano@mail.com','cafe52'),(3,'Pilar','Argit','argitp1@mail.com','asdfg13');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'El imperio final','Brandon Sanderson','Fantasy','2006-07-17',541,8500,5),(2,'La comunidad del anillo','J.R.Tolkien','Fantasy','1954-07-29',479,2600,30),(3,'A game of thrones','George R.R. Martin','Fantasy','1996-08-01',694,9611,10),(4,'El resplandor','Stephen King','Terror','1977-01-28',447,6000,20),(5,'El principito','Saint-Exupery','Child books','2006-07-17',541,2200,0),(6,'El camino de los reyes','Brandon Sanderson','Fantasy','2010-08-31',1007,10799,15),(7,'La metamorfosis','Franz Kafka','Relato','1915-10-01',70,1500,5);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'valel@mail.com','El principito'),(2,'danilopez@mail.com','El principito, A game of thrones'),(3,'julip@mail.com','El resplandor');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `newsletter`
--

LOCK TABLES `newsletter` WRITE;
/*!40000 ALTER TABLE `newsletter` DISABLE KEYS */;
INSERT INTO `newsletter` VALUES (3,'julip@mail.com'),(2,'miguef@mail.com'),(1,'pedroper@mail.com');
/*!40000 ALTER TABLE `newsletter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'miguef@mail.com',10799,'El imperio final, La comunidad del anillo'),(2,'pedroper@mail.com',14598,'El imperio final, El resplandor');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pricechange`
--

LOCK TABLES `pricechange` WRITE;
/*!40000 ALTER TABLE `pricechange` DISABLE KEYS */;
INSERT INTO `pricechange` VALUES (1,'2023-03-04 16:54:24',8199,8500,'root@localhost'),(2,'2023-03-04 16:54:24',6399,6000,'root@localhost');
/*!40000 ALTER TABLE `pricechange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Pedro','Pérez','pedroper@mail.com','c15235','Cabildo 1675',1168913576,1),(2,'Miguel','Fernández','miguef@mail.com','c12345','Panamá 332',1197451268,1),(3,'Valeria','López','valel@mail.com','c68421','Catamarca 1125',1146218796,0),(4,'Daniel','Lopez','danilopez@mail.com','c96512','Uruguay 3561',1121532354,0),(5,'Juliana','Pérez','julip@mail.com','c99998','Brasil 275',1168945120,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-06 15:20:14

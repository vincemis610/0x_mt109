DROP TABLE IF EXISTS `actores`;
CREATE TABLE `actores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameActor` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
LOCK TABLES `actores` WRITE;
INSERT INTO `actores` VALUES (1,'Maria Meldes'),(2,'Calvin Chanil'),(3,'Janvy Esquila'),(4,'Kelly Frances'),(5,'Jhonny Gallecki'),(6,'Jim Parsons '),(7,'Kaley Cuoco'),(8,'Frankie Muniz'),(9,'Bryan Cranston'),(10,'Justin Berfiled');
UNLOCK TABLES;

DROP TABLE IF EXISTS `directores`;
CREATE TABLE `directores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreDir` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
LOCK TABLES `directores` WRITE;
INSERT INTO `directores` VALUES (1,'Mark Cendroski'),(2,'Ted Wass'),(3,'Tod Holland'),(4,'Nick Mark'),(5,'Iselis Arzola');
UNLOCK TABLES;

DROP TABLE IF EXISTS `episodios`;
CREATE TABLE `episodios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numEpisodio` int(11) NOT NULL,
  `titulo` varchar(250) NOT NULL,
  `idSerie` int(11) NOT NULL,
  `idActor` int(11) NOT NULL,
  `idDir` int(11) NOT NULL,
  `numTransmisiones` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fk_ep_serie_idx` (`idSerie`),
  KEY `fk_ep_actor_idx` (`idActor`),
  KEY `fk_ep_dir_idx` (`idDir`),
  CONSTRAINT `fk_ep_actor` FOREIGN KEY (`idActor`) REFERENCES `actores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ep_dir` FOREIGN KEY (`idDir`) REFERENCES `directores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ep_serie` FOREIGN KEY (`idSerie`) REFERENCES `series` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
LOCK TABLES `episodios` WRITE;
INSERT INTO `episodios` VALUES (1,1,'Bienvenido',3,1,5,2),(2,1,'Bienvenido',3,2,5,2),(3,1,'Bienvenido',3,3,5,2),(4,1,'Pilot',1,8,3,5),(5,1,'Pilot',1,9,3,5),(6,1,'Pilot',1,10,3,5),(7,2,'Shame',1,8,3,8),(8,2,'Shame',1,9,3,8),(9,2,'Shame',1,10,3,8),(10,2,'Shame',3,2,2,2);
UNLOCK TABLES;

DROP TABLE IF EXISTS `series`;
CREATE TABLE `series` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreSerie` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
LOCK TABLES `series` WRITE;
INSERT INTO `series` VALUES (1,'Malcolm el de en medio '),(2,'La teoria del big bang'),(3,'Big Sister');
UNLOCK TABLES;


/* == WICH ACTORS PLAY IN THE SERIES BIG SISTER ? == */

SELECT a.nameActor FROM actores AS a 
JOIN episodios AS e ON  a.id = e.idActor
JOIN series AS s ON s.id = e.idSerie WHERE s.nombreSerie = 'Big Sister';

/* == WICH DIRECTOR HAS DIRECTED THE GREATEST NUMBER OF EPISODE ? == */

SELECT d.nombreDir, count(DISTINCT(e.titulo)) AS total FROM directores AS d JOIN episodios AS e ON d.id = e.idDir GROUP BY d.nombreDir ORDER BY total DESC;
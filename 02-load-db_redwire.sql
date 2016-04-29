USE `db_redwire`;

/* chargement des données de base de la table t_client */
LOAD DATA INFILE 'D://client.csv' INTO TABLE t_client CHARACTER SET 'latin1'  FIELDS TERMINATED BY ';'IGNORE 1 LINES SET idClient=NULL;

/* chargement des données de base de la table t_supplier */
LOAD DATA INFILE 'D://supplier.csv' INTO TABLE t_supplier CHARACTER SET 'latin1' FIELDS TERMINATED BY ';' IGNORE 1 LINES SET idSupplier=NULL;

/* chargement des données de la table t_article  et mise à jour des dépendances avec t_supplier */
LOAD DATA INFILE 'D://article.csv' INTO TABLE t_article CHARACTER SET 'latin1' FIELDS TERMINATED BY ';' IGNORE 1 LINES SET idArticle=NULL, fkSupplier=NULL;
UPDATE `t_article` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='Distrelec') WHERE artDescription='Acer K130';
UPDATE `t_article` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='Pctop') WHERE artDescription='Acer P1320W';
UPDATE `t_article` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='ABBOInformatique') WHERE artDescription='G.Skill DDR3 1333MHz 8GB';
UPDATE `t_article` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='ABBOInformatique') WHERE artDescription='Patriot Memory DDR3 1866MHz 8GB';
UPDATE `t_article` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='Steg') WHERE artDescription='MSI Gaming GT60';
UPDATE `t_article` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='1000Ordi') WHERE artDescription='Corsair SO-DDR3 1333MHz 4GB';
UPDATE `t_article` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='Pctop') WHERE artDescription='Samsung T27A750 5';
UPDATE `t_article` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='Distrelec') WHERE artDescription='Gigabyte GT 620 HD';
UPDATE `t_article` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='Pctop') WHERE artDescription='Gigabyte Z77X-UD5H-WB';
UPDATE `t_article` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='1000Ordi') WHERE artDescription='Acer Aspire E1-571';
UPDATE `t_article` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='Pctop') WHERE artDescription='Gigabyte Z77X-UD5H-WB';










/* chargement des données de la table t_suppliercontact  et mise à jour des dépendances avec t_supplier */
LOAD DATA INFILE 'D://suppliercontact.csv' INTO TABLE t_suppliercontact  CHARACTER SET 'latin1' FIELDS TERMINATED BY ';' IGNORE 1 LINES SET idContact=NULL, fkSupplier=NULL;
UPDATE `t_suppliercontact` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='Distrelec') WHERE conName='Duran' AND conFirstName='Pierre';
UPDATE `t_suppliercontact` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='Pctop') WHERE conName='Dupond' AND conFirstName='Jean-Pierre';
UPDATE `t_suppliercontact` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='ABBOInformatique') WHERE conName='De Pasquale' AND conFirstName='Flavio';
UPDATE `t_suppliercontact` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='ABBOInformatique') WHERE conName='Deleze' AND conFirstName='Jérémie';
UPDATE `t_suppliercontact` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='ABBOInformatique') WHERE conName='Evesque' AND conFirstName='Michaël';
UPDATE `t_suppliercontact` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='1000Ordi') WHERE conName='Grandjean' AND conFirstName='Alicia';
UPDATE `t_suppliercontact` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='1000Ordi') WHERE conName='Huguenin' AND conFirstName='Yoann';
UPDATE `t_suppliercontact` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='Distrelec') WHERE conName='Mosca' AND conFirstName='Alexandre';
UPDATE `t_suppliercontact` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='Pctop') WHERE conName='Panchaud' AND conFirstName='Gaël';
UPDATE `t_suppliercontact` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='ABBOInformatique') WHERE conName='Pantoja' AND conFirstName='Alexander';
UPDATE `t_suppliercontact` SET `fkSupplier`= (SELECT idSupplier FROM t_supplier WHERE supName='Distrelec') WHERE conName='Grand' AND conFirstName='Maxime';










/* insertion des données de la table t_order en utilisant les dépendances avec t_client */
INSERT INTO `t_order` (idOrder,ordDate,fkClient) VALUES  (NULL,'2015-12-01',(SELECT(idClient) FROM t_client WHERE cliName='Bossel' AND cliFirstName='Jérémy'));
INSERT INTO `t_order` (idOrder,ordDate,fkClient) VALUES  (NULL,'2016-02-11',(SELECT(idClient) FROM t_client WHERE cliName='Rochat' AND cliFirstName='Louis'));
INSERT INTO `t_order` (idOrder,ordDate,fkClient) VALUES  (NULL,'2016-01-03',(SELECT(idClient) FROM t_client WHERE cliName='Geinoz' AND cliFirstName='Loïc'));
INSERT INTO `t_order` (idOrder,ordDate,fkClient) VALUES  (NULL,'2015-10-10',(SELECT(idClient) FROM t_client WHERE cliName='Rochat' AND cliFirstName='Louis'));
INSERT INTO `t_order` (idOrder,ordDate,fkClient) VALUES  (NULL,'2015-07-23',(SELECT(idClient) FROM t_client WHERE cliName='Gnanasekaram' AND cliFirstName='Tharsshan'));
INSERT INTO `t_order` (idOrder,ordDate,fkClient) VALUES  (NULL,'2015-11-02',(SELECT(idClient) FROM t_client WHERE cliName='Casas' AND cliFirstName='David'));
INSERT INTO `t_order` (idOrder,ordDate,fkClient) VALUES  (NULL,'2014-05-05',(SELECT(idClient) FROM t_client WHERE cliName='Nébzoin' AND cliFirstName='Jean'));
INSERT INTO `t_order` (idOrder,ordDate,fkClient) VALUES  (NULL,'2015-04-03',(SELECT(idClient) FROM t_client WHERE cliName='Népasbzoin' AND cliFirstName='Jean'));
INSERT INTO `t_order` (idOrder,ordDate,fkClient) VALUES  (NULL,'2014-02-17',(SELECT(idClient) FROM t_client WHERE cliName='Le Labousse' AND cliFirstName='Emilie'));
INSERT INTO `t_order` (idOrder,ordDate,fkClient) VALUES  (NULL,'2015-11-30',(SELECT(idClient) FROM t_client WHERE cliName='Junior Branco' AND cliFirstName='David'));











/* insertion des données de la table t_orderdetail en utilisant les dépendances avec t_article et t_client, ainsi que les quantités */
INSERT INTO `t_orderdetail` (idfkArticle, idfkOrder, detQuantity) VALUES ((SELECT idArticle FROM t_article WHERE artDescription='Acer K130'),(SELECT idOrder FROM t_order AS o INNER JOIN t_client AS c ON o.fkClient=c.idClient WHERE ordDate='2015-12-01'), 34);
INSERT INTO `t_orderdetail` (idfkArticle, idfkOrder, detQuantity) VALUES ((SELECT idArticle FROM t_article WHERE artDescription='G.Skill DDR3 1333MHz 8GB'),(SELECT idOrder FROM t_order AS o INNER JOIN t_client AS c ON o.fkClient=c.idClient WHERE ordDate='2016-02-11'), 43);
INSERT INTO `t_orderdetail` (idfkArticle, idfkOrder, detQuantity) VALUES ((SELECT idArticle FROM t_article WHERE artDescription='MSI Gaming GT60'),(SELECT idOrder FROM t_order AS o INNER JOIN t_client AS c ON o.fkClient=c.idClient WHERE ordDate='2016-01-03'), 4);
INSERT INTO `t_orderdetail` (idfkArticle, idfkOrder, detQuantity) VALUES ((SELECT idArticle FROM t_article WHERE artDescription='Corsair SO-DDR3 1333MHz 4GB'),(SELECT idOrder FROM t_order AS o INNER JOIN t_client AS c ON o.fkClient=c.idClient WHERE ordDate='2015-10-10'), 654);
INSERT INTO `t_orderdetail` (idfkArticle, idfkOrder, detQuantity) VALUES ((SELECT idArticle FROM t_article WHERE artDescription='Acer P1320W'),(SELECT idOrder FROM t_order AS o INNER JOIN t_client AS c ON o.fkClient=c.idClient WHERE ordDate='2015-07-23'), 32);
INSERT INTO `t_orderdetail` (idfkArticle, idfkOrder, detQuantity) VALUES ((SELECT idArticle FROM t_article WHERE artDescription='Corsair SO-DDR3 1333MHz 4GB'),(SELECT idOrder FROM t_order AS o INNER JOIN t_client AS c ON o.fkClient=c.idClient WHERE ordDate='2015-11-02'), 12);
INSERT INTO `t_orderdetail` (idfkArticle, idfkOrder, detQuantity) VALUES ((SELECT idArticle FROM t_article WHERE artDescription='Gigabyte GT 620 HD'),(SELECT idOrder FROM t_order AS o INNER JOIN t_client AS c ON o.fkClient=c.idClient WHERE ordDate='2014-05-05'), 3);
INSERT INTO `t_orderdetail` (idfkArticle, idfkOrder, detQuantity) VALUES ((SELECT idArticle FROM t_article WHERE artDescription='Samsung T27A750 5'),(SELECT idOrder FROM t_order AS o INNER JOIN t_client AS c ON o.fkClient=c.idClient WHERE ordDate='2015-04-03'), 4);
INSERT INTO `t_orderdetail` (idfkArticle, idfkOrder, detQuantity) VALUES ((SELECT idArticle FROM t_article WHERE artDescription='G.Skill DDR3 1333MHz 8GB'),(SELECT idOrder FROM t_order AS o INNER JOIN t_client AS c ON o.fkClient=c.idClient WHERE ordDate='2014-02-17'), 12);
INSERT INTO `t_orderdetail` (idfkArticle, idfkOrder, detQuantity) VALUES ((SELECT idArticle FROM t_article WHERE artDescription='Acer K130'),(SELECT idOrder FROM t_order AS o INNER JOIN t_client AS c ON o.fkClient=c.idClient WHERE ordDate='2015-11-30'), 5);

DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `profile` VALUES ('1', 'cyper');
INSERT INTO `profile` VALUES ('2', 'green');
INSERT INTO `profile` VALUES ('3', 'kitten');

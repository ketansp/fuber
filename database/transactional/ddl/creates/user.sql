CREATE TABLE `fubertransactional`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `name` VARCHAR(255) NOT NULL COMMENT '',
  `contact_number` INT(10) NOT NULL COMMENT '',
  `created_date` DATETIME NOT NULL COMMENT '',
  `last_modified_date` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id_user`)  COMMENT '');

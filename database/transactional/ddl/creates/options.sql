CREATE TABLE `fubertransactional`.`options` (
  `id_options` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `value` INT NOT NULL COMMENT '',
  `label` VARCHAR(255) NOT NULL COMMENT '',
  `code` VARCHAR(255) NOT NULL COMMENT '',
  `created_date` DATETIME NOT NULL COMMENT '',
  `last_modified_date` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id_options`)  COMMENT '');
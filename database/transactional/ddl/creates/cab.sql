CREATE TABLE `fubertransactional`.`cab` (
  `id_cab` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `cab_number` INT NOT NULL COMMENT '',
  `id_cab_status` TINYINT NOT NULL COMMENT 'value from options table',
  `id_colour` TINYINT NOT NULL COMMENT 'value from options table',
  `driver_name` VARCHAR(255) NOT NULL COMMENT '',
  `driver_contact_number` INT(10) NOT NULL COMMENT '',
  `current_latitude` DECIMAL(10,8) NOT NULL COMMENT '',
  `current_longitude` DECIMAL(10,8) NOT NULL COMMENT '',
  `created_date` DATETIME NOT NULL COMMENT '',
  `last_modified_date` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id_cab`)  COMMENT '');

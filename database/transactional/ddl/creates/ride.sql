CREATE TABLE `fubertransactional`.`ride` (
  `id_ride` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `start_time` DATETIME NOT NULL COMMENT '',
  `start_latitude` DECIMAL(10,8) NOT NULL COMMENT '',
  `start_longitude` DECIMAL(10,8) NOT NULL COMMENT '',
  `end_time` DATETIME NULL COMMENT '',
  `end_latitude` DECIMAL(10,8) NULL COMMENT '',
  `end_longitude` DECIMAL(10,8) NULL COMMENT '',
  `fk_id_cab` INT NOT NULL COMMENT '',
  `fk_id_user` INT NOT NULL COMMENT '',
  `id_ride_status` TINYINT NOT NULL COMMENT 'value from options table',
  `amount` DOUBLE NULL COMMENT '',
  `created_date` DATETIME NOT NULL COMMENT '',
  `last_modified_date` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id_ride`)  COMMENT '',
  INDEX `fk_ride_cab_idx` (`fk_id_cab` ASC)  COMMENT '',
  INDEX `fk_ride_user_idx` (`fk_id_user` ASC)  COMMENT '',
  CONSTRAINT `fk_ride_cab`
    FOREIGN KEY (`fk_id_cab`)
    REFERENCES `fubertransactional`.`cab` (`id_cab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ride_user`
    FOREIGN KEY (`fk_id_user`)
    REFERENCES `fubertransactional`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

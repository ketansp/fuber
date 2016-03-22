DELIMITER $$;

DROP PROCEDURE IF EXISTS fubertransactional.start_ride;
 
CREATE PROCEDURE fubertransactional.start_ride(
    IN in_id_user INT,
    IN in_id_cab INT,
    IN in_start_latitude DECIMAL(10,8),
	IN in_start_longitude DECIMAL(10,8)
)

BEGIN
DECLARE v_error_flag Boolean default false;
DECLARE v_error_message Varchar(255) default null;
DECLARE v_id_ride INT;
DECLARE v_user_count INT;
DECLARE v_cab_count INT;


DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
          ROLLBACK;
    END;

START TRANSACTION;

select count(1) into v_user_count from user where user.id_user = in_id_user;

IF(v_user_count=0)THEN

	set v_error_flag = true;
	set v_error_message = "INVALIDUSER";

END IF;

select count(1) into v_cab_count from cab where cab.id_cab = in_id_cab and cab.id_status = 1;

IF(v_cab_count=0)THEN

	set v_error_flag = true;
	set v_error_message = "INVALIDCAB";

END IF;

select v_error_flag as errorFlag, v_error_message as errorMessage;

IF(v_error_flag=false)THEN
	insert into ride (start_time, start_latitude, start_longitude, fk_id_cab, fk_id_user, id_ride_status)
	values(now(), in_start_latitude, in_start_longitude, in_id_cab, in_id_user, 1);
	
	select last_insert_id() into v_id_ride;
	
	update cab set id_cab_status = 2 where id_cab= in_id_cab;
	
	commit;
	
	select v_id_ride as idRide;
	
END IF;

END

$$;
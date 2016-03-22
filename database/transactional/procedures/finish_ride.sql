DELIMITER $$;

DROP PROCEDURE IF EXISTS fubertransactional.finish_ride;
 
CREATE PROCEDURE fubertransactional.finish_ride(
    IN in_id_ride INT,
    IN in_end_latitude DECIMAL(10,8),
	IN in_end_longitude DECIMAL(10,8)
)

BEGIN
DECLARE v_error_flag Boolean default false;
DECLARE v_error_message Varchar(255) default null;
DECLARE v_ride_count INT;
DECLARE v_amount Double default 0.0;
DECLARE v_id_cab INT;
DECLARE v_id_colour INT;
DECLARE v_start_time DATETIME;
DECLARE v_start_latitude DECIMAL(10,8);
DECLARE v_start_longitude DECIMAL(10,8);


DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    BEGIN
          ROLLBACK;
    END;

START TRANSACTION;

select count(1) into v_ride_count from ride where ride.id_ride = in_id_ride and id_ride_status = 1;

IF(v_ride_count=0)THEN

	set v_error_flag = true;
	set v_error_message = "INVALIDRIDE";

END IF;

select v_error_flag as errorFlag, v_error_message as errorMessage;

IF(v_error_flag=false)THEN
	update ride set end_time = now(), end_latitude = in_end_latitude, end_longitude = in_end_longitude,
	id_ride_status = 2 where id_ride = in_id_ride;
	
	select fk_id_cab , start_time, start_latitude, start_longitude into v_id_cab, v_start_time, 
	v_start_latitude, v_start_longitude from ride where id_ride = in_id_ride;
	
	select id_colour into v_id_colour from cab where id_cab = v_id_cab;
	
	update cab set id_cab_status = 1, current_latitude = in_end_latitude, current_longitude = in_end_longitude where id_cab= v_id_cab;
	
	set v_amount = ( TIMESTAMPDIFF(MINUTE, v_start_time ,now()) * 1) 
	+ (calculate_distance(v_start_latitude, v_start_longitude, in_end_latitude, end_longitude) * 2);
	
	IF(v_id_colour=1)THEN

		set v_amount = v_amount + 5;

	END IF;
	
	update ride set amount = v_amount where id_ride = in_id_ride;
	
	commit;
	
	select v_amount as amount;
	
END IF;

END

$$;
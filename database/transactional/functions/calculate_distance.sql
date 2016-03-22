
DELIMITER $$;

DROP FUNCTION IF EXISTS fubertransactional.calculate_distance;

CREATE FUNCTION fubertransactional.calculate_distance  (first_latitude DECIMAL(10,8) ,
														first_longitude DECIMAL(10,8) ,
														second_latitude DECIMAL(10,8) ,
														second_longitude DECIMAL(10,8)) 
RETURNS VARCHAR(255)

BEGIN

DECLARE v_return_value DOUBLE;

  select (SQRT((POWER((first_latitude - second_latitude),2) + POWER((first_longitude - second_longitude),2))) * 40000 ) into v_return_value;
  ##multiplying by a constant to convert the distance into kilometers
  return v_return_value;

END

$$;


DELIMITER $$;

DROP FUNCTION IF EXISTS fubertransactional.get_options_label;

CREATE FUNCTION fubertransactional.get_options_label  (in_value INT ,
                                  in_code VARCHAR(255)) 
RETURNS VARCHAR(255)

BEGIN

DECLARE v_return_value VARCHAR(255);

  select options.label into v_return_value from dyupletransactional.options options where options.value = in_value and options.code = in_code;
  
  return v_return_value;

END

$$;

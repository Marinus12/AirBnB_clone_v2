USE hbnb_dev_db;

SET FOREIGN_KEY_CHECKS = 0;

-- Get the list of tables
SELECT concat('DROP TABLE IF EXISTS ', table_name, ';') 
FROM information_schema.tables 
WHERE table_schema = 'hbnb_dev_db';

-- Execute the drop table statements
-- You can copy the output of the previous query and execute it manually

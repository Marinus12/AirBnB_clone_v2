-- Create the database if it dies not exist
CREATE  DATABASE IF NOT EXISTS hbnb_test_db;

-- Create the user if it doesn't exist and set the password
CREATE USER IF NOT EXISTS 'hbnb_test'@'localhost' IDENTIFIED BY 'hbnb_test_pwd';

-- Grant all privileges on the database hbnb_test_db to the user hbnb_test
GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_test'@'localhost';

-- Grant SELECT privilege on the performance_schema database to the
-- user_hbnb_test
GRANT SELECT ON performance_schema.* TO 'hbnb_test'@'localhost';

-- Grant necessary privileges to execute SHOW DATABASES command
GRANT SHOW DATABASES ON *.* TO 'hbnb_test'@'localhost';

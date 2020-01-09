DROP DATABASE IF EXISTS homestead;
DROP USER IF EXISTS homestead;
CREATE DATABASE homestead;
CREATE USER 'homestead'@'%' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON homestead.* TO 'homestead'@'%';
FLUSH PRIVILEGES;
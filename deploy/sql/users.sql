CREATE USER 'mdbadmin'@'%' IDENTIFIED BY 'really_secure_password';
GRANT ALL PRIVILEGES ON *.* TO 'mdbadmin'@'%';

CREATE DATABASE world;
CREATE DATABASE `reward_test`;
CREATE DATABASE `reward_production`;
CREATE DATABASE `reward_development`;
CREATE USER 'reward'@'%' IDENTIFIED BY "orange1";
GRANT ALL ON `reward_test`.* TO 'reward'@'%' IDENTIFIED BY "orange1";
GRANT ALL ON `reward_production`.* TO 'reward'@'%' IDENTIFIED BY "orange1";
GRANT ALL ON `reward_development`.* TO 'reward'@'%' IDENTIFIED BY "orange1";
FLUSH PRIVILEGES;


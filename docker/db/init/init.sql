-- create application writable user (master)
CREATE USER IF NOT EXISTS 'master'@'%' IDENTIFIED BY 'master';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, REFERENCES
  ON `cake`.* TO 'master'@'%';

-- create read-only user (replica/app readonly)
CREATE USER IF NOT EXISTS 'readonly'@'%' IDENTIFIED BY 'readonly';
GRANT SELECT ON `cake`.* TO 'readonly'@'%';

-- cake_test データベースの作成
CREATE DATABASE IF NOT EXISTS cake_test;

-- test ユーザーの作成と権限付与
CREATE USER 'test'@'%' IDENTIFIED BY 'test';
GRANT ALL PRIVILEGES ON cake_test.* TO 'test'@'%';

FLUSH PRIVILEGES;
-- create application writable user (master)
CREATE USER IF NOT EXISTS 'master'@'%' IDENTIFIED BY 'master';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, REFERENCES
  ON `cake`.* TO 'master'@'%';

-- create read-only user (replica/app readonly)
CREATE USER IF NOT EXISTS 'readonly'@'%' IDENTIFIED BY 'readonly';
GRANT SELECT ON `cake`.* TO 'readonly'@'%';

FLUSH PRIVILEGES;
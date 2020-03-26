
set db=enhanceIT;

CREATE DATABASE IF NOT EXISTS  ${hiveconf:db};

use ${hiveconf:db};

CREATE TABLE IF NOT EXISTS consultants (
id INT,
name VARCHAR(200),
email VARCHAR(200),
phone VARCHAR(200),
city VARCHAR(200),
department_name VARCHAR(200)

) 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ','
;


set file="/media/sf_ubpgDrive/temp/consultant.csv";
load data local inpath  ${hiveconf:file} into table consultants;

select * from consultants limit 10;


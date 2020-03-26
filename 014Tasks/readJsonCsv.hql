

add jar /usr/local/hive3/lib/hive-json-serde.jar;
SET hive.variable.substitute.depth=100;
set db=enhanceIT;

CREATE DATABASE IF NOT EXISTS  ${hiveconf:db};

use ${hiveconf:db};

set table=department;

CREATE TABLE IF NOT EXISTS ${hiveconf:table}  (
id string,
deptName string,
manager string,
techManager string
) 

ROW FORMAT SERDE "org.apache.hadoop.hive.contrib.serde2.JsonSerde"
WITH SERDEPROPERTIES (
  "id"="$.id",
  "deptName"="$.deptName",
  "manager"="$.manager",
  "techManager"="$.techManager" 
);


set file="/media/sf_ubpgDrive/temp/department.json";

--select ${hiveconf:file};
load data local inpath ${hiveconf:file} into table  ${hiveconf:table} ;

select * from  ${hiveconf:table}  limit 10;


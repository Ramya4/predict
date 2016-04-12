create external table weather_2007_stg
(
station string,
date_measured string,
metric string,
value int,
t1 string,
t2 string,
t3 string,
time string
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '44' 
STORED AS TEXTFILE LOCATION '/apps/predict/data/weather_2007';

create table weather_2007
(
station string,
date_measured string,
metric string,
value int,
t1 string,
t2 string,
t3 string,
time string
)stored as orc;


insert into weather_2007 select * from weather_2007_stg;



create external table ord_stg_2007
(
delay int,
month int,
day int,
dayOfWeek int,
timeOfDay int,
distance int,
temp_min int,
temp_max int)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '44' 
STORED AS TEXTFILE LOCATION '/ml/airline_delay/ord/2007/';


create table ord_2007
(
delay int,
month int,
day int,
dayOfWeek int,
timeOfDay int,
distance int,
temp_min int,
temp_max int)
stored as orc;


insert into table ord_2007 select * from ord_stg_2007;
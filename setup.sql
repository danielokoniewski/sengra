create table if not exists sensors (
    id integer primary key,
    sensor_id varchar(29) null,
    sensor_desc varchar(50) null
);


create table if not exists sensordata (
    id integer primary key,
    measuretime timestamp default current_timestamp,
    sensor_id varchar(29) null,
    sensor integer null,
    value varchar(20) null,
    value_num decimal null,
);

--alter table [sensordata] add column sensor integer null;
--alter table [sensordata] add column value_num decimal null;

drop trigger if exists [tUpdateValue];
create trigger if not exists [tUpdateValue] 
    after insert on [sensordata]
    begin
	-- update sensors
        insert into sensors(sensor_id)
        select distinct sensor_id
        from sensordata
        except
        select sensor_id
        from sensors;

        update [sensordata]
	set [value_num] = cast(value as decimal)/1000.0
	where value_num is null;

	update sensordata
	set [sensor] = 
		(select id 
		 from [sensors]
	 	 where [sensors].sensor_id = [sensordata].sensor_id)
	where sensor is null;
    end;

use enhanceIT;


INSERT INTO departments SELECT * from  (
select get_json_object(str,'$.id') as id,
	get_json_object(str,'$.department_name'),
	get_json_object(str,'$.consultant_id'),
	get_json_object(str,'$.manager'),
	get_json_object(str,'$.tech_manager')
	
 from departmentsJSON

) as tmp;

select * from departments;


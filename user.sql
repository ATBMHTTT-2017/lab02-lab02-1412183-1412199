GRANT CONNECT, RESOURCE, CREATE SESSION TO PUBLIC;
/*Nhân viên bình thường*/	
-- 9,27,45,63,81,...
BEGIN
	FOR stf_id IN (
					Select Staff_id from Staff
					where Staff_id not in (
										Select depart_chief from Department)
							AND Staff_id not in (Select Branch_director from Branch)
							AND Staff_id not in (Select Project_leader from Project) )
	LOOP
		EXECUTE IMMEDIATE 'CREATE USER ' || stf_id.Staff_id|| ' IDENTIFIED BY ' || stf_id.Staff_id;
	END LOOP;
END;

/*trưởng phòng*/
--3,7,17,21,25,35,39,42,52,56,60,70,74,78,88;
BEGIN
	FOR chief IN (Select depart_chief from Department)
	LOOP
		EXECUTE IMMEDIATE 'CREATE USER ' || chief.depart_chief || ' IDENTIFIED BY ' || chief.depart_chief;
	END LOOP;
END;

/*trưởng chi nhánh*/
--8,26,43,61,79
BEGIN
	FOR drt IN (Select Branch_director from Branch)
	LOOP
		EXECUTE IMMEDIATE 'CREATE USER ' || drt.Branch_director || ' IDENTIFIED BY ' || drt.Branch_director;
	END LOOP;
END;

/*trưởng dự án*/
--6,24,41,59,77
BEGIN
	FOR ldr IN (Select Project_leader from Project)
	LOOP
		EXECUTE IMMEDIATE 'CREATE USER ' || ldr.Project_leader || ' IDENTIFIED BY ' || ldr.Project_leader;
	END LOOP;
END;

/*Giám đốc*/
CREATE USER GD001 IDENTIFIED BY "DIRECTOR";
CREATE USER GD002 IDENTIFIED BY "DIRECTOR";
CREATE USER GD003 IDENTIFIED BY "DIRECTOR";
CREATE USER GD004 IDENTIFIED BY "DIRECTOR";
CREATE USER GD005 IDENTIFIED BY "DIRECTOR";

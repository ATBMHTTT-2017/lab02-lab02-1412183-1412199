	--Số chi nhánh: 5
	--1 Cần Thơ	--2 Hồ Chí Minh	--3 Đà Nẵng	--4 Hải Phòng --5 Hà Nội
	execute Insert_New_Branch (1,N'Cần Thơ',NULL,NULL);
	execute Insert_New_Branch (2,N'Hồ Chí Minh',NULL,NULL);
	execute Insert_New_Branch (3,N'Đà Nẵng',NULL,NULL);
	execute Insert_New_Branch (4,N'Hải Phòng',NULL,NULL);
	execute Insert_New_Branch (5,N'Hà Nội',NULL,NULL);
	select count(*) from branch;
	--Mỗi chi nhánh có 3 phòng ban Kế Toán (4 nhân viên), Kế Hoạch(4 NV), Nhân Sự(10 NV)
	exec Insert_New_Department(1,N'Kế Toán',NULL,1,0,NULL);
	exec Insert_New_Department(2,N'Kế Hoạch',NULL,1,0,NULL);
	exec Insert_New_Department(3,N'Nhân Sự',NULL,1,0,NULL);
	exec Insert_New_Department(4,N'Kế Toán',NULL,2,0,NULL);
	exec Insert_New_Department(5,N'Kế Hoạch',NULL,2,0,NULL);
	exec Insert_New_Department(6,N'Nhân Sự',NULL,2,0,NULL);
	exec Insert_New_Department(7,N'Kế Toán',NULL,3,0,NULL);
	exec Insert_New_Department(8,N'Kế Hoạch',NULL,3,0,NULL);
	exec Insert_New_Department(9,N'Nhân Sự',NULL,3,0,NULL);
	exec Insert_New_Department(10,N'Kế Toán',NULL,4,0,NULL);
	exec Insert_New_Department(11,N'Kế Hoạch',NULL,4,0,NULL);
	exec Insert_New_Department(12,N'Nhân Sự',NULL,4,0,NULL);
	exec Insert_New_Department(13,N'Kế Toán',NULL,5,0,NULL);
	exec Insert_New_Department(14,N'Kế Hoạch',NULL,5,0,NULL);
	exec Insert_New_Department(15,N'Nhân Sự',NULL,5,0,NULL);
	select count(*) from Department;
	--delete from staff;
	--(Phòng Kế Toán,Chi Nhánh Cần Thơ) => (1,1)
	execute Insert_New_Staff('xxxxxxxxx1','John',NULL,'099xxxxxxx',16000000,1,sysdate,1);
	execute Insert_New_Staff('xxxxxxxxx2','Robert',NULL,'0166xxxxxxx',28000000,1,sysdate,1);
	execute Insert_New_Staff('xxxxxxxxx3','David',NULL,'098xxxxxxx',14000000,1,sysdate,1);
	execute Insert_New_Staff('xxxxxxxxx4','Brian',NULL,'098xxxxxxx',14000000,1,sysdate,1);
	--(Phòng Kế Hoạch,Chi Nhánh Cần Thơ) => (1,2)
	execute Insert_New_Staff('xxxxxxxxx5','Richard',NULL,'096xxxxxxx',16000000,2,sysdate,1);
	execute Insert_New_Staff('xxxxxxxxx6','Charles',NULL,'098xxxxxxx',14000000,2,sysdate,1);
	execute Insert_New_Staff('xxxxxxxxx7','Joseph',NULL,'098xxxxxxx',14000000,2,sysdate,1);
	execute Insert_New_Staff('xxxxxxxxx8','Ronald',NULL,'096xxxxxxx',16000000,2,sysdate,1);
	--(Phòng Nhân Sự,Chi Nhánh Cần Thơ) => (1,3)
	execute Insert_New_Staff('xxxxxxxxx9','Thomas',NULL,'099xxxxxx1',28000000,3,sysdate,1);
	execute Insert_New_Staff('xxxxxxxx10','Christopher	',NULL,'0164xxxxxx9',9000000,3,sysdate,1);
	execute Insert_New_Staff('xxxxxxxx11','Daniel',NULL,'0168xxxxxx0',13000000,3,sysdate,1);
	execute Insert_New_Staff('xxxxxxxx12','Paul',NULL,'0168xxxxxxx',13000000,3,sysdate,1);
	execute Insert_New_Staff('xxxxxxxx13','Mark',NULL,'098xxxxxxx',14000000,3,sysdate,1);
	execute Insert_New_Staff('xxxxxxxx14','Donald',NULL,'096xxxxxxx',16000000,3,sysdate,1);
	execute Insert_New_Staff('xxxxxxxx15','George',NULL,'099xxxxxx1',28000000,3,sysdate,1);
	execute Insert_New_Staff('xxxxxxxx16','Kenneth',NULL,'0164xxxxxx9',9000000,3,sysdate,1);
	execute Insert_New_Staff('xxxxxxxx17',' Steven',NULL,'0168xxxxxx0',13000000,3,sysdate,1);
	execute Insert_New_Staff('xxxxxxxx18','Edward',NULL,'0168xxxxxxx',13000000,3,sysdate,1);
	--select count(*) from staff;
	--(Phòng Kế Toán,Chi Nhánh Hồ Chí Minh) => (4,2)
	execute Insert_New_Staff('xxxxxxxx19','Kevin',NULL,'0168xxxxxx0',13000000,4,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx20','Jason',NULL,'098xxxxxxx',14000000,4,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx21','Jeff',NULL,'096xxxxxxx',16000000,4,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx22','Arthur',NULL,'098xxxxxxx',14000000,4,sysdate,2);
	--(Phòng Kế Hoạch,Chi Nhánh Hồ Chí Minh) => (5,2)
	execute Insert_New_Staff('xxxxxxxx23','Gary',NULL,'099xxxxxx1',28000000,5,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx24','Timothy',NULL,'0168xxxxxx0',13000000,5,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx25','Larry',NULL,'0168xxxxxxx',13000000,5,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx26','Ryan',NULL,'096xxxxxxx',16000000,5,sysdate,2);
	--(Phòng Nhân Sự,Chi Nhánh Hồ Chí Minh) => (6,2)
	execute Insert_New_Staff('xxxxxxxx27','Frank',NULL,'098xxxxxxx',14000000,7,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx28','Scott',NULL,'096xxxxxxx',16000000,7,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx29','Eric',NULL,'099xxxxxx1',28000000,7,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx30','Andrew',NULL,'0168xxxxxx0',13000000,7,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx31','Raymond',NULL,'0168xxxxxxx',13000000,7,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx32','Dennis',NULL,'098xxxxxxx',14000000,7,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx33','Walter',NULL,'096xxxxxxx',16000000,7,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx34','Peter',NULL,'099xxxxxx1',28000000,7,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx35','Harold',NULL,'0168xxxxxx0',13000000,7,sysdate,2);
	execute Insert_New_Staff('xxxxxxxx36','Henry',NULL,'0168xxxxxxx',13000000,7,sysdate,2);
	--select count(*) from staff;
	--(Phòng Kế Toán,Chi Nhánh Đà Nẵng) => (7,3)
	execute Insert_New_Staff('xxxxxxxx37','Joe',NULL,'0168xxxxxx0',13000000,7,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx38','Juan',NULL,'0168xxxxxxx',13000000,7,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx39','Jack',NULL,'098xxxxxxx',14000000,7,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx40','Albert',NULL,'096xxxxxxx',16000000,7,sysdate,3);
	--(Phòng Kế Hoạch,Chi Nhánh Đà Nẵng) => (8,3)
	execute Insert_New_Staff('xxxxxxxx41','Jonathan Juan',NULL,'099xxxxxx1',28000000,8,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx42','Justin',NULL,'0120xxxxxxx',14000000,8,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx43','Samuel',NULL,'099xxxxxxx',16000000,8,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx44','Travis',NULL,'0166xxxxxxx',28000000,8,sysdate,3);
	--(Phòng Nhân sự,Chi Nhánh Đà Nẵng) => (9,3)
	execute Insert_New_Staff('xxxxxxxx45','Lewis',NULL,'0164xxxxxxx',9000000,9,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx46','Vincent',NULL,'0168xxxxxxx',13000000,9,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx47','Allen',NULL,'098xxxxxxx',14000000,9,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx48','Mary',NULL,'096xxxxxxx',16000000,9,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx49','Patricia',NULL,'099xxxxxx1',28000000,9,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx50','Linda',NULL,'0164xxxxxx9',9000000,9,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx51','Barbara',NULL,'0168xxxxxx0',13000000,9,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx52','Elizabeth',NULL,'0168xxxxxxx',13000000,9,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx53','Jennifer',NULL,'098xxxxxxx',14000000,9,sysdate,3);
	execute Insert_New_Staff('xxxxxxxx54','Maria',NULL,'096xxxxxxx',16000000,9,sysdate,3);
	--select count(*) from staff;
	--(Phòng Kế Toán,Chi Nhánh Hải Phòng) => (10,4)
	execute Insert_New_Staff('xxxxxxxx55','Susan',NULL,'096xxxxxxx',16000000,10,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx56','Margaret',NULL,'099xxxxxx1',28000000,10,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx57','Dorothy',NULL,'0164xxxxxx9',9000000,10,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx58','Nancy',NULL,'0168xxxxxx0',13000000,10,sysdate,4);
	--(Phòng Kế Hoach,Chi Nhánh Hải Phòng) => (11,4)
	execute Insert_New_Staff('xxxxxxxx59','KarenK',NULL,'0168xxxxxxx',13000000,11,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx60','BettyB',NULL,'098xxxxxxxx',14000000,11,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx61','HelenLa',NULL,'096xxxxxxxx',16000000,11,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx62','Sandrat',NULL,'099xxxxxx1x',28000000,11,sysdate,4);
	--(Phòng Nhân sự,Chi Nhánh Hải Phòng) => (12,4)
	execute Insert_New_Staff('xxxxxxxx63','Carol',NULL,'0168xxxxxx0',13000000,12,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx64','Sharon',NULL,'0168xxxxxxx',13000000,12,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx65','Michelle',NULL,'098xxxxxxx',14000000,12,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx66','Laura',NULL,'096xxxxxxx',16000000,12,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx67','Sarah',NULL,'099xxxxxx1',28000000,12,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx68','Kimberly',NULL,'0168xxxxxx0',13000000,12,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx69','Jessica',NULL,'0168xxxxxxx',13000000,12,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx70','Shirley',NULL,'098xxxxxxx',14000000,12,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx71','Cynthia',NULL,'096xxxxxxx',16000000,12,sysdate,4);
	execute Insert_New_Staff('xxxxxxxx72','Christina',NULL,'099xxxxxx1',28000000,12,sysdate,4);
	--(Phòng Kế Toán,Chi Nhánh Hà Nội) => (13,5)
	execute Insert_New_Staff('xxxxxxxx73','Katherine',NULL,'0168xxxxxx0',13000000,13,sysdate,5);
	execute Insert_New_Staff('xxxxxxxx74','Rose',NULL,'0168xxxxxxx',13000000,13,sysdate,5);
	execute Insert_New_Staff('xxxxxxxx75','Janice',NULL,'098xxxxxxx',14000000,13,sysdate,5);
	execute Insert_New_Staff('xxxxxxxx76','Irene',NULL,'096xxxxxxx',16000000,13,sysdate,5);
	--(Phòng Kế Hoạch,Chi Nhánh Hà Nội) => (14,5)
	execute Insert_New_Staff('xxxxxxxx77','Rachel',NULL,'099xxxxxx1',28000000,14,sysdate,5);
	execute Insert_New_Staff('xxxxxxxx78','Marilyn',NULL,'0168xxxxxx0',13000000,14,sysdate,5);
	execute Insert_New_Staff('xxxxxxxx79','Kathryn',NULL,'0168xxxxxxx',13000000,14,sysdate,5);
	execute Insert_New_Staff('xxxxxxxx80','Louise',NULL,'098xxxxxxx',14000000,14,sysdate,5);
	--(Phòng Nhân sự,Chi Nhánh Hà Nội) => (15,5)
  	execute Insert_New_Staff('xxxxxxxx81','Jacqueline',NULL,'096xxxxxxx',16000000,15,sysdate,5);
  	execute Insert_New_Staff('xxxxxxxx82','Ruby',NULL,'099xxxxxx1',28000000, 15,sysdate,5);
	execute Insert_New_Staff('xxxxxxxx83','Tina',NULL,'0168xxxxxx0',13000000,15,sysdate,5);
  	execute Insert_New_Staff('xxxxxxxx84','Annie',NULL,'0168xxxxxxx',13000000, 15,sysdate,5);
	execute Insert_New_Staff('xxxxxxxx85','Emily',NULL,'098xxxxxxx',14000000, 15,sysdate,5);
	execute Insert_New_Staff('xxxxxxxx86','Crystal',NULL,'096xxxxxxx',16000000, 15,sysdate,5);
	execute Insert_New_Staff('xxxxxxxx87','Connie',NULL,'099xxxxxx1',28000000, 15,sysdate,5);
	execute Insert_New_Staff('xxxxxxxx88','Tiffany',NULL,'099xxxxxx1',28000000, 15,sysdate,5);
	execute Insert_New_Staff('xxxxxxxx89','Victoria',NULL,'099xxxxxx1',28000000, 15,sysdate,5);
	execute Insert_New_Staff('xxxxxxxx90','Sylvia',NULL,'099xxxxxx1',28000000, 15,sysdate,5);
	select count(*) from Staff;
	-- cập nhật các trưởng chi nhánh-chọn giám đốc phòng kế hoạch làm trưởng chi nhánh
	--trưởng chi nhánh Cần Thơ là giám đốc phòng Kế Hoạch
	exec Update_Branch_Director(1,'xxxxxxxxx8');
	exec Update_Branch_Director(2,'xxxxxxxx26');
	exec Update_Branch_Director(3,'xxxxxxxx43');
	exec Update_Branch_Director(4,'xxxxxxxx61');
	exec Update_Branch_Director(5,'xxxxxxxx79');
	select Branch_director as truongchinhanh,Branch_name as chinhanh from Branch;
	--cập nhật trưởng phòng
	exec Update_Depart_Chief(1,'xxxxxxxxx3');
	exec Update_Depart_Chief(2,'xxxxxxxxx7');
	exec Update_Depart_Chief(3,'xxxxxxxx17');
	exec Update_Depart_Chief(4,'xxxxxxxx21');
	exec Update_Depart_Chief(5,'xxxxxxxx25');
	exec Update_Depart_Chief(6,'xxxxxxxx35');
	exec Update_Depart_Chief(7,'xxxxxxxx39');
	exec Update_Depart_Chief(8,'xxxxxxxx42');
	exec Update_Depart_Chief(9,'xxxxxxxx52');
	exec Update_Depart_Chief(10,'xxxxxxxx56');
	exec Update_Depart_Chief(11,'xxxxxxxx60');
	exec Update_Depart_Chief(12,'xxxxxxxx70');
	exec Update_Depart_Chief(13,'xxxxxxxx74');
	exec Update_Depart_Chief(14,'xxxxxxxx78');
	exec Update_Depart_Chief(15,'xxxxxxxx88');
	select Depart_id, Depart_branch, Depart_name, Depart_Total_Staff,Depart_Chief,Depart_chief_start_date from Department;
	--insert dự án
	exec Insert_New_Project(1,'Proj1', 900000000,2,'xxxxxxxxx6',0)
	exec Insert_New_Project(2,'Proj2',1100000000,5,'xxxxxxxx24',0)
  	exec Insert_New_Project(3,'Proj3',1300000000,8,'xxxxxxxx41',0)
	exec Insert_New_Project(4,'Proj4',2200000000,11,'xxxxxxxx59',0)
	exec Insert_New_Project(5,'Proj5',4600000000,14,'xxxxxxxx77',0)
	select count(*) from Project;
	--insert phân công
	exec Insert_New_Assignment('xxxxxxxxx6',1,'Leader',100000000)
	exec Insert_New_Assignment('xxxxxxxxx1',1,N'Kế Toán',33000000)
	exec Insert_New_Assignment('xxxxxxxxx5',1,N'trợ tá-Kế hoạch',12000000)
	exec Insert_New_Assignment('xxxxxxxxx9',1,N'khảo sát thị trường',23000000)
	exec Insert_New_Assignment('xxxxxxxx10',1,N'giải phóng mặt bằng',49000000)
	exec Insert_New_Assignment('xxxxxxxx11',1,N'Quan trắc Địa hình',480000000)
	exec Insert_New_Assignment('xxxxxxxx24',2,'Leader',120000000)
	exec Insert_New_Assignment('xxxxxxxx19',2,N'Kế Toán',33000000)
	exec Insert_New_Assignment('xxxxxxxx23',2,N'trợ tá-Kế hoạch',12000000)
	exec Insert_New_Assignment('xxxxxxxx27',2,N'Khảo sát thổ nhưỡng',23000000)
	exec Insert_New_Assignment('xxxxxxxx28',2,N'Dân vận',49000000)
	exec Insert_New_Assignment('xxxxxxxx29',2,N'Vận hành máy móc',480000000)
	exec Insert_New_Assignment('xxxxxxxx41',3,'Leader',90000000)
	exec Insert_New_Assignment('xxxxxxxx37',3,N'Kế Toán',33000000)
	exec Insert_New_Assignment('xxxxxxxx40',3,N'trợ tá-Kế hoạch',12000000)
	exec Insert_New_Assignment('xxxxxxxx44',3,N'p/c sau nhé',23000000)
	exec Insert_New_Assignment('xxxxxxxx45',3,N'p/c sau nhé',49000000)
	exec Insert_New_Assignment('xxxxxxxx46',3,N'p/c sau nhé',480000000)
	exec Insert_New_Assignment('xxxxxxxx59',4,'Leader',130000000)
	exec Insert_New_Assignment('xxxxxxxx54',4,N'Kế Toán',33000000)
	exec Insert_New_Assignment('xxxxxxxx58',4,N'Trợ lí kế hoạch',12000000)
	exec Insert_New_Assignment('xxxxxxxx62',4,N'p/c sau nhé',23000000)
	exec Insert_New_Assignment('xxxxxxxx63',4,N'p/c sau nhé',49000000)
	exec Insert_New_Assignment('xxxxxxxx64',5,N'p/c sau nhé',339000000)
	exec Insert_New_Assignment('xxxxxxxx51',5,'Asis-Leader',33000000)
	exec Insert_New_Assignment('xxxxxxxx72',5,N'Kế Toán',12000000)
	exec Insert_New_Assignment('xxxxxxxx76',5,N'Trợ lí kế hoạch',23000000)
	exec Insert_New_Assignment('xxxxxxxx80',5,'Dev-1',49000000)
	exec Insert_New_Assignment('xxxxxxxx81',5,'Dev-2',480000000)
	exec Insert_New_Assignment('xxxxxxxx82',5,'Dev-2',480000000)
	select count(*) from Assignment;
	--insert into chi tiêu
	exec Insert_New_Charge(1,'market survey',400000,1,'xxxxxxxxx9')
	exec Insert_New_Charge(2,'food for OT',300000,1,'xxxxxxxx11')
	exec Insert_New_Charge(3,'food for OT',100000,2,'xxxxxxxx27')
	exec Insert_New_Charge(4,'food for OT',360000,2,'xxxxxxxx29')
	exec Insert_New_Charge(5,'upgrade hhd',3000000,3,'xxxxxxxx44')
	exec Insert_New_Charge(6,'upgrade hhd',360000,3,'xxxxxxxx46')
	exec Insert_New_Charge(7,'rent something',600000,4,'xxxxxxxx62')
	exec Insert_New_Charge(8,'rent something',360000,4,'xxxxxxxx64')
	exec Insert_New_Charge(9,'medical',800000,5,'xxxxxxxx80')
	exec Insert_New_Charge(10,'medical',360000,5,'xxxxxxxx82')
	select count(*) from Charge;
	select Project_name,Proj_total_expenditure from Project;
	-- Delete from Charge;
	-- Delete from Assignment;
	-- Delete from Project;
	-- Delete from Staff;
	-- Delete from Department;
	-- Delete from Branch;

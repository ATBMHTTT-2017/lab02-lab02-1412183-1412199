--VP2:Truong Du An chi duoc phep doc, ghi thong tin chi tieu cua du an minh quan ly
--Tao ham chinh sach cho VP2

create or replace function CRU_Charge_Project (p_schema varchar2, p_object varchar2)
return varchar2
as
  getUser varchar2(10);
  getMaDA number;
	flag number;
begin
    getUser := sys_context('  userenv', 'session_user');
    getUser := LOWER(getUser);
    select count(*) into flag from Project
    where Project_leader = getUser;
    -- if(LOWER(getUser) = 'xxxxxxxx59') THEN
    -- return 'Proj_id = ' ||To_Char(4); 
    -- else
    -- return 'Proj_id = ' ||To_Char(2); 
    if flag > 0 then
    select Project_id into getMaDA from Project where Project_leader = getUser;
    return 'Proj_id = ' || To_Char(getMaDA);
    else return 'Proj_id = ' ||To_Char(2); 
    end if;
end;

  
--Gan chinh sach vao bang Charge
begin
  dbms_rls.add_policy
  (
      object_schema => 'OwnerDB',
      object_name => 'Charge',
      policy_name => 'VPD_2',
      policy_function => 'CRU_Charge_Project',
      statement_types => 'select, update, insert, delete',
      update_check => TRUE    
  );
end;


--DROp
drop function CRU_Charge_Project;
BEGIN
 dbms_rls.drop_policy
(
  object_schema=>'OwnerDB' ,
  object_name=>'Charge',
  policy_name=>'VPD_2'                     
);
END;

--update infor bảng Charge
update Charge set HASH_KEY = Hash_key('pwd_boeing_737') where Proj_id = 1;
update Charge set HASH_KEY = Hash_key('pwd_boeing_747') where Proj_id = 2;
update Charge set HASH_KEY = Hash_key('pwd_boeing_757') where Proj_id = 3;
update Charge set HASH_KEY = Hash_key('pwd_boeing_767') where Proj_id = 4;
update Charge set HASH_KEY = Hash_key('pwd_boeing_787') where Proj_id = 5;

-- Update cột ENCRYPT_AMOUNT trong bảng Charge
update Charge set ENCRYPT_AMOUNT = encrypt_amount_charge(TO_CHAR(Amount),'pwd_boeing_737') where Proj_id = 1;
update Charge set ENCRYPT_AMOUNT = encrypt_amount_charge(TO_CHAR(Amount),'pwd_boeing_747') where Proj_id = 2;
update Charge set ENCRYPT_AMOUNT = encrypt_amount_charge(TO_CHAR(Amount),'pwd_boeing_757') where Proj_id = 3;
update Charge set ENCRYPT_AMOUNT = encrypt_amount_charge(TO_CHAR(Amount),'pwd_boeing_767') where Proj_id = 4;
update Charge set ENCRYPT_AMOUNT = encrypt_amount_charge(TO_CHAR(Amount),'pwd_boeing_787') where Proj_id = 5;

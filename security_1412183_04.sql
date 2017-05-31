-- Thêm cột hash_key và số tiền bị mã hóa vào bảng Charge
alter table Charge
ADD
(
	HASH_KEY  varchar2(512),
	ENCRYPT_AMOUNT  varchar2(512)
);

--Hàm tạo HASH KEY
create or replace function Hash_key(p_key IN VARCHAR2) return RAW DETERMINISTIC
IS
r_key RAW(128) := UTL_RAW.cast_to_raw(p_key);
r_HASH raw(1024);
BEGIN
	r_HASH := dbms_crypto.hash(src => r_key,typ => dbms_crypto.HASH_SH1);
	return r_HASH;
END Hash_key;


-- Hàm Encrypt
create or replace function encrypt_amount_charge(p_data IN VARCHAR2,p_key IN VARCHAR2) return RAW DETERMINISTIC
IS
r_key RAW(128) := UTL_RAW.cast_to_raw(p_key);
r_data raw(1024) := utl_raw.cast_to_raw(p_data);
r_encrypted raw(1024);

BEGIN
	r_encrypted := dbms_crypto.encrypt(src => r_data,typ => dbms_crypto.DES_CBC_PKCS5,key => r_key);
	return r_encrypted;
END encrypt_amount_charge;

--- Hàm Decrypt
create or replace function decrypt_amount_charge(p_data IN VARCHAR2,p_hash_key in VARCHAR2,p_key IN VARCHAR2) return VARCHAR2 DETERMINISTIC
IS
r_key RAW(128) := UTL_RAW.cast_to_raw(p_key);
r_decrypted raw(1024);
r_HASH raw(1024);

BEGIN
	r_HASH := dbms_crypto.hash(src => r_key,typ => dbms_crypto.HASH_SH1);
	if (r_HASH = p_hash_key) then
	r_decrypted := dbms_crypto.decrypt(src => p_data,typ => dbms_crypto.DES_CBC_PKCS5,key => r_key);
	return utl_raw.cast_to_varchar2(r_decrypted);
	else
		return TO_CHAR(p_data);
	end if;
END decrypt_amount_charge;

-- Update cột Hash_key trong bảng Charge
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

select * from Charge;
-- test
--SELECT HASH_KEY, ENCRYPT_AMOUNT,AMOUNT  FROM Charge;
--visual case
select
decrypt_amount_charge(ENCRYPT_AMOUNT, HASH_KEY, 'pwd_boeing_737')
from Charge
where PROJ_ID=1;
--non visual case
select
decrypt_amount_charge(ENCRYPT_AMOUNT, HASH_KEY, 'pwd_boeing_738')
from Charge
where PROJ_ID=1;

alter table Staff
  ADD
  (
    Staff_Salary_encrypt varchar2(200);
  );
--Specification
drop PACKAGE CRYPT01;
CREATE OR REPLACE PACKAGE CRYPT01 IS
  FUNCTION ENCRYPT_SALARY(p_data IN VARCHAR2,encrytion_Key IN VARCHAR2) RETURN RAW DETERMINISTIC;
  FUNCTION DECRYPT_SALARY(p_encrytpedData IN VARCHAR2,encrytion_Key IN VARCHAR2) RETURN NUMBER DETERMINISTIC;
END CRYPT01;

--Body
CREATE OR REPLACE PACKAGE BODY CRYPT01 IS
  encryption_type PLS_INTEGER :=
							 DBMS_CRYPTO.ENCRYPT_DES
							+DBMS_CRYPTO.CHAIN_CBC
							+DBMS_CRYPTO.PAD_PKCS5;

  FUNCTION ENCRYPT_SALARY(p_data IN VARCHAR2,encrytion_Key IN VARCHAR2) RETURN RAW DETERMINISTIC
  IS
  	encrypted_raw raw(1024);
  BEGIN
       encrypted_raw := dbms_crypto.encrypt(
          src => utl_raw.cast_to_raw(p_data),
          typ => encryption_type,
          key => utl_raw.cast_to_raw(encrytion_Key)
      );
      return encrypted_raw;
  END ENCRYPT_SALARY;

  FUNCTION DECRYPT_SALARY(p_encrytpedData IN VARCHAR2,encrytion_Key IN VARCHAR2) RETURN NUMBER DETERMINISTIC
  IS
    decrypted_raw raw(1024);
  BEGIN

       decrypted_raw := dbms_crypto.decrypt(
          src => p_encrytpedData,
          typ => encryption_type,
          key => utl_raw.cast_to_raw(encrytion_Key)
      );

      return utl_raw.cast_to_VARCHAR2(decrypted_raw);
  END DECRYPT_SALARY;

END CRYPT01;

--3: update table Staff
BEGIN
	FOR stf_id IN (Select Staff_id from Staff )
	LOOP
    UPDATE STAFF
        SET Staff_Salary_encrypt = CRYPT01.ENCRYPT_SALARY(Staff_Salary, Staff_id)
      WHERE Staff_ID = stf_id.Staff_ID;
	END LOOP;
END;
--test
select staff_salary_encrypt from Staff where Staff_depart=1;
select * from Staff where staff_id ='xxxxxxxxx2';
--4B92E41A8306867B
SELECT  CRYPT01.DECRYPT_SALARY(Staff_Salary_encrypt, Staff_ID)FROM STAFF St Where STAFF_ID = 'xxxxxxxxx2';
SELECT  CRYPT01.DECRYPT_SALARY(Staff_Salary_encrypt, Staff_ID)FROM STAFF St;

--TEST
create view staff_view_itsInfor

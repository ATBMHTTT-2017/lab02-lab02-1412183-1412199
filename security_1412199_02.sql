--thêm cột chữ kí vào bảng Assignment
ALTER TABLE Assignment
ADD 
(
  signature RAW(2000)
);

--Hàm tạo chữ kí
CREATE OR REPLACE FUNCTION create_signature
(
  create_signature IN NUMBER,
  private_key in CLOB
)
return RAW

AS
  signature RAW(2000);
BEGIN
        signature := ORA_RSA.SIGN(
                                    message => UTL_I18N.STRING_TO_RAW(create_signature, 'AL32UTF8'),
                                    private_key => UTL_RAW.cast_to_raw(private_key),
                                    hash => ORA_RSA.HASH_SHA256
                                 );
  return signature;
END;

 
--Hàm check chữ kí
create or replace function examine_signature
(
 create_signature in number,
 in_signature in raw,
 public_key in CLOB
)
return RAW

AS
  check_res PLS_INTEGER;
BEGIN	
    check_res := ORA_RSA.VERIFY(
                                message => UTL_I18N.STRING_TO_RAW(create_signature, 'AL32UTF8'), 
                                signature => in_signature, 
                                public_key => UTL_RAW.cast_to_raw(public_key),
                                HASH => ORA_RSA.HASH_SHA256
                                );
 
    if check_res = 1 then
       return 'Signature examined successfull'; 
    else
       return 'Signature examined failed'; 
    END if;

  EXCEPTION
   WHEN ORA_RSA.RSA_EXCEPTION then
     BEGIN
       if ORA_RSA.GET_RSA_ERROR() = ORA_RSA.RSA_WRONG_PASSWORD_ERR then
         DBMS_OUTPUT.PUT_LINE('The password for the private key is not matching: ' || SQLERRM);
       ELSIF ORA_RSA.GET_RSA_ERROR() = ORA_RSA.RSA_KEY_ERR then
         DBMS_OUTPUT.PUT_LINE('The provided key is not a valid RSA key.');
       ELSIF ORA_RSA.GET_RSA_ERROR() = ORA_RSA.RSA_ENCRYPTION_ERR then
         DBMS_OUTPUT.PUT_LINE('Error when performing RSA operation: ' || SQLERRM);
       ELSIF ORA_RSA.GET_RSA_ERROR() = ORA_RSA.RSA_GENERAL_IO_ERR then
         DBMS_OUTPUT.PUT_LINE('I/O error: ' || SQLERRM);
       END if;
     END;
 
   WHEN OTHERS then
     DBMS_OUTPUT.PUT_LINE('General error : ' || SQLERRM );
END;

--tạo chữ kí
declare
  private_key CLOB := '-----BEGIN PRIVATE KEY-----
dsfisdf2542iksdfsdfsdfsdfsdfsdfsddsf/sdfsdfsdfiewriwer2324899sf9s9fsf9sJJHSDS
DSAKDSADSADAKSDJSKADJKASDJKASDJAKSDJASKDJAKSDJKSD/SDSADWEWEW34erdsfdfdfdfdfdf/
TSFDSdsadasdWEDSDsDssdsdsdasdasdasdasdasdasdadasdasdasda/sdadqwesdqweqwrtgrf
-----END PRIVATE KEY-----';

  update Assignment set signature= create_signature(0.9,private_key) 
    where Staff_id='xxxxxxxxx1';
  update Assignment set signature= create_signature(0.8,private_key)
   where Staff_id='xxxxxxxxx5';
  update Assignment set signature= create_signature(0.7,private_key) 
    where Staff_id='xxxxxxxx10';
  update Assignment set signature= create_signature(0.5,private_key) 
    where Staff_id='xxxxxxxx11';

--kiểm tra
declare
  public_key CLOB := '-----BEGIN PUBLIC KEY-----
sdsdsRUEURDSHDSHDHSHDHSD34343483483843848384838438dsjdjsjdjsjdjDSD
dadsad2r727rdfuxudcuxcuxuzcuzxucuzuxcuzxuczxucuxzucuzuxXZXZXZXZXZX
XZXZXZXZWEEWE#$#%#RWSDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD@#@$#$#$WDEWD
-----END PUBLIC KEY-----';
sign raw(2000);
alw double;
getUser varchar2(10);
 getUser := sys_context('  userenv', 'session_user');
    getUser := LOWER(getUser);
  select allowance into alw from OwnerDB.Assignment where Staff_id = getUser;
	  OwnerDB.examine_signature(alw, sign, public_key); 
END;

grant execute on examine_signature to Staff_Normal;

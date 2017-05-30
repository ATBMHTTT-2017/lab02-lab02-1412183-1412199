--VP2:Truong Du An chi duoc phep doc, ghi thong tin chi tieu cua du an minh quan ly
--Tao ham chinh sach cho VP2
CREATE OR REPLACE FUNCTION VPD_ProjLeader_Charge (p_schema VARCHAR2, p_obj VARCHAR2)
RETURN VARCHAR2
AS
  user VARCHAR2(100);
  Prj_id VARCHAR2(10);
  icount NUMBER;
BEGIN
  user:= SYS_CONTEXT('userenv','SESSION_USER');
  SELECT COUNT(*) INTO icount FROM Department WHERE Depart_chief= user;
  IF(icount > 0) THEN
    RETURN '';
  ELSE
    BEGIN
     SELECT Project_id INTO Prj_id FROM Project WHERE Project_Leader = user;
     RETURN 'Proj_id='|| q'[']' || Prj_id || q'[']';
    END;
  END IF;
  EXCEPTION
      WHEN OTHERS THEN RETURN '1 = 0';
END;

BEGIN
 dbms_rls.add_policy(object_schema=>'OwnerDB'	,
                        object_name=>'Charge',
                        policy_name=>'VPD_2',
                        function_schema=>'OwnerDB',
                        policy_function=>'VPD_ProjLeader_Charge',
                        statement_types=>'select,update,insert',
                        update_check=>TRUE);
END;
--SELECT VALUE FROM V$DIAG_INFO WHERE NAME = 'Default Trace File';
grant select, update,insert on Charge to Project_Leader;
  select * from Charge;
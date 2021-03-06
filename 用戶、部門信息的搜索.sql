select u.USERNAME,u.TRUENAME,u.DEPTCODE,t.MAIL,t.TELEPHONE 
from TB_USER u left join USER_T t on u.USERNAME=t.USER_ID 
where 1=1

and u.deptcode in (SELECT A.DEPARTMENTCODE FROM EDI.TB_DEPARTMENT A,EDI.TB_BU B,EDI.TB_SITE C 
where A.BUCODE=B.BUCODE and B.SITECODE=C.SITECODE and C.SITENAME='LH' and B.BUNAME='PSD');


select F.USERNAME,F.TRUENAME,F.DEPTCODE,F.MAIL,F.TELEPHONE,A.DEPARTMENTNAME,B.BUNAME,C.SITENAME,F.ADDDATE

from EDI.TB_DEPARTMENT A,EDI.TB_BU B,EDI.TB_SITE C, 
    (select u.USERNAME USERNAME,u.TRUENAME TRUENAME,u.DEPTCODE DEPTCODE,U.ADDDATE ADDDATE,t.MAIL MAIL,t.TELEPHONE TELEPHONE
     from TB_USER u left join USER_T t on u.USERNAME=t.USER_ID)F

where A.BUCODE=B.BUCODE and B.SITECODE=C.SITECODE and F.DEPTCODE=A.DEPARTMENTCODE 

and F.DEPTCODE in (SELECT A.DEPARTMENTCODE FROM EDI.TB_DEPARTMENT A,EDI.TB_BU B,EDI.TB_SITE C 
    where A.BUCODE=B.BUCODE and B.SITECODE=C.SITECODE and C.SITENAME='LH' and B.BUNAME='PSD');
    
    
    
SELECT S.SITENAME,B.BUNAME,D.DEPARTMENTNAME,D.DEPARTMENTCODE
FROM TB_DEPARTMENT D,TB_BU B,TB_SITE S 
where D.BUCODE=B.BUCODE and B.SITECODE=S.SITECODE
    and S.SITENAME!='ALL' and B.BUNAME!='ALL' and D.DEPARTMENTNAME!='ALL'
    --and D.DEPARTMENTNAME='NPI';
    and S.SITENAME='LH';-- and B.BUNAME='MLBII';
    
    
SELECT  S.SITENAME,B.BUNAME
FROM TB_BU B,TB_SITE S 
where B.SITECODE=S.SITECODE
    and S.SITENAME!='ALL' and B.BUNAME!='ALL'
    and S.SITENAME='CD';
    
select * from tb_user where TB_USER.USERNAME='F9907740';

select * from tb_user where TB_USER.USERNAME='�d�­x';

select * from user_t where USER_T.USER_ID='F9907740'; 

select count(*) from tb_user;
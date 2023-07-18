	--TBL_VOTE_202005
	V_JUMIN
	V_NAME
	v_NO
	v_TIME
	v_AREA
	v_CONFIRM
	
	--TBL_MEMBER_202005
	M_NO
	M_NAME
	P_CODE
	P_SCHOOL
	M_JUMIN
	M_CITY
	
	--TBL_PARTY_202005
	P_CODE
	P_NAME
	P_INDATE
	P_READER
	P_TEL1
	P_TEL2
	P_TEL3

CREATE table TBL_VOTE_202005(
	V_JUMIN CHAR(13) PRIMARY KEY,
	V_NAME VARCHAR(20),
	v_NO CHAR(1),
	v_TIME CHAR(4),
	v_AREA CHAR(20),
	v_CONFIRM CHAR(1)
);
CREATE table TBL_MEMBER_202005(
	M_NO CHAR(1) PRIMARY KEY,
	M_NAME VARCHAR(20),
	P_CODE CHAR(2),
	P_SCHOOL CHAR(1),
	M_JUMIN CHAR(13),
	M_CITY VARCHAR(20)
);
CREATE table TBL_PARTY_202005(
	P_CODE CHAR(2) PRIMARY KEY,
	P_NAME VARCHAR(20),
	P_INDATE DATE,
	P_READER VARCHAR(20),
	P_TEL1 CHAR(3),
	P_TEL2 CHAR(4),
	P_TEL3 CHAR(4)
);

INSERT INTO TBL_MEMBER_202005 VALUES('1','김후보','P1','1','6603011999991','수선화동');
INSERT INTO TBL_MEMBER_202005 VALUES('2','이후보','P2','3','5503011999992','민들레동');
INSERT INTO TBL_MEMBER_202005 VALUES('3','박후보','P3','2','7703011999993','나팔꽃동');
INSERT INTO TBL_MEMBER_202005 VALUES('4','조후보','P4','2','8803011999994','진달래동');
INSERT INTO TBL_MEMBER_202005 VALUES('5','최후보','P5','3','9903011999995','개나리동');

INSERT INTO TBL_PARTY_202005 VALUES('P1','A정당',TO_DATE('2010-01-01','YYYY-MM-DD'),'위대표','02','1111','0001');
INSERT INTO TBL_PARTY_202005 VALUES('P2','B정당',TO_DATE('2010-02-01','YYYY-MM-DD'),'명대표','02','1111','0002');
INSERT INTO TBL_PARTY_202005 VALUES('P3','C정당',TO_DATE('2010-03-01','YYYY-MM-DD'),'기대표','02','1111','0003');
INSERT INTO TBL_PARTY_202005 VALUES('P4','D정당',TO_DATE('2010-04-01','YYYY-MM-DD'),'옥대표','02','1111','0004');
INSERT INTO TBL_PARTY_202005 VALUES('P5','E정당',TO_DATE('2010-05-01','YYYY-MM-DD'),'임대표','02','1111','0005');

--MemberDTO
select 
	m.M_NO,
	m.M_NAME,
	p.P_name,
	case m.P_SCHOOL 
		when '1' then '고졸' 
		when '2' then '학사' 
		when '3' then '석사'  
		when '4' then '박사' end p_school,
	substr(m.M_JUMIN,1,6)||'-'||substr(m.M_JUMIN,6) m_jumin,
	m.M_CITY,trim(p.P_TEL1)||'-'||p.P_TEL2||'-'||p.P_TEL3 as TEL 
	from TBL_MEMBER_202005 m, TBL_PARTY_202005 p 
	where m.p_code=p.p_code;


--VoteDTO
select V_NAME,
	 case 
	 	when substr(V_JUMIN,7,8)= '1' or substr(V_JUMIN,7,8)='2' then'19' 
	 	when substr(V_JUMIN,7,8)= '3' or substr(V_JUMIN,7,8)='4' then'20'end || 
	 	substr(V_JUMIN,1,3)||'년'||substr(V_JUMIN,3,5)||'월'||substr(V_JUMIN,5,7)||'일생' as birth,
	 extract(year from sysdate) - 
	 '만 '||to_number(
	 	case when substr(V_JUMIN,7,8)= '1' or substr(V_JUMIN,7,8)='2' then'19' 
	 		 when substr(V_JUMIN,7,8)= '3' or substr(V_JUMIN,7,8)='4' then'20'end||
	 		 substr(V_JUMIN,1,3)) ||'살' as age,
	 case when substr(V_JUMIN,7,8)= '1' or substr(V_JUMIN,7,8)='3' then'남자' 
	 	  when substr(V_JUMIN,7,8)= '2' or substr(V_JUMIN,7,8)='4' then'여자'end as gender,
	 v_NO,
	 substr(v_TIME,1,3)||':'||substr(v_TIME,3) as time,
	 case v_CONFIRM 
	 	when 'Y' then '확인' 
	 	when 'N' then '미확인' end 
	 from TBL_VOTE_202005 where v_AREA='제1투표장';
	 
--RankDTO
select m.M_NO,
	m.M_NAME,
	count(v.v_NO) as tot
from TBL_MEMBER_202005 m join TBL_VOTE_202005 v on m.M_NO=v.V_NO  
where v.V_CONFIRM != 'N'
GROUP BY m.M_NO,m.M_NAME 
ORDER BY tot desc;
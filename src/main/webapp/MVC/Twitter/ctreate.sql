drop sequence twitter_seq;
drop table twitter;
drop table twitter_login;

create table twitter_login(
	id 		varchar2(20) constraint twitter_login_id_pk primary key,
	passwd 	varchar2(20) constraint twitter_login_id_nn not null,
	name 	varchar2(15) constraint twitter_login_name_nn not null
);

insert into twitter_login
values('longlee', '6789', '�̼���');

insert into twitter_login
values('gdhong', '1234', 'ȫ�浿');

insert into twitter_login
values('yakim', '4567', '�迬��');

commit;

select * from twitter_login;

create table twitter(
	no	 		number(7)		 constraint twitter_no_pk primary key
,	id	 		varchar2(20) 	 constraint twitter_id_fk references twitter_login (id)
,	message	 	varchar2(300)	 constraint twitter_message_nn not null
,	create_date  date			 default sysdate
);

create sequence twitter_seq
	start with 1
	increment by 1
	maxvalue 9999999
	nocycle;
	
insert into twitter(no, id, message)
values(twitter_seq.nextval,'longlee', 'ù ��° Ʈ�� �Դϴ�.');

insert into twitter(no, id, message)
values(twitter_seq.nextval,'gdhong', '�� ��° Ʈ�� �Դϴ�.');

commit;

select * from twitter;

select Twitter.id || '@' ||  name as id_name, message, to_char(create_date, 'YYYY/MM/DD HH24:MI:SS') as cdatetime
from Twitter inner join Twitter_login
	on Twitter.id= Twitter_login.id;
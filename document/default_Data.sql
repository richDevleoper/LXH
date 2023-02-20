insert into tb_menu
select 1,1,0,0,0,'메뉴관리','Y','CSL','EMPTY',null,null,'','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 2,1,1,1,1,'관리자메뉴관리','','CSL','URL',null,null,'/csl/menu/manage.do?menuTyp=CSL','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 3,1,1,2,1,'기본사이트메뉴관리','','CSL','URL',0,0,'/csl/menu/manage.do?menuTyp=DEF','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 4,2,0,0,0,'회원관리','Y','CSL','EMPTY',0,0,'','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 5,2,4,1,1,'권한관리','','CSL','URL',0,0,'/csl/user/auth/list.do','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 6,2,4,2,1,'관리자관리','','CSL','URL',0,0,'/csl/user/mngr/list.do','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 7,2,4,3,1,'개인회원관리','Y','CSL','URL',null,null,'/csl/user/genr/list.do','','N','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 8,2,4,4,1,'기업회원관리','Y','CSL','URL',null,null,'/csl/user/corp/list.do','','N','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 9,3,0,0,0,'게시판관리','Y','CSL','URL',0,0,'/csl/board/list.do','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 10,4,0,0,0,'메인화면관리','Y','CSL','EMPTY',0,0,'','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 11,4,10,1,1,'팝업관리','','CSL','URL',0,0,'/csl/popup/list.do','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 12,4,10,2,1,'링크관리','Y','CSL','URL',null,null,'/csl/link/list.do','','N','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 13,4,10,3,1,'배너관리','Y','CSL','URL',null,null,'/csl/banner/list.do','','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 14,5,0,0,0,'컨텐츠관리','Y','CSL','URL',0,0,'/csl/content/list.do','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 15,6,0,0,0,'코드관리','Y','CSL','URL',0,0,'/csl/codegrp/list.do','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 16,7,0,0,0,'통계관리','Y','CSL','EMPTY',0,0,'','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 17,7,16,1,1,'기본사이트통계','','CSL','EMPTY',0,0,'','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 18,7,17,1,2,'기본사이트통계(접속별)','','CSL','URL',null,null,'/csl/stat/siteVisit.do?statTyp=DEF','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();
insert into tb_menu
select 19,7,17,2,2,'기본사이트통계(언어별)','','CSL','URL',null,null,'/csl/stat/siteLang.do?statTyp=DEF','LIST','Y','','','','','','','','','admin','2013-03-31 00:00:00','admin',sysdate();
insert into tb_menu
select 20,7,17,3,2,'기본사이트통계(국가별)','','CSL','URL',null,null,'/csl/stat/siteCntry.do?statTyp=DEF','LIST','Y','','','','','','','','','admin','2013-04-01 00:00:00','admin',sysdate();
insert into tb_menu
select 21,7,16,2,1,'기본사이트메뉴통계','','CSL','URL',null,null,'/csl/stat/menu.do?menuTyp=DEF','LIST','Y','','','','','','','','','admin',sysdate(),'admin',sysdate();




insert into tb_mngr_user
select 'admin','5ec341a5d20954a4b43db6bff37a7f41ec7268e07369ec02bd4fd5c2e0732fb3','김관리','','','','B01','ROLE_MNGR_ADMIN',sysdate(),sysdate(),null;


insert into tb_user_auth
select 'ROLE_MNGR_ADMIN','전체관리자','MNGR_USER',1,'Y','admin',sysdate(),'',sysdate();
insert into tb_user_auth
select 'ROLE_MNGR_DEFAULT','관리자_기본','MNGR_USER',3,'Y','admin',sysdate(),'',sysdate();



insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',1,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',2,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',3,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',4,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',5,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',6,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',7,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',8,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_DEFAULT',9,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',9,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',10,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',11,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',12,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',13,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',14,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_DEFAULT',14,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',15,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',16,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_DEFAULT',16,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',17,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',18,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',19,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',20,'ALL','CSL';
insert into tb_menu_use
select 'ROLE_MNGR_ADMIN',21,'ALL','CSL';

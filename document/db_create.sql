-- mysql

--use mysql;

-- show databases;
-- create database hd_const;

-- create user 'hd_const'@'%' identified by 'hd_const123';
-- grant all privileges on mysql_default.* to 'hd_const'@'%' identified by 'hd_const123';
-- flush privileges;

-- Table: tb_article

-- DROP TABLE tb_article;

CREATE TABLE tb_article
(
  article_key int(11) NOT NULL DEFAULT 0,
  board_key int(11) NOT NULL DEFAULT 0,
  fkey int(11) NOT NULL,
  pkey int(11) NOT NULL,
  okey int(11) NOT NULL,
  gkey int(11) NOT NULL,
  catgr varchar(255),
  title varchar(255) NOT NULL,
  content text,
  writer varchar(100),
  writer_pwd varchar(100),
  notice_flg varchar(1) NOT NULL DEFAULT 'N',
  secret_flg varchar(1) NOT NULL DEFAULT 'N',
  view_start_dt datetime,
  view_end_dt datetime,
  delete_typ varchar(20),
  delete_flg varchar(1) NOT NULL DEFAULT 'N',
  view_cnt int(11) NOT NULL DEFAULT 0,
  move_flg varchar(1) DEFAULT 'N',
  move_dt datetime,
  orgnl_board_key int(11),
  frst_oper_id varchar(20),
  frst_oper_dt datetime NOT NULL,
  frst_oper_ip varchar(30) NOT NULL,
  last_oper_id varchar(20),
  last_oper_dt datetime,
  last_oper_ip varchar(30),
  PRIMARY KEY (article_key)
)CHARSET=utf8;



-- Table: tb_article_comment

-- DROP TABLE tb_article_comment;

CREATE TABLE tb_article_comment
(
  article_comment_key int(11) NOT NULL,
  article_key int(11) NOT NULL,
  fkey int(11) NOT NULL,
  pkey int(11) NOT NULL,
  okey int(11) NOT NULL,
  gkey int(11) NOT NULL,
  content text NOT NULL,
  writer varchar(100) NOT NULL,
  writer_pwd varchar(100),
  delete_flg varchar(1) NOT NULL,
  delete_typ varchar(20),
  frst_oper_id varchar(20),
  frst_oper_dt datetime NOT NULL,
  frst_oper_ip varchar(20) NOT NULL,
  last_oper_id varchar(20),
  last_oper_dt datetime,
  last_oper_ip varchar(20),
  PRIMARY KEY (article_comment_key)
)CHARSET=utf8;



-- Table: tb_attach_file

-- DROP TABLE tb_attach_file;

CREATE TABLE tb_attach_file
(
  file_id varchar(50) NOT NULL,
  file_seq int(11) NOT NULL,
  file_grp varchar(20) NOT NULL,
  file_nm varchar(255) NOT NULL,
  file_siz bigint(11) NOT NULL,
  file_msk varchar(100) NOT NULL,
  dwnld_cnt int(11) NOT NULL,
  delete_flg varchar(1) NOT NULL,
  oper_dt datetime NOT NULL,
  PRIMARY KEY (file_id, file_seq)
)CHARSET=utf8;




-- Table: tb_banner

-- DROP TABLE tb_banner;

CREATE TABLE tb_banner
(
  banner_key int(11) NOT NULL,
  locate_typ varchar(20) NOT NULL,
  title varchar(255) NOT NULL,
  url varchar(255),
  target_typ varchar(20) NOT NULL,
  period_flg varchar(1) NOT NULL DEFAULT 'N',
  start_dt datetime,
  end_dt datetime,
  file_msk varchar(255),
  act_flg varchar(1) NOT NULL DEFAULT 'Y',
  view_ord int(11) NOT NULL DEFAULT 0,
  frst_oper_id varchar(20) NOT NULL,
  frst_oper_dt datetime NOT NULL,
  last_oper_id varchar(20),
  last_oper_dt datetime,
  PRIMARY KEY (banner_key)
)CHARSET=utf8;



-- Table: tb_board

-- DROP TABLE tb_board;

CREATE TABLE tb_board
(
  board_key int(11) NOT NULL DEFAULT 0,
  board_nm varchar(255) NOT NULL,
  board_typ varchar(40) NOT NULL,
  act_flg varchar(1) NOT NULL DEFAULT 'Y',
  catgr_flg varchar(1) NOT NULL DEFAULT 'N',
  catgr_id varchar(20),
  notice_flg varchar(1) NOT NULL DEFAULT 'N',
  reply_flg varchar(1) NOT NULL DEFAULT 'N',
  comment_flg varchar(1) NOT NULL DEFAULT 'N',
  wysiwyg_flg varchar(1) NOT NULL DEFAULT 'N',
  search_flg varchar(1) NOT NULL DEFAULT 'N',
  rss_flg varchar(1) NOT NULL DEFAULT 'N',
  secret_flg varchar(1) NOT NULL DEFAULT 'N',
  view_prd_flg varchar(1) NOT NULL DEFAULT 'N',
  attach_flg varchar(1) NOT NULL DEFAULT 'N',
  attach_cnt int(11) NOT NULL DEFAULT 0,
  attach_siz int(11) NOT NULL DEFAULT 0,
  new_prd int(11) NOT NULL DEFAULT 0,
  page_rows int(11) NOT NULL DEFAULT 10,
  page_cols int(11) NOT NULL DEFAULT 10,
  head_html text,
  foot_html text,
  frst_oper_id varchar(20) NOT NULL,
  frst_oper_dt datetime NOT NULL,
  last_oper_id varchar(20),
  last_oper_dt datetime,
  PRIMARY KEY (board_key)
)CHARSET=utf8;



-- Table: tb_board_use

-- DROP TABLE tb_board_use;

CREATE TABLE tb_board_use
(
  auth_id varchar(20) NOT NULL,
  board_key int(11) NOT NULL,
  use_typ varchar(20) NOT NULL,
  PRIMARY KEY (auth_id, board_key, use_typ)
)CHARSET=utf8;



-- Table: tb_code

-- DROP TABLE tb_code;

CREATE TABLE tb_code
(
  code_grp_id varchar(8) NOT NULL,
  code_id varchar(10) NOT NULL,
  code_nm varchar(50) NOT NULL,
  attr1 varchar(20),
  attr2 varchar(20),
  attr3 varchar(20),
  view_ord int(11) NOT NULL,
  act_flg varchar(1) NOT NULL DEFAULT 'Y',
  frst_oper_id varchar(20) NOT NULL,
  frst_oper_dt datetime NOT NULL,
  last_oper_id varchar(20),
  last_oper_dt datetime,
  PRIMARY KEY (code_grp_id, code_id)
)CHARSET=utf8;



-- Table: tb_code_grp

-- DROP TABLE tb_code_grp;

CREATE TABLE tb_code_grp
(
  code_grp_id varchar(8) NOT NULL,
  code_grp_nm varchar(50) NOT NULL,
  attr varchar(20),
  act_flg varchar(1) NOT NULL DEFAULT 'Y',
  frst_oper_id varchar(20) NOT NULL,
  frst_oper_dt datetime NOT NULL,
  last_oper_id varchar(20),
  last_oper_dt datetime,
  PRIMARY KEY (code_grp_id)
)CHARSET=utf8;


-- Table: tb_content

-- DROP TABLE tb_content;

CREATE TABLE tb_content
(
  content_key int(11) NOT NULL,
  title varchar(255) NOT NULL,
  content text,
  act_flg varchar(1) NOT NULL DEFAULT 'Y',
  frst_oper_id varchar(20) NOT NULL,
  frst_oper_dt datetime NOT NULL,
  last_oper_id varchar(20),
  last_oper_dt datetime,
  PRIMARY KEY (content_key)
)CHARSET=utf8;



-- Table: tb_content_hstry

-- DROP TABLE tb_content_hstry;

CREATE TABLE tb_content_hstry
(
  content_hstry_key int(11) NOT NULL,
  content_key int(11),
  content text,
  oper_id varchar(20),
  oper_dt datetime NOT NULL,
  PRIMARY KEY (content_hstry_key)
)CHARSET=utf8;



-- Table: tb_corp_user

-- DROP TABLE tb_corp_user;

CREATE TABLE tb_corp_user
(
  user_id varchar(20) NOT NULL,
  user_pw varchar(100) NOT NULL,
  user_nm varchar(50) NOT NULL,
  chr_tel varchar(20),
  chr_mob varchar(20),
  chr_fax varchar(20),
  chr_email varchar(255),
  chr_zip varchar(10),
  chr_addr1 varchar(255),
  chr_addr2 varchar(255),
  corp_id varchar(20),
  corp_nm varchar(50),
  corp_tel varchar(20),
  corp_mob varchar(20),
  corp_fax varchar(20),
  corp_email varchar(255),
  corp_zip varchar(10),
  corp_addr1 varchar(255),
  corp_addr2 varchar(255),
  reg_st varchar(3) NOT NULL DEFAULT 'A01',
  auth_id varchar(20),
  last_login_dt datetime,
  frst_oper_dt datetime NOT NULL,
  last_oper_dt datetime,
  PRIMARY KEY (user_id)
)CHARSET=utf8;



-- Table: tb_ecache_apply

-- DROP TABLE tb_ecache_apply;

CREATE TABLE tb_ecache_apply
(
  node_nm varchar(20) NOT NULL,
  menu_flg varchar(1) NOT NULL,
  content_flg varchar(1) NOT NULL,
  banner_flg varchar(1) NOT NULL,
  popup_flg varchar(1) NOT NULL,
  link_flg varchar(1) NOT NULL,
  oper_dt datetime NOT NULL,
  PRIMARY KEY (node_nm)
)CHARSET=utf8;



-- Table: tb_eng_stat

-- DROP TABLE tb_eng_stat;

CREATE TABLE tb_eng_stat
(
  stat_key int(11) NOT NULL,
  year int(11) NOT NULL,
  month int(11) NOT NULL,
  day int(11) NOT NULL,
  hour int(11) NOT NULL,
  minute int(11) NOT NULL,
  second int(11) NOT NULL,
  stat_typ varchar(20) NOT NULL,
  session_id varchar(100) NOT NULL,
  url varchar(255),
  locale varchar(50),
  lang varchar(10),
  cntry varchar(10),
  dsply_lang varchar(20),
  dsply_cntry varchar(20),
  ip varchar(20),
  referer varchar(255),
  user_agent varchar(255),
  PRIMARY KEY (stat_key)
)CHARSET=utf8;



-- Table: tb_genr_user

-- DROP TABLE tb_genr_user;

CREATE TABLE tb_genr_user
(
  user_id varchar(20) NOT NULL,
  user_pw varchar(100) NOT NULL,
  user_nm varchar(50) NOT NULL,
  tel varchar(20),
  mob varchar(20),
  email varchar(255),
  zip varchar(10),
  addr1 varchar(255),
  addr2 varchar(255),
  reg_st varchar(3) NOT NULL DEFAULT 'A01',
  auth_id varchar(20),
  last_login_dt datetime,
  frst_oper_dt datetime NOT NULL,
  last_oper_dt datetime,
  PRIMARY KEY (user_id)
)CHARSET=utf8;



-- Table: tb_ids

-- DROP TABLE tb_ids;

CREATE TABLE tb_ids
(
  table_name varchar(30) NOT NULL,
  next_id int(11) NOT NULL,
  PRIMARY KEY (table_name)
)CHARSET=utf8;


-- Table: tb_link

-- DROP TABLE tb_link;

CREATE TABLE tb_link
(
  link_key int(11) NOT NULL,
  locate_typ varchar(100) NOT NULL,
  title varchar(255) NOT NULL,
  url varchar(255),
  target_typ varchar(20) NOT NULL,
  period_flg varchar(1) NOT NULL DEFAULT 'N',
  start_dt datetime,
  end_dt datetime,
  act_flg varchar(1) NOT NULL DEFAULT 'Y',
  view_ord int(11) NOT NULL DEFAULT 0,
  frst_oper_id varchar(20) NOT NULL,
  frst_oper_dt datetime NOT NULL,
  last_oper_id varchar(20),
  last_oper_dt datetime,
  PRIMARY KEY (link_key)
)CHARSET=utf8;


-- Table: tb_menu

-- DROP TABLE tb_menu;

CREATE TABLE tb_menu
(
  menu_key int(11) NOT NULL,
  fkey int(11) DEFAULT 0,
  pkey int(11) DEFAULT 0,
  okey int(11) DEFAULT 0,
  gkey int(11),
  menu_nm varchar(100) NOT NULL,
  navi_flg varchar(1),
  menu_typ varchar(10) NOT NULL DEFAULT 'DEFAULT',
  link_typ varchar(10) NOT NULL DEFAULT 'EMPTY',
  board_key int(11),
  content_key int(11),
  url varchar(255),
  sub_view_typ varchar(10) DEFAULT 'LIST',
  act_flg varchar(1) NOT NULL DEFAULT 'Y',
  main_top_img_on varchar(255),
  main_top_img_off varchar(255),
  top_img_on varchar(255),
  top_img_off varchar(255),
  left_top_img varchar(255),
  left_img_on varchar(255),
  left_img_off varchar(255),
  title_img varchar(255),
  frst_oper_id varchar(20) NOT NULL,
  frst_oper_dt datetime NOT NULL,
  last_oper_id varchar(20),
  last_oper_dt datetime,
  PRIMARY KEY (menu_key)
)CHARSET=utf8;


-- Table: tb_menu_stat

-- DROP TABLE tb_menu_stat;

CREATE TABLE tb_menu_stat
(
  menu_stat_key int(11) NOT NULL,
  year int(11) NOT NULL,
  month int(11) NOT NULL,
  day int(11) NOT NULL,
  hour int(11) NOT NULL,
  minute int(11) NOT NULL,
  second int(11) NOT NULL,
  stat_typ varchar(20) NOT NULL,
  session_id varchar(100) NOT NULL,
  url varchar(255),
  locale varchar(50),
  lang varchar(10),
  cntry varchar(10),
  dsply_lang varchar(20),
  dsply_cntry varchar(20),
  ip varchar(20),
  referer varchar(255),
  user_agent varchar(255),
  menu_key int(11),
 PRIMARY KEY (menu_stat_key)
)CHARSET=utf8;



CREATE TABLE `TB_MENU_STAT_201903` (
`MENU_STAT_KEY`        INT(8) NOT NULL COMMENT '메뉴통계키',
`YEAR`                 INT(4) NOT NULL COMMENT '년',
`MONTH`                INT(2) NOT NULL COMMENT '월',
`DAY`                  INT(2) NOT NULL COMMENT '일',
`HOUR`                 INT(2) NOT NULL COMMENT '시',
`MINUTE`               INT(2) NOT NULL COMMENT '분',
`SECOND`               INT(2) NOT NULL COMMENT '초',
`STAT_TYP`             VARCHAR(20) NOT NULL COMMENT '통계구분',
`SESSION_ID`           VARCHAR(100) NOT NULL COMMENT '세션ID',
`URL`                  VARCHAR(255) NULL COMMENT 'URL',
`LOCALE`               VARCHAR(50) NULL COMMENT '로케일',
`LANG`                 VARCHAR(10) NULL COMMENT '언어',
`CNTRY`                VARCHAR(10) NULL COMMENT '국가',
`DSPLY_LANG`           VARCHAR(20) NULL COMMENT '출력언어',
`DSPLY_CNTRY`          VARCHAR(20) NULL COMMENT '출력국가',
`IP`                   VARCHAR(20) NULL COMMENT 'IP',
`REFERER`              VARCHAR(255) NULL COMMENT 'REFERER',
`USER_AGENT`           VARCHAR(255) NULL COMMENT 'USER_AGENT',
`MENU_KEY`             INT(8) NULL COMMENT '메뉴키',
PRIMARY KEY (`MENU_STAT_KEY`)
)CHARSET=utf8 COMMENT='메뉴통계_201903'





-- Table: tb_menu_use

-- DROP TABLE tb_menu_use;

CREATE TABLE tb_menu_use
(
  auth_id varchar(20) NOT NULL,
  menu_key int(11) NOT NULL,
  use_typ varchar(20) NOT NULL,
  menu_typ varchar(20) NOT NULL,
  PRIMARY KEY (auth_id, menu_key, use_typ)
)CHARSET=utf8;


-- Table: tb_mngr_user

-- DROP TABLE tb_mngr_user;

CREATE TABLE tb_mngr_user
(
  user_id varchar(20) NOT NULL,
  user_pw varchar(100) NOT NULL,
  user_nm varchar(50) NOT NULL,
  tel varchar(20),
  mob varchar(20),
  email varchar(255),
  reg_st varchar(3) NOT NULL DEFAULT 'A01',
  auth_id varchar(20),
  last_login_dt datetime,
  frst_oper_dt datetime NOT NULL,
  last_oper_dt datetime,
  PRIMARY KEY (user_id)
)CHARSET=utf8;


-- Table: tb_popup

-- DROP TABLE tb_popup;

CREATE TABLE tb_popup
(
  popup_key int(11) NOT NULL,
  locate_typ varchar(20) NOT NULL,
  title varchar(255) NOT NULL,
  period_flg varchar(1) NOT NULL DEFAULT 'N',
  start_dt datetime,
  end_dt datetime,
  size_auto_flg varchar(1) NOT NULL DEFAULT 'Y',
  size_wdh int(11),
  size_hgt int(11),
  content text,
  act_flg varchar(1) NOT NULL DEFAULT 'Y',
  view_ord int(11) NOT NULL DEFAULT 0,
  frst_oper_id varchar(20) NOT NULL,
  frst_oper_dt datetime NOT NULL,
  last_oper_id varchar(20),
  last_oper_dt datetime,
  PRIMARY KEY (popup_key)
)CHARSET=utf8;


-- Table: tb_stat

-- DROP TABLE tb_stat;

CREATE TABLE tb_stat
(
  stat_key int(11) NOT NULL,
  year int(11) NOT NULL,
  month int(11) NOT NULL,
  day int(11) NOT NULL,
  hour int(11) NOT NULL,
  minute int(11) NOT NULL,
  second int(11) NOT NULL,
  stat_typ varchar(20) NOT NULL,
  session_id varchar(100) NOT NULL,
  url varchar(255),
  locale varchar(50),
  lang varchar(10),
  cntry varchar(10),
  dsply_lang varchar(20),
  dsply_cntry varchar(20),
  ip varchar(20),
  referer varchar(255),
  user_agent varchar(255),
  PRIMARY KEY (stat_key)
)CHARSET=utf8;


CREATE TABLE TB_STAT_2019 (
`STAT_KEY`             INT(8) NOT NULL COMMENT '접속통계키',
`YEAR`                 INT(4) NOT NULL COMMENT '년',
`MONTH`                INT(2) NOT NULL COMMENT '월',
`DAY`                  INT(2) NOT NULL COMMENT '일',
`HOUR`                 INT(2) NOT NULL COMMENT '시',
`MINUTE`               INT(2) NOT NULL COMMENT '분',
`SECOND`               INT(2) NOT NULL COMMENT '초',
`STAT_TYP`             VARCHAR(20) NOT NULL COMMENT '통계구분',
`SESSION_ID`           VARCHAR(100) NOT NULL COMMENT '세션ID',
`URL`                  VARCHAR(255) NULL COMMENT 'URL',
`LOCALE`               VARCHAR(50) NULL COMMENT '로케일',
`LANG`                 VARCHAR(10) NULL COMMENT '언어',
`CNTRY`                VARCHAR(10) NULL COMMENT '국가',
`DSPLY_LANG`           VARCHAR(20) NULL COMMENT '출력언어',
`DSPLY_CNTRY`          VARCHAR(20) NULL COMMENT '출력국가',
`IP`                   VARCHAR(20) NULL COMMENT 'IP',
`REFERER`              VARCHAR(255) NULL COMMENT 'REFERER',
`USER_AGENT`           VARCHAR(255) NULL COMMENT 'USER_AGENT',
PRIMARY KEY (`STAT_KEY`)
)CHARSET=utf8 COMMENT='접속통계_2019'




-- Table: tb_user_auth

-- DROP TABLE tb_user_auth;

CREATE TABLE tb_user_auth
(
  auth_id varchar(20) NOT NULL,
  auth_nm varchar(50) NOT NULL,
  user_grp varchar(20) NOT NULL,
  order_no int(11) NOT NULL DEFAULT 1,
  act_flg varchar(1) NOT NULL DEFAULT 'Y',
  frst_oper_id varchar(20) NOT NULL,
  frst_oper_dt datetime NOT NULL,
  last_oper_id varchar(20),
  last_oper_dt datetime,
  PRIMARY KEY (auth_id)
)CHARSET=utf8;


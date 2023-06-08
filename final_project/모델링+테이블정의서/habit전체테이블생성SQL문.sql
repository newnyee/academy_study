-- ȸ�� ���̺�
-- �̹��� �⺻�� ���� �ؾ���
CREATE TABLE user (
  user_id      varchar(25)   NOT NULL  primary key,  --���� ���̵�
  user_pw      varchar(25)   NOT NULL,               --��й�ȣ
  user_name    varchar(15)   NOT NULL,               --�̸�
  user_email   varchar(40)   NOT NULL,               --�̸���
  user_phone   varchar(15)   NOT NULL,               --��ȭ��ȣ
  user_birth   varchar(10)   NOT NULL,               --�������(8�ڸ�)
  user_gender  char(1)       NOT NULL,               --����
  user_img     varchar(100)  NOT NULL  DEFAULT '',   --������ �̹���
  user_size    int           NOT NULL  DEFAULT 0,    --�̹��� ������
  user_status  char(1)       NOT NULL  DEFAULT 'O',  --ȸ�� ����
  user_grade   char(1)       NOT NULL  DEFAULT 'M',  --ȸ�� ����
  user_level   char(1)       NOT NULL  DEFAULT 'B',  --ȸ�� ���
  user_date    datetime      NOT NULL  DEFAULT now() --���Գ�¥
);


-- ȣ��Ʈ ���̺�
-- �̹��� �⺻�� ���� �ؾ���
CREATE TABLE host (
  host_id        varchar(25)   NOT NULL  primary key,     --ȣ��Ʈ ���̵�
  host_name      varchar(20)   NOT NULL,                  --ȣ��Ʈ �г���
  host_phone     varchar(15)   NOT NULL,                  --ȣ��Ʈ ��ȭ��ȣ
  host_intro     varchar(200)  NOT NULL,                  --�Ұ���
  host_email     varchar(40)   NOT NULL,                  --ȣ��Ʈ �̸���
  host_img       varchar(100)  NOT NULL	 DEFAULT default, --������ �̹���
  host_size      int	         NOT NULL	 DEFAULT 0,       --�̹��� ������ 
  host_account   varchar(50)   NOT NULL,                  --���¹�ȣ
  host_bank      varchar(15)   NOT NULL,                  --����
  host_acholder  varchar(15)   NOT NULL,                  --������
  host_date      datetime      NOT NULL	 DEFAULT now()    --ȣ��Ʈ �����
);


-- ������ ���̺�
CREATE TABLE energy (
  energy_no       int	         NOT NULL	 auto_increment  primary key, --������ ��ȣ
  user_id         varchar(25)	 NOT NULL,                              --ȸ�� ���̵�
  energy_saveuse  int	         NOT NULL,                              --����/��뿡����
  energy_date     datetime	   NOT NULL	 DEFAULT now(),               --������ ���� ��¥
  energy_sources  varchar(50)	 NOT NULL                               --������ ��ó
);


-- ī�װ� ���̺�
CREATE TABLE cate (
  cate_no      varchar(10)  NOT NULL  primary key, --ī�װ� �ڵ�(�ĺ��ڵ� ���� ���� ���)
  cate_large   varchar(50)  NOT NULL,              --��з�
  cate_middle  varchar(50)  NOT NULL               --�ߺз�
);


-- ������ ���̺�
-- �̹��� �⺻�� ���� �ؾ���
CREATE TABLE cont (
  cont_no        int	         NOT NULL	 auto_increment  primary key, --������ �ڵ�
  cate_no        int 	         NOT NULL,                              --ī�װ� �ڵ�
  host_id        varchar(25)	 NOT NULL,                              --ȣ��Ʈ ���̵�
  cont_name      varchar(50)	 NOT NULL,                              --������ ��
  cont_place     varchar(30)	 NOT NULL,                              --������ ���
  cont_img       varchar(100)	 NOT NULL  DEFAULT default,             --��ǥ�̹���
  cont_size      int	         NOT NULL  DEFAULT 0,                   --�̹��� ������
  cont_content   Text(6500)    NOT NULL,                              --������ ����
  cont_view      int	         NOT NULL	 DEFAULT 0,                   --��ȸ��
  cont_stdate    datetime	     NOT NULL  DEFAULT now(),               --������ �����
  cont_endate    datetime	     NOT NULL,                              --������ ������
  cont_hashtag1  varchar(35)	 NULL,                                  --�ؽ��±�1
  cont_hashtag2  varchar(35)	 NULL,                                  --�ؽ��±�2
  cont_hashtag3  varchar(35)	 NULL,                                  --�ؽ��±�3
  cont_hashtag4  varchar(35)	 NULL,                                  --�ؽ��±�4
  cont_hashtag5  varchar(35)	 NULL,                                  --�ؽ��±�5
  cont_status    char(1)	     NOT NULL  DEFAULT 'Y'                  --������ �Ǹ� ����
);


-- ������Ŭ���� ���̺�
CREATE TABLE one (
  pro_no      varchar(35)	 NOT NULL  primary key, --��ǰ�ڵ�
  cont_no     int	         NOT NULL,              --������ �ڵ�
  one_date    varchar(35)	 NOT NULL,              --��ǰ��(�����Ͻ�)
  one_maxqty  int	         NOT NULL	 DEFAULT 0,   --�ִ�����ο�(�Ѽ���)
  one_price   int	         NOT NULL	 DEFAULT 0,   --����
  one_status  char(2)	     NOT NULL	 DEFAULT 'OO' --��ǰ ����(OO:���డ��, OC:����Ұ�, OS:ǰ��)
);
-- ������ Ŭ���� ������(��ǰ�ڵ忡 ���)
create sequence �����ͺ��̽��̸�.sq_one
start with 1
increment by 1
maxvalue 999999
cycle;


-- ȸ����/ȸ���� ���̺�
CREATE TABLE prod (
  pro_no       varchar(35)  NOT NULL  primary key, --��ǰ�ڵ�
  cont_no      int	        NOT NULL,              --������ �ڵ�
  prod_name    varchar(50)	NOT NULL,              --��ǰ��
  prod_qty     int	        NOT NULL  DEFAULT 0,   --�Ǹż���
  prod_price   int	        NOT NULL  DEFAULT 0,   --����
  prod_status  char(2)	    NOT NULL  DEFAULT 'PO' --��ǰ����(PO:���Ű���, PC:���źҰ�, PS:ǰ��)
);
-- ȸ����/ȸ���� ������(��ǰ�ڵ忡 ���)
create sequence �����ͺ��̽��̸�.sq_prod
start with 1
increment by 1
maxvalue 999999
cycle;


-- ��ٱ��� ���̺�
CREATE TABLE cartlist (
  cl_no    int          NOT NULL  auto_increment  primary key, --��ٱ��� �ڵ�
  user_id  varchar(25)  NOT NULL,                              --���� ȸ�� ���̵�
  pro_no   varchar(35)  NOT NULL,                              --��ǰ �ڵ�
  cl_qty   int          NOT NULL  DEFAULT 0,                   --����
  cl_date  datetime     NOT NULL  DEFAULT now()                --��ٱ��� �����
);


-- �ֹ��� ���̺�
CREATE TABLE pay (
  pay_no      varchar(20)  NOT NULL  primary key,  --�ֹ��� ��ȣ(�ĺ��ڵ� ���� ���� ���)
  user_id     varchar(25)  NOT NULL,               --ȸ�����̵�
  pay_total   int          NOT NULL	 DEFAULT 0,    --������ �ݾ�
  pay_point   int          NOT NULL	 DEFAULT 0,    --��� ������
  pay_method  char(1)      NOT NULL,               --���� ����
  pay_status  char(1)      NOT NULL	 DEFAULT 'A',  --�ֹ� ����
  pay_date    datetime     NOT NULL	 DEFAULT now() --�ֹ� ��¥
);


-- �ֹ� �� ���̺�
CREATE TABLE payd (
  payd_no      int          NOT NULL  auto_increment  primary key, --�ֹ� �� ��ȣ
  pay_no       varchar(20)  NOT NULL,                              --�ֹ��� ��ȣ
  user_id      varchar(25)  NOT NULL,                              --ȸ�� ���̵�
  pro_no       varchar(35)  NOT NULL,                              --��ǰ �ڵ�
  payd_price   int          NOT NULL  DEFAULT 0,                   --��ǰ �ݾ�
  payd_qty     int          NOT NULL  DEFAULT 0,                   --�ֹ� ����
  payd_status  char(1)      NOT NULL  DEFAULT 'R',                 --�ֹ� �� ����
  payd_date    datetime     NOT NULL  DEFAULT now()                --�ֹ� ��¥
  refn_status  char(3)      NOT NULL  DEFAULT 'RO'                 --ȯ�� ����
);


-- ȯ�� ���̺�
CREATE TABLE refn (
  refn_no      int	        NOT NULL	auto_increment  primary key, --ȯ���ڵ�
  payd_no      int	        NOT NULL,                              --�ֹ��󼼹�ȣ
  user_id      varchar(25)	NOT NULL,                              --ȸ�����̵�
  pro_no       varchar(35)	NOT NULL,                              --��ǰ�ڵ�
  refn_qty     int	        NOT NULL	DEFAULT 0,                   --ȯ�� ����
  refn_point   int	        NOT NULL	DEFAULT 0,                   --ȯ�� ������
  refn_pay     int	        NOT NULL	DEFAULT 0,                   --�� ȯ�Ҿ�
  refn_method  char(1)	    NOT NULL,                              --ȯ�� ����
  refn_date    datetime	    NOT NULL	DEFAULT now()                --ȯ�� ��¥
);


-- ���� ���̺�
CREATE TABLE calc (
  calc_no        varchar(35)	  NOT NULL  primary key,  --���� �ڵ�(�ĺ��ڵ� ���� ���� ���)
  host_id        varchar(25)	  NOT NULL,               --ȣ��Ʈ ���̵�
  calc_date      varchar(50)	  NOT NULL,               --���� �Ⱓ
  calc_title     varchar(100) 	NOT NULL,               --���꼭 ����
  calc_ttlprice  int	          NOT NULL  DEFAULT 0,    --�� ���޾�(������ ��)
  calc_fee       int	          NOT NULL  DEFAULT 0,    --�� ������ ��
  calc_status    char(1)	      NOT NULL  DEFAULT 'N',  --���� ����
  calc_addate    datetime	      NOT NULL  DEFAULT now() --���� �����
);


-- ���� �� ���̺�
CREATE TABLE calcd (
  calcd_no      int	         NOT NULL	 auto_increment  primary key, --���� �� �ڵ�
  calc_no       varchar(35)	 NOT NULL,                              --���� �ڵ�
  payd_no       int	         NOT NULL,                              --�ֹ� �� ��ȣ
  pro_no        varchar(35)	 NOT NULL,                              --��ǰ �ڵ�
  calcd_price   int	         NOT NULL,                              --�ݾ�
  calcd_qty     int	         NOT NULL,                              --����
  calcd_status  char(1)	     NOT NULL	,                             --�ֹ��󼼻���
  calcd_date    varchar(35)	 NOT NULL                               --���� ��¥
);


-- ���� ���̺�
CREATE TABLE question (
  q_no        int          NOT NULL  auto_increment  primary key, --���� ��ȣ
  cont_no     int          NOT NULL,                              --������ �ڵ�
  id          varchar(25)  NOT NULL,                              --ȸ��/ȣ��Ʈ ���̵�
  q_question  TEXT(500)    NOT NULL,                              --����
  q_bedate    datetime     NOT NULL  DEFAULT now(),               --�����
  q_group     int          NOT NULL,                              --�� �׷��ȣ
  q_div       char(1)      NOT NULL                               --�����ڵ�(U:ȸ��, H:ȣ��Ʈ)
);


-- ���� ���̺�
CREATE TABLE review (
  review_no       int	         NOT NULL	 auto_increment  primary key, --���� �ڵ�
  user_id         varchar(25)	 NOT NULL,                              --���� ���̵�
  cont_no         int	         NOT NULL,                              --������ �ڵ�
  payed_no        int	         NOT NULL,                              --�ֹ� �� ��ȣ
  review_date     datetime	   NOT NULL	 DEFAULT now(),               --���� �����
  review_cont     Text(500)	   NOT NULL,                              --���� ����
  review_star     int	         NOT NULL,                              --����
  review_img      varchar(20)	 NULL,                                  --���� �̹���
  review_imgsize  int	         NULL,                                  --�̹��� ������
  review_ask      varchar(10)	 NULL,                                  --��������
  review_status   char(1)	     NOT NULL 	DEFAULT 'Y'                 --���� ����(Y:���� �Խ���, N:���� ����)
);

-- �� ���̺�
CREATE TABLE zzim (
  zzim_no  int	        NOT NULL  auto_increment  primary key, --�� �ڵ�
  user_id  varchar(25)	NOT NULL,                              --���� ���̵�
  cont_no  int	        NOT NULL                               --������ �ڵ�
);



-- Ű���� ���� ���̺�
CREATE TABLE reco (
  reco_no       int	         NOT NULL 	auto_increment  primary key, --Ű���� �ڵ�
  reco_keyword  varchar(50)	 NOT NULL,                               --Ű����
  reco_date     datetime	   NOT NULL	  DEFAULT now()                --Ű���� ������
);


-- �������� ���̺�
CREATE TABLE survey (
  user_id   varchar(25)	 NOT NULL  primary key,  --���� ���̵�
  ask_1     varchar(20)	 NOT NULL,               --����1
  ask_2     varchar(20)	 NOT NULL,               --����1
  ask_3     varchar(20)	 NOT NULL,               --����1
  ask_4     varchar(20)	 NOT NULL,               --����1
  ask_5     varchar(20)	 NOT NULL,               --����1
  ask_date  datetime	   NOT NULL	 DEFAULT now() --���� ������
);
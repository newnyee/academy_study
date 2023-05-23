
I:\java202301\database\20230228_03emp���̺���.sql
////////////////////////////////////////////////////////////////////////////////

commit;

��1) emp ������̺��� �����Ͻÿ�
create table emp(
  empno       number(4)     primary key --���(-9999~9999)
  ,ename      varchar2(50)              --�̸�
  ,job        varchar2(10)              --����
  ,mgr        number(4)                 --�Ŵ�������
  ,hiredate   date                      --�Ի���
  ,sal        number(7,2)               --�޿�(�Ҽ��� 2�ڸ�)
  ,comm       number(7,2)               --Ŀ�̼�(���ʽ�)
  ,deptno     number(2)                 --�μ��ڵ�(-99~99)
);


��2) emp������̺� ���� �߰��Ͻÿ�
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7369, '������', '���', 7902, '2000-12-17', 200, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7499, '���޷�', '����', 7698, '2001-12-15', 360, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7521, '���϶�', '����', 7698, '2001-02-17', 355, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7654, '�����', '����', 7839, '2002-01-11', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7698, '������', '����', 7698, '2000-07-12', 325, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7782, '�迬��', '���', 7698, '2001-12-17', 225, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7778, '����ȭ', '���', 7839, '2005-11-14', 200, 10);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7839, 'ȫ�浿', '����', 7566, '2006-06-17', 450, 20);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7844, '�۰�ȣ', '����', 7566, '2018-09-17', 400, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7876, '���켺', '��ǥ', 7839, '2004-09-09', 500, 30);

insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
values(7900, '������', '���', 7902, '2001-12-03', 200, 20);
////////////////////////////////////////////////////////////////////////////////


��3) ��ü ���� ������ ��ȸ�Ͻÿ�
select count(*) from emp;


��4) ���̺��� Į��(�ʵ�) ����� Ȯ���Ͻÿ�
select * from emp;


��5) ����̸���(��������) �����Ͻÿ�
select * from emp order by ename;


��6) ����̸���(��������) �����Ͻÿ�
select * from emp order by ename desc;


��7) �޿� ������������ ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�
select ename, sal, deptno from emp order by sal desc;


��8) �μ��ڵ� ��������, �޿� ������������
     ����̸�(ename), �޿�(sal), �μ��ڵ�(deptno)�� ��ȸ�Ͻÿ�
select ename, sal, deptno from emp order by deptno desc;


��9) �̸�(ename)/�Ի�����(hiredate)/�μ��ڵ�(deptno)��
      �μ��ڵ� ��������, �Ի�����(hiredate) ������������ ��ȸ�Ͻÿ�
select ename, hiredate, deptno from emp order by deptno, hiredate;


��10) ����(job) Į���� �ߺ������͸� �ϳ����� ��ȸ�Ͻÿ�
select job from emp group by job;
select distinct(job) from emp;


��11) emp���̺��� job ��������, sal ������������ �����ؼ�
      ename �̸�, job ����, sal �޿� Į�������� ��Ī�� �ٲ㼭 ��ȸ�Ͻÿ�
select ename as "�̸�", job as "����", sal as "�޿�" 
from emp order by "����", "�޿�";


��12) �޿��� 100���� ���� 400���� ���� ���� ��ȸ�ϱ�(�޿� ��������)
select * from emp where sal>100 and sal<400 order by sal desc;


��13) �޿��� 100���� �Ǵ� 400 �̻��� ���� �˻��ϱ�(�޿� ��������)
select * from emp where sal<=100 or sal>=400 order by sal desc;


��14) ����(job)�� ���� �Ǵ� ������ �������� �̸������� ��ȸ�Ͻÿ�
select * from emp where job in('����', '����') order by ename;


��15) �μ��ڵ�(deptno)�� 30�� ������ ��ȸ�Ͻÿ�
select * from emp where deptno=30;


��16) �ߺ��� �μ��ڵ带 �Ѱ����� ��ȸ�Ͻÿ�
select deptno from emp group by deptno;


��17) �μ��ڵ尡 10 �Ǵ� 20 �Ǵ� 30�� ������ ��ȸ�Ͻÿ�
      (or, in������ ���� Ȱ���ؼ� ��ȸ)
select * from emp where deptno in(10, 20, 30);
select * from emp where deptno = 10 or deptno = 20 or deptno = 30;


��18) �޿��� 300~500�� ������ �޿������� ��ȸ�Ͻÿ�
      (and, between������ ���� Ȱ���ؼ� ��ȸ)
select * from emp where sal between 300 and 500 order by sal;
select * from emp where sal>=300 and sal<=500 order by sal;


��19) �̸��� ����ȭ ��ȸ�Ͻÿ�
select * from emp where ename='����ȭ';


��20) �达���� ��ȸ�Ͻÿ�
select * from emp where ename like ('��%');


��21) �̸��� 'ȭ' ���Ե� ���� ��ȸ�Ͻÿ�
select * from emp where ename like ('%ȭ%');


��22) �μ��ڵ尡 20�� �࿡ ���ؼ� �޿��� 1%�� Ŀ�̼����� å���Ͻÿ�
update emp set comm=sal*0.01 where deptno = 20;


��23) ������ �Ʒ��� ���� ������ �̸�, �μ�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
      �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)
select ename, deptno, sal, comm, sal*12+nvl(comm,0) as "����" from emp;


��24) Ŀ�̼��� null�̸� 0���� �ٲ��� ������ �ٽ� ����ؼ�
      �̸�, �޿�, Ŀ�̼�, ������ ��ȸ�Ͻÿ�
select ename, sal, nvl(comm,0) as comm, 
       sal*12+nvl(comm,0) as "����" 
from emp;


��25) �� ����� �޿��� �˻��ؼ� '���������� �޿��� ���Դϴ�'�� ��ȸ�Ͻÿ�
      (|| ���տ�����)
select uname || '�� �޿���' || sal || '�Դϴ�' from emp;


-- ������ �켱����
() ��ȣ : ������ �켱�������� �켱��
1���� : �񱳿�����, SQL������, ���������
2���� : not
3���� : and
4���� : or
5���� : ���տ�����   

��26) emp���̺��� �Ի���(hiredate)�� 2005�� 1�� 1�� ������ ����� ����
      ����� �̸�(ename), �Ի���, �μ���ȣ(deptno)�� �Ի��ϼ����� ��ȸ�Ͻÿ�
select ename, hiredate, deptno 
from emp 
where to_char(hiredate, 'YYYYMMDD')<20050101 
order by hiredate;


��27) emp���̺��� �μ���ȣ�� 20���̳� 30���� �μ��� ����
     ����鿡 ���Ͽ� �̸�, �����ڵ�(job), �μ���ȣ�� �̸������� ��ȸ�Ͻÿ�
     (or, in������ ���� Ȱ���ؼ� ��� ��ȸ)
select ename, job, deptno from emp where deptno in(20, 30) order by ename;
     

��28) ���, �̸�, �μ��� ��ȸ�Ͻÿ�
      (��, �μ��ڵ尡 10�̸� ������
                      20�̸� ������
                      30�̸� �����η� �ٲ㼭 ���)
select empno, ename,
case deptno when 10 then '������' 
            when 20 then '������' 
            when 30 then '������' 
            end as deptno
from emp;

��29) ������ SQL���� �м��Ͻÿ�
      select empno, sal 
      from emp
      where not(sal>200 and sal<300)
      order by sal;
      
-> emp ���̺��� �޿��� 200���� �Ǵ� 300�̻��� ����� �޿��� �޿����� ���������Ͽ� ��ȸ�Ͻÿ�

��30) ������ SQL���� �м��Ͻÿ�
      select empno, sal 
      from emp
      where not sal>200 and sal<300
      order by sal;

-> emp ���̺��� �޿��� 200������ ����� �޿��� �޿� �������� ���������Ͽ� ��ȸ�Ͻÿ�


//////////////////////////////////////////////////////////////////////////////////////////////////////

[emp���̺� ���� ��������]


��31) �μ��ڵ庰 �޿��հ踦 ���Ͻÿ�
select deptno, sum(sal) as "�޿��հ�" 
from emp 
group by deptno;


��32) �μ��ڵ庰 �޿��հ踦 ���ؼ�  �� �հ谪�� 1500�̻� ��ȸ�Ͻÿ�
select * 
from (select deptno, sum(sal) as "�޿��հ�" from emp group by deptno) 
where "�޿��հ�">=1500;

select deptno, sum(sal) as "�޿��հ�"
from emp
group by deptno
having sum(sal)>=1500;


��33) �μ��� �޿������ 300�̻� ��ȸ�Ͻÿ�
select * 
from (select deptno, avg(sal) as "�޿����" from emp group by deptno) 
where "�޿����" >=300;

select deptno, avg(sal) as "�޿����" 
from emp 
group by deptno
having avg(sal)>=300;


��34) �޿��� 300�̻� �������߿��� �μ��ڵ庰 �޿������ ���ؼ� �޿���ռ����� ��ȸ�Ͻÿ�
select deptno, avg(sal) as "�޿����" 
from (select deptno, sal from emp where sal>=300) 
group by deptno
order by "�޿����";

select deptno, avg(sal) as "�޿����" 
from emp
where sal>=300
group by deptno
order by "�޿����";


��35) �޿��� 300�̻� �������߿��� �μ��ڵ庰 �޿������ 400�̻��� �޿������� ��ȸ�Ͻÿ�
select * 
from (select deptno, avg(sal) as "�޿����" from (select deptno, sal from emp where sal>=300) group by deptno) 
where "�޿����" >=400
order by "�޿����";

select deptno, avg(sal) as "�޿����" 
from emp
where sal>=300
group by deptno
having avg(sal)>=400
order by "�޿����";


��36) hiredateĮ���� ����Ͽ� ������ �Ի��� �ο����� ���Ͻÿ�
select "�Ի��", count(*) as "�ο���"
from (select to_char(hiredate,'MM') as "�Ի��" from emp) 
group by "�Ի��";

select to_char(hiredate,'MM') as "�Ի��", count(*) as "�ο���"
from emp
group by to_char(hiredate,'MM');


��37) �Ŵ����� ����ο����� ��ȸ�Ͻÿ�
select mgr as "�Ŵ���", count(*) as "����ο���"
from emp 
group by mgr;


��38) �����ȣ 7654�� �޿����� ���� ���� ��ȸ�Ͻÿ�
select * 
from emp 
where sal<(select sal from emp where empno=7654);


��39) �μ����� �޿�+Ŀ�̼Ǹ� �������� �ִ밪, �ּҰ�, ��հ��� �Ҽ��� ��° �ڸ����� �ݿø��Ͽ� �μ������� ��ȸ�Ͻÿ�
select deptno,
       round(max(sal_comm),0) as max,
       round(min(sal_comm),0) as min,
       round(avg(sal_comm),0) as avg
from (select deptno, sal + nvl(comm,0) as sal_comm from emp)
group by deptno
order by deptno;

select deptno,
       round(max(sal + nvl(comm,0)),1) as max,
       round(min(sal + nvl(comm,0)),1) as min,
       round(avg(sal + nvl(comm,0)),1) as avg
from emp
group by deptno
order by deptno;


��40) �� �����鿡 ���ؼ� ������ �̸��� �ټӿ����� ���Ͻÿ�
select ename,
ceil((sysdate-hiredate)/365) as "�ټӿ���"
from emp;


��41) �Ʒ��� ���� ��� �Ͻÿ�
      ��) �������� �ټӳ�� : 20��
select ename || '�� �ټӿ��� : ' || ceil((sysdate-hiredate)/365) || '��' from emp;


��42) ������� �ټӳ���� ������ ���� ��ȸ(�̸�, �ټӳ��)�Ͻÿ�
select ename, "�ټӿ���"
from (select ename, ceil((sysdate-hiredate)/365) as "�ټӿ���" from emp)
where "�ټӿ���" = (select ceil((sysdate-hiredate)/365) 
                    from emp 
                    where ename = '�����');


��43) �Ի����� ��20�� �̻�� ����� ���� ���翬������ 10% �λ������ �� 
      ���, �̸�, �Ի���, ���翬��, �λ��Ŀ���, �λ�ȱݾ����� ��׿��������� ��ȸ�Ͻÿ�
      �������ϴ� �� : �޿�(sal)*12����+���ʽ�(comm)
select empno, ename, hiredate,
       (sal*12+nvl(comm,0)) as "���翬��" ,
       round((sal*12+nvl(comm,0))*1.1,0) as "�λ��Ŀ���",
       (sal*12+nvl(comm,0))*0.1 as "�λ�ȱݾ�"
from emp
where trunc((sysdate-hiredate)/365) >=20
order by "�λ��Ŀ���" desc;


��44) �Ի�⵵�� ¦���� �������� �޿��� ����� job���� ����Ͻÿ�
select job, avg(sal) as "�޿����" 
from (select hiredate, job, sal from emp where mod(extract(year from hiredate),2)=0) 
group by job;

select job, avg(sal) as "�޿����"
from emp
where mod(extract(year from hiredate),2)=0
group by job;






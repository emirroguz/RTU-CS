/*=================================*/
/* DBMS NAME:	ORACLE Version 12c */
/*=================================*/

ALTER TABLE BOOKS
   DROP CONSTRAINT FK_BOOKS_BOOKS_AUT_AUTHORS;

ALTER TABLE BOOKS
   DROP CONSTRAINT FK_BOOKS_BOOKS_PUB_PUBLISHE;

ALTER TABLE BOOKS_CATEGORIES
   DROP CONSTRAINT FK_BOOKS_CA_BOOKS_CAT_BOOKS;

ALTER TABLE BOOKS_CATEGORIES
   DROP CONSTRAINT FK_BOOKS_CA_BOOKS_CAT_CATEGORI;

ALTER TABLE BOOKS_STUDENTS
   DROP CONSTRAINT FK_BOOKS_ST_BOOKS_STU_BOOKS;

ALTER TABLE BOOKS_STUDENTS
   DROP CONSTRAINT FK_BOOKS_ST_BOOKS_STU_STUDENTS;

ALTER TABLE LIBRARYCARDS
   DROP CONSTRAINT FK_LIBRARYC_STUDENTS__STUDENTS;

ALTER TABLE STUDENTS
   DROP CONSTRAINT FK_STUDENTS_STUDENTS__LIBRARYC;

DROP TABLE AUTHORS CASCADE CONSTRAINTS;

DROP INDEX BOOKS_AUTHORS_FK;

DROP INDEX BOOKS_PUBLISHERS_FK;

DROP TABLE BOOKS CASCADE CONSTRAINTS;

DROP INDEX BOOKS_CATEGORIES2_FK;

DROP INDEX BOOKS_CATEGORIES_FK;

DROP TABLE BOOKS_CATEGORIES CASCADE CONSTRAINTS;

DROP INDEX BOOKS_STUDENTS2_FK;

DROP INDEX BOOKS_STUDENTS_FK;

DROP TABLE BOOKS_STUDENTS CASCADE CONSTRAINTS;

DROP TABLE CATEGORIES CASCADE CONSTRAINTS;

DROP INDEX STUDENTS_CARDS2_FK;

DROP TABLE LIBRARYCARDS CASCADE CONSTRAINTS;

DROP TABLE PUBLISHERS CASCADE CONSTRAINTS;

DROP INDEX STUDENTS_CARDS_FK;

DROP TABLE STUDENTS CASCADE CONSTRAINTS;

/*==============================================================*/
/* TABLE: AUTHORS                                               */
/*==============================================================*/
CREATE TABLE AUTHORS (
   AUTHORID             VARCHAR2(10)          NOT NULL,
   AUTHORFIRSTNAME      VARCHAR2(50),
   AUTHORLASTNAME       VARCHAR2(50),
   AUTHORCOUNTRY        VARCHAR2(30),
   CONSTRAINT PK_AUTHORS PRIMARY KEY (AUTHORID)
);

/*==============================================================*/
/* TABLE: BOOKS                                                 */
/*==============================================================*/
CREATE TABLE BOOKS (
   ISBN                 VARCHAR2(13)          NOT NULL,
   AUTHORID             VARCHAR2(10)          NOT NULL,
   PUBLISHERID          VARCHAR2(10)          NOT NULL,
   BOOKTITLE            VARCHAR2(50),
   BOOKPUBLISHDATE      DATE,
   BOOKQUANTITY         SMALLINT,
   BOOKPRICE            REAL,
   CONSTRAINT PK_BOOKS PRIMARY KEY (ISBN)
);

/*==============================================================*/
/* INDEX: BOOKS_PUBLISHERS_FK                                   */
/*==============================================================*/
CREATE INDEX BOOKS_PUBLISHERS_FK ON BOOKS (
   PUBLISHERID ASC
);

/*==============================================================*/
/* INDEX: BOOKS_AUTHORS_FK                                      */
/*==============================================================*/
CREATE INDEX BOOKS_AUTHORS_FK ON BOOKS (
   AUTHORID ASC
);

/*==============================================================*/
/* TABLE: BOOKS_CATEGORIES                                      */
/*==============================================================*/
CREATE TABLE BOOKS_CATEGORIES (
   ISBN                 VARCHAR2(13)          NOT NULL,
   CATEGORYID           VARCHAR2(5)           NOT NULL,
   CONSTRAINT PK_BOOKS_CATEGORIES PRIMARY KEY (ISBN, CATEGORYID)
);

/*==============================================================*/
/* INDEX: BOOKS_CATEGORIES_FK                                   */
/*==============================================================*/
CREATE INDEX BOOKS_CATEGORIES_FK ON BOOKS_CATEGORIES (
   ISBN ASC
);

/*==============================================================*/
/* INDEX: BOOKS_CATEGORIES2_FK                                  */
/*==============================================================*/
CREATE INDEX BOOKS_CATEGORIES2_FK ON BOOKS_CATEGORIES (
   CATEGORYID ASC
);

/*==============================================================*/
/* TABLE: BOOKS_STUDENTS                                        */
/*==============================================================*/
CREATE TABLE BOOKS_STUDENTS (
   ISBN                 VARCHAR2(13)          NOT NULL,
   STDID                VARCHAR2(9)           NOT NULL,
   BOOKBORROWINGDATE    DATE,
   BOOKDELIVERYDATE     DATE,
   CONSTRAINT PK_BOOKS_STUDENTS PRIMARY KEY (ISBN, STDID)
);

/*==============================================================*/
/* INDEX: BOOKS_STUDENTS_FK                                     */
/*==============================================================*/
CREATE INDEX BOOKS_STUDENTS_FK ON BOOKS_STUDENTS (
   ISBN ASC
);

/*==============================================================*/
/* INDEX: BOOKS_STUDENTS2_FK                                    */
/*==============================================================*/
CREATE INDEX BOOKS_STUDENTS2_FK ON BOOKS_STUDENTS (
   STDID ASC
);

/*==============================================================*/
/* TABLE: CATEGORIES                                            */
/*==============================================================*/
CREATE TABLE CATEGORIES (
   CATEGORYID           VARCHAR2(5)           NOT NULL,
   CATEGORYNAME         VARCHAR2(40),
   CONSTRAINT PK_CATEGORIES PRIMARY KEY (CATEGORYID)
);

/*==============================================================*/
/* TABLE: LIBRARYCARDS                                          */
/*==============================================================*/
CREATE TABLE LIBRARYCARDS (
   CARDNO               VARCHAR2(10)          NOT NULL,
   STDID                VARCHAR2(9),
   CARDEXPDATE          DATE                  NOT NULL,
   CONSTRAINT PK_LIBRARYCARDS PRIMARY KEY (CARDNO)
);

/*==============================================================*/
/* INDEX: STUDENTS_CARDS2_FK                                    */
/*==============================================================*/
CREATE INDEX STUDENTS_CARDS2_FK ON LIBRARYCARDS (
   STDID ASC
);

/*==============================================================*/
/* TABLE: PUBLISHERS                                            */
/*==============================================================*/
CREATE TABLE PUBLISHERS (
   PUBLISHERID          VARCHAR2(10)          NOT NULL,
   PUBLISHERFULLNAME    VARCHAR2(50),
   PUBLISHERADDRESS     VARCHAR2(100),
   CONSTRAINT PK_PUBLISHERS PRIMARY KEY (PUBLISHERID)
);

/*==============================================================*/
/* TABLE: STUDENTS                                              */
/*==============================================================*/
CREATE TABLE STUDENTS (
   STDID                VARCHAR2(9)           NOT NULL,
   CARDNO               VARCHAR2(10)          NOT NULL,
   STDFIRSNAME          VARCHAR2(50),
   STDLASTNAME          VARCHAR2(50),
   STDPHONENO           VARCHAR2(12),
   STDMAIL              VARCHAR2(50),
   STDADDRESS           VARCHAR2(100),
   STDPOINT             NUMBER(3,0),
   CONSTRAINT PK_STUDENTS PRIMARY KEY (STDID)
);

/*==============================================================*/
/* INDEX: STUDENTS_CARDS_FK                                     */
/*==============================================================*/
CREATE INDEX STUDENTS_CARDS_FK ON STUDENTS (
   CARDNO ASC
);

ALTER TABLE BOOKS
   ADD CONSTRAINT FK_BOOKS_BOOKS_AUT_AUTHORS FOREIGN KEY (AUTHORID)
      REFERENCES AUTHORS (AUTHORID);

ALTER TABLE BOOKS
   ADD CONSTRAINT FK_BOOKS_BOOKS_PUB_PUBLISHE FOREIGN KEY (PUBLISHERID)
      REFERENCES PUBLISHERS (PUBLISHERID);

ALTER TABLE BOOKS_CATEGORIES
   ADD CONSTRAINT FK_BOOKS_CA_BOOKS_CAT_BOOKS FOREIGN KEY (ISBN)
      REFERENCES BOOKS (ISBN);

ALTER TABLE BOOKS_CATEGORIES
   ADD CONSTRAINT FK_BOOKS_CA_BOOKS_CAT_CATEGORI FOREIGN KEY (CATEGORYID)
      REFERENCES CATEGORIES (CATEGORYID);

ALTER TABLE BOOKS_STUDENTS
   ADD CONSTRAINT FK_BOOKS_ST_BOOKS_STU_BOOKS FOREIGN KEY (ISBN)
      REFERENCES BOOKS (ISBN);

ALTER TABLE BOOKS_STUDENTS
   ADD CONSTRAINT FK_BOOKS_ST_BOOKS_STU_STUDENTS FOREIGN KEY (STDID)
      REFERENCES STUDENTS (STDID);

ALTER TABLE LIBRARYCARDS
   ADD CONSTRAINT FK_LIBRARYC_STUDENTS__STUDENTS FOREIGN KEY (STDID)
      REFERENCES STUDENTS (STDID);

ALTER TABLE STUDENTS
   ADD CONSTRAINT FK_STUDENTS_STUDENTS__LIBRARYC FOREIGN KEY (CARDNO)
      REFERENCES LIBRARYCARDS (CARDNO);

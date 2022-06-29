DROP TABLE B_tblStates CASCADE CONSTRAINTS;
DROP TABLE B_tblSchools CASCADE CONSTRAINTS;        
DROP TABLE B_tblDepartments CASCADE CONSTRAINTS;
DROP TABLE B_tblArea_Of_Studys CASCADE CONSTRAINTS;   
DROP TABLE B_tblStudents CASCADE CONSTRAINTS;
DROP TABLE B_tblEmployees CASCADE CONSTRAINTS; 
DROP TABLE B_tblCourses CASCADE CONSTRAINTS;
DROP TABLE B_tblClass_Assignments CASCADE CONSTRAINTS; 
DROP TABLE B_tblAOS_Maps CASCADE CONSTRAINTS;
DROP TABLE B_tblClass_Sections CASCADE CONSTRAINTS;
DROP TABLE B_tblEnrollments CASCADE CONSTRAINTS;


CREATE TABLE B_tblStates
    (   STATE_CODE         CHAR(2),
        STATE_NAME         VARCHAR2(25),
        FIRST_ZIP_CODE     VARCHAR2(10),
        LAST_ZIP_CODE      VARCHAR2(10),
            CONSTRAINT STATES_STATESCODE_PK PRIMARY KEY (STATE_CODE)
    );


CREATE TABLE B_tblAOS_Maps 
    (   AOS_MAPID          NUMBER (6),
        CATALOG_YEAR       NUMBER (4)       NOT NULL,
        AOSID              CHAR(4)         NOT NULL,
        DEPTID             CHAR(3)          NOT NULL,
        COURSE_NUMBER      CHAR(3)          NOT NULL,
        SEMESTER_CLUSTER   NUMBER(2)        DEFAULT 0,
            CONSTRAINT AOSMAPS_MAPID_PK PRIMARY KEY (AOS_MAPID)
    );

CREATE TABLE B_tblSchools
    (   SCHOOLID           VARCHAR2(10),
        SCHOOL_NAME        VARCHAR2(200) NOT NULL,
        DEANID             NUMBER(6,0),
	    CONSTRAINT SCHOOLS_SCHOOLID_PK PRIMARY KEY (SCHOOLID)
    );

CREATE TABLE B_tblDepartments
    (   DEPTID             CHAR(3),
        DEPARTMENT_NAME    VARCHAR2(200) NOT NULL,
        SCHOOLID           VARCHAR2(10),
        DEPT_CHAIRID       NUMBER(6,0),
	    CONSTRAINT DEPARTMENTS_DEPTID_PK PRIMARY KEY (DEPTID)

    );

CREATE TABLE B_tblArea_Of_Studys
    (   AOSID            CHAR(4),
        DEPTID           CHAR(3)         NOT NULL,
        AOSTITLE         VARCHAR(200)    NOT NULL,
        AOS_LEVEL        CHAR(1),     
           CONSTRAINT AOS_AOSID_PK PRIMARY KEY (AOSID)
    );



CREATE TABLE B_tblStudents 
   (	STUDENTID          NUMBER(6,0), 
	LAST_NAME          VARCHAR2(25)   NOT NULL, 
	FIRST_NAME         VARCHAR2(25)   NOT NULL, 
	DOB                DATE           NOT NULL, 
	SSN                VARCHAR2(11)   NOT NULL, 
	GENDER             VARCHAR2(1), 
	STREET             VARCHAR2(100)  NOT NULL, 
	CITY               VARCHAR2(50)   NOT NULL, 
	STATE_CODE         CHAR(2), 
	ZIP_CODE           VARCHAR2(10), 
	PHONE              VARCHAR2(12), 
	EMAIL              VARCHAR2(200), 
	ADVISOR_CODE       NUMBER(6,0), 
	FINACIAL_AID_FLAG  VARCHAR2(5)    DEFAULT 'FALSE', 
	CATALOG_CODE       VARCHAR2(50), 
	ACT_AOS_ID1        CHAR(4)        DEFAULT 'UNDC', 
	ACT_AOS_ID2        CHAR(4), 
	    CONSTRAINT STUDENT_STUDENID_PK PRIMARY KEY (STUDENTID),
            CONSTRAINT STUDENT_SSN_UK UNIQUE (SSN)
    );


CREATE TABLE B_tblEmployees
    (   EMPLOYEEID          NUMBER(6,0),
        LAST_NAME           VARCHAR2(25)    NOT NULL,
        FIRST_NAME          VARCHAR2(25)    NOT NULL,
        A_PRIMARY_ADEPTID   CHAR(3),
        ADDRESS             VARCHAR2(100),
        CITY                VARCHAR2(50),
        STATE_CODE          CHAR(2),
        ZIP_CODE            VARCHAR2(10),
        PHONE               VARCHAR2(12),
        EMAIL               VARCHAR2(200),
            CONSTRAINT EMPLOYEES_EMPLOYEEID_PK PRIMARY KEY (EMPLOYEEID)
    );




CREATE TABLE B_tblCourses
    (   DEPTID             CHAR(3),
        COURSE_NUMBER      CHAR(3),
        COURSE_TITLE       VARCHAR2(200)     NOT NULL,
        COURSE_DESCRIPTION VARCHAR2(4000)    NOT NULL,
        COMMENTS           VARCHAR2(4000),
        CREDIT_HOURS       NUMBER(3),
        LAST_UPDATED_DATE  DATE,
        RETIRED_DATE       DATE,
            CONSTRAINT DEPTID_COURSE_NO_PK PRIMARY KEY (DEPTID, COURSE_NUMBER)
    );

CREATE TABLE B_tblClass_Assignments
    (   CLASS_ASSIGNMENTID NUMBER(6),
        CLASS_SECTID       NUMBER(6)       NOT NULL,
        INSTRUCTORID       NUMBER(6)       NOT NULL,
            CONSTRAINT CASSIGNMENTS_ASSIGNID_PK PRIMARY KEY (CLASS_ASSIGNMENTID)
    );

CREATE TABLE B_tblClass_Sections
    (   CLASS_SECTID       NUMBER(6),
        B_YEAR             NUMBER(4)       NOT NULL,
        SEMESTER_CODE      NUMBER(2)       NOT NULL,
        DEPTID             CHAR(3)         NOT NULL,
        COURSE_NUMBER      CHAR(3)         NOT NULL,
        SECTION_NUMBER     CHAR(2)         NOT NULL,
        CAMPUS_CODE        CHAR(5),
        BUILDING_CODE      VARCHAR2(10),
        ROOM_NUMBER        VARCHAR2(10),
        CLASS_DOW          VARCHAR2(7),
        CLASS_TIME         VARCHAR2(13),
           CONSTRAINT CLASSSECT_SECTID_PK PRIMARY KEY (CLASS_SECTID)
    );
        
CREATE TABLE B_tblEnrollments
    (   ENROLLMENTID      NUMBER(6),
        STUDENTID         NUMBER(6)        NOT NULL,
        CLASS_SECTID      NUMBER(6)        NOT NULL,
        MID_TERM_GRADE    CHAR(2),
        FINAL_GRADE       CHAR(2),
        ENROLLMENT_STATUS VARCHAR2(10)     DEFAULT 'GRADED',
        REGISTRATION_DATE DATE,
           CONSTRAINT ENROLLMENTS_ENROLLMENTID_PK PRIMARY KEY (ENROLLMENTID)
    );

INSERT INTO B_tblDepartments
    VALUES ('UND','Undeclared','','');
INSERT INTO B_tblDepartments
    VALUES ('ACC','Accounting','BET','');
INSERT INTO B_tblDepartments
    VALUES ('ALH','Allied Health','','');
INSERT INTO B_tblDepartments
    VALUES ('ANT','Anthropology','','');
INSERT INTO B_tblDepartments
    VALUES ('ART','Art','','');
INSERT INTO B_tblDepartments
    VALUES ('ASL','American Sign Language','','');
INSERT INTO B_tblDepartments
    VALUES ('AUT','Automotive Technology','','');
INSERT INTO B_tblDepartments
    VALUES ('BIO','Biology','','');
INSERT INTO B_tblDepartments
    VALUES ('BKK','Bookkeeping','BET','');
INSERT INTO B_tblDepartments
    VALUES ('BSL','Business Law','','');
INSERT INTO B_tblDepartments
    VALUES ('BSS','Bussiness Office Support Specialist','','');
INSERT INTO B_tblDepartments
    VALUES ('BTT','Biotechnology','','');
INSERT INTO B_tblDepartments
    VALUES ('BUS','Business','BET','');
INSERT INTO B_tblDepartments
    VALUES ('CHC','Complementary Health','','');
INSERT INTO B_tblDepartments
    VALUES ('CHM','Chemistry','','');
INSERT INTO B_tblDepartments
    VALUES ('CIS','Computer Information Systems','BET','');
INSERT INTO B_tblDepartments
    VALUES ('COM','Communication','','');
INSERT INTO B_tblDepartments
    VALUES ('CPS','Career Placement Services','','');
INSERT INTO B_tblDepartments
    VALUES ('CRJ','Criminal Justice','','');
INSERT INTO B_tblDepartments
    VALUES ('CSC','Computer Science','BET','');
INSERT INTO B_tblDepartments
    VALUES ('CST','Computer Systems Engineering Technology','BET','');
INSERT INTO B_tblDepartments
    VALUES ('DAS','Dental Assisting','','');
INSERT INTO B_tblDepartments
    VALUES ('DHY','Dental Hygiene','','');
INSERT INTO B_tblDepartments
    VALUES ('ECE','Early Childhood Education','','');
INSERT INTO B_tblDepartments
    VALUES ('ECO','Economics','','');
INSERT INTO B_tblDepartments
    VALUES ('EDU','Elementary Education','','');
INSERT INTO B_tblDepartments
    VALUES ('EET','Electronics Engineering Tecnology','BET','');
INSERT INTO B_tblDepartments
    VALUES ('ELM','Electromechanical Technology','BET','');
INSERT INTO B_tblDepartments
    VALUES ('ELT','Electronics Technology','BET','');
INSERT INTO B_tblDepartments
    VALUES ('EMT','Emergency Medical Technian','','');
INSERT INTO B_tblDepartments
    VALUES ('ENG','English','','');
INSERT INTO B_tblDepartments
    VALUES ('ERG','Engineering','BET','');
INSERT INTO B_tblDepartments
    VALUES ('ESL','English as a Second Langauge','','');
INSERT INTO B_tblDepartments
    VALUES ('EUT','Energy Utility Technolgy','','');
INSERT INTO B_tblDepartments
    VALUES ('FIN','Finance','','');
INSERT INTO B_tblDepartments
    VALUES ('FRC','French','','');
INSERT INTO B_tblDepartments
    VALUES ('FSC','Fire Science','','');
INSERT INTO B_tblDepartments
    VALUES ('GEO','Geography','','');
INSERT INTO B_tblDepartments
    VALUES ('GER','German','','');
INSERT INTO B_tblDepartments
    VALUES ('GRT','Gerontology','','');
INSERT INTO B_tblDepartments
    VALUES ('HRM','Hospitality & Recreation Management','BET','');
INSERT INTO B_tblDepartments
    VALUES ('HST','History','','');
INSERT INTO B_tblDepartments
    VALUES ('HUS','Human Services','','');
INSERT INTO B_tblDepartments
    VALUES ('HVC','Heating Ventilation Air Conditioning','BET','');
INSERT INTO B_tblDepartments
    VALUES ('IDS','Interdisciplinary Studies','','');
INSERT INTO B_tblDepartments
    VALUES ('IMD','Interactive Media Digital Design','','');
INSERT INTO B_tblDepartments
    VALUES ('LOG','Logistics','','');
INSERT INTO B_tblDepartments
    VALUES ('MAT','Mathematics','','');
INSERT INTO B_tblDepartments
    VALUES ('MGT','Management','BET','');
INSERT INTO B_tblDepartments
    VALUES ('MNT','Manufacturing Technology','BET','');
INSERT INTO B_tblDepartments
    VALUES ('MRK','Marketing','','');
INSERT INTO B_tblDepartments
    VALUES ('MSS','Medical Support Specialist','','');
INSERT INTO B_tblDepartments
    VALUES ('MUS','Music','','');
INSERT INTO B_tblDepartments
    VALUES ('NUR','Nursing Education','','');
INSERT INTO B_tblDepartments
    VALUES ('ORT','Orientation','','');
INSERT INTO B_tblDepartments
    VALUES ('OTA','Occupational Therapy','','');
INSERT INTO B_tblDepartments
    VALUES ('PHA','Public Health','','');
INSERT INTO B_tblDepartments
    VALUES ('PHE','Physical Education','','');
INSERT INTO B_tblDepartments
    VALUES ('PHI','Philosophy','','');
INSERT INTO B_tblDepartments
    VALUES ('PHY','Physics','','');
INSERT INTO B_tblDepartments
    VALUES ('PNP','Practical Nursing Program','','');
INSERT INTO B_tblDepartments
    VALUES ('PSC','Political Science','','');
INSERT INTO B_tblDepartments
    VALUES ('PSY','Psychology','','');
INSERT INTO B_tblDepartments
    VALUES ('RCP','Respiratory Care','','');
INSERT INTO B_tblDepartments
    VALUES ('RDT','Radiologic Technology','','');
INSERT INTO B_tblDepartments
    VALUES ('SCI','Science','','');
INSERT INTO B_tblDepartments
    VALUES ('SOS','Social Science','','');
INSERT INTO B_tblDepartments
    VALUES ('SPH','Speech','','');
INSERT INTO B_tblDepartments
    VALUES ('SPN','Spanish','','');
INSERT INTO B_tblDepartments
    VALUES ('SUR','Surgical Technology/Preioperative Nursing','','');
INSERT INTO B_tblDepartments
    VALUES ('THA','Theater','','');


INSERT INTO B_tblAOS_Maps
    VALUES (1,2020,'CIWP','CIS','105',1);

INSERT INTO B_tblAOS_Maps
    VALUES (2,2020,'CIWP','CIS','111',1);

INSERT INTO B_tblAOS_Maps
    VALUES (3,2020,'CIWP','CIS','121',1);

INSERT INTO B_tblAOS_Maps
    VALUES (4,2020,'CIWP','CIS','134',1);

INSERT INTO B_tblAOS_Maps
    VALUES (5,2020,'CIWP','ENG','101',1);

INSERT INTO B_tblAOS_Maps
    VALUES (6,2020,'CIWP','CIS','223',2);

INSERT INTO B_tblAOS_Maps
    VALUES (7,2020,'CIWP','CIS','228',2);

INSERT INTO B_tblAOS_Maps
    VALUES (8,2020,'CIWP','ENG','102',2);

INSERT INTO B_tblAOS_Maps
    VALUES (9,2020,'CIWP','MAT','122',2);

INSERT INTO B_tblAOS_Maps
    VALUES (10,2020,'CIWP','CIS','141',3);

INSERT INTO B_tblAOS_Maps
    VALUES (11,2020,'CIWP','CIS','226',4);

INSERT INTO B_tblAOS_Maps
    VALUES (12,2020,'CIWP','CIS','232',4);

INSERT INTO B_tblAOS_Maps
    VALUES (13,2020,'CIWP','CPS','298',4);

INSERT INTO B_tblAOS_Maps
    VALUES (14,2020,'CIWP','CIS','241',5);

INSERT INTO B_tblAOS_Maps
    VALUES (15,2020,'CIWP','CIS','299',5);

INSERT INTO B_tblAOS_Maps
    VALUES (16,2020,'CITR','CIS','105',1);

INSERT INTO B_tblAOS_Maps
    VALUES (17,2020,'CITR','CIS','111',1);

INSERT INTO B_tblAOS_Maps
    VALUES (18,2020,'CITR','CIS','121',1);

INSERT INTO B_tblAOS_Maps
    VALUES (19,2020,'CITR','ENG','101',1);

INSERT INTO B_tblAOS_Maps
    VALUES (20,2020,'CITR','MAT','100',1);

INSERT INTO B_tblAOS_Maps
    VALUES (21,2020,'CITR','ACC','101',2);

INSERT INTO B_tblAOS_Maps
    VALUES (22,2020,'CITR','CIS','223',2);

INSERT INTO B_tblAOS_Maps
    VALUES (23,2020,'CITR','ENG','102',2);

INSERT INTO B_tblAOS_Maps
    VALUES (24,2020,'CITR','MAT','123',2);

INSERT INTO B_tblAOS_Maps
    VALUES (25,2020,'CITR','MAT','124',3);

INSERT INTO B_tblAOS_Maps
    VALUES (26,2020,'CITR','CIS','134',4);

INSERT INTO B_tblAOS_Maps
    VALUES (27,2020,'CITR','CIS','226',4);

INSERT INTO B_tblAOS_Maps
    VALUES (28,2020,'CITR','CIS','232',4);

INSERT INTO B_tblAOS_Maps
    VALUES (29,2020,'CITR','MAT','125',4);

INSERT INTO B_tblAOS_Maps
    VALUES (30,2020,'DB','CIS','111',1);

INSERT INTO B_tblAOS_Maps
    VALUES (31,2020,'DB','CIS','121',1);

INSERT INTO B_tblAOS_Maps
    VALUES (32,2020,'DB','ENG','101',1);

INSERT INTO B_tblAOS_Maps
    VALUES (33,2020,'DB','CIS','141',2);

INSERT INTO B_tblAOS_Maps
    VALUES (34,2020,'DB','CIS','223',2);

INSERT INTO B_tblAOS_Maps
    VALUES (35,2020,'DB','CIS','228',2);

INSERT INTO B_tblAOS_Maps
    VALUES (36,2020,'DB','CIS','243',2);

INSERT INTO B_tblAOS_Maps
    VALUES (37,2020,'DB','CIS','244',2);


INSERT INTO B_tblArea_Of_Studys
    VALUES ('UNDC','UND','Undeclared','');
INSERT INTO B_tblArea_Of_Studys
    VALUES ('CIES','CIS','CIS Career Enterprise','A');
INSERT INTO B_tblArea_Of_Studys
    VALUES ('CITR','CIS','CIS Transfer Option','A');
INSERT INTO B_tblArea_Of_Studys
    VALUES ('CIWP','CIS','Web development and Programming','A');
INSERT INTO B_tblArea_Of_Studys
    VALUES ('DB','CIS','Database Certificate','C');
INSERT INTO B_tblArea_Of_Studys
    VALUES ('CWA','CIS','Applications Certificate','C');

INSERT INTO B_tblCourses
    VALUES ('ACC','101','Financial Accounting I','This course focuses on the relationships between business activities and events and the impact they have on financial statements from a preparer perspective. Students study financial transactions for both service and merchandising businesses and relate the transactions to a company?s assets, liabilities, owners? equity, revenues, and expenses. Areas of study include the basic accounting model, the process of the accounting cycle, accounting principles and terminology, financial statement preparation, analytics, and computerized accounting applications.','Prerequisite: Placement into college level English, MAT 090 with a grade of ?C? or higher or appropriate placement score Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ACC','102','Financial Accounting II','This course builds on the material learned in ACC 101. Students use their knowledge of preparing financial statements to analyze and communicate a variety of financial information including accounting for plant assets, stockholders equity, current and long-term liabilities and the statement of cash flows. Students demonstrate the knowledge they gain by working with Web resources to present a financial analysis of a public corporation.','Prerequisite: ACC 101, CIS 111 Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ACC','110','Accounting Software for Small Business','This course focuses on understanding accounting through a mastery of general ledger software applications. Students set up and maintain a computerized accounting records system by recording the transactions necessary to operate a service and merchandizing business. This course covers the areas of cash, accounts receivable, accounts payable, and payroll transactions. Students learn how to create these transactions on a computer and how to understand and interpret the resulting financial reports. During the laboratory component, students will be required to develop an accounting system for a small company. This course will prepare students for the Certified QuickBooks Users examination','Prerequisite: Placement into college level English, MAT 090 with a grade of ?C? or higher or appropriate placement score Semester Offered: F',4,'','');

INSERT INTO B_tblCourses
    VALUES ('ACC','211','Federal Taxation','This course examines basic federal income and employment taxes. Students learn how to prepare individual tax returns including the appropriate schedules, manually and on computers. Topics covered include analysis of tax problems, identification of tax issues, income inclusion and exclusion, deductible business and non-business expenses, gains and losses, tax credits, special taxes, and current tax laws and procedures.','Prerequisite: Placement into college level English Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ACC','222','Managerial Accounting','This course examines information used by executives and managers who work in business. Students study manufacturing accounting, budgeting and forecasting. Using computer applications, analytics, working in groups, and through classroom exercises, students learn to use and interpret accounting data as the basis for managerial decision-making and planning.','Prerequisite: ACC 102 Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ACC','225','Volunteer Income Tax Assistance, VITA Practicum','ACC 225 Volunteer Income Tax Assistance, VITA Practicum - 
This course introduces students to concepts and language of IRS and taxation while preparing federal and state taxes within their community for low-income individuals.','Prerequisite: CIS 111, Placement into college level English, MAT 090 with a grade of ?C? or higher or appropriate placement score Semester Offered: S',4,'','');

INSERT INTO B_tblCourses
    VALUES ('ACC','231','Computerized Accounting','This course focuses on understanding accounting through a mastery of general ledger software applications, using industry-standard software. Students set up and maintain a computerized accounting records system by recording the transactions necessary to operate a service and merchandising business. The course covers the areas of cash, accounts receivable, accounts payable, and payroll transactions. Students learn how to create these transactions on a computer and how to understand and interpret the resulting financial reports. QuickBooks certification exam will be offered at the end of the semester.','Prerequisite: ACC 101, CIS 111 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ALH','102','Introduction to Medical Terminology','This course provides a basic foundation for students interested in the allied health field. Emphasis is on analyzing word parts and learning basic prefixes, suffixes and word roots. The course also highlights the body systems: basic anatomy and physiology, including terms used in diseases and surgical procedures.','Prerequisite: Placement into college level English Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ALH','103','Introduction to Pharmacology for Allied Health Professionals','This course provides a foundation with knowledge in pharmacology, a historical view of pharmacology and explores the fundamental pharmacological concepts such as pharmacokinetics and pharmacodynamics. Students study drug classifications, their actions, indications for use, contraindications and adverse effects. Natural alternatives and herbal remedies are included. This course is designed for all students with an interest in the Allied Health Professions, as well as the general public.','Prerequisite: Placement into college level English Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ALH','106','Medical Law and Ethics','This course explores many legal, ethical and bioethical issues encountered in a medical office and offers suggestions for dealing with those issues in an informed, legal and sensitive manner. Students learn the various designations for medical employees (licensed, registered and certified) and understand the laws that directly relate to physicians. Also, an understanding of the role of bioethics in a medical office is discussed.','Prerequisite: Placement into college level English Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ALH','107','Medical Coding and Billing','This course examines ICD-10CM coding, CPT-4 coding, insurance programs, Medicare, insurance claim forms, and legal issues. The course introduces the coding systems and recordkeeping used in medical facilities.','Prerequisite: ALH 102, Placement into college level English Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ALH','131','Introductory Nursing Assistant','This course provides students with the theory and entry-level skills necessary to safely provide basic nursing assistant level care in a long-term care facility, acute care facility or home health care agency. Students learn the role and responsibilities of the nursing assistant and home health aide within the health care team, including patient and residents? rights, professionalism, communication skills, basic body structure and function, common disorders, rehabilitation and restorative care, infection control and safety, special care concerns, and basic patient care skills, including vital signs. Upon completion of classroom and skills practice laboratory learning and competency testing, students participate in a clinical rotation at a skilled nursing facility, under the supervision of a registered nurse.','Prerequisite: Placement into college level English Semester Offered: F/S/SU',5,'','');

INSERT INTO B_tblCourses
    VALUES ('ALH','132','Advanced Nursing Assistant','This advanced course is designed for students who have completed a Massachusetts state-approved nursing assistant training program and want to expand their knowledge related to the role and practice of the certified nursing assistant. Students learn the importance of professionalism and develop the traits, behaviors, and skills that employers are demanding of today?s health care workers. Topics include work ethics and performance, personal values, personal traits of the health care professional, interpersonal relationships, teamwork and communication skills, cultural competence, professionalism and personal life, job-seeking skills, becoming a leader, and career development. This course also includes advanced education to expand students? knowledge of how to understand and successfully care for people with dementia. Topics include types and symptoms of dementia, conditions that may present dementia-like symptoms, prevention of abuse, communication strategies, understanding and dealing with challenging behaviors, and the principles of a person-centered approach to care.','Prerequisite: ALH 131, Certificate of Completion from a state-approved nursing assistant training program or current C.N.A. Certificate Semester Offered: F/S/SU',2,'','');
INSERT INTO B_tblCourses
    VALUES ('ALH','134','Phlebotomy/EKG Technician','This course provides an introduction to the theory, techniques and roles of a phlebotomist and electrocardiogram (EKG) technician. Students learn phlebotomy skills, including skin puncture, venipuncture, blood collection, and quality assurance. Additional topics include infection control, medical terminology, quality assurance, principles of venipuncture, specimen handling, basic hematology and basic anatomy of the venous system. Students learn the cardiovascular system as it relates to the performance of an EKG. Students gain knowledge in basic EKG tracing, rate, rhythm, common heart abnormalities and the use and function of the EKG machine.','Prerequisite: Placement into college level English 
Corequisite: ALH 136 Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ALH','136','Phlebotomy/EKG Technician Clinical Co-Operative Externship','The externship prepares students for a career as a phlebotomy/EKG technician. Students learn phlebotomy skills, EKG skills and how to use reference materials. Students then work in a laboratory and learn how to perform as a phlebotomist; they also work in an EKG clinic and learn how to perform as an EKG technician. Students practice their communication skills, familiarize themselves with the layout of the EKG clinic and its daily and monthly operation. Students experience data entry and third-party billing, inventory and quality control checks. Students also practice writing a resume, interviewing techniques and professional skills.','Corequisite: ALH 134 Semester Offered: F/S/SU',6,'','');

INSERT INTO B_tblCourses
    VALUES ('ALH','137','Pharmacy Technician','This course provides students with the knowledge needed to prepare for a career as a pharmacy technician. Students study the laws of pharmacy practice, drug names and classification, compounding, calculations, abbreviations, and dosage forms. Students learn various duties a technician may perform as well as communication skills and aspects of assisting the pharmacist.','Prerequisite: Placement into college level English, MAT 090 with a grade of ?C? or higher or appropriate placement score Semester Offered: F',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ALH','138','Pharmacy Technician Clinical Co-Operative Externship','The externship prepares students for a career as a pharmacy technician. Students learn compounding skills, mathematical calculations, and how to use reference materials. Students then work in a pharmacy and learn how to perform as a pharmacy technician. They practice their communication skills; familiarize themselves with the layout of a pharmacy and its daily and monthly operation. Students experience data entry and third-party billing, inventory and compounding. Students also practice writing resumes, interviewing, and professional skills.','Prerequisite: ALH 137 Semester Offered: S',6,'','');

INSERT INTO B_tblCourses
    VALUES ('ALH','151','Medical Office Administration I','This course introduces medical office procedures, including appointment scheduling, medical records creation and maintenance, phone communication, inventory of supplies, and computers in the medical office. Students become competent in the use of office equipment and the composing of different types of letters. The course introduces verbal and non-verbal methods of communication skills.','Prerequisite: ALH 102, ENG 101, PSY 101 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ALH','152','Medical Office Administration II','This course examines legal relationships of physicians, staff and patients, contractual agreements, professional liability, malpractice, medical practice acts, informed consent and bioethical issues. Emphasis is placed on legal terms, professional attitudes, and the principles and basic concepts of ethics and laws involved in providing medical care. Additionally, students acquire entry-level skills with the use of electronic medical record (EMR) software.','Prerequisite: ALH 107, ALH 151, CPS 298, MSS 151 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ALH','299','Healthcare Externship','This course provides students with real world experience in health careers. Students learn the job-hunting process, identification of their skill set, resume and cover letter preparation, job interviewing skills, networking, negotiation, interpersonal skills development, business etiquette, ethics, and presenting themselves for success. Co-op Placement: Students develop a learning agreement with the instructor, stipulating learning goals and outcomes based on the position description. Students are required to successfully satisfy the terms of the learning agreement and complete the cooperative work experience related to their particular major. The faculty member and career placement services can provide Co-op placement assistance, but students are ultimately responsible for securing a timely Co-op placement.','Prerequisite: ACC 101 or MRK 201, ALH 106, BSS 112 or MRK 221, CPS 298 Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','105','Introduction to Information Technology','This course provides an overview of the core aspects of information technology. The topics include: computer hardware, operating systems, application software, networks, information security, interactive media, and programming. The course focuses on defining how each IT area relates to, and interacts with, each other. Upon completion of the course, students have the knowledge necessary for further study in IT as well as understanding of the impact of technology on society and organizations of all types.','Credits: 3 Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','111','Introduction to Microcomputer Applications','This course provides an overview of common business office technology usage, including operating systems functions, Internet technologies, and productivity suites. The course focuses on basic working knowledge and hands-on experiences in word processing, spreadsheet processing, relational database processing, and presentation software. This course is the first of two in a series to assist students in preparation of the Microsoft Office Specialist (MOS) certification exam.','Credits: 3 Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','112','Advanced Microcomputer Applications','This course builds on the foundations acquired in CIS 111. Students learn complex spreadsheet and database processing through the use of realistic business situations. For spreadsheet, topics will include financial functions, amortization schedules, connecting multiple worksheets and workbooks, sorting, querying tables, Pivot Tables, importing data, as well as data cleansing utilizing VBA. For database, topics will include report and form creation, learn multiple-table form techniques, learn advance report generation techniques, add combo boxes and command buttons to forms, creation of multiple page form, and form navigation using macros. This course is the second of two in a series to assist students in preparation of the Microsoft Office Specialist (MOS) certification exam.','Credits: 3 
Prerequisite: CIS 111, Placement into college level English, MAT 095 with a grade of ?C? or higher or appropriate placement score Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','121','Introduction to Programming with C++','This course focuses on the basic concept of programming, utilization of the executable codes, and implementation of these codes in problem solving. Students learn the concept of solving problems through the design and implementation of algorithmic solutions using the C++ programming language. Topics include the programming process, structured programming techniques, and basic logic formations. Practical business applications are emphasized throughout the course. Microsoft frameworks and Visual Studio will be emphasized.','Credits: 3 
Prerequisite: Placement into college level English, MAT 095 with a grade of ?C? or higher or appropriate placement score 
Corequisite: CIS 111 or CIS 115 Semester Offered: F/S',3,'','');
INSERT INTO B_tblCourses
    VALUES ('CIS','134','Web Page Development I','This course focuses on designing Web sites using HTML5/XHTML and CSS3 along with development tools such as Notepad++. Topics include creating links, image maps, using grid-based layout for laying out pages, positioning elements, applying CSS for graphic design, flexbox for mobile web pages, media queries, tables, client-side forms, and insertion of audio and video files. Validation of web pages using transitional DTD, strict DTD will also be discussed. Students will work on individual assignments to create web pages/sites.','Prerequisite: Placement into college level English, MAT 095 with a grade of ?C? or higher or appropriate placement score 
Corequisite: CIS 111 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','141','Introduction to Data Communication & Networks','This course examines business data communications. Students learn fundamental communication concepts, communication networks, and communications hardware and software. Students study the information in a non-technical format designed to provide an understanding of data communication systems needed in today?s business environment.','Prerequisite: Placement into college level English, MAT 095 with a grade of ?C? or higher or appropriate placement score 
Corequisite: CIS 111 Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','206','Management of Data Analytics','This course prepares students to understand data-driven decision making in business. Students complete assignments and hands-on projects using data and software. Topics in this course include descriptive, predictive, and prescriptive data analytics, data manipulation, determination of correct data, decision making, and the use of analytical tools.','Prerequisite: CIS 111, MAT 122 Semester Offered: F/S Note: This course is cross-listed as MGT 206',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','212','Prerequisite: CIS 111, MAT 122 Semester Offered: F/S Note: This course is cross-listed as MGT 206','This course provides students with the understanding of Electronic Health Records (EHR) system, HIPPA requirements, patient confidentiality, a team-based approach, and workflow processes in a health care setting. This course allows the student to learn to use and operate an EHR software package.','Prerequisite: ALH 102, CIS 111 Semester Offered: F',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','223','.NET Programming I','In this course, students who already have been exposed to programming and critical thinking are introduced to Microsoft .NET architecture, Visual Studio IDE and object-oriented programming with .NET. The course emphasizes building stand-alone desktop projects with graphical user interfaces using WinForm components. Students are taught how to apply the principles of programming and problem solving within an object-based design and event-driven paradigm. Among other skills, the student learns basic interface design, using common libraries and features of the common language runtime.','Prerequisite: CIS 111, CIS 121 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','225','Programming with C++ II','This course is a continuation of CIS 121 and covers advanced topics, including recursive programming, storage techniques, pointer and dynamic variables, arrays, manipulation of data (searching, sorting, etc.), file processing, linked lists, stacks and queues. The course emphasizes structured programming through the use of algorithm analysis. Students explore higher-level problem solving through user-defined functions and classes, and learn how to write programs and demonstrate proficiency in the C++ language. Advanced Visual Studio features are utilized for building Application solutions.','Prerequisite: CIS 121 Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','226','Introduction to Java','This course explores the fundamentals of visual object-oriented programming using the Java language. Students learn how to design, write, and compile Java programs through lectures, hands-on programming assignments, and projects. The emphasis is on problem solving through algorithmic analysis. Topics include Java applications and applets, control structures, methods and classes, arrays, searches, and fundamental data types.','Prerequisite: CIS 121 Semester Offered: F',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','227','Java II','This course is a continuation of CIS 226 and focuses on higher-level visual object-oriented programming using the Java language. Students learn to design, write, and execute Java applications and applets using graphic user interface (GUI) components through lectures, hands-on programming exercises, and projects. Other topics include exception handling, classes and methods, objects and inheritance, and problem solving through the use of algorithmic analysis.','Prerequisite: CIS 226 Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','228','SQL Programming','This course introduces students to the fundamentals and functions of Structured Query Language (SQL), including relational database, table creation, updating, and manipulation concepts. Using a live data base, students learn SQL basics and then move on to the more sophisticated and challenging aspects of SQL. Students get in-depth knowledge of the language through extensive use of Internet-based, industry-standard SQL programming and certification testing engines. Upon completion of this course, students have the skills and competencies required to program in SQL and the background necessary to continue to intermediate and advanced courses in PL/SQL and database administration.','Prerequisite: CIS 105 or CIS 111, Placement into college level English, MAT 095 with a grade of ?C? or higher or appropriate placement score Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','229','PL/SQL Programming','This is an intermediate course in the use of Relational Database Management Systems Procedural Language, PL/SQL. The course focuses on the concepts, design and components of relational database PL/SQL programming Language, including creating record, types, defining transactions, the basics of SQL in PL/SQL and datatypes. The student will also manipulate RDBMS including functions related to multiple tables, compound and complex queries, exporting and importing tables, sub-queries, and reporting.','Prerequisite: CIS 228 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','230','Mobile Apps Development','This course introduces application development for mobile devices such as Android, Windows, and web. Students program professional apps, using standard IDE (Integrated Development Environment) platforms commonly used professionally, through lectures, hands-on programming assignments, and individual and group projects.','Prerequisite: CIS 226 Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','232','.NET Programming II','This course emphasizes in-depth programming skills and extends the student?s knowledge of Microsoft .NET and Microsoft IDE Visual Studio. The course emphasizes the use of SQL and ADO.NET for the creation of stand-alone and distributed database applications to solve common business problems. The course exposes students to n-tier and database application design, advanced error handling, and the production of flexible business reports. Advanced Visual Studio features are utilized for building Application solutions.','Prerequisite: CIS 223 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','234','Web Page Development II','This course focuses on creating interactive Web sites using the latest version of XHTML, DHTML and JavaScript. Students write code for form validation, page animation, image and text rollovers, pull-down menus, slide shows, create expandable and collapsible outlines, and mouse and keyboard events to create interactive and dynamic web sites. Students also learn to code for W3CDOM. Concepts of e-commerce are discussed.','Prerequisite: CIS 121, CIS 134 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','241','Systems Analysis & Design','This course introduces the student to the major design methodologies such as SDLC, RAD, Object and Agile. This course provides practical experience in feasibility studies, data gathering, analysis, and design of a business information system. Students study the various techniques that can be utilized, conduct a feasibility study, learn valid data collection processes, analyze existing systems, and design new information systems.','Prerequisite: CIS 121 or CIS 223 or CIS 226 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','243','Database Management Application Development','This course focuses on in-depth database management utilizing current database applications. Microsoft?s Access is utilized to help reinforce relational database application concepts. Students learn the concepts of distributed database systems, query optimization, concurrency control, and deductive database and object-oriented database systems through lecture and hands-on activities. Topics include structural design, testing and debugging techniques, security, and backup and restart procedures. Students design and construct a complete database system.','Prerequisite: CIS 105 or CIS 111, Placement into college level English, MAT 095 with a grade of ?C? or higher or appropriate placement score Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','244','Database Management Concepts','This course provides an overview of the skills and the knowledge of database application systems that are used in business, government, and industry. Topics include database systems, data models, the relational database model, entity relationship modeling, normalization of database tables, advanced data modeling, introduction to Structured Query Language (SQL), database design.','Prerequisite: CIS 105 or CIS 111 or CIS 115 Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','245','Database-Driven Web Pages','This course introduces students to building database-driven pages using ?open source? tools available on the Internet. The tools used in this course will be PHP (Hypertext Preprocessor), which is a server-side scripting language, and MySQL and/or MS SQLServer, a relational database management system','Prerequisite: CIS 121, CIS 135 or CIS 141 
Corequisite: CIS 234 Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','246','.NET Programming III','This course introduces students who are already familiar with HTML, Visual Basic, and database concepts to creating N-tier Web applications using .NET technologies such as: Active Server pages and ActiveX data objectives. Microsoft?s Active Server Pages (ASP) technology allows the Internet developer to create browser-independent, dynamic Web pages by combining programmatic code with the three-tier client-server Web applications.','Prerequisite: CIS 134, CIS 232 Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','247','Database Administration','This course focuses on how to fine tune a selected relational database (RDB), such as SQL SERVER/ORACLE. Topics include RDB architectural components; RDB administration tools; RDB instances; creating an RDB database; constructing Data Dictionary views; maintaining the control file; maintaining the Redo Log File; managing table spaces and data files; understanding relationships and impacts on the storage structure; managing tables, indexes and segments; maintaining data integrity; managing users, profiles, privileges, and roles; understanding and using database auditing options; using National Language Support.','Prerequisite: CIS 228 or CIS 244 Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','251','Quality Assurance Foundations','This course is one of three in a series developed to introduce students to the importance of user-oriented programming development. This course focuses on software testing concepts. Topics include fundamentals of testing, testing throughout SDLC process, static testing, and dynamic testing. Testing techniques such as Black-box and White-box, management of testing, and testing tools are also covered. At the end of the course, students prepare to sit for ISTQB?s 2018 Foundation Level Exam.','Prerequisite: CIS 121 Semester Offered: S',1,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','252','Information Architecture/User Interface Foundations','This course provides fundamental methodologies for information systems user interface design requirements. Students will learn to plan and design navigation pathways for the information to flow easily and logically for the user. The focus will be on applying UI techniques that will meet the organizational information system?s goals and user?s requirements. The seven habits of Information Systems Interface Designers will be discussed, including understanding the business, maximum graphical effectiveness in information systems, think like a user, use of models and prototypes, focus on usability, invite feedback, and documentation.','Prerequisite: CIS 121, CIS 134 Semester Offered: S',1,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','253','Security Techniques in Programming','This course provides fundamental process and methodologies for creating secure software. Students are introduced to a variety of different software threats and vulnerabilities. Focus is placed on incorporating various techniques in the beginning of the Software Development Life Cycle.','Prerequisite: CIS 121, CIS 134 Semester Offered: S',1,'','');

INSERT INTO B_tblCourses
    VALUES ('CIS','299','Cooperative Work Experience & Seminar','This course provides students with an opportunity to learn about various approaches for career and employment. Students learn to create a portfolio, which includes resume, list of skills, and a sample of the completed project from a previous class. Students also learn to write a forwarding letter, elevator speech, interviewing skills, thank-you letter after an interview, business etiquette, as well as ethics. Using the job description, the student and the faculty will develop a learning agreement specifying learning goals. Students will complete 150 hours for a non-paid position and 225 hours for a paid position. Co-op placement assistance will be provided by career placement services and the faculty; however, the student will be responsible for obtaining a co-op placement.','Prerequisite: CIS 241, CPS 298, Approval of Program Coordinator Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CPS','298','Pre Cooperative Education Seminar','The Pre Cooperative Education Seminar is a required preparatory course designed to provide students with the necessary structure, resources, and support to successfully secure and engage in their cooperative education experience. Students will learn about the attitudes, skills and behaviors expected by employers. They will develop an understanding of Cooperative Education policies, procedures and requirements. Students will prepare an effective cover letter and resume, practice interview skills, job search strategies and learn how to self-market for a successful coop experience and post-graduate job search. Students will work with Career Services & Credit for Prior Learning to complete the necessary job readiness workshops.','Semester Offered: F/S',0,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','101','Introduction to Programming Using Python','This course introduces analytical thinking and problem solving using the Python programming language. Python is a modern language popular in many scientific and engineering disciplines. Students learn key concepts that help them learn how to work with data in their disciplines. This course covers basic logic operations, creating reusable and generic functions, and the use of data structures to represent the components of a problem. Topics include control structures, iterators, functions, and basic data structures, such as list, dictionary, file, etc., which are common in many programming languages. Students implement, comment, test, and debug programs through class assignments.','Prerequisite: MAT 099 with a grade of ?C? or higher or appropriate placement score Semester Offered: F',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','105','IT Help Desk Concepts','This course focuses on key information needed by user support professionals, including decision making, communicating successfully with a client, determining the client?s specific needs, and technical writing for the end user. Students are introduced to the latest in support industry trends, such as the use of Web support, e-mail-based support, self-service support and automated help desk software. Career paths for user-support workers are researched and discussed. This course details real-life scenarios of working professionals and issues in the IT help desk environment.','Semester Offered: F/S/SU',2,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','108','Computer Science I','This course is the first in a two-course sequence that provides students with a foundation in computer science. The complete two-course sequence is designed in such manner that students progress in knowledge, proficiency and professional maturity in software engineering principles, professional, and ethical conduct. Students develop fundamental programming skills using a language that supports an object-oriented approach, incorporating security awareness, human-computer interactions and social responsibility. This course emphasizes using a cyclic approach for program development by iterating through designing, coding, and testing program modules. Complemented by algorithm analysis, students are encouraged to think abstractly about problems and to begin developing processes for decomposing problems into organized parts. Encouraging clear documentation, good naming conventions and consistent secure coding style contribute to a disciplined approach to writing programs.','Prerequisite: CIS 111, Placement into college level English, MAT 100 or appropriate placement score Semester Offered: F/S Note: Four hours lecture',4,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','109','Computer Science II','This course is the second in a two-course sequence that provides students with a foundation in computer science. The progression of software engineering topics continues in CSC 108, where greater emphasis is placed on abstraction and sound software design principles, engaging students in the development of secure software components that solve a wide range of related problems and can be reused. The students determine the necessary elements of simple ADTs (such as a counter or a date) and then construct them; by their very nature, these components must be well-documented to encourage reuse. Additionally, the students write assertions such as pre- conditions and post-conditions describing each class method, thereby encouraging students to think deeply about a simple problem before coding. After coding, the components must be well-tested, and therefore the use of test plans and test drivers are practiced. These activities reinforce the notion of constructing software from well-defined, independent pieces and complement the study of using existing library classes and APIs in software solutions.','Prerequisite: CSC 108 with a grade of ?C? or higher Semester Offered: F/S Note: Four hours lecture',4,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','140','Mobile Operating Systems','This course explores information technology devices used in personal and professional capacities, including modern mobile operating systems environments. Students learn how to utilize, configure, and maintain common mobile operating systems including Windows, Android, and Mac OS in home and enterprise business environments. Students are presented with subject-matter contained within the CompTIA?s Mobility+ certification exam.','Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','141','Windows Client Operating Systems','This course provides the student with an introduction to Microsoft client or desktop operating systems. Hands-on activities in the laboratory closely parallel classroom discussion to give the student practical experience with the use and management of multiple desktop operating systems, both legacy and current. Topics include operating system installation and configuration, file systems, resource management, user management, and security. This course focuses on current Microsoft desktop operating systems and teaches subject-matter corresponding to the current Microsoft Solutions Associate certification examination.','Semester Offered: F/S/SU Note: Three hours lecture, three hours laboratory',4,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','201','Systems Programming and Scripting','This course provides an introduction to writing programs for use by operating systems. Students examine scripting within both Windows and Linux. Topics include command line operating system syntax, basic rules of scripting, examination of tools used for script creation, and creating scripts using both command line and graphical user interface tools.','Prerequisite: CSC 141 
Corequisite: CST 245 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','208','Introduction to Architecture and Assembly Language','This course presents computers from the circuit level to higher levels of abstraction. Students work from logical gates, digital circuits, and memory, through the execution model, machine and assembly languages, and the interaction with high-level languages. Topics include the organization of computers, number representatives, assembly language instruction sets and addressing modes, procedure calling and the stack, low-level input/output, and linkers and loaders. Students write and debug programs in assembly language.','Prerequisite: CSC 109 with a grade of ?C? or higher Semester Offered: S/SU',4,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','210','Storage Technologies','This course covers the information needed to plan, design, manage, and use storage technology infrastructure for information management in an enterprise environment. Students learn information availability and management theories commonly used in business today, including backup, recovery, and replication. Through hands-on activities, students implement solutions using modern storage subsystems such as Direct Attached Storage (DAS), Storage Attached Networks (SANs), Network Attached Storage (NAS), and Content Addressed Storage (CAS). This course contains subject-matter consistent with topics in EMC?s Storage Technologist and CompTIA?s Storage+ exams. Note: Some of the products and technologies discussed in this course are subject to federal government restrictions on exports from the U.S. Accordingly, all students registered for this course shall be subject to review under the ?Denied Persons List? maintained by the U.S. Department of Commerce?s Bureau of Industry and Security in order to determine their eligibility to receive U.S. goods and technology information.','Prerequisite: Placement into college level English Semester Offered: S/SU Note: Two hours lecture, three hours laboratory',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','211','Programming with Data Structures','This course introduces data structures using object-oriented programming techniques and basic algorithm analysis. It covers basic structures such as lists, queues, and stack; binary trees and balanced trees; hash tables and priority queues; and set and graph representation. Students use algorithms to survey and apply recursion techniques; apply common sorting and searching algorithms such as MergeSort; graph traversal algorithms such as Floyd?s and Dijkstra?s; and explore depth-first traversals, divide and conquer, backtracking, and greedy algorithms. Students develop and test a variety of programs in the languages chosen for the course.','Prerequisite: CSC 109 with a grade of ?C? or higher or CIS 225 Semester Offered: F/SU',4,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','212','Introduction to Software Engineering','The progression of software engineering topics from the previous computer science courses conclude in CSC 212, where students are asked to step beyond the programmer role and take a broader view of software development; to consider its lifecycle from problem description to maintenance. Students first practice with analysis and design of medium-sized systems. Standard modeling tools are introduced and the students complete the phases of analysis, design, implementation and testing of a medium-sized team project that includes documents such as UML diagrams or CRC cards in addition to test plans. The software engineering topics are integrated with professionalism and ethics, as well as software and information assurance topics, such as security concerns and liabilities of computer-based systems.','Prerequisite: CSC 109 with a grade of ?C? or higher Semester Offered: S/SU Note: Four hours lecture',4,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','221','C++ For Scientists & Engineers','This is a course in computer architecture and programming. Course topics include the fundamentals of software engineering; the computation of the engineering problem and selection of the appropriate algorithm; the relationship between analysis, design, coding and testing; programming algorithm, modularity, functions, constants; data structures, (such as records, lists, and trees) arithmetic operations and variables, accumulating, counting, and formatting output; mathematical library functions; relational expressions; logical operators, loops, solution of simultaneous linear equations; root finding; fixed increment iterations; numerical integration; rectangular approximations and trapezoidal approximations; Simpson?s method; pointers and character strings are covered in this course.','Prerequisite: MAT 124 
Corequisite: MAT 233 recommended Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','233','Computer Hardware and Support','This course is a comprehensive study of the topics students need to learn in order to service, maintain, upgrade, and optimize computer systems? hardware and related devices. Students perform hands-on laboratory projects utilizing servers, personal computers, laptops, tablets, and embedded systems. This course presents students with subject-matter corresponding to the CompTIA?s A+ 220-801 certification examination.','Corequisite: CSC 141 Semester Offered: F/S/SU Note: Three hours lecture, three hours laboratory',4,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','234','Networking Technologies','This course presents students with information needed to install, configure and troubleshoot local area networks (LANs). Students are also introduced to wide area networks (WANs) methods and technologies. Students will learn the basics of telecommunications, home and enterprise networking technologies, wireless networking technologies, protocols of data communications, LAN cabling, and internetworking. This course presents subject-matter contained within the CompTIA?s Network+ certification examination.','Corequisite: CSC 141 Semester Offered: F/S/SU Note: Three hours lecture, three hours laboratory',4,'','');

INSERT INTO B_tblCourses
    VALUES ('CSC','241','Windows Server Operating Systems','This course introduces students to current Microsoft Windows server operating systems and the techniques utilized to network computers with Windows client and server operating systems. Topics covered include establishing a user environment including permissions and rights, print servers, files system management, and advanced configuration and connectivity. Students use hands-on projects and project cases to emphasize what is covered in the lecture. This course presents subject-matter contained in the Microsoft Certified Solutions Associate examination in the area of the current Microsoft server operating system.','Prerequisite: CSC 141 Semester Offered: F/S/SU Note: Two hours lecture, three hours laboratory',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','205','IT Security Foundations','This course provides students with knowledge of the basic information security goals of availability, integrity, accuracy, and confidentiality. Vocabulary and terminology specific to the field of information security are discussed. Detection of exposures and vulnerabilities with their appropriate countermeasures, planning, and administrative controls are also discussed. Students become competent in the five areas of security, including general security, communications security, infrastructure security, cryptography, and operational/organizational security. This course presents subject-matter contained within CompTIA?s Security+ exam.','Prerequisite: Placement into college level English Semester Offered: S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','206','Computer Forensics','This course provides students with an introduction to computer forensics and investigation. Students are presented with methods to properly conduct computer forensics investigations beginning with an understanding of ethics through identification of tools and techniques to prevent, identify, and/or analyze computer crime. Students are presented with subject-matter contained within the Certified Forensic Computer Examiner (CFCE) certification offered by the International Association of Computer Investigative Specialists (IACIS) organization.','Prerequisite: CSC 141 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','207','Telecommunications in Business','This course provides students with the key technical and business strategies needed to leverage telecommunications technologies effectively in the business enterprise today. This course covers the principles of implementing and managing secure integrated voice, video, and data for a converged network solution, as well as providing an understanding of the importance of the convergence of voice and data in today?s enterprise. This course introduces voice technologies including VOIP, IVR, phone systems, and call center management; reviews video technologies including IPTV and video conferencing; and explores the implementation of LAN and WAN-based technologies including circuit and packet-switched networks. Students are presented with subject-matter contained within the CompTIA?s Convergence Technologies Professional (CTP+) certification exam.','Prerequisite: Placement into college level English Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','208','Enterprise IT Systems Security','This course presents a modern and relevant introduction to information systems security in business. Topics presented combine technical and managerial competence, skills, experience, and credibility to design, implement, and manage enterprise IT systems and network environments. Students are presented with subject-matter contained within the International Information Systems Security Certification Consortium (ISC)2 Certified Information Security Professional (CISSP) certification exam.','Prerequisite: CSC 141 Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','209','Ethical Hacking','This course combines an ethical hacking methodology with the hands-on application of security tools to assist students in maintaining secure computer and network infrastructures. Students learn to identify, counter, and defend hackers from penetrating networks and gaining access to vital information, mitigating potential threats. This course presents subject matter contained in the EC Council?s Certificated Ethical Hackers certification exam.','Prerequisite: CSC 201, CST 205 Semester Offered: S Note: Two hours lecture, three hours laboratory',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','211','Advanced Topics in Security','This course explores and reflects on modern security issues throughout the globe. Students learn to perform ongoing research on advanced security trends and the impact of those trends to the enterprise and consumer. Topics include security best practices, situational awareness, current vulnerabilities and threats, cyber-terrorism, mobile devices and Internet of Things security, and proposed/pending legislative actions regarding information security.','Prerequisite: CST 205 Semester Offered: F/S Note: Three hours lecture',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','231','Internetworking Principles and Protocols','This course presents a detailed overview of the implementation of the Transmission Control Protocol/Internet Protocol (TCP/IP) suite. It prepares students with the necessary concepts and skills needed to configure, manage, and troubleshoot the TCP/IP environment. Upon completion of the course, students are able to configure TCP/IP clients and resources, configure and manage TCP/IP services, and troubleshoot network problems using TCP/IP utilities.','Prerequisite: MAT 100 or appropriate placement score 
Corequisite: CSC 234 Semester Offered: F/S/SU Note: Two hours lecture, three hours laboratory',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','235','Network Infrastructure Management','This course represents the concepts and technologies employed to manage computer networks. It has a technical focus, employing the latest techniques in the disciplines of Network Management to provide a central solution to managing distributed Network Resources. Students design, document, and plan the implementation of a complex network environment including security, configure/use network management systems to control and troubleshoot networking equipment, and configure and use software to maintain and troubleshoot remote computer systems and resources from a central command center.','Prerequisite: CSC 234 
Corequisite: CST 231 Semester Offered: S Note: Two hours lecture, three hours laboratory',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','238','Enterprise Networking and Application Infrastructure','This course covers the many things that turn a Local Area Network (LAN) into an Enterprise Network. The focus is on the interconnectivity between multiple operating systems, services, and applications commonly deployed in business and industry today. Current trends are further illustrated with the current technology and network operating systems in wide use today.','Corequisite: CSC 241 Semester Offered: S/SU Note: Two hours lecture, three hours laboratory',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','240','Routing Technologies -','CST 240 Routing Technologies - 
This course provides students with a foundation in, and apprentice knowledge of, network routing for the small to medium office and home office environment. Students gain skills necessary to install, configure, and operate LAN, WAN, and dial access services for small to medium networks, including, but not limited to use of these protocols: IP, IGRP, IPX, Serial, AppleTalk, Frame Relay, IP RIP, VLANs, RIP, Ethernet and Access Lists. This course presents student with subject-matter contained within the Cisco Certified Network Associate (CCNA) certification examination.','Corequisite: CST 231 Semester Offered: S Note: Two hours lecture, three hours laboratory',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','245','UNIX Operating Systems I','This course provides students with a strong foundation in UNIX operating systems. Students explore the implementation of UNIX in a networked environment as a file/print server in an end-user environment and also as a special-purpose server, such as Web, e-mail, and database servers. Topics include installation and rebuilding of the operating system kernel, configuration, system administration and maintenance, and troubleshooting. This course presents subject-matter contained within the CompTIA?s Linux+ certification exams.','Corequisite: CSC 141 Semester Offered: F/S/SU Note: Three hours lecture, three hours laboratory',4,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','246','UNIX Operating Systems II','This course provides students with the knowledge to implement and maintain UNIX-based server technologies. Students install server-based Linux and those packages required to support Linux clients. Server components are discussed and then implemented by students and include: DNS, DHCP, NIS, NFS, and SAMBA. Students explore configuration of log files, remote access, task automation, security, and virtualization. After completing this course students have the required knowledge to sit for the Red Hat Certified System Administrator/Engineer (EX200 and EX300).','Prerequisite: CST 245 Semester Offered: S Note: Two hours lecture, three hours laboratory',3,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','250','Web Server Administration','network and application administration in today?s enterprise computing environments. This course focuses on Web Servers, emphasizing IT best practices, and providing practical knowledge on how to administer Web Servers in a Windows and Linux environment. Students learn the differences between two common Web Server architectures and environments, Microsoft IIS, and Apache, and learn the basics of using Web Server management consoles and command lines to package and deploy web sites in both environments. Topics such as IIS Manager, Virtual Directories, Web Activation Service, and FTP are examined.','Prerequisite: CSC 141 or CST 245 Semester Offered: S/SU',1,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','251','SQL Server Administration','This course is one of three in a series developed to introduce students to the growing complexities of network and application administration in today?s enterprise computing environments. This course focuses on SQL Server, emphasizing practical knowledge on how to administer SQL Server in a Windows environment. Students learn the basics of Relational Database Management Systems along with an overview of products on the market today. Students are introduced to installing and configuring SQL Databases, creating database tables and indices, and accessing data using SQL commands such as SELECT, UPDATE, DELETE, JOIN, and stored procedures. Topics related to administering a Microsoft SQL Server installation is also covered, including SQL Server Management Studio, security considerations, and performance management.','Prerequisite: CSC 141 Semester Offered: S/SU',1,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','252','Exchange Server Administration','This course is one of three in a series developed to introduce students to the growing complexities of network and application administration in today?s enterprise computing environments. This course focuses on Exchange Server, emphasizing practical knowledge on how to administer an Exchange Server in a Windows environment. Students learn the basics of installing and deploying Exchange, its integration with Active Directory, using the Exchange Management shell, user and contact administration, mailbox management, and enterprise considerations such as security, backup and recovery strategies, and secure mobile access.','Prerequisite: CSC 241 Semester Offered: S',1,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','253','Unified Communications','This course, one of five in a series, introduces students to the growing complexities of network and application administration in today?s enterprise computing environments. This course focuses on Unified Communication technologies, including real-time enterprise communication services such as instant messaging, presence information, voice, mobility features, audio, web and video conferencing, fixed-mobile convergence, desktop sharing, data sharing, call control and speech recognition with non-real-time communication services such as unified messaging across multiple devices and media-types.','Prerequisite: CSC 141, CSC 234 
Corequisite: CST 231 Semester Offered: S',1,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','254','SharePoint Server Administration','This course, one of five in a series, introduces students to the growing complexities of network and application administration in today?s enterprise computing environments. This course focuses on SharePoint and other collaborative technologies, emphasizing IT best practices, and providing practical knowledge on how to administer SharePoint in a modern Windows environment. Students explore the information architecture of SharePoint, plan a deployment, and install an on-premise and cloud-based version of the software. Students explore topics such as SharePoint metadata, SharePoint sites, and SharePoint governance.','Prerequisite: CSC 141 Semester Offered: S',1,'','');

INSERT INTO B_tblCourses
    VALUES ('CST','299','Cooperative Work Experience & Seminar','This course provides students with a structured learning experience, in which they apply classroom theory to a practical work experience. The seminar provides opportunities for students to exchange feedback about their work experience. The number of credits earned is determined by the number of weeks and hours per week required by the cooperative work experience and the objectives of the student?s learning contract.','Prerequisite: CPS 298, Approval of Program Coordinator Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','091','Intermediate Reading Skills','This course helps students to read independently in college level courses. Students acquire strategies for improving vocabulary and reading comprehension as well as critical thinking skills while emphasizing both academic reading and reading for studying. The minimal passing grade for developmental courses is a ?C?.','Prerequisite: ENG 090 with a grade of ?C? or higher or appropriate placement score Semester Offered: F/S/SU Note: This developmental English course cannot be used to satisfy degree or certificate requirements',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','092','College Reading Strategies','This course helps students to gain, practice, and perfect college level reading and comprehension skills using adaptive, self-paced reading technology. Students develop critical thinking abilities, improve vocabulary, language use, reading comprehension, and textbook command. The minimal passing grade is a ?C?.','Prerequisite: Appropriate placement score Semester Offered: F/S/SU Note: This developmental English course cannot be used to satisfy degree or certificate requirements',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','093','College Writing Strategies','This course helps students develop writing competence using adaptive, self-paced writing technology. Students will practice writing sentences, paragraphs, and essays, while learning how to recognize and use basic sentence patterns and write clear paragraphs containing a topic sentence, idea development, and a supportive conclusion. As students progress, they will write unified, supported, essays using grammatically sound sentences. Assignments are individually paced to prepare for college level writing courses. The minimal passing grade for developmental courses is a ?C?.','Prerequisite: Appropriate placement score Semester Offered: F/S/SU Note: This developmental English course cannot be used to satisfy degree or certificate requirements',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','095','Basic Writing Skills','This course helps students develop competence in written communication by practicing writing clear sentences and paragraphs. Students learn how to recognize and use basic sentence patterns and to write coherent paragraphs containing a topic sentence, idea development, and a strong conclusion. Students complete a variety of writing assignments and develop the skills needed for ENG 096 Intermediate Writing Skills. Taking the departmental final examination is a requirement of the course. The minimum passing grade for developmental English courses is a ?C?.','Prerequisite: Appropriate placement score Semester Offered: F/S/SU Note: This developmental English course cannot be used to satisfy degree or certificate requirements',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','096','096 Intermediate Writing Skills','This course helps students develop writing competence by practicing writing paragraphs and essays. Students learn to write unified, supported, coherent essays using grammatically sound sentences. Assignments focus on writing a variety of paragraphs and essays in order to prepare for college level writing courses. Taking the departmental final examination is a requirement of the course. The minimal passing grade for developmental English courses is a ?C?.','Prerequisite: ENG 095 with a grade of ?C? or higher or appropriate placement score Semester Offered: F/S/SU Note: This developmental English course cannot be used to satisfy degree or certificate requirements',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','097','The Reading-Writing Connection','This course analyzes college level essay writing by emphasizing the reading-writing connection. Students examine writing through reading and analyzing essay models and also refine their critical reading and writing skills by focusing on the writing process and effective reading strategies. Students develop a familiarity with library resources. Taking the Departmental Exam for writing is a requirement of this course. A minimum passing grade of ?C? is required.','Prerequisite: Appropriate placement score Semester Offered: F/S Note: This developmental English course cannot be used to satisfy degree or certificate requirements',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','101','Composition I','In Composition I, students write a minimum of four essays in multiple drafts in addition to shorter writing assignments, such as journals or discussion posts, with emphasis on audience awareness; critical thinking and reading; thesis development; organization; and grammatical correctness. Readings from various disciplines provide writing models and material for analysis of ideas. Students also evaluate, incorporate, and document sources from print, Internet, and library databases to support their writing.','Prerequisite: Placement into college level English Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','102','Composition II','In Composition II, students produce a minimum of four essays of carefully crafted prose. Student writers practice integrating and citing readings from academic disciplines, including literature; their research-based documented essays are expected to reflect the ethical standards of formal argument.','Prerequisite: ENG 101 Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','105','Technical Writing','This course focuses on writing letters, memos, resumes, lab reports, instructions/processes and technical descriptions, and design visual aids. Instructional emphasis is placed on clarity, correctness, conciseness, audience, precision, accuracy, organization, and document design in writing technical documents.','Prerequisite: ENG 101 Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','200','Children?s Literature','This course introduces students to the nature, variety, and artistry of children?s stories. Students examine various modes of the genre and investigate why stories are necessary and popular teaching vehicles for the intellectual growth and development of children. Students discuss and explore numerous tales, fables, myths, and literary archetypes. Special emphasis is placed on selected visually orientated stories and their context in today?s society. Students write individual reports and interact in panel discussions, commentary, and discussions of the merits of contemporary works.','Prerequisite: ENG 102 Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','202','Creative Writing','This course centers on weekly student writing of poems, short stories, plays or personal essays. Specific Projects will be determined by individual and group interests. Group discussion of works-in-process will aid the student to achieve a significant creative writing project for the semester. Examples of creative excellence will be read and discussed, with some attention to critical and aesthetic theory.','Prerequisite: ENG 102 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','203','Writing Poetry','This course focuses on writing fixed and free verse forms. Students learn the technical vocabulary of poetry and apply it to the work of classic and contemporary poets, as well as their own work and the work of their peers. Students present their poems in a group setting, and receive and provide both oral and written critiques.','Prerequisite: ENG 102 Semester Offered: F',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','204','Writing Fiction','This course focuses on writing short story and/or novel prose. Students learn the technical vocabulary of the craft and apply it to the work of classic and contemporary fiction writers, as well as their own work and the work of their peers. Students present their writing in a group setting, and receive and provide both oral and written critiques.','Prerequisite: ENG 102 Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','205','Technical and Workplace Writing','This course covers the theory and practice of writing appropriate to the workplace. While the course is designed for students interested in technical applications, it is useful for anyone who intends to enter an occupation that requires writing assignments such as resumes, reports, or proposals, instructions, web pages, abstracts, technical descriptions, and letters and memos in either traditional or electronic format. Other technically-oriented assignments may be included as well. Students explore concepts such as critical thinking, empathy, style, tone, persuasion, precision, simplicity, readability, ethics, etiquette, graphics, electronic and hard copy elements of design, and collaborativE writing. Students develop a portfolio to show prospective employers.','Prerequisite: ENG 102, Computer Literacy Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','209','Creative Nonfiction','This course covers topics based in reality using the tools of fiction - structure, characterization, plot, scene, dialogue, style, etc. - to animate storytelling and discover truth. Students examine readings from this genre both as scholars and writers, and cover core components of crafting memoir, personal essays, and literary journalism. Students also examine topics that include the role of memory, perception, subjectivity and ethical questions inherent in this genre as students produce original work of creative nonfiction.','Prerequisite: ENG 102 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','210','Introduction to Literary Theory','This course covers seminal extracts from the work of major literary/cultural theorists especially those whose work initiated particular schools of literary/cultural criticism. Students examine the work of these theorists in the order in which they appeared on the historical scene. Students also explore how the work of each theorist built upon, extended, challenged, or problematized, that of predecessors. Students apply these taught theories to several major works of literature. The class runs as a seminar and culminates with a final essay.','Prerequisite: ENG 101 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','231','Masterpieces of World Literature I','This course examines the history and growth of great books and ideas and their relevance to modern times. Students read literary selections from the ancient world to the 18th century to help them understand the sense and perspectives of major world writers. Students learn to demonstrate an understanding of both Eastern and Western literary traditions through class discussions and written assignments.','Prerequisite: ENG 102 Semester Offered: F',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','232','Masterpieces of World Literature II','This course complements ENG 231 by examining the history, growth, and cross influences of ideas and their impact on views of the modern world. Students study major writings and writers of both Eastern and Western literature from the 18th century to the present. Students learn how to understand the universal themes of great literature and the relevance of those themes in the modern world.','Prerequisite: ENG 102 Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','241','British Literature I','This course explores British literature from its beginnings to 1750. Students examine major representative authors of the Anglo-Saxon, medieval, Renaissance, metaphysical, and Restoration periods. Students study the major developments in English literature and develop an understanding of the relevancy of key themes of early British literature to present works. The course also explores the evolution of the English language from its beginnings in Old English to its modern-day form.','Prerequisite: ENG 102 Semester Offered: F',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','242','British Literature II','This course explores British literature from 1750 to the present. Students explore key literary and cultural movements that occurred during the Romantic, Victorian, 20th century, and contemporary periods. Selected works cover several literary genres including poetry, drama, the essay, the short story, and the novel.','Prerequisite: ENG 102 Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','251','American Literature I','This course examines American literature from approximately 1600-1870, covering poetry, fiction, essays, and autobiography. Students explore literary movements and major authors of major American time periods including the Puritan, colonial, Revolutionary, Romantic, Transcendentalist, and abolitionist eras. Students examine how writers influenced both their own times and subsequent generations.','Prerequisite: ENG 102 Semester Offered: F',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','252','American Literature II','This course examines American literature from the mid-1800s to the present, including poetry, fiction, essays, and autobiography. Students explore literary movements, major authors, and trends of the various time periods. Topics include American regional writing; American Realism; literature during and between the two world wars; the literatures of American minorities; and the contemporary literature of disillusionment. Students explore texts both as literary works and as products of historical forces.','Prerequisite: ENG 102 Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','256','The Short Story','This course focuses on reading and analyzing short stories by renowned writers from various cultures. Students participate in class discussions and write papers to demonstrate close reading skills, to express individual interpretation, and to understand the common themes and unique literary characteristics of the genre. Students also examine cultural and historical contexts that influenced the authors.','Prerequisite: ENG 102 Semester Offered: F/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','260','Special Topics in English','Special Topics in English provides an opportunity for specialized literary study of various topics from year to year. Special Topics may feature a particular literary theme, an historical era, a genre, a single author or group of authors, specific regional or national literature, or other topics defined by the teaching professor. Research papers or projects may constitute a significant portion of the course requirements. This course will vary in any number of ways according to the discretion of the instructor and the instructor?s choice of text(s).','Prerequisite: ENG 102 Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','261','African American Literature I','This course examines African American literature and vernacular culture from 1746 to 1940. Students explore the major authors, genres, aesthetics, political movements, and intersectional tropes of the period. The course focuses on the slave narrative, the Abolitionist movement, minstrelsy, the Civil War, racial uplift politics, Reconstruction, plantation literature, Post-Reconstruction, the New Negro movement, the Great Migration, the New Deal, Popular Front radicalism, and social realism. Students also explore representations of the law and technology in the primary texts. The course emphasizes African American resistance, agency, transculturation, intertextuality, and cultural continuity.','Prerequisite: ENG 102 Semester Offered: F',3,'','');

INSERT INTO B_tblCourses
    VALUES ('ENG','262','African American Literature II','This course examines African American literature and vernacular culture from 1940 to 2017. Students explore the major authors, genres, aesthetics, political movements, and intersectional tropes of the period. The course focuses on the Great Migration, Popular Front radicalism, social realism, the Civil Rights/Black Power movements, the Black Arts movement, and the post-Civil Rights ethos. Students also explore representations of the law and technology in the primary texts. The course emphasizes African American resistance, agency, transculturation, intertextuality, and cultural continuity.','Prerequisite: ENG 102 Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','090','Basic Mathematics Skills','This course is designed for students with little or no background in mathematics. Major topics include the following: whole numbers, fractions, decimals, percents, ratios, proportions, basic statistics (finding mean and reading graphs, charts and tables) and an introduction to algebra. Technology tools are utilized in this course. Taking the departmental final examination is a requirement of the course. The minimum passing grade for developmental mathematics courses is a ?C?.','Prerequisite: Appropriate placement score Semester Offered: F/S/SU Note: This developmental mathematics course cannot be used to satisfy degree or certificate requirements',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','095','Beginning Algebra','This course covers all basic operations of real numbers, linear and literal equations, graphing lines (using tables, x and y-intercepts), the arithmetic of polynomial expressions including properties of exponents, solving and graphing linear inequalities, perimeters and areas of basic figures, scientific notation and intrasystem metric conversions. Technology tools are utilized in this course. Taking the departmental final examination is a requirement of the course. The minimum passing grade for developmental mathematics courses is a ?C?.','Prerequisite: MAT 090 with a grade of ?C? or higher or appropriate placement score Semester Offered: F/S/SU Note: This developmental mathematics course cannot be used to satisfy degree or certificate requirements',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','098','Math Skills for Allied Health Careers','This course focuses on practical and useful applications of mathematics for students intending to enter the health science fields. Students examine mathematical topics as they relate to health application. Topics include: basic arithmetic computations in health applications; review of algebra; systems of measurement; medication labels; prescriptions, and syringe calculations; modeling health applications with ratios and proportions; dosage calculations; and basics of statistics.','Prerequisite: MAT 095 with a grade of ?C? or higher or appropriate placement score Semester Offered: S Note: This developmental mathematics course cannot be used to satisfy degree or certificate requirements',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','099','Intermediate Algebra','This course covers major topics in the study of algebra. Students learn to factor polynomials (common factor, grouping, difference of squares and trinomials), perform arithmetic operations on rational expressions and complex fractions, and solve rational, quadratic (by factoring and formula) and literal equations. The course also covers applications including the use of the Pythagorean Theorem, understanding the definition of radical expressions, simplifying radical expressions containing numerical and variable radicands, graphing linear equations using slope-intercept concepts, and solving 2x2 systems of linear equations by graphing and elimination. Technology tools are utilized in this course. Taking the departmental final examination is a requirement of the course. The minimum passing grade for developmental mathematics courses is a ?C?. Credits:','Prerequisite: MAT 095 with a grade of ?C? or higher or appropriate placement score Semester Offered: F/S/SU Note: This developmental mathematics course cannot be used to satisfy degree or certificate requirements',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','100','College Algebra','This course continues the areas of study presented in Intermediate Algebra with more advanced treatment. Students perform arithmetic operations on rational expressions; solve equations with fractions; factor expressions; simplify complex fractions; simplify exponential expressions, roots, radicals, and rational exponents; solve linear systems using several techniques; use the midpoint and distance formulas; recognize and graph the equation of a circle; solve linear and absolute value inequalities; solve quadratic equations by completing the square and by using the quadratic formula; solve equations containing radicals or absolute values; and perform arithmetic operations on radical expressions and complex numbers.','Prerequisite: MAT 099 with a grade of ?C? or higher or appropriate placement score Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','103','Mathematics for Business','MAT 103 Mathematics for Business - 
This course introduces the mathematical processes and techniques currently used in the fields of business and finance. Students use practical examples throughout to illustrate the relevance of analyzing and interpreting data in business and financial management. Students learn sound decision-making skills that will aid them in fulfilling their roles as citizens, consumers, employees, employers, investors, and entrepreneurs. The course introduces business statistics and continues with business and financial topics including bank services, business and consumer loans, simple and compound interest, payroll taxes, risk management, the mathematics of buying, break-even and cost-volume-profit analysis, discounts, markups and markdowns, inventory control, stocks and bonds, annuities and sinking funds, depreciation, interpreting financial statements and financial analysis.','Prerequisite: MAT 095 with a grade of ?C? or higher or appropriate placement Semester Offered: F Restriction: Restricted to Business Administration Career (BB and BBAP) and Business Administration Certificate (BAC) students',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','111','Mathematics for Educators I','This course focuses on the critical Mathematical concepts necessary for students who are pursuing the Elementary Education Transfer Option in the General Education-Associate in Arts degree program. Students construct and apply problem solving techniques to solve problems, apply arithmetical operations on integers, rational numbers and decimals, and develop an understanding of mathematical relationships using equations, draw conclusions based upon geometric pattern and interpret data. Students construct geometric patterns and graphical data into algebraic equations; construct a geometric or graphical model given an algebraic equation. Instructor modeling is an integral component of the course.','Prerequisite: MAT 099 with a grade of ?C? or higher or appropriate placement score Semester Offered: F/S/SU Restriction: Restricted to General Studies - Elementary Education Transfer Option and ECE Program students',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','112','Mathematics for Educators II','This course continues the comprehensive focus on the critical Mathematics concepts necessary for students who are pursuing and Early Childhood and/or General Studies Elementary Education degree. Students develop an understanding of the principles of Euclidean geometry and use them to prove theorems. In addition, students apply Euclidean geometry to analyze the characteristics and properties of two and three-dimensional shapes, coordinate geometry, and transformations. Fundamental principles of probability and statistics explored. Students develop a deep level of understanding of geometry, probability, and statistics in order to become successful elementary and middle school teachers. Instructor modeling is an integral component of the course.','Prerequisite: MAT 111 Semester Offered: F/S/SU Restriction: Restricted to General Studies - Elementary Education Transfer Option and ECE Program students',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','121','Topics in Mathematics','This course explores various areas in contemporary mathematics and consists of two components: required topics and optional topics. Required topics include mathematical patterns and problem solving, consumer finance, probability, statistics and Euclidean and transformational geometry. Optional topics may be chosen from the following: linear functions and applications; numeration systems; sets; logic; graph theory; election theory; apportionment; tessellations and fractals; and cryptography; in addition, instructors may also choose to expand upon the required topics.','Prerequisite: MAT 095 with a grade of ?C? or higher or appropriate placement Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','122','Statistics','This course covers the essentials of statistics. Students learn descriptive and inferential statistics; charts (histograms, frequency polygons, ogives, and pie charts); measures of central tendency (mean, median, mode, and weighted mean); and measures of dispersion (range, variance, and standard deviation). Additional areas of study include discrete and continuous random variables; basic probability theory; the binomial distribution and its application in binomial experiments; standard and non-standard normal distributions; the Central Limit Theorem; confidence intervals for means, proportions, and variances; linear correlation and regression; and the one sample hypotheses test for mean (large and small sample), proportions, and variances.','Prerequisite: MAT 095 with a grade of ?C? or higher or appropriate placement Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','123','College Mathematics I: Pre-Calculus','This course focuses on the knowledge and skills necessary for advanced mathematics. Students expand binomial expressions using the binomial theorem; solve non-linear, and rational inequalities and write their solutions using interval notation; determine and write linear equations in several forms; explain the concept of function; graph functions using symmetry test; recognize and graph functions, including constant, linear, quadratic, polynomial, rational, exponential, and logarithmic functions; use function transformation techniques; perform composition and arithmetic operations on functions; find and graph inverses of functions; use properties of logarithms; and solve logarithmic and exponential equations.','Prerequisite: MAT 100 or appropriate placement score Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','124','College Mathematics II: Trigonometry','Students solve right and oblique triangles and related applications; perform vector computations and use vector concepts to solve applications; determine the values of trigonometric ratios of angles and the values of inverse trigonometric ratios of real numbers; work with angles measured in degrees-minutes-seconds or radians; solve uniform circular motion problems; learn the traditional trigonometric identities and use them to prove other identities; perform transformations of basic trigonometric graphs; write equations to describe specific instances of harmonic motion; and solve trigonometric equations.','Prerequisite: MAT 123 or appropriate placement score Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','125','Discrete Mathematics','This course provides an introduction to the basic concepts in Discrete Mathematics. Topics include predicate and propositional calculus, sets, proof techniques, permutations and combinations, probability, relations, closure, partial order, functions, graph connectivity and shortest paths, and an introduction to languages, grammars and nondeterministic finite-state machines.','Prerequisite: MAT 123 or appropriate placement score Semester Offered: F/S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','147','Mathematics for Technicians I','This course covers applied mathematical concepts and methods: Content includes a review of basic concepts of arithmetic operations on scientific and engineering notation and algebra. Students are introduced to simple equations, functions and graphs, geometry, right triangles, vectors and oblique triangles. Students learn applications to systems of linear equations, matrices and determinants, ratio, proportion and variation. Solving quadratic equations, basic rules of factoring, power rule, exponents and radicals, radian measure, arc length, and rotation. Pythagorean Theorem and the six trigonometric ratios are also covered.','Prerequisite: MAT 095 with a grade of ?C? or higher or appropriate placement score Semester Offered: F/S/SU Restriction: Restricted to Manufacturing Technology programs (MP, MPA, MPC), Automotive Technology (AT), Computer Systems Engineering Technology programs (SECS, SECY, SEIT, SEF), Electronics Engineering Technology programs (EEBI, EEMO, EEPH, CE, CP), and Energy Utility Technology programs (GSET, EUTC)',4,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','148','Mathematics for Technicians II','This course covers applied mathematical and statistical concepts and methods: Topics include Trigonometry, parametric, and polar graphs; Trigonometric identities and equations; Exponential and logarithmic functions; Complex numbers and their applications; Series, sequences and the binomial theorem; Introduction to statistics and probability; Process Control, Correlation and Regression Analysis; Derivatives of algebraic functions.','Prerequisite: MAT 147 Semester Offered: F/S/SU',4,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','231','Applied Calculus','MAT 231 Applied Calculus - 
This course begins with a review of the basic concepts of functions and function notation. After introducing the limit and continuity theorems on an intuitive basis, the study of differentiation begins. Typical derivative formulae are applied to polynomial, rational, implicit, exponential and logarithmic functions. Application topics include extreme, related rates, biochemical reaction, cost-benefit analysis, growth and decay, maximizing revenue, elasticity of demand, inflation, amortization, drug concentration, drug reaction, and continuous probability models. The basic rules of integration and the substitution method are introduced along with Riemann Sums and the Fundamental Theorem of Calculus. This course is designed for students considering a major in business, pharmaceutical, social, and life sciences.','Prerequisite: MAT 123 or appropriate placement score Semester Offered: S',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','233','Calculus I','This course begins with a review of functions and functional notation. After introducing the limit and continuity theorems on an intuitive basis, the study of differentiation begins. Typical derivative formulae are applied to polynomial, rational, trigonometric, and implicit functions. Application topics include extrema, related rates, curve sketching, and velocity and acceleration. The basic rules of integration and the substitution method are introduced along with Riemann Sums and the Fundamental Theorem of Calculus.','Prerequisite: MAT 124 or appropriate placement score Semester Offered: F/S/SU',4,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','234','Calculus II','This course focuses on expanded methods of integration and their application. Derivatives of the exponential, logarithmic and inverse trigonometric functions as well as their antiderivatives will be examined. Students learn to compute the customary antiderivatives of functions and apply antidifferentiation to such areas as volumes, moments, centroids, arc lengths and surfaces of revolution. Students will be introduced to differential equations. The use of L?Hopital?s Rule and the evaluation of improper integrals are examined. The convergence tests of infinite series as well as the Power, Taylor and Maclauren series are analyzed.','Prerequisite: MAT 233 Semester Offered: F/S/SU',4,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','235','Calculus III','This course covers conic sections, rotation of axis, plane curves, parametric equations, vectors; polar, cylindrical, and spherical coordinates and graphs; vector-valued functions, differentiation, and integration; functions of several variables, partial derivatives, gradients; applications of extrema of functions, Lagrange multipliers; multiple integrations; area, volume, center of mass, moment of inertia, change of variables, Jacobians; Green?s, divergence, and Stokes? theorems. Students learn to use calculus to solve engineering and scientific problems. The course includes some elementary differential equations.','Prerequisite: MAT 234 Semester Offered: F/S/SU',4,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','237','Probability & Statistics for Engineers and Scientists','This course focuses on statistics and engineering. It covers interpretation, description, and treatment of data; probability and probability distributions; binomial, geometric, and hypergeometric methods; poisson processes; gamma, beta, and weibull distribution; populations and samples; inferences, hypotheses, and significance tests; Bayesian estimates; curve fitting; the method of least squares; curvilinear regression, correlation, and experimental design. Students use calculators and statistical software to solve statistical problems.','Prerequisite: MAT 234 Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','238','Differential Equations','This course covers definition of differential equations, solution of differential equations, separation of variables, homogeneous and nonhomogeneous solutions, Wronskian, second and higher order equations, solution of systems of linear differential equations, numerical methods, linear independence, the Laplace transform, transforms of derivatives, derivatives of transforms, the Gamma function, inverse transforms, and convolution theorem. Students use mathematical software to solve differential equations for numerical methods.','Prerequisite: MAT 235 Semester Offered: F/S/SU',3,'','');

INSERT INTO B_tblCourses
    VALUES ('MAT','243','Linear Algebra','This course covers systems of linear equations, matrices, reduced echelon forms, vectors in Rn, linear independence and transformations, matrix operations, inverse of a matrix, determinants, vector space, rank, subspaces, bases, eigen vectors and eigen values, the characteristic equations, diagonalization, complex eigen values, numerical methods for solving linear systems, and orthogonality. Students learn to use linear algebra to solve problems in differential equations, statistics, and engineering design. Students also use mathematical software to solve higher order systems of equations and matrices.','Corequisite: MAT 238 Semester Offered: F/S/SU',3,'','');


INSERT INTO B_tblEmployees
    VALUES (2300,'Irin','Ania','','PO Box 96621','New Braintree','MA','01531','413-555-1111','');

INSERT INTO B_tblEmployees
    VALUES (2301,'Quinn','Kenzie','','1990 Westwood Blvd Ste 260','Grafton','MA','01519','978-555-2222','');

INSERT INTO B_tblEmployees
    VALUES (2302,'Mauro','Anton','','3255 Ramos Cir','Worcester','MA','01610','508-555-3333','');

INSERT INTO B_tblEmployees
    VALUES (2303,'Anthoni','Kaitlyn','','Box 52001','Millbury','MA','01527','774-555-1234','');

INSERT INTO B_tblEmployees
    VALUES (2304,'Mayte','Kendall','','PO Box 2069','Sterling','MA','01564','774-555-1242','');

INSERT INTO B_tblEmployees
    VALUES (2305,'Hanson','Russell','CIS','4420 N. First Street, Suite 108','Hardwick','MA','01037','413-555-4403','');

INSERT INTO B_tblEmployees
    VALUES (2306,'Keeton','Gonzalo','','27371 Valderas','Sturbridge','MA','01566','978-555-1239','');

INSERT INTO B_tblEmployees
    VALUES (2307,'Chaddick','Dereck','','1952 "H" Street','Sturbridge','MA','01518','508-555-4457','');

INSERT INTO B_tblEmployees
    VALUES (2308,'Marques','Malia','ENG','7700 Forsyth','Acton','MA','01330','978-555-1248','');

INSERT INTO B_tblEmployees
    VALUES (2309,'Evan','Emily','','1555 W Lane Ave','Auburn','MA','01501','978-555-','');

INSERT INTO B_tblEmployees
    VALUES (2310,'Alexis','Alexandro','','3711 W Franklin','Barre','MA','01005','978-555-2240','');

INSERT INTO B_tblEmployees
    VALUES (2311,'Neil','Ingrid','','12 Daniel Road','Crescent Mills','MA','01050','508-555-2239','');

INSERT INTO B_tblEmployees
    VALUES (2312,'Lawrence','Eileen','','6 Albert St.','Worcester','MA','01603','978-555-4444','');

INSERT INTO B_tblEmployees
    VALUES (2313,'Essence','Marjorie','','PO Box 31','Duxbury','MA','02331','508-555-1247','');

INSERT INTO B_tblEmployees
    VALUES (2314,'Camron','Trentin','','PO Box 61000','Framingham','MA','01702','978-555-1241','');

INSERT INTO B_tblEmployees
    VALUES (2315,'Hunter','Mary','CIS','PO Box 956','Gardner','MA','01440','508-555-2237','');

INSERT INTO B_tblEmployees
    VALUES (2316,'Neftaly','Leah','','60 Madison Ave','Barre','MA','01005','978-555-5555','');

INSERT INTO B_tblEmployees
    VALUES (2317,'Myles','Rachael','CSC','PO Box 7028','Sterling','MA','01564','978-555-2236','');

INSERT INTO B_tblEmployees
    VALUES (2318,'Paris','Gideon','','1033 N Sycamore Ave.','Sutton','MA','01590','508-555-4456','');

INSERT INTO B_tblEmployees
    VALUES (2319,'Maxwell','Jayda','CSC','PO Box 39046','Shrewsbury','MA','01545','978-555-1235','');

INSERT INTO B_tblEmployees
    VALUES (2320,'Gerald','Christopher','','PO Box 40513','Shrewsbury','MA','01545','978-555-4455','');

INSERT INTO B_tblEmployees
    VALUES (2321,'Carrolton','Nolan','MAT','Box 1979','Fitchburg','MA','01420','978-555-7760','');

INSERT INTO B_tblEmployees
    VALUES (2322,'Griffin','Cole','','1150 N Tustin Ave','Fitchburg','MA','01420','978-555-4462','');

INSERT INTO B_tblEmployees
    VALUES (2323,'Cheyenne','Kaedin','','2384 E Gettysburg','Worcester','MA','01603','508-555-5555','');

INSERT INTO B_tblEmployees
    VALUES (2324,'Misael','Mathew','','PO Box 95857','Worcester','MA','01606','508-555-2235','');

INSERT INTO B_tblEmployees
    VALUES (2325,'Maeve','Belle','CIS','PO Box 7247-7051','Sutton','MA','01590','978-555-2234','');

INSERT INTO B_tblEmployees
    VALUES (2326,'Hanson','Abby','','627 Aviation Way','Shrewsbury','MA','01545','978-555-1244','');

INSERT INTO B_tblEmployees
    VALUES (2327,'Dineen','Lillie','','828 S Broadway','Sturbridge','MA','01566','978-555-7778','');

INSERT INTO B_tblEmployees
    VALUES (2328,'Aryn','Scott','CSC','3502 W Greenway #7','Worcester','MA','01606','508-555-2243','');

INSERT INTO B_tblEmployees
    VALUES (2329,'Braydon','Anne','','PO Box 942','Sutton','MA','01590','978-555-1237','');

INSERT INTO B_tblEmployees
    VALUES (2330,'Colton','Robert','','1626 E Street','Shrewsbury','MA','01545','978-555-7048','');

INSERT INTO B_tblEmployees
    VALUES (2331,'Arodondo','Cesar','MAT','4545 Glenmeade Lane','Sutton','MA','01590','508-555-2233','');

INSERT INTO B_tblEmployees
    VALUES (2332,'Dsnielson','Rachael','','353 E Shaw Ave','Sturbridge','MA','01518','978-555-7779','');

INSERT INTO B_tblEmployees
    VALUES (2333,'Edgardo','Salina','CPS','6435 North Palm Ave, Ste 101','Sutton','MA','01590','978-555-1238','');

INSERT INTO B_tblEmployees
    VALUES (2334,'Bradlee','Daniel','','4 Cornwall Dr Ste 102','Sturbridge','MA','01566','978-555-7780','');

INSERT INTO B_tblEmployees
    VALUES (2335,'Warren','Wayne','MAT','PO Box 12332','Worcester','MA','01603','508-555-4459','');

INSERT INTO B_tblEmployees
    VALUES (2336,'Clifford','Jillian','','3250 Spring Grove Ave','Sturbridge','MA','01518','978-555-8022','');

INSERT INTO B_tblEmployees
    VALUES (2337,'Lloyd','Angel','','Department #1872','Shrewsbury','MA','01545','978-555-7047','');

INSERT INTO B_tblEmployees
    VALUES (2338,'Helena','Jeanette','ENG','4775 E Miami River Rd','Worcester','MA','01606','508-555-7043','');

INSERT INTO B_tblEmployees
    VALUES (2339,'Destin','Lucianp','','P O Box 7126','Fitchburg','MA','01420','978-555-7001','');

INSERT INTO B_tblEmployees
    VALUES (2340,'Francis','Kyra','','4150 W Shaw Ave','Sterling','MA','01564','978-555-1240','');

INSERT INTO B_tblEmployees
    VALUES (2341,'Potter','Harry','CIS','28210 N Avenue Stanford','Fitchburg','MA','01420','508-555-8044','');

INSERT INTO B_tblEmployees
    VALUES (2342,'Smitzen','Jeffrey','','PO Box 1091','Shrewsbury','MA','01545','978-555-1243','');

INSERT INTO B_tblEmployees
    VALUES (2343,'Johnson','Vance','','9 River Pk Pl E 400','Sturbridge','MA','01518','978-555-2243','');

INSERT INTO B_tblEmployees
    VALUES (2344,'Aaronsen','Thomas','','7112 N Fresno St Ste 200','Fitchburg','MA','01420','508-555-7001','');

INSERT INTO B_tblEmployees
    VALUES (2345,'Spivak','Aaron','','2874 S Cherry Ave','Fitchburg','MA','01420','774-555-8099','');

INSERT INTO B_tblEmployees
    VALUES (2346,'Bluzinski','Penny','CPS','P.O. Box 860070','Shrewsbury','MA','01545','774-555-8123','');

INSERT INTO B_tblEmployees
    VALUES (2347,'Hernamdez','Reba','','PO Box 2061','Fitchburg','MA','01420','508-555-8234','');

INSERT INTO B_tblEmployees
    VALUES (2348,'Ronaldsen','Jaime','ENG','3467 W Shaw Ave #103','Fitchburg','MA','01420','774-555-8345','');

INSERT INTO B_tblEmployees
    VALUES (2349,'Beaguregard','Violet','','P.O. Box 505820','Sutton','MA','01590','774-555-8643','');

INSERT INTO B_tblEmployees
    VALUES (2350,'Bucket','Charlie','','P.O. Box 1140','Sturbridge','MA','01566','508-555-7001','');


INSERT INTO B_tblStates
    VALUES ('AK','Alaska',99500,99999);

INSERT INTO B_tblStates
    VALUES ('AL','Alabama',35000,36999);

INSERT INTO B_tblStates
    VALUES ('AR','Arkansas',71600,72999);

INSERT INTO B_tblStates
    VALUES ('AZ','Arizona',85000,86599);

INSERT INTO B_tblStates
    VALUES ('CA','California',90000,96699);

INSERT INTO B_tblStates
    VALUES ('CO','Colorado',80000,81699);

INSERT INTO B_tblStates
    VALUES ('CT','Connecticut',6000,6999);

INSERT INTO B_tblStates
    VALUES ('DC','District of Columbia',20000,20599);

INSERT INTO B_tblStates
    VALUES ('DE','Delaware',19700,19999);

INSERT INTO B_tblStates
    VALUES ('FL','Florida',32000,34999);

INSERT INTO B_tblStates
    VALUES ('GA','Georgia',30000,31999);

INSERT INTO B_tblStates
    VALUES ('HI','Hawaii',96700,96899);

INSERT INTO B_tblStates
    VALUES ('IA','Iowa',50000,52899);

INSERT INTO B_tblStates
    VALUES ('ID','Idaho',83200,83899);

INSERT INTO B_tblStates
    VALUES ('IL','Illinois',60000,62999);

INSERT INTO B_tblStates
    VALUES ('IN','Indiana',46000,47999);

INSERT INTO B_tblStates
    VALUES ('KS','Kansas',66000,67999);

INSERT INTO B_tblStates
    VALUES ('KY','Kentucky',40000,42799);

INSERT INTO B_tblStates
    VALUES ('LA','Lousiana',70000,71499);

INSERT INTO B_tblStates
    VALUES ('MA','Massachusetts',1000,2799);

INSERT INTO B_tblStates
    VALUES ('MD','Maryland',20600,21999);

INSERT INTO B_tblStates
    VALUES ('ME','Maine',3900,4999);

INSERT INTO B_tblStates
    VALUES ('MI','Michigan',48000,49999);

INSERT INTO B_tblStates
    VALUES ('MN','Minnesota',55000,56799);

INSERT INTO B_tblStates
    VALUES ('MO','Missouri',63000,65899);

INSERT INTO B_tblStates
    VALUES ('MS','Mississippi',38600,39799);

INSERT INTO B_tblStates
    VALUES ('MT','Montana',59000,59999);

INSERT INTO B_tblStates
    VALUES ('NC','North Carolina',27000,28999);

INSERT INTO B_tblStates
    VALUES ('ND','North Dakota',58000,58899);

INSERT INTO B_tblStates
    VALUES ('NE','Nebraska',68000,69399);

INSERT INTO B_tblStates
    VALUES ('NH','New Hampshire',3000,3899);

INSERT INTO B_tblStates
    VALUES ('NJ','New Jersey',7000,8999);

INSERT INTO B_tblStates
    VALUES ('NM','New Mexico',87000,88499);

INSERT INTO B_tblStates
    VALUES ('NV','Nevada',89000,89899);

INSERT INTO B_tblStates
    VALUES ('NY','New York',9000,14999);

INSERT INTO B_tblStates
    VALUES ('OH','Ohio',43000,45899);

INSERT INTO B_tblStates
    VALUES ('OK','Oklahoma',73000,74999);

INSERT INTO B_tblStates
    VALUES ('OR','Oregon',97000,97999);

INSERT INTO B_tblStates
    VALUES ('PA','Pennsylvania',15000,19699);

INSERT INTO B_tblStates
    VALUES ('RI','Rhode Island',2800,2999);

INSERT INTO B_tblStates
    VALUES ('SC','South Carolina',29000,29999);

INSERT INTO B_tblStates
    VALUES ('SD','South Dakota',57000,57799);

INSERT INTO B_tblStates
    VALUES ('TN','Tennessee',37000,38599);

INSERT INTO B_tblStates
    VALUES ('TX','Texas',75000,79999);

INSERT INTO B_tblStates
    VALUES ('UT','Utah',84000,84799);

INSERT INTO B_tblStates
    VALUES ('VA','Virginia',22000,24699);

INSERT INTO B_tblStates
    VALUES ('VI','Virgin Islands',801,850);

INSERT INTO B_tblStates
    VALUES ('VT','Vermont',5000,5999);

INSERT INTO B_tblStates
    VALUES ('WA','Washington',98000,99499);

INSERT INTO B_tblStates
    VALUES ('WI','Wisconsin',53000,54999);

INSERT INTO B_tblStates
    VALUES ('WV','West Virginia',24700,26899);

INSERT INTO B_tblStates
    VALUES ('WY','Wyoming',82000,83199);



INSERT INTO B_tblStudents
    VALUES (1,'Francillo','Lurlene','7-Jan-1978','201-87-0587','F','204 3rd Trail','Barre','MA','01005','812-876-8590','lfrancillo1l@merriam-webster.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (2,'Wakelam','Amble','12-Jun-1989','461-65-7213','M','356 4th Road','Charlton','MA','01507','650-387-6234','awakelam23@paginegialle.it','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (3,'McEntee','Cameron','21-Apr-1975','215-68-5356','M','8798 5th Circle','Worcester','MA','01606','865-851-0121','cmcenteeo1@wix.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (4,'Betteriss','Ddene','14-Feb-1956','104-02-4033','F','198 5th Way','Leominster','MA','01453','609-189-4353','dbetteriss2d@chron.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (5,'Ronaldson','Fiona','13-May-1975','581-08-5439','F','209 8th Parkway','Baldwinville','MA','01436','939-915-1924','fronaldsonr@hp.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (7,'Oxenden','Dominga','1-Dec-1972','747-43-1873','F','987 8th Street','Hopedale','MA','01747','433-900-2447','doxendene1@netvibes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (8,'Baysting','Niel','5-Jan-1959','880-28-4974','M','75 Acker Plaza','Worcester','MA','01606','297-160-6276','nbaystingjb@plala.or.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (9,'Rooper','Perri','8-Feb-1975','442-42-5997','F','931 Alpine Pass','Worcester','MA','01606','657-841-1347','prooperpv@sitemeter.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (10,'Goligly','Drucie','24-Mar-1981','693-08-1305','F','123 American Ash Trail','Spencer','MA','01562','438-938-9675','dgoliglyfn@google.nl','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (11,'Bowman','Tierney','15-Jul-1976','378-85-3745','F','28 Annamark Terrace','Leominster','MA','01453','271-235-7282','tbowmano0@examiner.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (12,'Arnoud','Hubert','1-Nov-1960','327-27-3868','M','30 Anniversary Park','Worcester','MA','01606','199-838-3770','harnoudh9@addtoany.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (13,'O Dornan','Sibylle','8-Oct-1977','806-83-2877','F','76 Anthes Avenue','Shrewsbury','MA','01545','406-125-9335','sodornaneo@nifty.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (14,'Goakes','Melisande','24-Dec-1981','846-09-6425','F','440 Anthes Junction','Worcester','MA','01606','472-658-5258','mgoakes4j@timesonline.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (15,'Bowshire','Nariko','1-Sep-1972','661-97-9825','F','76 Anzinger Drive','Springfield','MA','01101','804-586-6524','nbowshire2@salon.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (17,'Kiddey','Lacie','24-Feb-1973','748-78-7262','F','76 Arkansas Alley','Warren','MA','01083','751-102-7015','lkiddeyra@yandex.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (18,'Gail','Ruperta','7-Nov-1982','315-16-1734','F','76 Armistice Avenue','Northborough','MA','01532','403-970-5156','rgailae@ask.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (19,'di Rocca','Chucho','23-Feb-1972','469-35-8437','M','510 Arrowood Place','Worcester','MA','01606','296-566-0862','cdirocca9f@gov.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (20,'Paquet','Erastus','21-May-1966','797-95-0603','M','90 Atwood Junction','Worcester','MA','01606','877-497-0571','epaquet2e@github.io','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (21,'Ecclestone','Valentin','9-Apr-1977','716-75-6775','M','76 Badeau Hill','N. Brookfield','MA','01535','419-145-7604','vecclestone8u@baidu.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (66,'Carverhill','Stacy','19-Feb-1988','635-92-5974','M','76 Delladonna Street','Berlin','MA','01503','326-131-7099','scarverhill6e@163.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (67,'Tomasoni','Steffen','12-Aug-1978','228-66-6742','M','76 Derek Lane','Shrewsbury','MA','01546','556-317-0063','stomasoniei@wix.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (68,'Barnfather','Ebonee','23-Oct-1963','875-30-4625','F','76 Dexter Center','Leominster','MA','01453','579-247-6521','ebarnfatherkd@alexa.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (22,'Mangenot','Mab','16-Apr-1959','860-34-8333','F','120 Barby Lane','Worcester','MA','01606','508-230-1623','mmangenotc4@icq.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (23,'Colleck','Heda','8-Dec-1977','196-65-1636','F','222 Bay Terrace','Worcester','MA','01606','508-838-4204','hcollecka4@ihg.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (24,'Vedenyakin','Timothea','4-Feb-1980','451-74-7346','F','22 Bayside Court','Spencer','MA','01562','125-802-5184','tvedenyakinnm@imageshack.us','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (25,'Chater','Alvin','23-Apr-1979','737-50-5466','M','6 Birchwood Circle','Worcester','MA','01606','978-908-3845','achaterkl@bbb.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (26,'Spaughton','Rosabelle','19-Sep-1957','846-91-0861','F','147 Birchwood Lane','Worcester','MA','01606','508-631-0527','rspaughtonrj@devhub.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (27,'Monkley','Morena','10-Jan-1974','855-78-8411','F','65 Blaine Drive','Worcester','MA','01606','508-630-2634','mmonkleyc2@ucla.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (28,'Vella','Stevie','6-Oct-1980','437-55-3097','M','678 Blaine Road','Shrewsbury','MA','01545','584-566-5744','svellal6@vkontakte.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (30,'Climpson','Gunilla','7-Mar-1954','513-50-0324','F','2 Bowman Street','Oxford','MA','01540','645-227-0116','gclimpson50@earthlink.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (31,'Glauber','Cordy','25-Aug-1979','327-10-7800','M','111 Boyd Trail','Fitchburg','MA','01420','327-549-7121','cglauberej@latimes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (32,'Shankland','Nixie','25-Jul-1982','471-99-0033','F','23 Briar Crest Hill','Worcester','MA','01606','508-758-9002','nshanklando5@privacy.gov.au','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (33,'McGeachy','Murielle','15-Sep-1977','441-15-8255','F','47 Brickson Park Park','Rutland','MA','01543','331-403-1557','mmcgeachyp0@123-reg.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (34,'Tardiff','May','16-Feb-1963','829-50-6746','F','37 Brown Point','Marlborough','MA','01752','809-628-0762','mtardiffnm@csmonitor.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (35,'Klesel','Essy','21-Oct-1973','701-39-8487','F','21 Buena Vista Circle','Shrewsbury','MA','01545','350-407-4310','ekleselaf@cafepress.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (37,'Leehane','Frasier','8-Aug-1973','803-52-4794','M','910 Caliangt Court','Worcester','MA','01606','508-180-9454','fleehaneoo@wired.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (38,'Gleder','Valencia','8-Jun-1959','793-04-0244','F','76 0 Caliangt Hill','West Boylston','MA','01583','935-756-6821','vgleder86@netlog.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (40,'Crome','Corbin','26-May-1980','283-83-9476','M','93 Canary Alley','Ware','MA','01082','994-735-3923','ccromeqf@yahoo.co.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (41,'Groves','Conway','27-Jan-1971','531-43-1976','M','39 Canary Trail','Orange','MA','01378','919-398-4653','cgrovescj@house.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (42,'Pudden','Stanton','23-Jun-1954','289-90-1340','M','48 Carey Avenue','Worcester','MA','01606','508-942-4772','spudden7m@dmoz.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (43,'Fortune','Sanford','18-Dec-1979','294-45-1949','M','84 Carey Drive','Shrewsbury','MA','01546','987-216-1552','sfortunent@comsenz.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (44,'Ranby','Franky','6-Oct-1982','377-40-2794','M','6 Carey Point','Ware','MA','01082','746-807-1459','franbypn@reuters.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (45,'Trowill','Jeanine','28-Oct-1975','464-99-4891','F','770 Carey Road','Worcester','MA','01606','968-581-5025','jtrowilleb@themeforest.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (46,'Loffel','Garrick','23-Jan-1957','406-70-3080','M','23 Carioca Alley','Auburn','MA','01501','472-957-8889','gloffel14@yelp.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (47,'Clayworth','Chelsy','10-Jul-1979','769-12-0039','F','71 Carpenter Trail','Boston','MA','02108','709-659-8543','cclayworthc@clickbank.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (49,'Poinsett','Dina','20-Jan-1978','325-73-5461','F','85 Claremont Terrace','Springfield','MA','01101','664-921-2650','dpoinsett43@ox.ac.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (51,'Aldie','Elia','21-Mar-1975','481-81-4411','M','1290 Clemons Park','Newton','MA','02456','262-755-9217','ealdiei1@uol.com.br','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (52,'Goldney','Will','21-Sep-1980','633-87-8614','M','1010 Colorado Avenue','Holden','MA','01520','785-200-1574','wgoldney6g@redcross.org','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (53,'Blakeden','Amabel','24-Oct-1974','418-42-1589','F','250 Columbus Hill','Auburn','MA','01501','278-353-2452','ablakeden9u@nba.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (54,'Baike','Dwayne','1-Oct-1967','698-93-2327','M','150 Comanche Terrace','Worcester','MA','01606','669-100-7603','dbaikegp@qq.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (55,'Petrushka','Any','16-May-1978','274-69-7262','M','180 Continental Avenue','Auburn','MA','01501','697-671-9890','apetrushkain@desdev.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (56,'Martinek','Whitman','6-Feb-1984','579-29-6058','M','2244 Coolidge Center','Hubbardston','MA','01452','462-583-1407','wmartinek3w@chronoengine.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (57,'Winterburn','Foss','19-May-1976','368-56-9179','M','2879 Corscot Junction','Paxton','MA','01612','838-736-4043','fwinterburna2@1688.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (58,'Brane','Rania','3-Dec-1966','628-36-4473','F','385 Cottonwood Crossing','Fitchburg','MA','01420','702-269-5533','rbranem8@ted.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (59,'Mahood','Gusella','12-Jul-1975','778-96-5018','F','7832 Crescent Oaks Drive','Athol','MA','01331','324-144-2240','gmahood81@digg.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (60,'Maes','Guthrie','6-Feb-1982','626-96-4516','M','76 54 Dakota Hill','Worcester','MA','01606','916-921-0351','gmaeshm@hao123.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (61,'Pauncefort','Huntington','4-Nov-1974','160-71-4935','M','11 David Junction','Leicester','MA','01524','888-885-9211','hpauncefort34@walmart.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (62,'Grieger','Daile','18-Aug-1953','543-58-7734','F','87 Daystar Plaza','Leicester','MA','01524','444-849-6740','dgriegerod@scribd.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (63,'Scathard','Wallace','18-Jun-1971','866-83-6261','M','46 Dayton Plaza','Berlin','MA','01503','817-538-0046','wscathard31@devhub.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (64,'Combe','Flor','1-Jul-1982','492-54-9810','F','3876 Debra Street','Hubbardston','MA','01452','517-665-0479','fcombe2s@uiuc.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (65,'Mayor','Appolonia','13-Aug-1972','210-26-9303','F','567 Del Sol Junction','Fitchburg','MA','01420','900-116-6274','amayor50@drupal.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (69,'Fawcus','Kellina','25-Dec-1979','846-34-0885','F','589 Dixon Road','Worcester','MA','01606','163-730-7183','kfawcus7o@liveinternet.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (71,'Buckingham','Perice','1-Sep-1975','837-19-9957','M','71 Donald Lane','Worcester','MA','01606','935-974-7403','pbuckinghampo@woothemes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (72,'Webland','Stillman','19-Dec-1959','685-55-5333','M','76 Dorton Alley','Gardner','MA','01440','719-879-1728','sweblandit@github.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (73,'Philcox','Cammy','4-May-1973','845-92-6368','F','76 Dottie Way','Spencer','MA','01562','620-408-0395','cphilcox1e@ning.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (75,'Sterrick','Suzette','25-Oct-1975','361-80-8904','F','76 Drewry Circle','Boston','MA','02108','133-829-8630','ssterrick22@ucoz.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (76,'Bruun','Natty','24-Mar-1952','716-95-7457','M','76 Dryden Center','Oxford','MA','01540','852-156-8640','nbruungd@newsvine.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (77,'Coupe','Erwin','12-Jun-1975','538-47-2349','M','76 Dunning Terrace','Auburn','MA','01501','782-746-6092','ecoupefl@patch.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (78,'Reddy','Wren','19-Oct-1984','161-10-8950','F','98 East Hill','Worcester','MA','01606','393-921-2216','wreddy8l@japanpost.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (79,'Albion','Whit','1-Sep-1974','491-94-2032','M','2300 Eastlawn Crossing','Worcester','MA','01606','360-937-3165','walbion32@woothemes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (80,'Tennet','Chet','28-Oct-1961','227-97-8672','M','76 Eastwood Plaza','Boylston','MA','01505','685-470-6915','ctennet5f@furl.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (81,'Ungerechts','Zachariah','4-Jul-1977','406-92-5208','M','76 Eggendart Hill','Shrewsbury','MA','01546','914-765-7094','zungerechts7i@weibo.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (82,'Ivanishchev','Kienan','6-Nov-1988','128-05-8157','M','4870 Elgar Way','Worcester','MA','01606','921-212-7499','kivanishchevq1@ed.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (83,'Ughetti','Molli','11-Jul-1978','118-66-4727','F','76 Eliot Alley','Worcester','MA','01606','563-483-9545','mughettikv@godaddy.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (84,'Juszczyk','Idaline','3-Jul-1955','667-39-0436','F','76 Elmside Crossing','Worcester','MA','01606','553-689-6979','ijuszczykdr@yelp.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (85,'Coughlin','Corny','7-Nov-1975','604-58-7584','M','76 Emmet Park','Oxford','MA','01540','765-848-3725','ccoughlinbx@tiny.cc','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (86,'Claxton','Fransisco','19-Jan-1988','304-31-0626','M','76 Esch Point','Worcester','MA','01606','740-390-4936','fclaxton4n@dion.ne.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (87,'Rudkin','Foster','23-Feb-1977','440-82-7070','M','76 Esker Way','Worcester','MA','01606','849-754-9484','frudkinj2@mac.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (88,'Ramirez','Erek','12-Feb-1957','721-12-2884','M','76 Fairview Place','Auburn','MA','01501','946-381-7710','eramirezn3@shop-pro.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (89,'Howard','Roma','6-Mar-1978','533-37-4942','M','76 Fallview Lane','Fitchburg','MA','01420','519-452-0573','rhowardc0@themeforest.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (90,'Carpmile','Pancho','26-Feb-1981','739-14-6706','M','76 Farragut Park','E. Brookfield','MA','01515','431-826-3934','pcarpmileku@yellowbook.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (91,'Selwin','Byran','20-Aug-1979','276-10-6774','M','76 Fieldstone Plaza','Holden','MA','01520','118-502-2974','bselwin9q@w3.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (92,'Grigolashvill','Bronny','4-May-1967','494-04-5741','M','54 Fisk Avenue','Winchendon','MA','01475','411-499-6274','bgrigolashvillgn@go.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (93,'Fitchburgitt','Gillie','4-Jun-1978','292-42-6462','F','76 Fisk Plaza','Leominster','MA','01453','801-505-7699','gFitchburgittho@fastcompany.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (94,'Heggadon','Cairistiona','13-Apr-1984','655-43-7611','F','76 Florence Avenue','Shrewsbury','MA','01545','379-648-7690','cheggadonba@columbia.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (96,'Kingswoode','Blythe','21-Nov-1950','429-08-4547','F','76 Forest Circle','Boston','MA','02108','534-915-0928','bkingswoodex@microsoft.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (98,'Haberfield','Danita','25-Mar-1982','522-81-7941','F','76 Fremont Street','Athol','MA','01331','916-668-6030','dhaberfield4s@yahoo.co.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (99,'O Towey','Dasha','22-Feb-1974','818-19-2238','F','76 Fuller Avenue','Sturbridge','MA','01518','451-339-1519','dotowey2d@mac.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (100,'Bembrick','Evanne','11-Oct-1954','815-29-0899','F','76 Fulton Terrace','W. Boylston','MA','01583','847-939-3110','ebembrickff@histats.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (101,'Garriock','Ginni','17-Sep-1976','856-45-3198','F','76 Gateway Drive','Rutland','MA','01543','293-690-8608','ggarriock4@smh.com.au','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (102,'Lydiate','Isidora','9-Dec-1982','347-85-4614','F','76 Gateway Place','Auburn','MA','01501','505-431-3447','ilydiate37@is.gd','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (103,'McClaurie','Albrecht','8-Feb-1978','596-20-7804','M','76 Gateway Road','Holden','MA','01520','229-163-1851','amcclaurie31@sphinn.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (104,'Foukx','Shem','12-Jan-1966','615-59-2445','M','76 Gerald Alley','Berlin','MA','01503','864-383-8193','sfoukx5y@ihg.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (105,'Kuschke','Eldon','23-May-1972','676-55-0069','M','76 Gerald Parkway','Worcester','MA','01606','774-828-4622','ekuschkebu@imgur.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (106,'Philbrick','Karlyn','6-Mar-1981','421-37-6088','F','76 Golden Leaf Place','Worcester','MA','01606','768-193-3423','kphilbrick9a@godaddy.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (107,'Parren','Chrissy','13-Apr-1975','595-95-0606','M','76 Golf View Avenue','Worcester','MA','01606','496-545-6711','cparren6y@mail.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (108,'Cuddon','Milton','15-Sep-1961','777-12-7808','M','76 Graedel Hill','Worcester','MA','01606','191-661-4074','mcuddonol@icq.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (109,'Denyagin','Reamonn','9-Jun-1973','153-17-2461','M','76 Granby Lane','Worcester','MA','01606','856-619-8987','rdenyaginn0@examiner.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (110,'Fridlington','Barn','17-Aug-1983','581-09-4881','M','76 Grasskamp Point','Holden','MA','01520','328-669-5946','bfridlington8z@ocn.ne.jp','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (111,'Bazylets','Layney','11-Aug-1975','799-21-6684','F','76 Green Ridge Crossing','Oxford','MA','01540','341-637-9312','lbazyletsi2@multiply.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (112,'McIndoe','Daile','24-May-1968','494-12-1061','F','76 Gulseth Plaza','Spencer','MA','01562','840-540-2719','dmcindoeli@51.la','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (113,'Blade','Emelda','15-Jul-1951','013-47-5822','F','1234 Milk','Boston','MA','02108','907-289-6338','eblade9c@homestead.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (114,'Blade','Emelda','1-Feb-1980','165-74-2285','F','76 Hagan Plaza','Boston','MA','02108','100-919-6517','eblade10c@homestead.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (115,'Gallandre','Edgard','20-Nov-1976','616-63-3496','M','76 Hallows Circle','Worcester','MA','01606','532-938-5859','egallandrebt@friendfeed.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (116,'Shulem','Leola','6-Jun-1966','788-65-1174','F','76 Hanson Hill','Springfield','MA','01101','673-561-3070','lshulemc8@reference.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (117,'Couldwell','Beau','14-Sep-1978','851-56-7884','M','76 Hanson Terrace','Auburn','MA','01501','514-559-0261','bcouldwellcv@hhs.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (118,'Ruppert','Twyla','13-Dec-1988','688-85-8876','F','76 Hansons Alley','Marlborough','MA','01752','866-361-4268','truppertaz@loc.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (119,'Caldwell','Glenine','2-Feb-1970','529-60-7671','F','76 Hazelcrest Plaza','Worcester','MA','01606','834-609-2830','gcaldwell58@google.cn','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (120,'MacIan','Hildy','2-Aug-1963','546-02-7426','F','76 High Crossing Center','Sturbridge','MA','01518','917-142-4676','hmacianhu@g.co','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (121,'Feathersby','Marisa','16-Jul-1978','571-05-4512','F','76 Hintze Junction','Marlborough','MA','01752','636-722-9918','mfeathersby6i@irs.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (122,'Watkins','Candra','24-Oct-1988','217-03-1964','F','76 Hintze Trail','Shrewsbury','MA','01545','712-703-2348','cwatkinsj@bbc.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (123,'Dowsett','Darelle','11-Dec-1977','160-07-8427','F','76 Hoepker Junction','Shrewsbury','MA','01545','319-142-0391','ddowsettbh@dot.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (124,'Traill','Kristoforo','7-Feb-1964','550-73-0893','M','76 Holmberg Road','Oxford','MA','01540','666-907-8076','ktraillk9@wikispaces.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (125,'Feveryear','Arvin','16-Jun-1971','664-68-9547','M','76 Hooker Plaza','Gilbertville','MA','01031','783-491-3346','afeveryearmx@smh.com.au','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (126,'Beardon','Lissy','8-Jul-1982','734-76-1607','F','76 Hovde Hill','Boston','MA','02108','758-516-1230','lbeardonj7@a8.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (128,'Drewett','Jemie','6-Apr-1954','301-39-1388','F','76 Huxley Circle','Worcester','MA','01606','181-639-2685','jdrewettl7@gravatar.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (129,'Strevens','Carry','6-Apr-1971','374-18-4960','F','76 Ilene Terrace','West Boylston','MA','01583','173-522-6556','cstrevenskn@geocities.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (130,'Dunrige','Alastair','6-Oct-1986','703-37-2648','M','76 Ilene Way','Worcester','MA','01606','366-899-3929','adunrigeis@dedecms.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (131,'Bernocchi','Penny','15-Nov-1972','159-11-8406','F','76 Jana Terrace','Auburn','MA','01501','653-831-4031','pbernocchidq@alexa.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (132,'Okey','Aloisia','12-Jun-1961','890-75-8964','F','76 Kedzie Parkway','Worcester','MA','01606','975-562-8656','aokeyn5@angelfire.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (133,'Winterson','Coleman','17-Mar-1977','845-79-0599','M','76 Kennedy Point','Shrewsbury','MA','01545','902-680-0425','cwinterson5p@tumblr.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (134,'Kearns','Engracia','1-Nov-1980','424-09-5265','F','76 Kensington Plaza','Holden','MA','01520','946-957-2078','ekearnsoq@1688.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (135,'Ousley','Chaunce','3-Nov-1976','396-69-8746','M','76 Killdeer Avenue','West Boylston','MA','01583','819-698-4948','cousleyb1@goo.gl','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (136,'Lam(5pett','Rockey','28-Dec-1950','175-59-2675','M','76 Killdeer Way','Charlton','MA','01507','606-545-2591','rlampettkb@naver.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (137,'Frobisher','Conni','6-Mar-1973','576-57-4265','F','76 Kingsford Center','Worcester','MA','01606','992-145-1221','cfrobisher3z@merriam-webster.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (138,'McMurty','Zachary','28-Mar-1989','569-02-4894','M','76 Kropf Court','Worcester','MA','01606','435-136-2519','zmcmurty5b@ed.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (139,'Dafforne','Konstantine','27-Mar-1971','503-03-6572','M','76 Kropf Road','Hubbardston','MA','01452','971-414-6420','kdaffornent@geocities.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (140,'Danslow','Wheeler','20-Oct-1967','406-22-8964','M','76 La Follette Point','Worcester','MA','01606','118-260-4499','wdanslowjt@topsy.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (141,'Sturmey','Barrie','23-May-1976','776-32-3774','F','76 Lakewood Gardens Hill','Athol','MA','01331','518-323-1951','bsturmeycy@is.gd','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (142,'Sherel','Tome','28-Oct-1988','665-13-8539','M','76 Laurel Court','Fitchburg','MA','01420','721-833-2918','tsherelnv@friendfeed.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (143,'Hanalan','Brodie','28-Jun-1970','365-88-0461','M','76 Lawn Alley','Worcester','MA','01606','705-925-3746','bhanalanrk@mail.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (144,'Silk','Marieann','5-Nov-1953','842-17-4954','F','76 Loftsgordon Terrace','Athol','MA','01331','363-703-4219','msilkqr@netscape.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (145,'Bilney','Mohandis','2-Apr-1972','717-77-0991','M','76 Londonderry Street','Orange','MA','01378','485-918-4508','mbilney98@ucoz.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (146,'Oldcroft','Leonhard','4-Jun-1986','360-94-5735','M','76 Ludington Point','Holden','MA','01520','520-113-0840','loldcroftlc@youku.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (147,'Toohey','Ruggiero','21-Feb-1976','350-74-8346','M','76 Lukken Pass','Shrewsbury','MA','01545','781-340-8049','rtooheycw@hugedomains.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (148,'Farrell','Etheline','2-Feb-1956','799-66-1156','F','76 Mallard Center','Spencer','MA','01562','904-711-1097','efarrell3p@youtu.be','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (149,'Vader','Regen','28-Oct-1975','789-97-3771','M','76 Maple Avenue','Worcester','MA','01606','452-942-9713','rvader17@uiuc.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (151,'Parley','Ferdinanda','15-Mar-1970','713-58-4074','F','76 Mayer Center','Worcester','MA','01606','492-928-0574','fparleygn@netlog.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (152,'Pidduck','Harriot','2-Jun-1952','317-99-2292','F','76 Mayer Circle','Springfield','MA','01101','632-438-9065','hpidduckn1@clickbank.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (153,'Fennell','Audrie','23-Aug-1974','107-07-5135','F','76 Maywood Junction','Southbridge','MA','01550','421-730-2721','afennellkp@usnews.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (154,'Lintot','Nikos','1-Feb-1981','590-65-9126','M','76 Maywood Road','Worcester','MA','01606','143-418-5711','nlintot3y@illinois.edu','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (155,'Hakey','Hulda','24-Oct-1976','471-59-5229','F','76 Maywood Trail','Worcester','MA','01606','572-934-1281','hhakeyp6@com.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (156,'Latliff','Morganne','18-Mar-1968','439-75-5988','F','76 Meadow Ridge Circle','Boston','MA','02108','119-319-3501','mlatliff6@hao123.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (158,'Di Ruggero','Cynthia','14-Jun-1980','251-23-8277','F','76 Melvin Junction','Shrewsbury','MA','01545','487-113-6714','cdiruggerogh@nbcnews.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (159,'Snasdell','Bil','7-Apr-1975','817-84-3144','M','76 Merchant Road','Dudley','MA','01571','611-281-6963','bsnasdellaj@purevolume.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (160,'De Filippo','Laraine','5-Aug-1953','257-08-1256','F','76 Messerschmidt Parkway','Auburn','MA','01501','258-339-6748','ldefilippoid@friendfeed.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (161,'Clarycott','Maryanna','8-Jan-1978','577-38-9804','F','76 Michigan Crossing','W. Boylston','MA','01583','903-154-4192','mclarycott5u@un.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (162,'Dignum','Margit','26-Nov-1980','487-49-6383','F','76 Moland Trail','Auburn','MA','01501','509-171-9585','mdignumnc@wordpress.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (163,'Huegett','Jeremias','9-Jan-1971','678-12-4850','M','76 Monterey Park','Lunenburg','MA','01462','586-372-7165','jhuegettbi@mac.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (164,'Kieran','Tina','14-Feb-1951','733-83-9934','F','76 Monument Pass','Oxford','MA','01540','977-396-8697','tkieran5g@shop-pro.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (165,'Serjeant','Irv','25-Aug-1974','111-89-2785','M','76 Morningstar Junction','Paxton','MA','01612','666-287-7768','iserjeantbe@nba.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (166,'Philipson','Pearline','1-Jul-1982','209-91-4150','F','76 Morningstar Pass','Barre','MA','01005','667-559-6651','pphilipson8x@berkeley.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (167,'Poveleye','Faber','21-May-1972','546-28-6625','M','76 Namekagon Junction','E. Brookfield','MA','01515','949-400-3231','fpoveleye78@pcworld.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (168,'Tramel','Ingram','13-Sep-1963','806-87-2364','M','76 Nevada Avenue','Oxford','MA','01540','675-384-8411','itramelcn@prlog.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (169,'Heball','Ellie','20-Oct-1972','779-77-5118','F','76 Northborough Drive','Worcester','MA','01606','208-303-1609','eheballgg@qq.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (170,'Curryer','Gay','18-Feb-1984','839-70-1964','M','76 Northfield Terrace','Worcester','MA','01606','178-780-3569','gcurryeri7@tuttocitta.it','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (171,'Punshon','Manfred','1-Sep-1971','663-81-1018','M','76 Northland Lane','Auburn','MA','01501','764-696-2711','mpunshones@nyu.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (172,'Peerman','Yolanthe','27-Dec-1952','595-38-9626','F','76 Northport Park','Hopedale','MA','01747','482-177-3247','ypeermanky@blogger.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (173,'Pawley','Conrad','26-May-1972','712-24-9037','M','76 Northport Point','West Boylston','MA','01583','120-348-4316','cpawleym9@umich.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (174,'Trenbay','Jere','21-Nov-1986','448-94-4298','F','76 Northview Alley','Leominster','MA','01453','575-560-4361','jtrenbaydd@miitbeian.gov.cn','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (175,'Matveyev','Finley','3-Dec-1973','437-92-3648','M','76 Norway Maple Point','West Boylston','MA','01583','480-636-0857','fmatveyev4z@fda.gov','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (176,'Goldring','Rozele','1-May-1969','727-68-6435','F','76 Novick Avenue','Worcester','MA','01606','870-580-2990','rgoldringq0@macromedia.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (177,'Pimblotte','Guntar','8-Jul-1976','240-31-4866','M','76 Ohio Court','Shrewsbury','MA','01545','357-176-4305','gpimblottehb@phoca.cz','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (178,'Kienzle','Abigael','24-Dec-1987','476-31-8643','F','76 Old Gate Park','Worcester','MA','01606','260-328-1208','akienzle6o@noaa.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (179,'Godwin','Gabriela','6-Mar-1976','437-01-0705','F','76 Onsgard Avenue','Worcester','MA','01606','748-958-6581','ggodwinmn@blogspot.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (180,'McGinnell','Essa','8-Feb-1951','318-63-9373','F','76 Orin Street','Southbridge','MA','01550','710-193-0911','emcginnellcy@bluehost.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (181,'Scotsbrook','Sutherland','21-Aug-1979','388-39-0621','M','76 Pearson Street','Ware','MA','01082','565-470-9487','sscotsbrookjr@vkontakte.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (182,'Beachem','Simmonds','12-Dec-1984','601-31-0416','M','76 Petterle Drive','Worcester','MA','01606','288-438-4092','sbeachem9y@mapquest.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (183,'Barzen','Benny','12-Oct-1970','340-62-7584','F','76 Pine View Circle','Auburn','MA','01501','472-472-3558','bbarzen42@moonfruit.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (184,'MacDiarmid','Demetra','16-Jul-1959','700-15-0903','F','76 Pond Parkway','Marlborough','MA','01752','709-820-0346','dmacdiarmidmr@parallels.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (185,'Mineghelli','Yetta','13-Apr-1970','580-65-8365','F','76 Portage Plaza','Worcester','MA','01606','195-601-2389','ymineghelli5q@upenn.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (187,'Lamplough','Jenica','22-Mar-1972','178-27-8811','F','76 Porter Alley','Springfield','MA','01101','876-419-0926','jlamplough2e@ask.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (188,'Gambell','Lana','26-Jan-1966','543-51-6623','F','76 Prairie Rose Court','Worcester','MA','01606','823-321-6925','lgambell23@adobe.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (189,'Czaja','Liesa','23-Nov-1974','583-09-8323','F','76 Prairie Rose Terrace','W. Boylston','MA','01583','373-113-5327','lczajaar@example.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (190,'Pinch','Halimeda','28-Aug-1982','371-05-6971','F','76 Prentice Avenue','Worcester','MA','01606','275-100-2464','hpinchy@amazon.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (191,'Bilby','Mollie','9-Aug-1970','628-71-9579','F','76 Prentice Way','Worcester','MA','01606','163-287-5216','mbilby93@illinois.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (192,'Dignam','Cullan','21-Nov-1960','109-82-5913','M','76 Prentice Way','Worcester','MA','01606','707-618-9306','cdignamrh@techcrunch.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (193,'Burgane','Rosalinde','20-Oct-1977','429-91-8586','F','76 Ramsey Lane','Spencer','MA','01562','757-560-8890','rburganef0@sphinn.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (194,'Riping','Timothea','13-Nov-1983','470-10-0639','F','76 Ridgeway Plaza','Athol','MA','01331','414-699-8206','tripingn5@geocities.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (195,'Raccio','Hayden','24-Aug-1979','495-13-5196','M','76 Rieder Alley','Worcester','MA','01606','407-981-4750','hracciodt@moonfruit.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (196,'Deverell','Aliza','7-Apr-1966','385-72-3847','F','76 Rigney Terrace','Northbridge','MA','01534','704-621-9286','adeverellhi@spiegel.de','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (198,'Utton','Kiah','4-Jul-1984','705-36-3617','F','76 Rockefeller Hill','Worcester','MA','01606','153-800-0143','kuttonfv@biglobe.ne.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (199,'Kubasek','Levin','12-Apr-1979','435-98-4389','M','76 Roth Pass','Oxford','MA','01540','425-291-2524','lkubasekr9@discuz.net','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (200,'Maynard','Morganne','27-Feb-1962','817-23-2377','F','76 Rowland Court','Leicester','MA','01524','925-795-0044','mmaynard0@usnews.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (201,'Crates','Martyn','24-Nov-1975','116-92-7222','M','76 Russell Lane','Worcester','MA','01606','522-648-9584','mcratesj8@addtoany.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (202,'Birks','Millie','15-Dec-1984','624-49-7586','F','76 Russell Way','Leominster','MA','01453','126-124-5690','mbirksfz@163.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (203,'Callister','Adolph','14-Oct-1974','718-92-8377','M','76 Schiller Place','Worcester','MA','01606','937-581-7486','acallistergs@cisco.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (204,'Mayward','Moe','25-Aug-1962','376-30-2693','M','76 Schlimgen Point','Oxford','MA','01540','369-590-3124','mmayward40@usa.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (205,'Bottjer','Thorin','18-Jan-1974','374-18-0245','M','76 Scofield Circle','Holden','MA','01520','153-262-8099','tbottjero6@statcounter.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (206,'Orbell','Cyndia','20-Aug-1981','552-74-8143','F','76 Scofield Pass','Boston','MA','02108','945-385-3253','corbell9i@amazon.de','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (207,'Orbell','Cyndia','25-Aug-1977','252-74-8143','F','76 Scofield Pass','Boston','MA','02108','386-726-5888','corbell9i@amazon.de','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (208,'Cappleman','Darya','16-Aug-1951','295-12-5441','F','76 Scott Way','Barre','MA','01005','237-652-6822','dcappleman12@redcross.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (209,'Buttrick','Carney','16-Mar-1970','170-77-0951','M','76 Sherman Street','Auburn','MA','01501','640-636-7063','cbuttricknd@yellowpages.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (210,'Belderfield','Bobine','14-Dec-1982','499-72-4027','F','76 Shoshone Pass','Brimfield','MA','01010','969-153-2207','bbelderfield3q@whitehouse.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (212,'Hunnicot','Quentin','12-Nov-1953','136-45-1115','F','76 Spenser Lane','Shrewsbury','MA','01545','408-304-2937','qhunnicotcs@posterous.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (213,'Keays','Cathi','19-Jun-1979','750-65-2221','F','76 Spenser Trail','Worcester','MA','01606','464-332-6234','ckeaysb6@bizjournals.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (214,'Baldazzi','Edeline','7-May-1980','374-73-6481','F','76 Starling Terrace','Worcester','MA','01606','658-898-0116','ebaldazzirp@multiply.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (215,'Gabbatiss','La verne','26-Aug-1974','217-80-8140','F','76 Steensland Pass','Worcester','MA','01606','616-833-6168','lgabbatiss93@fda.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (216,'Belison','Rhodia','16-Nov-1958','699-41-6541','F','76 Stephen Road','Fitchburg','MA','01420','785-798-3939','rbelison2c@taobao.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (217,'Burde','Veda','27-Jul-1974','295-58-8597','F','76 Stephen Terrace','Charlton','MA','01507','586-434-1107','vburdeev@marketwatch.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (218,'Chorlton','Fairlie','11-Aug-1983','551-53-4557','M','76 Stoughton Trail','Worcester','MA','01606','576-242-2667','fchorlton6w@admin.ch','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (219,'McCarrell','Christi','25-Apr-1975','495-55-7957','F','76 Sugar Avenue','Worcester','MA','01606','768-337-9775','cmccarrellpx@cyberchimps.com','',DEFAULT,'','DB','');
INSERT INTO B_tblStudents
    VALUES (220,'Gillyatt','Kirbee','18-Feb-1960','521-40-2371','F','76 Sugar Trail','Auburn','MA','01501','694-925-4469','kgillyatta7@mozilla.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (221,'Wilfinger','Dulci','15-Jan-1976','560-55-9726','F','76 Summer Ridge Place','Shrewsbury','MA','01545','138-204-4363','dwilfinger8w@europa.eu','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (222,'Higgoe','Ammamaria','17-Nov-1983','295-62-3453','F','76 Summit Terrace','Worcester','MA','01606','108-300-7758','ahiggoe3g@scientificamerican.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (223,'Douris','Alvis','5-Jun-1974','467-69-1644','M','76 Sunbrook Drive','Dudley','MA','01571','956-970-2635','adourisda@google.es','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (224,'Kenealy','Abbot','1-Jan-1950','560-93-1722','M','76 Sundown Terrace','Shrewsbury','MA','01545','852-518-2643','akenealyml@goodreads.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (225,'Spindler','Shelley','28-May-1972','157-80-5267','M','320 Superior Street','Winchendon','MA','01475','131-388-6634','sspindlergv@tripadvisor.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (226,'Kennifick','Tarrance','3-Nov-1984','254-93-5792','M','76 Surrey Hill','Worcester','MA','01606','362-860-8534','tkennifickap@webmd.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (227,'Battell','Clem','26-Nov-1974','171-62-2660','M','76 Tennessee Lane','Shrewsbury','MA','01545','626-353-1933','cbattell6k@shop-pro.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (228,'McCorkell','Antonina','6-Jul-1952','378-12-1338','F','76 Tennyson Road','Worcester','MA','01606','223-337-8549','amccorkellfc@ox.ac.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (229,'Dennick','Buck','27-Oct-1978','749-08-2593','M','276 Thackeray Trail','Holden','MA','01520','704-723-3976','bdennickg4@uol.com.br','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (230,'Joddins','Chloe','5-Sep-1981','797-83-9561','F','336 Toban Place','Rutland','MA','01543','146-159-3556','cjoddins85@wisc.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (231,'Axby','Garwood','9-Mar-1972','383-07-2888','M','256 Tony Terrace','Shrewsbury','MA','01545','525-810-6975','gaxbybn@forbes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (232,'Garroway','Brandie','15-Apr-1959','337-57-3383','F','6 Towne Center','Ashby','MA','01431','498-223-4665','bgarroway3e@domainmarket.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (233,'Goggan','Pincas','2-May-1979','722-64-5643','M','7 Trailsway Road','Clinton','MA','01510','413-979-4276','pgoggannf@oracle.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (234,'Paolini','Seka','28-Jan-1989','336-03-8474','F','736 Transport Avenue','Auburn','MA','01501','972-677-3435','spaolini8q@hexun.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (235,'Gladbach','Veradis','27-Sep-1977','604-57-2751','F','286 Transport Place','Northbridge','MA','01534','226-599-0313','vgladbachpc@infoseek.co.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (236,'Baylie','Emelda','3-Apr-1961','160-15-2940','F','1176 Upham Lane','Spencer','MA','01562','649-152-0883','ebayliea3@rambler.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (237,'McFadzean','Culley','24-Jul-1971','620-67-7343','M','2576 Utah Street','Worcester','MA','01606','856-699-5083','cmcfadzeaniu@engadget.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (238,'Grzelczyk','Northrup','19-Oct-1988','684-42-3412','M','326 Vahlen Crossing','Ware','MA','01082','531-270-3363','ngrzelczyk8g@paginegialle.it','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (239,'Nethercott','Rasla','18-Dec-1976','865-42-5761','F','1234 Vera Center','Worcester','MA','01606','936-813-7924','rnethercottg6@icq.com','',DEFAULT,'','DB','');
INSERT INTO B_tblStudents
    VALUES (240,'Gumn','Leonora','24-Oct-1953','333-59-0068','F','4321 Vera Circle','Worcester','MA','01606','426-104-7610','lgumni3@state.tx.us','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (241,'de Keyser','Sonni','12-Jan-1970','126-05-5703','F','36 Vernon Lane','Berlin','MA','01503','102-957-4794','sdekeysergg@answers.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (242,'Aspinal','Haroun','13-Jul-1981','408-53-9312','M','71 Victoria Crossing','Clinton','MA','01510','625-918-4993','haspinal9t@flavors.me','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (243,'Reditt','Briney','8-Sep-1978','728-09-9305','F','276 Village Green Avenue','Spencer','MA','01562','219-621-6338','bredittq1@reuters.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (244,'Tunnadine','Alejoa','4-Nov-1968','803-90-4784','M','566 Walton Place','E. Brookfield','MA','01515','719-982-5261','atunnadine55@ihg.com','',DEFAULT,'','DB','');
INSERT INTO B_tblStudents
    VALUES (245,'Archbald','Nilson','21-Aug-1977','701-26-3459','M','983 Warbler Hill','Worcester','MA','01606','194-575-1223','narchbald13@printfriendly.com','',DEFAULT,'','DB','');
INSERT INTO B_tblStudents
    VALUES (246,'Oulner','Kin','13-Nov-1988','488-43-8059','M','376 Warrior Parkway','Holden','MA','01520','543-769-2626','koulner2y@bloglines.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (247,'Serman','Esme','8-Apr-1974','401-74-5722','F','76 Waxwing Road','Worcester','MA','01606','661-712-9036','eserman7m@hud.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (248,'Muzzi','Lucina','7-May-1963','122-02-6825','F','576 Wayridge Place','Athol','MA','01331','638-566-8967','lmuzzi9j@comcast.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (249,'Farren','Clem','21-Jan-1971','110-92-7902','F','776 Waywood Avenue','Fort Devins','MA','01420','192-673-1569','cfarrenjz@cafepress.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (250,'Baldry','Salomone','8-Mar-1982','743-23-5839','M','976 Welch Place','Auburn','MA','01501','444-147-9937','sbaldryp1@soundcloud.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (251,'Groocock','Hiram','26-Mar-1973','851-04-3822','M','226 Welch Road','Auburn','MA','01501','713-456-8036','hgroocockl2@ucla.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (252,'Bannell','Celestyna','13-Dec-1955','498-13-6380','F','33 Aberg Road','Worcester','MA','01606','290-596-8907','cbannellom@nhs.uk','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (253,'Bannell','Celestyna','8-Apr-1970','010-78-6380','F','40 Aberg Road','Worcester','MA','01606','358-398-4323','cbannellom@nhs.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (254,'Casella','Lula','4-Nov-1988','135-32-7983','F','4060 Bay Crossing','Worcester','MA','01606','928-282-5963','lcasella8c@phpbb.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (255,'Capozzi','Hillard','2-May-1979','336-42-2914','M','60 Cardinal Center','Auburn','MA','01501','813-828-7827','hcapozzi1s@omniture.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (256,'Stern','Aurilia','3-Dec-1957','800-44-7809','F','7 Carpenter Pass','Worcester','MA','01606','961-244-7240','asternkl@moonfruit.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (257,'Jereatt','Izabel','16-Jul-1972','221-21-3033','F','55 Cherokee Circle','Worcester','MA','01606','911-597-4143','ijereattmx@t.co','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (258,'Shorto','Dannie','5-Feb-1985','672-44-9097','M','00 Declaration Junction','Fitchburg','MA','01420','588-461-5810','dshortofb@sourceforge.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (259,'Yakobowitz','Bank','6-Oct-1976','620-93-2616','M','00 Dexter Street','Worcester','MA','01606','311-458-9987','byakobowitzct@163.com','',DEFAULT,'','DB','');
INSERT INTO B_tblStudents
    VALUES (260,'Dougill','Kele','1-Mar-1953','513-19-9555','M','00 Fair Oaks Avenue','Worcester','MA','01606','207-347-8045','kdougill48@hhs.gov','',DEFAULT,'',DEFAULT,'');
 INSERT INTO B_tblStudents
   VALUES (261,'Tregunnah','Lanna','21-Apr-1976','126-98-9836','F','00 Fairview Road','Springfield','MA','01101','122-861-7579','ltregunnahf2@reuters.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (262,'Janoschek','Humphrey','28-Aug-1986','516-51-5808','M','00 Forest Dale Alley','Worcester','MA','01606','705-594-6840','hjanoschekd0@economist.com','',DEFAULT,'','DB','');
INSERT INTO B_tblStudents
    VALUES (263,'Seathwright','Brad','20-Sep-1973','384-88-3158','M','00 Fuller Court','Worcester','MA','01606','357-166-9982','bseathwrightpj@hexun.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (264,'Casley','Amelina','9-Mar-1950','588-94-3437','F','00 Garrison Avenue','Shrewsbury','MA','01545','678-922-2097','acasley1d@imageshack.us','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (265,'Mapples','Tailor','23-Feb-1978','234-51-4785','M','00 Hanson Circle','Ware','MA','01082','973-213-4450','tmapples65@alibaba.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (266,'Decent','Zane','11-Jul-1988','389-75-5896','M','00 Laurel Circle','Shrewsbury','MA','01545','867-829-9274','zdecent6u@nbcnews.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (267,'Nertney','Jonathon','7-May-1979','837-53-5190','M','00 Mallard Parkway','Shrewsbury','MA','01545','825-524-2239','jnertneyfp@meetup.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (268,'Slemmonds','Terrel','4-May-1954','336-79-4078','M','00 Manley Circle','Brookfield','MA','01506','923-238-3160','tslemmondsm3@wsj.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (269,'Wichard','Inglebert','18-May-1976','526-18-9285','M','00 Melvin Drive','Orange','MA','01378','573-102-1380','iwichardo2@statcounter.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (270,'Eliassen','Jacinthe','14-Jan-1980','360-87-2891','F','00 Memorial Alley','Shrewsbury','MA','01545','417-986-9430','jeliassen6j@toplist.cz','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (271,'Norcliffe','Brennen','14-Oct-1973','390-11-1438','M','00 Merrick Road','Worcester','MA','01606','600-599-3206','bnorcliffe10@deliciousdays.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (272,'Odda','Vanessa','27-Sep-1969','742-55-9567','F','00 Orin Park','Fitchburg','MA','01420','505-285-2704','voddaiw@vistaprint.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (273,'Laux','Cindy','9-Jan-1970','735-40-7511','F','00 Orin Plaza','Pepperell','MA','01463','551-204-3480','clauxqu@g.co','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (274,'Meindl','Immanuel','2-Dec-1983','608-42-5274','M','00 Sauthoff Terrace','Hubbardston','MA','01452','314-910-6603','imeindldj@wired.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (275,'Kinney','Gian','9-Apr-1978','479-81-5799','M','00 Sugar Street','West Boylston','MA','01583','510-965-5765','gkinneypk@usgs.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (276,'Glave','Dane','27-Aug-1960','384-56-0926','M','00 Walton Hill','Hubbardston','MA','01452','339-216-5633','dglaver6@hatena.ne.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (277,'Weepers','Odele','27-Jul-1974','606-07-4520','F','00 Warrior Drive','Boston','MA','02108','111-722-5095','oweepers6k@hugedomains.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (279,'Bisatt','Wald','21-Apr-1974','781-08-6795','M','000 Annamark Parkway','Fitchburg','MA','01420','693-954-2040','wbisattiv@nationalgeographic.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (280,'Crother','Maia','19-Feb-1968','467-93-5661','F','000 Sage Street','Boston','MA','02108','282-789-9057','mcrother8b@netvibes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (282,'Gwilliam','Elle','22-Jun-1985','418-07-3325','F','00008 American Terrace','Worcester','MA','01606','983-431-2734','egwilliam2o@theatlantic.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (283,'Taborre','Logan','17-Dec-1974','230-34-6963','M','0003 Independence Road','Auburn','MA','01501','596-452-2863','ltaborreix@mozilla.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (284,'Merigon','Barbe','26-Dec-1956','273-35-0342','F','0003 Village Lane','Auburn','MA','01501','827-447-2221','bmerigonqm@un.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (285,'Batsford','Ferdy','1-Dec-1976','638-80-4185','M','00034 Texas Circle','Worcester','MA','01606','885-583-0747','fbatsfordod@github.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (286,'Rumin','Leigh','14-May-1982','868-64-0426','F','0006 Redwing Plaza','Fitchburg','MA','01420','715-822-7949','lruminl1@tinypic.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (287,'Mose','Nicholle','7-Nov-1979','849-73-5275','F','001 Scofield Alley','Holden','MA','01520','701-519-0098','nmoseqv@vinaora.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (288,'Waugh','Adelbert','1-Aug-1957','362-31-0978','M','0013 Londonderry Plaza','Lunenburg','MA','01462','596-351-6673','awaugh8a@goodreads.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (289,'Blodget','Zacharie','26-Mar-1970','153-47-3579','M','00132 Hansons Lane','Oxford','MA','01540','649-666-3498','zblodgete0@themeforest.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (291,'Alleyn','Mora','13-Jun-1971','461-79-1931','F','002 Fallview Hill','Springfield','MA','01101','493-957-9131','malleyn4h@nbcnews.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (292,'Craigg','Herminia','8-Oct-1952','364-42-6409','F','002 John Wall Junction','Charlton','MA','01507','433-165-9281','hcraiggfk@imageshack.us','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (293,'Figura','Mano','18-Mar-1973','328-28-5006','M','002 Waywood Crossing','Hubbardston','MA','01452','758-784-3936','mfigurafp@linkedin.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (294,'Broadbear','Chrissy','13-Feb-1984','108-24-5548','F','0020 Lindbergh Trail','New Braintree','MA','01531','697-865-0998','cbroadbearbk@squarespace.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (296,'Rennebach','Fiorenze','11-Sep-1969','828-04-5681','F','00217 Brown Junction','Baldwinville','MA','01436','400-711-0966','frennebachin@oaic.gov.au','',DEFAULT,'','DB','');
INSERT INTO B_tblStudents
    VALUES (297,'Quarton','Boycie','17-Nov-1979','559-52-6806','M','0022 Stone Corner Plaza','Worcester','MA','01606','513-977-8701','bquartons@plala.or.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (298,'Larter','Genovera','2-Sep-1982','694-80-1250','F','0023 Barby Circle','Sturbridge','MA','01518','213-645-5924','glarteri3@tumblr.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (299,'Winscum','Chev','28-Dec-1970','495-91-1981','M','0024 Saint Paul Center','Townsend','MA','01469','442-354-3687','cwinscumb4@google.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (301,'Fairnie','Lyssa','24-Sep-1979','226-82-5513','F','00249 Rigney Terrace','Warren','MA','01083','824-515-5754','lfairnie3g@indiegogo.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (302,'Ghilks','Philomena','2-Mar-1984','376-88-9285','F','00269 American Ash Place','Boston','MA','02108','545-340-1622','pghilksn3@blogs.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (304,'Brennen','Nappie','1-Jun-1954','230-25-7413','M','00271 Colorado Parkway','Auburn','MA','01501','827-389-1810','nbrennenpu@shop-pro.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (305,'Dowall','Clarine','21-Nov-1978','280-21-5475','F','00271 Nobel Lane','Worcester','MA','01606','399-638-8329','cdowallhd@163.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (306,'Gainor','Dorian','17-Jul-1988','562-21-9697','M','00292 Heffernan Parkway','Worcester','MA','01606','885-904-7284','dgainornl@home.pl','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (307,'Firbank','Jania','19-Feb-1972','626-02-7507','F','003 Acker Place','Worcester','MA','01606','638-325-6091','jfirbankdl@omniture.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (308,'Neubigin','Nerissa','15-Jul-1954','293-04-9729','F','003 Boyd Point','Marlborough','MA','01752','570-692-0451','nneubigin1z@360.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (309,'Barkas','Hasty','8-Jun-1970','526-12-2865','M','003 Little Fleur Circle','Westminster','MA','01441','309-973-4443','hbarkasij@networksolutions.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (310,'Snoden','Giraud','10-Jul-1986','643-64-5564','M','003 Mitchell Parkway','Worcester','MA','01606','119-939-8170','gsnodendv@mac.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (311,'Imesen','Sabine','14-May-1978','792-28-5792','F','00395 Bunker Hill Way','Spencer','MA','01562','617-378-0534','simesen8r@nyu.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (312,'Seth','Reuven','25-Dec-1969','130-05-2860','M','004 Declaration Road','Holden','MA','01520','743-759-3911','rseth9l@un.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (313,'Tullett','Reggie','5-Apr-1978','384-06-4365','M','004 Prairieview Lane','Westminster','MA','01441','855-327-6648','rtullett5e@studiopress.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (314,'Lamminam','Jessalin','6-May-1982','780-31-9692','F','004 Welch Trail','Shrewsbury','MA','01545','174-726-4057','jlamminam6w@dmoz.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (315,'Longmate','Brok','18-Sep-1978','615-19-9843','M','0042 Pleasure Place','Holden','MA','01520','864-446-2085','blongmate2z@baidu.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (316,'Godwyn','Dinnie','17-Aug-1966','788-71-4525','F','00422 3rd Junction','Shrewsbury','MA','01545','895-454-2755','dgodwynr9@bloomberg.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (317,'Van Merwe','Gwyn','21-May-1976','818-19-9058','F','00428 Lighthouse Bay Trail','Worcester','MA','01606','237-476-5508','gvanmerwe61@forbes.com','',DEFAULT,'','DB','');
INSERT INTO B_tblStudents
    VALUES (318,'Scurrah','Adria','14-Feb-1989','658-33-3783','F','0043 Kennedy Plaza','Shrewsbury','MA','01545','809-704-9912','ascurrah7e@youku.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (319,'Bletso','Harmon','24-Sep-1977','401-29-7805','M','00435 Mariners Cove Point','Oxford','MA','01540','649-885-7873','hbletsokm@ucoz.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (320,'Shovelbottom','Karisa','27-Jan-1962','770-72-9768','F','0044 Del Sol Circle','Sturbridge','MA','01518','479-522-8480','kshovelbottomam@wiley.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (321,'Harlett','Dell','14-Mar-1974','802-28-3550','M','0044 Fuller Alley','Auburn','MA','01501','781-229-5883','dharlett93@qq.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (322,'Dodwell','Constancia','5-Apr-1980','566-36-2319','F','00474 Roxbury Lane','Worcester','MA','01606','555-339-7813','cdodwello3@mac.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (323,'Tesmond','Odelinda','9-Jan-1970','471-43-5993','F','00497 Lerdahl Park','Fitchburg','MA','01420','928-915-4204','otesmondk4@issuu.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (324,'Mingaud','Codie','15-Oct-1955','798-65-4374','F','00499 Carioca Parkway','Auburn','MA','01501','436-617-4568','cmingaudhc@craigslist.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (325,'Bloxsom','Joletta','18-Oct-1971','702-79-9778','F','005 Annamark Court','Worcester','MA','01606','361-218-4339','jbloxsombi@altervista.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (326,'Donke','Tana','11-Nov-1981','576-83-3727','F','005 Chive Place','Leicester','MA','01524','770-198-3859','tdonke29@china.com.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (327,'Erskin','Spenser','21-Nov-1974','448-40-5143','M','005 Forest Terrace','Worcester','MA','01606','638-721-6898','serskinhd@nbcnews.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (328,'Watkin','Edy','23-Nov-1950','223-58-7014','F','005 Stone Corner Point','Shrewsbury','MA','01546','431-551-1406','ewatkinnj@goo.gl','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (329,'Bogey','Emalia','24-Aug-1979','476-33-5099','F','3038 Eastwood Center','Shrewsbury','MA','01545','577-664-6260','ebogey3c@umich.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (331,'Wynett','Dory','27-Jul-1976','352-85-7033','F','1376 Drewry Circle','Boston','MA','02108','366-449-6685','dwynetto8@comsenz.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (332,'Dalling','Timmy','6-Nov-1956','142-51-6590','M','357 Tomscot Circle','Fitchburg','MA','01420','332-681-7995','tdallingmp@tiny.cc','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (333,'Winspurr','Geralda','15-Jan-1971','665-72-8151','F','230 Sheridan Alley','Worcester','MA','01606','473-629-0488','gwinspurrp1@paginegialle.it','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (334,'Winspurr','Geralda','6-Dec-1983','013-27-1957','F','2390 Sheridan Alley','Worcester','MA','01606','279-683-5341','gwinspurrp1@paginegialle.it','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (335,'Howison','Teri','16-Oct-1975','654-34-5549','F','599 Annamark Street','Boston','MA','02108','762-431-7543','thowisonkq@fastcompany.com','',DEFAULT,'',DEFAULT,''); 
INSERT INTO B_tblStudents
    VALUES (337,'Hallibone','Jacob','4-Jun-1979','871-73-7087','M','3006 Algoma Junction','Holden','MA','01520','196-956-3173','jhallibone85@house.gov','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (338,'D Aguanno','Carmon','14-Jun-1986','648-14-8287','F','206 Kropf Place','Worcester','MA','01606','914-961-4652','cdaguannoee@xing.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (339,'Laurenceau','Clemence','1-May-1977','554-24-5490','F','006 Manitowish Place','Leominster','MA','01453','299-980-1712','claurenceau4b@skype.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (340,'Skingley','Fulton','11-Jan-1953','445-84-8613','M','006 Oneill Alley','Worcester','MA','01606','707-789-1209','fskingleydz@accuweather.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (341,'Gerraty','Trudie','19-Oct-1976','141-49-9594','F','006 Talmadge Hill','Wheelwright','MA','01094','227-405-3143','tgerraty91@utexas.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (342,'Tytterton','Cletis','20-Feb-1986','804-17-9007','M','0060 Independence Pass','Auburn','MA','01501','608-535-0129','ctytterton1b@cdc.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (343,'Lough','Basil','21-Dec-1970','681-28-5105','M','00601 Fairfield Lane','Worcester','MA','01606','878-933-3217','bloughoc@mayoclinic.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (344,'Southerill','La verne','2-Nov-1959','685-07-7916','F','00623 Pierstorff Hill','Oxford','MA','01540','617-305-7373','lsoutherilljb@guardian.co.uk','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (345,'Galbraeth','Borg','20-Oct-1970','267-76-7145','M','00640 Heath Pass','Worcester','MA','01606','887-505-6938','bgalbraethe8@hubpages.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (346,'McCaghan','Koral','25-May-1984','207-81-6705','F','00642 Veith Alley','Fitchburg','MA','01420','352-870-9307','kmccaghanp@vistaprint.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (347,'Ethridge','Babbie','20-Jun-1972','233-84-0356','F','00647 Sutteridge Pass','Southbridge','MA','01550','240-891-8051','bethridge7o@lulu.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (348,'Manjin','Jolynn','5-Jun-1951','680-51-3392','F','0065 Harper Pass','Worcester','MA','01606','670-532-0531','jmanjinad@loc.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (349,'Sexcey','Marie-jeanne','11-Nov-1970','703-54-2348','F','0066 Forest Run Parkway','Worcester','MA','01606','255-774-9004','msexcey4b@ibm.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (350,'Mosedill','Bartholomeus','27-Sep-1984','414-45-3192','M','0069 Esch Parkway','Worcester','MA','01606','552-135-3536','bmosedillqf@prweb.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (351,'Dahlberg','Trudy','5-May-1977','526-64-5116','F','00738 Pepper Wood Park','Worcester','MA','01606','590-414-1930','tdahlberg36@imdb.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (352,'Lambdon','Daria','28-Apr-1968','242-19-9605','F','00740 Kedzie Court','Sturbridge','MA','01518','622-281-2449','dlambdonfl@google.co.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (353,'Cullington','Emmalyn','23-May-1979','453-53-1171','F','0077 Aberg Plaza','Fitchburg','MA','01420','802-425-4970','ecullingtonb7@zdnet.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (354,'Gaspard','Tremaine','20-Aug-1984','890-78-7324','M','0077 Banding Circle','Holden','MA','01520','930-125-7955','tgaspardk@thetimes.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (355,'Crowcher','Sigfried','16-Jul-1979','281-12-8696','M','00771 Old Shore Plaza','Oxford','MA','01540','254-809-9752','scrowcherde@un.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (356,'Abramof','Clevey','12-Sep-1966','565-07-4315','M','0078 Merrick Plaza','Worcester','MA','01606','328-579-1686','cabramofgu@facebook.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (357,'Norster','Bertina','19-Jun-1979','230-68-3366','F','008 Mayfield Trail','Worcester','MA','01606','470-631-0639','bnorstere2@ask.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (358,'Walker','Even','18-Aug-1981','133-50-4352','M','00813 Anderson Street','Worcester','MA','01606','612-377-2943','ewalker3v@google.it','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (359,'Deerr','Jacques','24-Sep-1972','416-77-9640','M','0087 4th Trail','Brookfield','MA','01506','910-713-3015','jdeerr4k@mozilla.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (360,'Dadley','Guendolen','21-Aug-1967','651-68-3806','F','00889 Onsgard Lane','Hardwick','MA','01037','559-868-6842','gdadleybf@discuz.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (361,'Ciccotto','Celestia','2-Feb-1952','113-91-7573','F','9 Messerschmidt Trail','Boston','MA','02108','746-105-0359','cciccottols@hubpages.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (362,'Ciccotto','Celestia','16-Dec-1982','508-19-5375','F','9 Messerschmidt Trail','Boston','MA','02108','746-105-0359','cciccottols2@hubpages.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (363,'Northen','Noelyn','24-Apr-1977','435-54-8478','F','0092 Summerview Crossing','Gardner','MA','01440','355-642-1439','nnorthenab@vinaora.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (364,'Bartel','Inness','12-Mar-1955','854-88-6098','M','00935 Lakewood Gardens Terrace','Worcester','MA','01606','775-607-2306','ibartelop@desdev.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (365,'Blowes','Gilemette','18-Aug-1973','852-06-0838','F','0096 Nobel Plaza','Shrewsbury','MA','01545','696-459-6420','gblowesn1@businessinsider.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (366,'Shoppee','Kameko','20-Nov-1983','453-90-2730','F','00963 Kennedy Pass','Worcester','MA','01606','675-723-2891','kshoppeehj@aol.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (367,'Rigardeau','Saul','6-Apr-1977','214-43-2802','M','0099 Basil Drive','Dudley','MA','01571','947-463-4974','srigardeaukf@icq.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (368,'O Rafferty','Sylvan','9-Jan-1950','424-79-2258','M','01 Alpine Park','Worcester','MA','01606','311-637-3725','soraffertyqe@miitbeian.gov.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (369,'Adamczyk','Binny','28-Sep-1979','676-46-7814','F','01 Boyd Way','Fitchburg','MA','01420','741-835-4495','badamczyk7m@sbwire.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (370,'Elias','Turner','2-Nov-1986','852-05-2824','M','01 Cordelia Junction','Worcester','MA','01606','811-609-8855','teliaspc@blogtalkradio.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (371,'Janecki','Silvain','3-Feb-1973','347-03-1639','M','01 Esch Drive','Auburn','MA','01501','262-676-3364','sjaneckiak@bizjournals.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (372,'Liquorish','Armando','6-Sep-1962','543-61-2305','M','01 Esch Hill','Northbridge','MA','01534','589-502-3412','aliquorishpt@samsung.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (373,'Stammer','Harli','3-Nov-1974','370-60-9268','F','01 Express Avenue','Hopedale','MA','01747','212-744-1710','hstammerb6@chicagotribune.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (374,'Medling','Tobe','23-Aug-1987','326-97-1681','M','01 Graceland Way','Worcester','MA','01606','567-771-6172','tmedlingma@omniture.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (375,'Dowson','Illa','20-Sep-1972','865-40-5719','F','01 Heffernan Point','Blackstone','MA','01504','301-976-0257','idowsonhf@wiley.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (376,'Selway','Ivie','7-Nov-1952','565-42-0569','F','01 Ilene Circle','Shrewsbury','MA','01545','142-206-1455','iselwayg@google.de','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (377,'Gullis','Wenonah','13-Jan-1978','705-23-4678','F','01 Meadow Vale Plaza','Worcester','MA','01606','815-608-4493','wgullis4z@newsvine.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (378,'McCurlye','Jedediah','7-Jul-1989','849-70-9684','M','01 Moose Park','Oxford','MA','01540','406-117-0176','jmccurlye7r@google.pl','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (379,'Johnigan','Vincenz','17-May-1975','140-02-3825','M','01 N. Brookfield Alley','Ware','MA','01082','884-731-3485','vjohnigangd@tamu.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (380,'Eastbrook','Stanleigh','5-Nov-1955','287-48-8504','M','01 Petterle Place','Worcester','MA','01606','691-879-9409','seastbrooke2@yolasite.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (381,'Sebborn','Shayne','27-Nov-1970','161-60-0538','M','01 Ryan Hill','Oxford','MA','01540','973-156-2504','ssebbornqd@moonfruit.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (382,'McKelvey','Morry','21-Jan-1982','601-08-4161','M','01 Schmedeman Place','Worcester','MA','01606','907-521-6066','mmckelveykq@craigslist.org','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (383,'McRonald','Nalani','12-Jul-1972','246-26-5541','F','01 Summerview Hill','Worcester','MA','01606','747-726-3141','nmcronald7s@constantcontact.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (384,'Imorts','Arlena','5-Feb-1968','131-03-5249','F','01 Union Hill','Spencer','MA','01562','271-231-8325','aimortsiu@twitpic.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (386,'Ferfulle','Malia','3-Feb-1985','303-61-1208','F','01 Vermont Parkway','Boston','MA','02108','526-376-1439','mferfullepb@washingtonpost.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (387,'Foss','Heall','26-Jan-1979','518-01-1762','M','01 Warrior Alley','Holden','MA','01520','125-459-2731','hfosso4@salon.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (388,'Dutteridge','Nickie','15-Dec-1950','696-12-2162','F','010 Express Pass','Framingham','MA','01701','942-535-4734','ndutteridgebw@bluehost.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (389,'Gilchrist','Tamma','21-Jul-1979','245-35-8466','F','010 Merry Road','Hardwick','MA','01037','889-200-7207','tgilchrist26@studiopress.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (390,'McCosh','Darbee','2-Jan-1988','275-56-8612','M','010 Paget Lane','Auburn','MA','01501','700-328-5767','dmccosh3r@infoseek.co.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (391,'Vern','Rutledge','8-Jul-1972','215-63-8284','M','0100 Burning Wood Road','Leicester','MA','01524','177-924-4254','rvernu@oaic.gov.au','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (392,'Baynom','Janie','7-Nov-1956','367-07-7569','F','0100 Ridge Oak Avenue','Leominster','MA','01453','547-276-4314','jbaynom86@wix.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (393,'Asplin','Cassondra','20-Mar-1975','576-02-4160','F','01002 Hoepker Junction','Spencer','MA','01562','911-202-7236','casplin82@bbc.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (394,'Daunay','Ado','3-May-1988','104-14-6137','M','01019 South Pass','Auburn','MA','01501','638-704-2522','adaunay6g@joomla.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (395,'Bohlje','Lamont','12-Mar-1971','644-86-4774','M','0104 Canary Circle','Ware','MA','01082','422-442-7476','lbohljejn@wired.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (396,'Brownrigg','Haskell','24-Nov-1964','770-06-6670','M','01046 Cascade Crossing','Worcester','MA','01606','682-584-2164','hbrownriggfb@nbcnews.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (397,'Saby','Ruby','4-Oct-1975','333-40-2554','M','011 Esker Hill','Worcester','MA','01606','902-377-8914','rsaby5v@fema.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (398,'Grzeszczyk','Suki','14-Nov-1988','224-36-7522','F','011 Hollow Ridge Hill','Hubbardston','MA','01452','905-379-8541','sgrzeszczykfl@ox.ac.uk','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (400,'Kenion','Jeannine','21-Nov-1968','746-98-2439','F','011 Ronald Regan Street','Boston','MA','02108','718-708-0164','jkenionid@devhub.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (401,'Kaubisch','Kim','21-May-1974','499-99-9203','M','011 Spaight Junction','Fitchburg','MA','01420','538-281-3761','kkaubisch9v@gov.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (402,'Leebetter','Audrey','18-Dec-1988','210-08-9542','F','01109 Killdeer Trail','Shrewsbury','MA','01546','925-983-9993','aleebetter8n@51.la','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (403,'Ellershaw','Oswell','18-Jun-1978','644-64-6089','M','0111 Birchwood Trail','N. Brookfield','MA','01535','599-135-6749','oellershawdh@flavors.me','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (404,'Kissock','Phillipe','14-Nov-1966','156-28-8889','M','01116 Doe Crossing Street','Auburn','MA','01501','258-669-2810','pkissockda@wordpress.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (405,'Purdon','Nixie','15-Jan-1974','154-08-4177','F','01119 Grim Trail','Springfield','MA','01101','143-226-3383','npurdonju@about.me','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (407,'Skeermer','Chrisy','18-Mar-1977','643-17-0403','M','01124 Clove Crossing','Worcester','MA','01606','122-610-4660','cskeermerdf@bravesites.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (408,'Leipnik','Denny','16-Dec-1964','898-23-3744','M','01150 Springs Point','Lunenburg','MA','01462','843-687-6036','dleipnikg7@privacy.gov.au','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (409,'Garry','Mark','24-Sep-1970','456-84-2847','M','0117 Park Meadow Trail','Framingham','MA','01701','989-123-1617','mgarryhp@ameblo.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (410,'Skeath','Devina','16-Feb-1987','790-46-8567','F','0118 Glendale Place','Leominster','MA','01453','232-777-1288','dskeathl2@earthlink.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (411,'Edgin','Weber','28-Jul-1975','281-17-6112','M','012 Graceland Parkway','Holden','MA','01520','274-319-9241','wedginqr@wired.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (412,'Andersen','Thorny','5-May-1961','420-46-1805','M','012 Iowa Drive','Worcester','MA','01606','938-153-1521','tandersena8@unblog.fr','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (414,'Kayser','Vere','20-Aug-1987','458-07-9788','F','012 Kim Street','Springfield','MA','01101','560-472-9712','vkayser4w@phpbb.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (415,'Strathern','Denver','22-Sep-1975','106-10-3668','M','012 Lyons Alley','E. Brookfield','MA','01515','342-344-5344','dstrathernit@nyu.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (416,'Maynell','Dell','17-Sep-1958','542-84-0346','M','012 Maywood Drive','Worcester','MA','01606','724-330-6633','dmaynell8q@psu.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (417,'Beldum','Thain','13-Aug-1975','201-15-0698','M','0120 Sommers Way','Ware','MA','01082','117-887-7168','tbeldum59@gov.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (418,'Burgane','Melinde','19-Jan-1984','409-12-7183','F','01241 Old Gate Pass','Worcester','MA','01606','413-658-6916','mburganem6@digg.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (419,'Mandy','Eachelle','3-Oct-1976','780-97-1681','F','0127 Fair Oaks Terrace','Fitchburg','MA','01420','330-174-5822','emandy5p@bandcamp.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (420,'Houndson','Rollin','13-Jan-1950','708-31-5053','M','0127 Goodland Circle','Fitchburg','MA','01420','689-283-3562','rhoundsonf7@fda.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (421,'McArtan','Graehme','22-May-1972','784-59-5059','M','01296 Birchwood Park','Brookfield','MA','01506','110-944-6033','gmcartanhi@vk.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (422,'Braime','Gram','14-Nov-1988','462-33-5368','M','013 Cordelia Place','Worcester','MA','01606','624-271-9100','gbraime49@indiatimes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (423,'Stollberg','Harv','8-Dec-1977','635-85-6508','M','013 Debra Center','Worcester','MA','01606','103-656-9923','hstollberg8g@noaa.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (424,'Kryzhov','Wittie','11-Sep-1969','394-39-1916','M','013 Kedzie Drive','Worcester','MA','01606','343-771-4804','wkryzhov2c@sogou.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (425,'Rops','Lissa','7-Oct-1973','211-92-8329','F','013 Kenwood Court','Worcester','MA','01606','547-225-9142','lrops6p@blinklist.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (426,'Issacof','Finley','8-May-1986','777-50-8569','M','013 Victoria Court','Charlton','MA','01507','241-199-0092','fissacof3s@sohu.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (427,'Stoffel','Hillary','9-Jun-1976','125-52-9011','M','013 Warbler Park','Auburn','MA','01501','404-457-4177','hstoffel9s@bloomberg.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (428,'Puckring','Everard','4-Apr-1969','673-88-2096','M','01305 Dwight Plaza','Framingham','MA','01701','238-388-6841','epuckring77@fastcompany.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (429,'Gilchrest','Jerri','28-Dec-1970','618-69-6668','M','01317 Cordelia Avenue','Framingham','MA','01701','533-843-9099','jgilchrestdq@google.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (430,'Darridon','Ange','11-Aug-1982','477-61-9365','M','0134 Moulton Point','Worcester','MA','01606','487-305-3091','adarridon3c@sfgate.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (431,'Lorand','Ugo','20-Jan-1970','218-43-7588','M','0134 Saint Paul Park','Worcester','MA','01606','136-886-6410','ulorand43@state.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (432,'Mogford','Dara','14-May-1953','471-59-4354','F','0135 Michigan Park','Worcester','MA','01606','240-399-2790','dmogfordfc@globo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (433,'Tatterton','Rasla','25-Apr-1970','856-74-0013','F','0135 Paget Crossing','Worcester','MA','01606','953-894-2785','rtatterton9c@storify.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (434,'Bathoe','Donal','16-Feb-1983','217-32-8673','M','0137 Fulton Court','N. Grafton','MA','01536','740-488-8411','dbathoej8@bizjournals.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (435,'Mellem','Roana','10-Jul-1970','781-62-0593','F','01370 Monument Center','Spencer','MA','01562','980-580-2290','rmellemla@flickr.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (436,'Manger','Ermengarde','26-Mar-1968','553-67-3405','F','01378 Dayton Plaza','Worcester','MA','01606','450-237-4344','emangerm1@google.fr','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (437,'Royans','Cybill','27-Aug-1977','191-57-2378','F','014 Loftsgordon Avenue','West Boylston','MA','01583','984-399-0568','croyansak@who.int','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (439,'Wasylkiewicz','Christophorus','21-Feb-1971','399-52-6109','M','014 Vera Street','Oxford','MA','01540','786-517-0557','cwasylkiewiczmu@cbsnews.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (440,'Pigeon','Cherin','2-Jan-1968','415-29-6999','F','0141 Clyde Gallagher Lane','Worcester','MA','01606','873-173-3094','cpigeonm7@shop-pro.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (442,'Bradden','Magdaia','5-May-1988','874-62-7953','F','01426 Thierer Avenue','Brimfield','MA','01010','273-530-1979','mbradden5i@cloudflare.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (443,'Lamy','Elsinore','17-Feb-1970','794-58-7872','F','0143 3rd Plaza','Worcester','MA','01606','963-132-3088','elamy2a@aboutads.info','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (444,'Apfler','Tremayne','24-Jun-1956','673-40-8028','M','01456 Westerfield Street','Holden','MA','01520','800-432-9189','tapfler3o@wikispaces.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (445,'Heisler','Trefor','18-Jul-1979','153-20-1073','M','0146 Menomonie Avenue','Worcester','MA','01606','354-403-1665','theislerrb@technorati.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (446,'Faulkner','Leigh','20-May-1985','682-43-6179','F','01468 Manitowish Pass','Rutland','MA','01543','189-708-0928','lfaulknerqz@arizona.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (447,'Midgley','Pablo','14-Jun-1971','536-39-2828','M','01494 Armistice Parkway','Worcester','MA','01606','883-741-1499','pmidgleypo@wix.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (448,'Gertz','Sarita','12-Nov-1951','347-28-0630','F','01499 Buhler Road','Leominster','MA','01453','982-541-6454','sgertznl@Leominster.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (449,'Kase','Jamesy','20-Jun-1979','750-68-4516','M','015 Elgar Park','Holden','MA','01520','697-130-2863','jkasek5@pen.io','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (450,'MacCroary','Milo','22-Jun-1989','396-88-3725','M','015 Hagan Center','Paxton','MA','01612','875-623-2722','mmaccroary9o@de.vu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (451,'Po','Field','22-Sep-1970','298-19-4589','M','01522 Sunfield Plaza','Auburn','MA','01501','718-400-0211','fpob9@photobucket.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (452,'Hayhurst','Hyacinthia','21-May-1951','734-71-3310','F','0155 Dryden Street','Rutland','MA','01543','694-789-8713','hhayhurst93@naver.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (453,'Stribbling','Anastasie','22-Apr-1978','475-60-3278','F','01550 Clemons Hill','Worcester','MA','01606','300-919-9655','astribblingp0@bloglovin.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (454,'Kaser','Malia','22-Oct-1984','659-94-3194','F','01573 Rowland Drive','Wheelwright','MA','01094','233-803-1287','mkaser5@shop-pro.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (455,'Tollit','Janenna','1-Jun-1972','278-39-2170','F','016 La Follette Lane','Leicester','MA','01524','635-280-6085','jtollited@squidoo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (456,'Gawen','Nicky','8-Jan-1963','499-82-8584','M','01614 Buhler Alley','West Boylston','MA','01583','108-553-3423','ngawendi@nymag.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (458,'Crumpe','Brana','13-Mar-1988','457-13-0770','F','01631 Oneill Junction','Boston','MA','02108','235-452-8482','bcrumpec4@slashdot.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (459,'Randall','Caryl','9-Jan-1972','536-54-4492','M','0166 Del Sol Hill','Newton','MA','02456','218-222-3626','crandalldr@gmpg.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (460,'Ruilton','Francois','23-Jan-1954','732-56-8636','M','01661 Briar Crest Junction','Worcester','MA','01606','651-296-4924','fruiltonrh@discovery.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (461,'McInnery','Dre','5-May-1977','782-81-8125','F','01669 Raven Terrace','Fitchburg','MA','01420','499-473-9365','dmcinneryoj@china.com.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (462,'Nolder','Jerad','5-Sep-1981','679-43-4379','M','01696 Trailsway Parkway','Worcester','MA','01606','305-910-5476','jnolder5e@feedburner.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (464,'Bradd','Konstance','18-Jun-1958','226-83-2006','F','017 Merrick Road','Boston','MA','02108','231-900-1098','kbraddhw@icq.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (465,'Eardley','Mario','25-May-1973','631-13-9826','M','017 Reindahl Trail','W. Brookfield','MA','01585','611-185-9258','meardleyke@technorati.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (466,'Gergher','Carlyn','5-May-1989','818-02-6828','F','0173 6th Place','Worcester','MA','01606','853-684-8663','cgergherob@amazon.de','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (467,'Spiring','Kris','27-May-1978','751-95-0700','F','01741 Holy Cross Parkway','Charlton','MA','01507','432-780-2059','kspiringlc@mac.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (469,'Newby','Leroi','9-Dec-1975','706-67-3290','M','01758 Brickson Park Alley','Fitchburg','MA','01420','162-742-1996','lnewbyof@geocities.jp','',DEFAULT,'','CITR','DB');
INSERT INTO B_tblStudents
    VALUES (470,'Shiell','Otha','1-Apr-1986','713-97-9323','F','0176 Brentwood Circle','Auburn','MA','01501','236-563-0241','oshiell6t@blog.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (471,'Rudge','Lisette','7-Dec-1975','542-14-8975','F','0176 Roth Court','Oxford','MA','01540','557-148-3291','lrudge4j@mac.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (472,'Frude','Zacherie','25-Feb-1959','404-13-4494','M','01773 Northwestern Parkway','Worcester','MA','01606','677-707-2134','zfrudeh1@w3.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (473,'Leser','Carny','15-Feb-1974','191-92-7380','M','018 Lighthouse Bay Point','N. Brookfield','MA','01535','553-860-7840','cleserme@cdc.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (475,'Lawlance','Crystal','5-Jan-1970','724-85-4934','F','018 Lunder Street','Boston','MA','02108','919-945-4279','clawlanceb3@weibo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (476,'Weekley','Dina','20-Jul-1962','187-42-3143','F','018 Mayer Drive','Hardwick','MA','01037','495-777-6417','dweekley1y@geocities.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (477,'Buzek','Meta','21-Nov-1970','320-69-9850','F','018 Rowland Lane','Barre','MA','01005','448-221-6022','mbuzekp8@dagondesign.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (478,'Shillington','Mariejeanne','15-Nov-1988','524-44-5159','F','018 Spaight Alley','Auburn','MA','01501','905-372-9539','mshillingtonr0@wsj.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (479,'Risbie','Diandra','21-Jul-1972','276-68-1262','F','0180 Badeau Hill','Worcester','MA','01606','733-748-8577','drisbiebk@earthlink.net','',DEFAULT,'','CIES','DB');
INSERT INTO B_tblStudents
    VALUES (480,'Rowell','Thea','19-Aug-1963','798-86-0970','F','01801 Center Lane','Leominster','MA','01453','666-766-4322','trowell2v@wikia.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (481,'Humpage','Tyson','16-Oct-1977','367-37-0739','M','01803 Pine View Park','W. Brookfield','MA','01585','979-310-6077','thumpage2h@eepurl.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (482,'Lacer','Gradey','22-Aug-1981','893-06-7129','M','01807 Evergreen Terrace','Worcester','MA','01606','134-315-7457','glacer9r@macromedia.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (483,'Clist','Orland','20-Dec-1979','385-69-9806','M','019 Hooker Alley','Framingham','MA','01701','912-169-2668','oclistf0@craigslist.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (484,'Twell','Ingaborg','2-Jun-1957','677-10-9530','F','019 Stuart Parkway','Marlborough','MA','01752','284-448-9301','itwelli2@squidoo.com','',DEFAULT,'','DB','');
INSERT INTO B_tblStudents
    VALUES (485,'Jiggins','Ronnie','21-Aug-1970','136-83-8228','M','01900 Corben Terrace','Fitchburg','MA','01420','954-951-4205','rjigginshn@dropbox.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (486,'Cordell','Mellie','21-Aug-1983','596-47-9583','F','0191 Heath Point','Shrewsbury','MA','01546','506-963-0152','mcordellen@huffingtonpost.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (487,'Gudgen','Casar','22-Oct-1979','498-98-9238','M','01912 Homewood Point','Worcester','MA','01606','924-695-2646','cgudgenib@army.mil','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (488,'Whitehurst','Frederich','1-Oct-1950','649-85-1387','M','01913 Fuller Avenue','Clinton','MA','01510','504-747-0527','fwhitehurst86@stanford.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (489,'Nertney','Dylan','24-Aug-1972','463-97-2164','M','0194 Cordelia Alley','Northbridge','MA','01534','976-948-8900','dnertneylt@unc.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (490,'Medland','Toddy','26-Nov-1982','488-15-4002','M','0199 Golf Course Parkway','Charlton','MA','01507','248-673-1481','tmedlandm1@businessweek.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (491,'Capoun','Pat','4-Feb-1976','853-20-1879','M','01993 Bluejay Trail','Worcester','MA','01606','853-455-3848','pcapoun2j@springer.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (492,'Mattusov','Issie','14-Jul-1962','626-80-3375','F','02 4th Drive','Worcester','MA','01606','240-889-2162','imattusovna@cornell.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (493,'Deschelle','Lizzie','19-Jul-1977','783-93-5499','F','02 Barnett Junction','Worcester','MA','01606','750-645-5496','ldeschellegd@webeden.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (494,'Cansdale','Chandra','22-Jan-1989','754-09-6658','F','02 Cherokee Terrace','Northbridge','MA','01534','836-240-7458','ccansdalepp@reference.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (496,'Sigg','Ashly','7-Feb-1959','502-86-2531','F','02 Clarendon Junction','Boston','MA','02108','759-858-3224','asiggd3@weibo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (498,'Mantz','Sayer','24-Feb-1986','580-19-1437','M','02 Clyde Gallagher Junction','Lunenburg','MA','01462','475-940-9239','smantzld@shareasale.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (500,'Huxstep','Hortense','12-Sep-1967','378-54-8399','F','02 Declaration Street','Boston','MA','02108','932-763-4021','hhuxstepgw@java.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (501,'Sizzey','Patrizia','16-Jun-1978','308-06-0418','F','02 Dunning Alley','Marlborough','MA','01752','467-866-1312','psizzeydh@sitemeter.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (502,'Southeran','Adorne','15-Apr-1985','325-35-3757','F','02 Fieldstone Avenue','Worcester','MA','01606','670-584-8259','asoutheranhu@who.int','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (503,'Lisett','Tallulah','10-May-1974','291-63-6503','F','02 Fuller Alley','Fitchburg','MA','01420','296-612-6221','tlisettdr@devhub.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (504,'Vernazza','Florette','3-Feb-1952','344-98-6424','F','02 Gina Road','Northborough','MA','01532','571-418-3682','fvernazza92@amazon.co.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (505,'Fairs','Malorie','20-Jun-1979','687-38-0365','F','02 Hermina Plaza','Worcester','MA','01606','507-629-8014','mfairspu@unesco.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (506,'Gilluley','Ronnie','22-Aug-1989','395-90-7421','M','02 Jackson Street','Worcester','MA','01606','159-391-3386','rgilluley8x@epa.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (507,'Tann','Karlens','11-Jul-1972','258-24-3756','M','02 Jana Parkway','Hubbardston','MA','01452','653-785-2425','ktannct@godaddy.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (508,'Caulier','Idelle','11-Jan-1964','470-29-2715','F','02 Kennedy Junction','Worcester','MA','01606','866-155-4851','icaulier2m@netvibes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (509,'Whines','Jason','17-Feb-1970','299-86-0781','M','02 Lerdahl Trail','Worcester','MA','01606','572-883-2502','jwhinesjq@mashable.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (510,'Lathey','Ezri','3-Nov-1984','859-32-2761','M','02 Leroy Avenue','Worcester','MA','01606','977-147-0438','elathey5k@xrea.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (511,'Truscott','Wiatt','23-May-1973','763-24-8218','M','2 Lukken Court','Winchendon','MA','01475','853-524-2606','wtruscott8c@usatoday.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (512,'Brookfield','Amelie','13-Dec-1967','341-70-1791','F','02 Lukken Trail','Auburn','MA','01501','651-602-0181','abrookfield1z@miibeian.gov.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (513,'Sleney','Marianna','13-Jul-1977','846-62-2900','F','02 Lyons Circle','Pepperell','MA','01463','232-781-6763','msleney9k@wikispaces.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (514,'Berrick','Ezechiel','27-Nov-1988','409-77-1377','M','02 Macpherson Way','Auburn','MA','01501','618-520-8978','eberrickeo@columbia.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (515,'Bispham','Alejandro','18-Sep-1972','708-45-8095','M','02 Maywood Hill','Oxford','MA','01540','933-808-8749','abisphamdg@goodreads.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (516,'Mourton','Kippy','26-Oct-1954','522-77-0243','F','02 Melvin Crossing','Leicester','MA','01524','303-483-2074','kmourton8u@fotki.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (517,'Daintier','Clarine','16-Oct-1976','318-06-6046','F','02 Northridge Street','Worcester','MA','01606','927-707-9083','cdaintier7t@blogs.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (518,'Neal','Jeramey','7-Jan-1987','853-43-0886','M','02 Onsgard Terrace','Worcester','MA','01606','212-426-5784','jnealj7@timesonline.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (519,'Copley','Dex','22-Jun-1972','163-34-7066','M','02 Oriole Terrace','Worcester','MA','01606','440-972-5630','dcopley8x@phoca.cz','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (520,'Maryon','Devlen','21-Jan-1966','268-25-7646','M','02 Prairieview Parkway','Worcester','MA','01606','784-268-6630','dmaryonhh@bbc.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (521,'Motto','Maybelle','25-Jul-1973','529-12-3982','F','02 Warrior Way','Worcester','MA','01606','968-798-3550','mmottodl@nih.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (522,'Yeulet','Saunders','3-Nov-1988','352-90-9552','M','02 Waywood Avenue','Oxford','MA','01540','807-492-4695','syeulet7g@paypal.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (523,'Yedall','Gage','13-Oct-1976','189-05-8971','M','02 Winchendon Avenue','Holden','MA','01520','254-988-9360','gyedall6@ucsd.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (524,'Papa','Aldus','23-Mar-1959','190-04-5199','M','020 Forest Dale Way','Auburn','MA','01501','648-844-2704','apapaci@about.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (525,'Steiner','Kathi','11-Aug-1973','488-65-6916','F','02025 Forster Court','Fitchburg','MA','01420','969-986-8903','ksteiner8t@hubpages.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (526,'Bryett','Ofelia','28-Mar-1980','857-17-2278','F','0203 Sauthoff Trail','Worcester','MA','01606','708-718-9964','obryettb9@telegraph.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (528,'Saull','Dulcinea','14-May-1969','743-46-3058','F','02051 Magdeline Trail','Boston','MA','02108','602-399-3902','dsaullo4@techcrunch.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (529,'Cowherd','Heall','9-May-1973','351-14-3042','M','02055 Melrose Circle','Worcester','MA','01606','536-416-5191','hcowherdcg@kickstarter.com','',DEFAULT,'','CIES','CIWP');
INSERT INTO B_tblStudents
    VALUES (530,'Fleckness','Baird','25-Jun-1984','806-77-9150','M','02066 Corscot Plaza','Worcester','MA','01606','773-295-5054','bflecknesshg@people.com.cn','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (531,'Oxterby','Leontine','20-Oct-1975','405-24-3160','F','02069 Anniversary Terrace','Sturbridge','MA','01518','544-102-6878','loxterbybu@marketwatch.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (532,'Pilsbury','Aldous','20-Dec-1952','267-91-8328','M','0208 Basil Way','Orange','MA','01378','353-651-1381','apilsburykk@ihg.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (533,'Tomet','Agnese','20-May-1976','828-66-5453','F','021 1st Crossing','Oxford','MA','01540','717-627-9273','atometf0@freewebs.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (534,'Minster','Margaretha','28-Sep-1987','469-75-6290','F','021 Holy Cross Point','Springfield','MA','01101','257-542-5975','mminster9p@google.com.hk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (535,'Fantonetti','Moina','7-Dec-1970','823-32-7246','F','021 Old Shore Drive','Leominster','MA','01453','146-521-8459','mfantonettinf@lulu.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (536,'DAmbrogi','Myrvyn','23-Jan-1960','877-46-9489','M','02123 Everett Plaza','Ware','MA','01082','966-817-5097','mdambrogi10@livejournal.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (537,'Sneesby','Thurston','13-Oct-1971','216-84-1275','M','0216 Schiller Street','Worcester','MA','01606','468-237-5867','tsneesbycn@opensource.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (538,'Creasy','Nell','11-Feb-1987','310-83-3688','F','02193 Reinke Hill','Fitchburg','MA','01420','212-629-9649','ncreasybc@wired.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (540,'Sugge','Lizette','14-Jul-1966','241-44-4658','F','022 Anzinger Street','Boston','MA','02108','601-457-0395','lsuggel9@symantec.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (541,'Rosin','Latisha','6-Jun-1971','736-72-5666','F','022 Carberry Junction','Shrewsbury','MA','01545','213-952-8273','lrosinkv@google.com.au','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (542,'Stobbie','Charleen','5-Feb-1985','586-58-5926','F','022 Main Crossing','Athol','MA','01331','216-740-0725','cstobbiemb@imdb.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (543,'Kimmins','Annetta','25-Aug-1975','515-61-5187','F','022 Monica Crossing','W. Boylston','MA','01583','448-339-8532','akimmins2q@amazon.de','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (544,'Baskerville','Tonya','25-Nov-1957','835-39-9306','F','022 Vahlen Plaza','Worcester','MA','01606','273-319-7890','tbaskervilleqd@digg.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (545,'Shevelin','Baillie','25-Jul-1973','165-41-7094','M','022 West Hill','Auburn','MA','01501','547-227-6216','bshevelinhr@bloglovin.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (546,'Charlton','Rosaleen','20-May-1982','568-90-5117','F','02202 Vahlen Street','Leominster','MA','01453','754-339-7341','rcharltonrj@disqus.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (548,'McGrane','Raine','28-Oct-1964','197-72-2032','F','02204 Corry Road','Northbridge','MA','01534','555-505-0195','rmcgranena@nih.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (550,'Boustead','Caroljean','4-Sep-1983','326-46-5046','F','02236 Anzinger Street','Worcester','MA','01606','118-685-2400','cboustead4b@google.pl','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (551,'Whitehead','Kay','5-Jan-1975','796-36-8881','F','0227 Ramsey Terrace','Baldwinville','MA','01436','421-283-1392','kwhitehead12@liveinternet.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (553,'Bethell','Gilda','19-May-1974','342-34-7097','F','02283 Oak Valley Point','Worcester','MA','01606','617-830-1122','gbethellgb@geocities.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (554,'Davana','Nolly','9-Mar-1987','552-60-9709','M','02349 Gulseth Junction','Auburn','MA','01501','951-668-3692','ndavanaki@bluehost.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (556,'Lamps','Verena','10-Aug-1969','683-73-8261','F','02359 Sauthoff Avenue','Springfield','MA','01101','700-406-4521','vlamps7p@nyu.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (557,'Full','Tierney','11-Feb-1973','330-38-4618','F','0238 Sachs Drive','Southbridge','MA','01550','941-659-7788','tfull4k@weebly.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (558,'Guilloud','Chiarra','19-Dec-1980','416-72-8533','F','02380 Butterfield Road','Worcester','MA','01606','395-511-1136','cguilloudop@washingtonpost.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (559,'Hamber','Anthiathia','1-May-1979','261-49-2625','F','024 Crest Line Street','Rutland','MA','01543','592-923-8446','ahamberfa@livejournal.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (560,'Kauffman','Herculie','11-Feb-1964','116-48-9460','M','024 Johnson Terrace','Fitchburg','MA','01420','111-698-0052','hkauffman56@berkeley.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (561,'Clyburn','Padget','19-Nov-1972','489-64-0421','M','024 Kedzie Drive','Grafton','MA','01519','546-825-2426','pclyburngy@salon.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (562,'Korbmaker','Herold','19-Jul-1983','538-06-4539','M','0240 Hallows Terrace','Townsend','MA','01469','756-347-0248','hkorbmaker6a@xinhuanet.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (563,'Trotter','Brooke','9-Jul-1971','362-23-9701','F','02416 Melby Junction','Sturbridge','MA','01518','868-637-2262','btrotter8c@house.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (564,'Andrei','Scott','13-Feb-1954','505-51-4439','M','02485 Crescent Oaks Drive','Leicester','MA','01524','267-369-5222','sandreibv@unesco.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (565,'Jindrich','Olly','20-Jan-1972','818-21-6619','M','025 Green Place','Worcester','MA','01606','663-439-5606','ojindrichb4@elpais.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (566,'Kernes','Woodie','8-Apr-1987','491-96-2899','M','025 Nelson Way','Oxford','MA','01540','345-318-0121','wkernesoy@ow.ly','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (567,'Leeman','Derwin','6-Mar-1978','754-29-7025','M','025 Pearson Road','Holden','MA','01520','592-475-1415','dleemanq8@google.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (568,'Rops','Tiebold','3-Nov-1958','524-59-9179','M','025 Stoughton Trail','Worcester','MA','01606','755-147-7975','tropsqy@mlb.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (569,'Luis','Elva','5-Oct-1975','208-16-3617','F','025 Westend Court','Worcester','MA','01606','590-321-2743','eluis1v@newyorker.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (570,'Barrs','Alix','21-Feb-1988','393-36-9682','F','02578 Goodland Alley','Worcester','MA','01606','653-371-1775','abarrsc6@flavors.me','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (571,'Ghest','Odille','20-Jun-1979','202-54-1108','F','02581 Tomscot Avenue','Leicester','MA','01524','715-487-3799','oghestpc@un.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (572,'Woolfoot','Cletus','17-May-1954','518-44-2353','M','026 Bashford Street','Worcester','MA','01606','872-314-6971','cwoolfootlg@dailymotion.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (573,'Asty','Rodi','15-May-1972','858-88-6610','F','026 Boyd Alley','Shrewsbury','MA','01545','818-640-9947','rastymc@europa.eu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (574,'Janew','Fitz','19-May-1988','513-88-0377','M','026 Welch Terrace','Ware','MA','01082','139-663-0219','fjanew2l@1und1.de','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (575,'Wyld','Bernelle','5-Nov-1973','871-95-2254','F','0260 Elgar Parkway','Charlton','MA','01507','260-199-2223','bwyldnp@usgs.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (576,'Hearsey','Osmund','1-Mar-1969','218-07-9674','M','02605 Village Court','Auburn','MA','01501','509-724-8879','ohearseybn@ebay.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (577,'Gallafant','Odelle','9-Jul-1972','511-28-7084','F','0262 East Hill','Shrewsbury','MA','01545','390-636-0778','ogallafant1t@prlog.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (578,'Flemyng','Vachel','10-Apr-1981','567-23-6703','M','0264 Cottonwood Parkway','Auburn','MA','01501','916-275-5569','vflemyngko@washington.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (579,'Onthank','Emmit','7-Sep-1971','565-15-6247','M','02684 Clemons Trail','E. Brookfield','MA','01515','698-103-0068','eonthank8s@prweb.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (580,'Huntington','Hetti','24-Dec-1953','169-49-2190','F','027 Jenna Parkway','Worcester','MA','01606','122-536-5116','hhuntington6j@hud.gov','',DEFAULT,'','DB','');
INSERT INTO B_tblStudents
    VALUES (581,'Raffeorty','Ahmed','22-Oct-1971','366-05-6036','M','02718 Raven Junction','Winchendon','MA','01475','582-448-3267','araffeorty26@example.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (582,'Jeaneau','Gerladina','7-May-1984','881-50-2793','F','02780 Anthes Court','Worcester','MA','01606','770-839-4350','gjeaneau4e@fema.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (583,'Franzman','Brandy','7-Feb-1971','204-44-6046','F','028 Blue Bill Park Pass','Rutland','MA','01543','747-902-4488','bfranzmannm@un.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (584,'Guare','Moritz','9-Sep-1961','749-12-8098','M','028 International Park','Ware','MA','01082','167-243-3927','mguarej0@nature.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (585,'Mattiussi','Menard','20-Oct-1970','764-34-5913','M','0281 Granby Center','Charlton','MA','01507','636-500-0238','mmattiussilz@kickstarter.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (586,'Pickaver','Georas','24-Feb-1986','322-31-5624','M','0282 Bonner Parkway','Framingham','MA','01701','513-545-5163','gpickavercc@t-online.de','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (587,'Giannotti','Kellen','16-Mar-1971','849-78-6243','M','0282 Fallview Terrace','Worcester','MA','01606','562-396-8651','kgiannotti1n@privacy.gov.au','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (588,'Trahmel','Theressa','19-Feb-1955','633-07-2676','F','02826 Ramsey Hill','Hopedale','MA','01747','446-994-1994','ttrahmel6q@delicious.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (589,'Sword','Zilvia','16-Mar-1971','715-65-2618','F','0283 Upham Way','Boston','MA','02108','896-807-7267','zsword90@typepad.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (591,'Piborn','Ray','10-Jun-1977','403-61-2650','F','0284 Northview Park','Athol','MA','01331','776-164-1511','rpibornqs@businessweek.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (592,'Haddon','Stacia','3-May-1956','871-65-2092','F','0285 Killdeer Drive','Fitchburg','MA','01420','188-719-9075','shaddonov@youtu.be','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (593,'Joicey','Avril','22-Dec-1952','572-91-7938','F','0285 Kingsford Circle','Boston','MA','02108','378-727-2504','ajoicey5n@businesswire.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (594,'Joicey','Avril','15-Oct-1982','275-19-7738','F','0285 Kingsford Circle','Boston','MA','02108','378-727-2504','ajoicey5n2@businesswire.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (595,'Brightie','Elia','19-Jun-1977','811-38-9783','M','0285 Troy Alley','Worcester','MA','01606','622-561-9469','ebrightie55@newyorker.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (596,'Pignon','Jarrod','8-Aug-1956','308-28-2183','M','02890 Redwing Drive','West Boylston','MA','01583','956-266-2145','jpignonog@samsung.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (597,'LeCount','Beverlie','15-Dec-1976','182-88-6970','F','02891 Sutherland Crossing','Worcester','MA','01606','458-940-5020','blecountpp@myspace.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (598,'Fendley','Mitch','6-Oct-1981','479-29-3897','M','029 Drewry Lane','Holden','MA','01520','811-916-6403','mfendleygj@ted.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (599,'McElhinney','Thornie','12-Oct-1970','723-89-1610','M','029 Tomscot Way','E. Brookfield','MA','01515','708-481-4054','tmcelhinney8l@pbs.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (600,'Alessandretti','Annora','2-Jul-1960','109-74-2211','F','0294 Longview Place','Charlton','MA','01507','425-246-3197','aalessandrettipl@washingtonpost.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (601,'Silly','Dennie','11-May-1978','697-39-3106','M','02940 Spaight Place','Auburn','MA','01501','373-777-8834','dsillyay@bizjournals.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (602,'Cassella','Lorna','3-Nov-1980','128-39-2437','F','02942 Fair Oaks Parkway','Worcester','MA','01606','687-882-8077','lcassellaf5@tinypic.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (603,'Skipperbottom','Nicol','7-Feb-1979','615-81-9436','M','02973 Merrick Crossing','Worcester','MA','01606','365-146-6065','nskipperbottomed@aboutads.info','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (604,'Giabuzzi','Sileas','8-Mar-1951','294-60-3230','F','03 Bay Alley','Shrewsbury','MA','01546','664-492-3850','sgiabuzzi51@devhub.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (605,'Kubis','Bebe','15-Jan-1976','199-61-2111','F','03 Briar Crest Park','Southbridge','MA','01550','815-842-2847','bkubisf9@ca.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (606,'Bercevelo','Elle','11-Mar-1986','593-13-6174','F','03 Butternut Avenue','Worcester','MA','01606','261-247-3030','eberceveloij@nytimes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (607,'Nason','Jeanna','25-Oct-1971','647-74-2245','F','03 Charing Cross Pass','Southbridge','MA','01550','624-455-4046','jnason53@hhs.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (608,'Casbolt','Ripley','1-Jan-1956','207-99-3611','M','03 Claremont Center','Worcester','MA','01606','379-226-9531','rcasbolt18@google.nl','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (609,'Tapin','Rafi','6-Jul-1979','806-47-7858','M','03 Darwin Road','Framingham','MA','01701','181-338-6192','rtapina4@discovery.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (610,'Lillecrap','Alikee','7-Nov-1985','816-33-3206','F','03 Golf Trail','Fitchburg','MA','01420','203-120-5564','alillecrapcd@ocn.ne.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (611,'Celle','Cristin','11-Apr-1974','578-71-9141','F','03 Jackson Parkway','Auburn','MA','01501','200-319-6158','ccelle7y@google.pl','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (612,'Emmer','Cobby','2-Oct-1965','596-57-0352','M','03 Jana Pass','Leicester','MA','01524','699-346-1019','cemmero3@domainmarket.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (613,'Otto','Darcee','4-May-1970','810-28-3293','F','03 Jay Avenue','Athol','MA','01331','947-404-2162','dotto26@aboutads.info','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (614,'Matson','Helaina','13-Oct-1986','418-65-4851','F','03 Jenifer Crossing','Gardner','MA','01440','972-253-3486','hmatsond4@mysql.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (615,'Saile','Ddene','5-May-1973','553-37-3487','F','03 Leroy Hill','Worcester','MA','01606','172-846-0089','dsaile9h@gmpg.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (616,'Seggie','Neal','12-Jan-1968','380-59-0309','M','03 Lotheville Plaza','Worcester','MA','01606','473-423-0963','nseggiepn@google.pl','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (617,'Lurner','Jessica','13-Oct-1978','130-01-8918','F','03 Lotheville Terrace','Worcester','MA','01606','297-570-4273','jlurneris@drupal.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (618,'Iohananof','Lizzy','3-Dec-1988','818-34-8772','F','03 Manley Park','W. Brookfield','MA','01585','351-153-8225','liohananof6o@discovery.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (619,'Parramore','Malcolm','22-Mar-1973','844-29-3731','M','03 N. Brookfield Way','Ware','MA','01082','176-592-1646','mparramore28@wisc.edu','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (620,'Aiton','Kassey','11-Apr-1963','570-27-2994','F','03 Ridge Oak Court','Oxford','MA','01540','686-106-0345','kaiton7m@gov.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (621,'Desilets','Russell','23-May-1953','861-48-6595','M','129 N. Hapton','Worcester','MA','01606','555-555-5225','rdesilets@hud.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (622,'Slimme','Vicky','23-Feb-1985','565-12-6471','F','03 Sheridan Center','Leominster','MA','01453','699-779-6896','vslimmeqn@trellian.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (623,'Brun','Halsey','8-Jul-1970','876-60-2852','M','03 Transport Avenue','Paxton','MA','01612','560-429-2976','hbrunlj@yahoo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (624,'Nucciotti','Patricio','18-Jan-1961','256-21-3988','M','03 Troy Court','N. Grafton','MA','01536','797-174-0432','pnucciottij6@skyrock.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (625,'Sprionghall','Stace','2-Apr-1979','462-03-8046','F','03 Veith Crossing','Worcester','MA','01606','795-503-0244','ssprionghallz@drupal.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (626,'Ockwell','Bird','22-Apr-1981','678-98-5573','F','03 Victoria Way','Worcester','MA','01606','773-932-2622','bockwellke@hibu.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (627,'Gagg','Colman','14-Sep-1970','898-74-4658','M','03 Wayridge Drive','Shrewsbury','MA','01545','778-218-1036','cgaggmw@163.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (628,'Lezemore','Bibbie','22-Jan-1963','806-84-6096','F','030 Artisan Avenue','Sturbridge','MA','01518','600-712-8120','blezemore65@hatena.ne.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (629,'Poupard','Valeda','3-Apr-1978','646-98-6873','F','030 Melody Place','Shrewsbury','MA','01546','226-568-8487','vpoupardpx@twitpic.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (630,'Gerardot','Melanie','17-Oct-1982','401-33-0329','F','030 Ridge Oak Point','Worcester','MA','01606','867-135-6063','mgerardota0@hexun.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (631,'Jope','Lyn','4-Apr-1970','253-71-7729','F','030 Sachs Drive','Shrewsbury','MA','01545','286-667-0705','ljopel2@usda.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (632,'Hargie','Carey','22-Jan-1962','382-91-5803','M','030 Sunfield Way','Auburn','MA','01501','807-901-3327','chargie6m@vinaora.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (633,'Kleinert','Ernesta','14-Jun-1974','522-89-6711','F','0304 Bobwhite Place','Marlborough','MA','01752','745-264-1294','ekleinerthw@salon.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (634,'Hain','Leland','24-Jul-1983','792-88-3722','F','03064 Westerfield Trail','Shrewsbury','MA','01545','326-821-5852','lhain8z@dot.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (636,'Meaden','Dolli','4-Apr-1961','407-84-5772','F','03074 Rutledge Circle','Boston','MA','02108','799-943-8657','dmeadenje@gmpg.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (637,'Blumsom','Gaylord','6-Jan-1972','603-46-6867','M','03076 American Lane','Worcester','MA','01606','853-331-4579','gblumsomhs@unblog.fr','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (638,'Croson','Penn','5-Jun-1984','739-35-2239','M','03088 Pond Hill','Holden','MA','01520','702-349-3463','pcrosonkr@sohu.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (639,'Ollivier','Radcliffe','8-Oct-1971','651-05-1421','M','03089 Sheridan Pass','Worcester','MA','01606','236-371-5149','rollivierm8@unblog.fr','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (640,'Rihosek','Lucho','27-May-1952','206-13-6583','M','03096 Barby Plaza','Worcester','MA','01606','993-940-9344','lrihoseklz@networkadvertising.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (641,'Elven','Morganne','1-Apr-1971','377-81-0052','F','031 Crest Line Center','New Braintree','MA','01531','183-891-1527','melvengm@gizmodo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (643,'Sibson','Ivory','10-Aug-1975','897-53-5379','F','031 Fordem Junction','Northbridge','MA','01534','619-150-8501','isibsonrf@github.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (644,'Lovstrom','Loutitia','7-Aug-1964','497-95-0744','F','031 Hallows Parkway','Fitchburg','MA','01420','363-312-1093','llovstromkv@jimdo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (645,'Ventris','Kris','7-Jan-1979','635-21-1068','F','0312 Chive Circle','Worcester','MA','01606','511-731-3454','kventrisn9@google.ca','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (646,'Coleford','Viviana','15-Aug-1983','880-40-9793','F','03173 Dixon Plaza','Worcester','MA','01606','595-947-8860','vcolefordow@walmart.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (647,'Ungerer','Ingaborg','6-May-1975','156-40-4276','F','032 American Ash Alley','Warren','MA','01083','450-764-8875','iungerer8m@sciencedaily.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (650,'Semerad','Denice','12-Nov-1980','169-14-7532','F','032 Oxford Park','Worcester','MA','01606','779-702-0640','dsemerada7@plala.or.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (651,'Wrinch','Ammamaria','11-Feb-1975','680-55-8073','F','032 Truax Drive','Marlborough','MA','01752','385-773-9392','awrinch2v@cocolog-nifty.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (652,'Domengue','Ettore','2-Jul-1957','582-80-9904','M','03204 Merchant Place','Fitchburg','MA','01420','442-348-4244','edomenguefo@gov.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (653,'Lockhart','Mallory','11-Dec-1978','578-76-8912','F','03234 Redwing Crossing','Leominster','MA','01453','838-404-0560','mlockhartgj@amazon.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (654,'Bowkett','Tildi','27-Jan-1988','523-19-5982','F','033 Delladonna Avenue','Marlborough','MA','01752','169-379-7490','tbowkettaf@ovh.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (655,'Chevis','Chrisse','27-Jan-1973','565-40-4323','M','033 Dennis Pass','Fitchburg','MA','01420','870-969-8840','cchevisn4@dell.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (656,'Glasper','Emerson','5-Mar-1953','771-94-3916','M','033 Roth Road','Fitchburg','MA','01420','860-484-8042','eglasperi2@tripadvisor.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (657,'Blincowe','Merwin','1-Nov-1978','707-75-6431','M','033 Sauthoff Junction','Fitchburg','MA','01420','767-228-8479','mblincowejf@nsw.gov.au','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (658,'Woodland','Codi','23-Apr-1989','783-92-7456','M','03301 Ridgeway Drive','Leicester','MA','01524','352-618-5118','cwoodland5p@friendfeed.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (659,'Longforth','Olympia','15-Mar-1970','427-93-5170','F','03307 Badeau Drive','Marlborough','MA','01752','646-533-4593','olongforthcs@google.com.au','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (660,'Nickell','Lawton','15-Oct-1960','770-36-1556','M','03318 Waywood Trail','Worcester','MA','01606','531-313-8390','lnickellm@tripadvisor.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (661,'Nisot','Lewie','13-Jun-1971','196-31-5640','M','03365 Mosinee Plaza','Worcester','MA','01606','215-109-3363','lnisot6y@sciencedaily.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (662,'Brabban','Cletis','10-Mar-1986','688-29-1435','M','034 Fallview Center','Grafton','MA','01519','628-520-3882','cbrabbanmu@alexa.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (663,'Knevet','Stanislaus','15-May-1972','693-89-8679','M','034 Petterle Circle','Charlton','MA','01507','591-282-5548','sknevetlr@mediafire.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (664,'Jaskowicz','Crissy','11-May-1956','761-53-2536','F','034 Quincy Road','Worcester','MA','01606','600-691-3235','cjaskowicz7i@google.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (665,'Dedenham','Tabatha','2-Oct-1971','169-79-7763','F','03427 Pleasure Junction','Shrewsbury','MA','01546','850-306-4554','tdedenhamhc@eepurl.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (666,'Hutley','Vonnie','8-May-1986','661-42-9979','F','03429 Basil Street','Fitchburg','MA','01420','359-988-0290','vhutleyl9@myspace.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (667,'Kaysor','Nolana','19-Mar-1978','737-26-5691','F','03467 Crest Line Crossing','W. Brookfield','MA','01585','294-523-8729','nkaysor3g@webmd.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (668,'Banasik','Sammy','23-Apr-1950','489-61-9103','M','03481 Maple Wood Parkway','Worcester','MA','01606','905-396-575','sbanasikpa@businesswire.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (670,'Blaase','Karla','25-Nov-1986','205-62-9365','F','0349 Fallview Road','Springfield','MA','01101','808-718-0771','kblaasepm@tinypic.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (671,'Chantree','Claudetta','16-Sep-1978','771-14-5192','F','035 Aberg Court','Lunenburg','MA','01462','279-204-7036','cchantreell@google.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (672,'Bestman','Laurent','24-Feb-1953','413-38-7602','M','035 Ridgeview Parkway','Leicester','MA','01524','398-471-0899','lbestmanni@usgs.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (673,'Puttick','Conroy','8-Sep-1973','257-94-2504','M','035 Westport Way','Worcester','MA','01606','851-743-5422','cputtick4e@nasa.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (674,'Jennaroy','Rockie','4-Nov-1987','820-20-0294','M','0354 Beilfuss Junction','Holden','MA','01520','635-263-7289','rjennaroy1h@rediff.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (676,'de Zamora','Kimmie','27-Feb-1954','362-66-4377','F','0356 Delaware Parkway','Boston','MA','02108','248-851-8632','kdezamora84@redcross.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (677,'Bushill','Dorisa','3-Apr-1978','242-76-5958','F','03569 4th Trail','Worcester','MA','01606','138-111-3324','dbushill46@sciencedirect.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (678,'Crosdill','Sayre','11-Aug-1980','840-61-0229','F','0358 Cottonwood Pass','Marlborough','MA','01752','566-164-7608','scrosdill8h@mayoclinic.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (679,'Nix','Ric','16-Aug-1970','815-32-5385','M','036 Hoepker Place','Fitchburg','MA','01420','536-285-2542','rnix5c@google.com.hk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (680,'Pillington','Bat','18-Aug-1956','116-46-3001','M','036 Hovde Place','Leicester','MA','01524','895-752-7886','bpillington1p@4shared.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (681,'Merry','Emmery','26-Sep-1971','570-19-3074','M','036 Sachtjen Alley','Holden','MA','01520','808-990-3721','emerryfr@paypal.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (682,'Coldbreath','Leelah','4-Jan-1983','567-96-2125','F','03601 Drewry Court','Leicester','MA','01524','464-327-7286','lcoldbreathdo@thetimes.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (683,'Samter','Milo','3-Jan-1976','480-91-5555','M','03630 Dawn Street','Worcester','MA','01606','450-394-9873','msamterm2@hud.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (685,'Larose','Eydie','27-Mar-1971','353-58-4492','F','03659 Quincy Hill','Springfield','MA','01101','851-606-5004','elarose2y@foxnews.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (686,'Blackwood','Nappy','27-May-1989','260-15-1132','M','03662 Merry Way','Lunenburg','MA','01462','947-941-0930','nblackwoodqw@shop-pro.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (687,'Vigar','Iggie','17-Aug-1979','656-92-2539','M','037 Debra Way','Worcester','MA','01606','949-379-8837','ivigarhr@nih.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (688,'Ellissen','Yorke','22-Sep-1967','249-21-0056','M','037 Meadow Ridge Pass','Worcester','MA','01606','729-389-5728','yellissenc4@tripadvisor.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (689,'Maseres','Celeste','4-Jul-1975','687-52-2334','F','037 Sauthoff Plaza','Fitchburg','MA','01420','997-849-4539','cmaseresou@disqus.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (690,'Schott','Florian','27-Jan-1987','229-26-1000','M','037 Westport Terrace','Grafton','MA','01519','331-645-6037','fschottmv@cocolog-nifty.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (691,'Tattam','Vi','14-Mar-1975','677-06-8591','F','0374 Claremont Crossing','Berlin','MA','01503','339-385-5570','vtattam4p@dedecms.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (692,'Puckey','Stephanus','4-May-1951','761-03-9858','M','0377 Kensington Plaza','Shrewsbury','MA','01545','383-604-0755','spuckeyqq@istockphoto.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (693,'Meffen','Borden','16-Oct-1974','847-29-1289','M','038 Eagle Crest Parkway','Worcester','MA','01606','113-528-8800','bmeffen20@dailymotion.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (695,'Snashall','Berry','25-Jul-1978','555-66-4941','F','038 Johnson Park','Barre','MA','01005','319-689-4194','bsnashallkm@furl.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (696,'Ivakin','Philippa','26-May-1958','832-66-5977','F','0380 Lighthouse Bay Point','Leicester','MA','01524','408-433-7671','pivakina2@apache.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (697,'Benadette','Ingamar','14-Apr-1975','757-56-6489','M','03803 Evergreen Terrace','Worcester','MA','01606','229-638-0910','ibenadetteiv@macromedia.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (699,'Gorvin','Maude','27-Oct-1973','644-63-7296','F','0381 Manley Center','Boston','MA','02108','250-790-7276','mgorvinoa@mashable.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (700,'Filoniere','Ruthe','24-Jul-1961','486-11-5264','F','0384 Forest Dale Pass','Worcester','MA','01606','966-513-2101','rfiloniereq1@dot.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (701,'Amberger','Livvyy','11-Oct-1976','888-61-2641','F','03841 Shoshone Terrace','Shrewsbury','MA','01545','964-365-8492','lambergergc@printfriendly.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (702,'Aveyard','Richy','10-Jan-1989','594-71-7564','M','03843 Emmet Park','Leicester','MA','01524','776-780-3242','raveyardg2@pbs.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (703,'Island','Norris','26-Dec-1974','151-07-8528','M','0385 Bartillon Plaza','Athol','MA','01331','943-909-1867','nisland1c@shareasale.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (704,'Pattle','Micky','25-Mar-1953','829-02-5076','M','0387 Beilfuss Hill','Berlin','MA','01503','481-196-0494','mpattlees@gizmodo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (705,'Coughan','Klarika','10-Jul-1972','563-96-7764','F','03870 Dennis Pass','Worcester','MA','01606','715-490-1859','kcoughancn@kickstarter.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (706,'Bellin','Heinrik','24-Oct-1984','248-06-2360','M','03878 Sauthoff Terrace','Charlton','MA','01507','386-747-3208','hbelline1@nature.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (707,'Hollerin','Blisse','20-Jan-1971','275-60-1344','F','03894 8th Way','Auburn','MA','01501','282-985-6738','bhollerin6j@engadget.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (708,'Silcocks','Drud','24-Aug-1961','527-45-1240','M','039 Bartillon Plaza','Worcester','MA','01606','581-758-6903','dsilcocksjc@whitehouse.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (709,'Dishmon','Winnah','18-May-1978','525-07-2170','F','039 Fair Oaks Point','Leominster','MA','01453','574-229-6870','wdishmond7@baidu.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (710,'Dawidowitsch','Zorana','24-Jul-1981','897-15-8353','F','03940 Mandrake Drive','Athol','MA','01331','119-981-9781','zdawidowitschl4@networksolutions.com','','CIES','',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (711,'Lismore','Federica','12-Oct-1971','589-09-4476','F','03967 Claremont Court','Wheelwright','MA','01094','450-463-6908','flismore7s@tmall.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (712,'Howgate','Merry','27-Oct-1964','669-20-2161','M','03967 Mccormick Park','Worcester','MA','01606','687-905-5585','mhowgatenb@apple.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (713,'Dufton','Abbie','16-Apr-1978','545-77-2639','F','04 Basil Crossing','Holden','MA','01520','615-597-6596','adufton97@sbwire.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (714,'Titchmarsh','Isis','16-Sep-1986','363-83-0855','F','04 Corscot Drive','Shrewsbury','MA','01545','617-154-3658','ititchmarshat@dell.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (715,'Roddy','Shaine','19-Feb-1975','245-13-0199','M','04 Cottonwood Lane','Shrewsbury','MA','01545','522-528-9620','sroddybo@house.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (716,'Thuillier','Donnajean','22-Feb-1961','757-09-7276','F','04 Daystar Avenue','Athol','MA','01331','827-986-3406','dthuillierd2@mayoclinic.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (717,'Kindleside','Dennis','18-Jun-1973','205-68-8213','M','04 Elka Plaza','Oxford','MA','01540','333-245-0735','dkindlesidejg@imdb.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (718,'Melior','Dawn','18-Nov-1982','390-80-6350','F','04 Everett Hill','Leominster','MA','01453','347-911-3525','dmeliorpr@feedburner.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (719,'Print','Peyter','14-Dec-1971','194-43-5929','M','04 Farragut Hill','Fort Devins','MA','01420','419-806-0134','pprintc6@live.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (720,'McAllaster','Syman','14-Aug-1956','848-02-3646','M','04 Hollow Ridge Drive','Worcester','MA','01606','527-753-7170','smcallastercc@google.de','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (721,'Viggers','Dene','24-Jan-1977','240-95-9973','M','04 Iowa Place','Worcester','MA','01606','379-347-1027','dviggers4a@blogger.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (722,'McNickle','Val','15-Aug-1984','470-20-6200','M','04 Marcy Junction','N. Brookfield','MA','01535','692-884-6885','vmcnicklen9@usgs.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
   VALUES (723,'Hollingdale','Richy','3-Sep-1972','273-64-3018','M','04 Ohio Crossing','Worcester','MA','01606','562-146-0069','rhollingdalei@yelp.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (724,'Van Daalen','Edmon','5-Feb-1960','377-48-7179','M','04 Oneill Avenue','Worcester','MA','01606','381-964-3352','evandaalen3j@opensource.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (725,'Gouth','Constanta','9-Sep-1979','207-85-3781','F','04 Pepper Wood Place','Sturbridge','MA','01518','336-790-7656','cgouthe1@squarespace.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (726,'Kahan','Ansell','7-Aug-1989','844-93-8615','M','04 Roxbury Place','Worcester','MA','01606','960-449-8609','akahanom@google.it','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (727,'Mussettini','Tarrah','9-May-1974','167-04-3779','F','04 Stoughton Plaza','Worcester','MA','01606','520-209-2578','tmussettinim3@cbsnews.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (728,'Gresty','Rog','15-Mar-1961','690-27-4399','M','04 Straubel Point','Oxford','MA','01540','262-663-6811','rgrestyd2@diigo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (729,'Pipping','Glenna','7-Sep-1970','814-31-5364','F','04 Superior Road','Worcester','MA','01606','541-941-2102','gpipping26@vistaprint.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (730,'Fellowes','Shell','22-Jul-1985','447-73-5384','F','04 Veith Center','W. Brookfield','MA','01585','326-807-4675','sfellowes60@columbia.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (731,'Lealle','Edgard','27-Aug-1970','627-99-3470','M','04 Vernon Trail','West Boylston','MA','01583','329-297-4126','elealleii@360.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (732,'Graveson','Ignazio','24-Jul-1959','585-22-2605','M','04 Waywood Junction','Worcester','MA','01606','917-260-2132','igravesonqq@yolasite.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (733,'Iveans','Adam','23-Jun-1977','141-31-1124','M','040 7th Crossing','Shrewsbury','MA','01546','858-387-1161','aiveansal@over-blog.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (734,'Haug','Mordy','13-Nov-1985','736-21-5878','M','040 Forest Dale Parkway','Worcester','MA','01606','829-874-5230','mhaugmn@last.fm','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (735,'Shurrock','Merrel','17-Feb-1973','759-01-2694','M','0400 Washington Court','Worcester','MA','01606','564-571-1148','mshurrockjr@quantcast.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (736,'Athersmith','Karlan','4-Aug-1966','450-78-3808','M','04007 Lakewood Center','Worcester','MA','01606','764-382-7044','kathersmithr1@freewebs.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (737,'Grimm','Hendrika','22-Sep-1973','240-05-7137','F','04018 Pond Center','Springfield','MA','01101','541-222-7245','hgrimm77@cocolog-nifty.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (738,'Gummie','Orlan','4-Mar-1986','607-84-7615','M','0402 Hanson Drive','Fitchburg','MA','01420','833-484-7341','ogummieoh@netlog.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (739,'Kellock','Mar','15-May-1974','584-08-3862','M','0402 Talmadge Place','Worcester','MA','01606','183-558-9642','mkellockci@berkeley.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (740,'Ninnoli','Bride','13-Jul-1968','142-61-1692','F','04029 Golf Way','Worcester','MA','01606','739-969-3374','bninnoli7s@amazonaws.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (741,'Longmead','Artur','25-Aug-1970','557-49-3180','M','0408 Hansons Alley','Fitchburg','MA','01420','797-181-8888','alongmeaddu@alexa.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (742,'McElory','Kala','21-Jan-1981','709-34-5269','F','04088 Little Fleur Parkway','W. Boylston','MA','01583','956-258-8132','kmcelorym@blogtalkradio.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (743,'Bonnyson','Audie','1-Jun-1973','853-02-8846','F','041 Dwight Pass','Worcester','MA','01606','152-411-1011','abonnysonq0@msu.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (744,'Folbige','Jermaine','24-Mar-1962','466-82-9143','F','0411 Bowman Way','West Boylston','MA','01583','195-798-5014','jfolbigepj@fastcompany.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (745,'Folbige','Jermaine','23-Oct-1985','789-12-6425','F','0411 Bowman Way','West Boylston','MA','01583','344-977-7499','jfolbigepj2@fastcompany.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (746,'Darkott','Yehudit','3-Jan-1989','397-36-0102','M','0412 Buena Vista Street','Boylston','MA','01505','413-772-5981','ydarkotto0@privacy.gov.au','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (747,'Vitall','Susanne','23-Jun-1979','895-57-2421','F','04122 Talmadge Plaza','Berlin','MA','01503','413-785-2195','svitalld9@seattletimes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (748,'Rennick','Therine','28-Jun-1958','333-09-4878','F','04135 Trailsway Drive','Fitchburg','MA','01420','951-686-9642','trennickm5@cornell.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (749,'Astman','Sawyere','10-Mar-1977','261-24-2189','M','0414 Summit Junction','Worcester','MA','01606','512-819-0106','sastmanoi@dailymotion.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (750,'Hurdiss','Abbey','23-Apr-1981','630-23-0184','F','0416 Drewry Park','Oxford','MA','01540','157-973-1965','ahurdissda@fda.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (752,'Cicetti','Kathy','14-Nov-1956','111-50-7286','F','04162 Crest Line Junction','Boston','MA','02108','831-746-4252','kcicettirh@nationalgeographic.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (753,'Laban','Arlinda','17-Apr-1979','342-33-7553','F','04169 Gulseth Center','Hardwick','MA','01037','521-630-2674','alabanly@answers.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (754,'Langham','Lowell','26-Jun-1980','836-84-9347','M','0417 Dorton Terrace','Lunenburg','MA','01462','625-919-6271','llanghamq9@amazonaws.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (755,'Hunnawill','Aleta','2-Oct-1972','646-23-1188','F','0419 Portage Avenue','Spencer','MA','01562','584-907-2594','ahunnawillkg@zimbio.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (756,'Paragreen','Gabe','8-Sep-1951','708-31-7285','M','042 Golf Pass','Worcester','MA','01606','795-200-8264','gparagreen2j@cisco.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (757,'Rusling','Barbaraanne','22-May-1976','191-19-5512','F','042 Ohio Crossing','Leicester','MA','01524','327-733-8656','brusling8y@engadget.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (758,'Todari','Sarette','2-Mar-1988','372-18-1299','F','0421 Division Hill','Worcester','MA','01606','264-733-6282','stodari28@taobao.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (759,'Tithecote','Drusie','4-Jul-1971','650-48-1125','F','04216 Ruskin Junction','Shrewsbury','MA','01545','880-533-6214','dtithecote12@virginia.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (760,'Weepers','Joy','9-Sep-1961','628-38-9037','F','04246 Lakewood Gardens Lane','Worcester','MA','01606','977-175-7591','jweepers1a@360.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (761,'Studd','Micheline','24-Dec-1973','492-68-7196','F','0425 Forest Dale Plaza','Worcester','MA','01606','787-215-6529','mstuddw@mediafire.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (762,'Shelmerdine','Melantha','13-Apr-1980','563-06-7569','F','0428 Stephen Street','Worcester','MA','01606','336-139-9059','mshelmerdinegy@gizmodo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (763,'Kainz','Clare','11-Sep-1976','813-19-2958','M','04298 Buena Vista Park','Leicester','MA','01524','841-415-6146','ckainzo9@linkedin.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (764,'Plitz','Janenna','12-Oct-1968','679-55-7214','F','043 Arkansas Road','Leominster','MA','01453','216-495-2936','jplitzlz@biglobe.ne.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (765,'Coopey','Standford','23-Jul-1974','353-16-4749','M','043 Delaware Terrace','Worcester','MA','01606','457-639-4491','scoopey4u@arstechnica.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (766,'Dalziel','Lois','28-Nov-1981','208-09-6353','F','04302 Butternut Drive','Auburn','MA','01501','150-973-2406','ldalzielnr@devhub.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (767,'Rames','Ferdinanda','23-Dec-1978','279-26-3957','F','04304 Rusk Way','Worcester','MA','01606','591-621-0767','frames2r@wikimedia.org','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (768,'Python','Forster','18-May-1966','474-87-3987','M','0432 Trailsway Junction','Auburn','MA','01501','499-210-0344','fpythonf8@wufoo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (769,'Pudan','Delinda','1-Dec-1973','388-35-7215','F','0436 Eastwood Lane','Blackstone','MA','01504','680-167-2191','dpudanmx@ucla.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (770,'Valti','Joletta','12-Jun-1981','319-08-7514','F','044 Clyde Gallagher Parkway','Blackstone','MA','01504','403-333-5587','jvalti4v@statcounter.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (771,'Hales','Janeta','2-Nov-1977','838-43-0291','F','044 Surrey Junction','Oxford','MA','01540','462-242-5028','jhalesf7@vkontakte.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (772,'Vasile','Hill','12-Jul-1960','742-61-6274','M','0440 Prentice Road','Worcester','MA','01606','701-121-4796','hvasile7j@gizmodo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (773,'Costell','Marybelle','21-Jun-1975','281-91-3261','F','0441 Acker Junction','W. Boylston','MA','01583','994-751-9811','mcostell6y@cbc.ca','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (774,'Dayton','Nevin','27-Nov-1985','611-09-4795','M','04421 Tennyson Lane','Hubbardston','MA','01452','280-343-7446','ndaytonop@google.com.hk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (775,'Bleacher','Delano','17-Apr-1979','635-24-2800','M','04443 Messerschmidt Lane','Fitchburg','MA','01420','415-474-8343','dbleacher4b@irs.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (776,'Manes','Vickie','14-Oct-1963','360-32-1208','F','0446 Sutteridge Pass','Shrewsbury','MA','01545','266-230-2245','vmanesmh@chicagotribune.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (777,'Jewers','Wenona','3-Dec-1974','723-07-7363','F','0451 Sutherland Terrace','Wheelwright','MA','01094','904-605-7233','wjewers6d@biglobe.ne.jp','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (778,'Syme','Fanchon','1-May-1982','355-22-4310','F','04512 Hooker Street','Sturbridge','MA','01518','638-966-0391','fsymel0@usa.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (779,'Jobb','Junette','6-Jan-1978','628-52-4992','F','0453 Mitchell Drive','Fitchburg','MA','01420','883-400-3838','jjobbd4@mail.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (780,'Munnion','Paddie','16-Sep-1960','568-45-7905','M','0454 Lake View Avenue','Holden','MA','01520','673-136-6015','pmunnionil@123-reg.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (781,'Amy','Colin','2-Aug-1972','312-85-7875','M','04544 Ridgeview Road','Leicester','MA','01524','116-430-2365','camyqv@gizmodo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (782,'Platts','Margaretha','12-May-1981','398-42-5232','F','0457 Victoria Place','Barre','MA','01005','231-510-6140','mplattsdi@sbwire.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (783,'McGeaney','Cornela','21-Nov-1978','717-62-9934','F','04587 Donald Junction','Worcester','MA','01606','915-630-6243','cmcgeaney4l@dagondesign.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (784,'Bauman','Penelope','23-May-1960','675-73-4767','F','04594 Hermina Point','Holden','MA','01520','880-149-2728','pbaumani0@google.co.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (785,'Schowenburg','Garwood','26-Feb-1977','650-71-2023','M','046 Hazelcrest Crossing','Shrewsbury','MA','01546','698-233-2818','gschowenburg94@about.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (786,'Gowanson','Claiborn','12-Aug-1984','746-18-7669','M','464 Butternut Parkway','Ware','MA','01082','886-432-6517','cgowansonow@fotki.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (787,'Meatcher','Florie','3-Sep-1972','243-74-4901','F','4668 Longview Hill','New Braintree','MA','01531','227-634-2498','fmeatcher8z@cam.ac.uk','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (788,'Laurence','Levon','28-Jun-1950','280-33-6734','M','467 Claremont Lane','Holden','MA','01520','827-530-7471','llaurenceb2@dailymotion.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (789,'Blondel','Amata','24-May-1977','161-01-4425','F','4674 Vidon Center','Rutland','MA','01543','433-647-1570','ablondela8@technorati.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (790,'Lelliott','Monah','16-Dec-1989','107-47-0817','F','4688 Truax Crossing','Springfield','MA','01101','906-744-6214','mlelliottkw@macromedia.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (791,'Straffon','Chico','15-Aug-1973','629-05-3620','M','4695 Clarendon Hill','Ware','MA','01082','218-614-0747','cstraffoncb@istockphoto.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (792,'Weinham','Meryl','8-Nov-1952','252-80-4706','M','471 Upham Trail','Ware','MA','01082','197-807-1899','mweinhamqj@ebay.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (793,'Huckin','Paige','20-Oct-1971','658-88-0936','M','4735 Kim Crossing','Worcester','MA','01606','689-836-2422','phuckindk@rediff.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (794,'Lafoy','Yale','7-Jan-1984','327-16-5302','M','4777 Sugar Way','Worcester','MA','01606','782-842-3399','ylafoy77@technorati.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (795,'Scrigmour','Lydon','26-Mar-1972','389-93-2770','M','478 Monica Point','Worcester','MA','01606','126-409-5284','lscrigmourc9@hibu.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (796,'Yerson','Gawain','5-Sep-1952','367-03-7179','M','48 Sauthoff Circle','Auburn','MA','01501','400-111-8817','gyersondy@gov.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (797,'Gheraldi','Yorke','8-Aug-1978','454-21-3255','M','480 Sutherland Road','Holden','MA','01520','694-952-6401','ygheraldilm@huffingtonpost.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (798,'Solley','Granville','23-Nov-1980','339-82-6678','M','4810 Barnett Place','Worcester','MA','01606','190-691-6994','gsolley9n@msn.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (799,'Inmett','Deny','22-Nov-1974','632-36-8340','F','4812 Cody Plaza','Worcester','MA','01606','971-818-5862','dinmettpx@marketwatch.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (800,'Inmett','Robert','16-Jun-1968','111-11-8340','M','4812 Cody Plaza','Worcester','MA','01606','161-728-1267','rinmettpx@marketwatch.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (801,'McGinly','Minor','15-Apr-1976','602-21-7730','M','4815 Manufacturers Road','Holden','MA','01520','957-736-8696','mmcginly97@mayoclinic.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (802,'Parker','Pascale','28-Aug-1989','766-46-5797','M','483 Jackson Way','Worcester','MA','01606','209-171-2724','pparker@omniture.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (803,'Gooderick','Betta','1-Aug-1970','780-13-8990','F','4847 Harper Center','Worcester','MA','01606','793-429-2943','bgooderickii@aboutads.info','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (804,'Pabel','Poul','9-Dec-1961','270-90-6573','M','4847 Holy Cross Road','Ware','MA','01082','262-731-7449','ppabelqx@imageshack.us','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (805,'Telling','Bronny','7-Feb-1975','797-67-4087','M','049 Fulton Avenue','Worcester','MA','01606','644-744-0658','btelling6o@mtv.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (806,'Birkwood','Herbie','8-Oct-1988','893-37-2012','M','49 Kensington Drive','Auburn','MA','01501','195-959-3742','hbirkwoodoy@dedecms.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (807,'Shegog','Daile','10-Sep-1971','692-46-2892','F','49 Tony Crossing','Charlton','MA','01507','733-539-9542','dshegog4c@statcounter.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (808,'Arnoud','Raymond','25-Jul-1961','536-27-3619','M','04958 Vahlen Junction','Athol','MA','01331','506-862-5483','rarnoudms@w3.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (809,'Crebbin','Candie','26-Oct-1974','488-93-9702','F','0496 Becker Way','Rutland','MA','01543','130-698-0264','ccrebbinqc@vistaprint.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (810,'Ghidotti','Beale','21-Nov-1985','285-81-1253','M','04983 Lillian Pass','Worcester','MA','01606','905-875-3306','bghidottiao@cyberchimps.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (811,'Ghidotti','Karlen','16-Feb-1987','625-64-6607','F','05 Arkansas Park','Warren','MA','01083','978-314-4897','ktrowelld6@geocities.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (812,'Gardner','Karlen','3-Jun-1969','611-14-6607','F','05 Arkansas Park','Warren','MA','01083','978-314-4897','kGardner3@geocities.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (814,'Sinney','Marie-ann','6-Sep-1988','545-69-7223','F','05 Artisan Parkway','Boston','MA','02108','609-518-3319','msinneyqk@wsj.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (815,'Skerrett','Patience','15-Oct-1970','728-90-2355','F','05 Bluejay Road','Marlborough','MA','01752','830-538-9265','pskerrettkz@chron.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (816,'Huetson','Lisetta','17-Mar-1963','250-42-3472','F','05 Burrows Junction','Fitchburg','MA','01420','489-989-2969','lhuetsoneb@mail.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (817,'Pridham','Ryann','7-Apr-1978','206-17-6200','F','05 Delladonna Alley','West Boylston','MA','01583','752-241-7991','rpridhameq@msu.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (819,'Garrat','Eydie','27-May-1970','173-85-4391','F','05 Fairfield Alley','Worcester','MA','01606','201-481-4224','egarratec@ft.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (820,'Avramovsky','Adolph','27-Nov-1959','570-52-3219','M','05 Hallows Avenue','N. Grafton','MA','01536','332-877-8948','aavramovskymh@discuz.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (821,'Gherardelli','Lorrin','14-Nov-1973','583-56-2401','F','05 Hazelcrest Trail','Barre','MA','01005','492-209-6006','lgherardelli5m@com.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (822,'Sowle','Cullen','19-Aug-1985','255-51-7005','M','05 Hermina Terrace','Holden','MA','01520','432-636-4384','csowleo7@last.fm','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (823,'Raggles','Wylie','20-Feb-1974','585-16-8770','M','05 Hovde Court','Worcester','MA','01606','148-889-2784','wraggles3f@apple.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (824,'Ormston','Jarid','17-Sep-1968','232-62-0964','M','05 Hovde Parkway','Dudley','MA','01571','590-274-7547','jormstonnt@blogs.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (825,'Seeviour','Cindie','9-Mar-1978','688-52-3962','F','05 Jenna Court','Worcester','MA','01606','983-466-2966','cseeviour1p@wikimedia.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (826,'Shotter','Isadora','13-Jan-1987','471-98-8320','F','05 Kropf Drive','Worcester','MA','01606','119-996-8413','ishotterny@wisc.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (827,'Board','Nikolaos','10-Feb-1974','795-64-1954','M','05 Lillian Avenue','Worcester','MA','01606','831-629-6776','nboardo0@xinhuanet.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (828,'Orchard','Andris','18-Oct-1957','373-67-5661','M','05 Lunder Place','West Boylston','MA','01583','347-682-2799','aorchard5w@skype.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (829,'Vanyatin','Alexandros','6-Jan-1972','240-45-6297','M','05 Manitowish Road','Hubbardston','MA','01452','641-576-0464','avanyatin4l@vk.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (830,'Cottisford','Elga','23-Jul-1988','541-12-5051','F','05 Mayer Hill','Worcester','MA','01606','493-393-7080','ecottisfordd2@ucoz.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (831,'Litherland','Boycie','21-Aug-1972','690-53-3896','M','05 Nelson Pass','Auburn','MA','01501','626-234-3872','blitherlandk6@squidoo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (832,'Antrobus','Becka','27-Sep-1965','899-92-8097','F','05 Northland Way','Wheelwright','MA','01094','376-144-5424','bantrobus4q@amazon.co.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (833,'Bates','Cacilia','22-May-1970','424-73-5595','F','05 Northwestern Street','Fitchburg','MA','01420','638-160-7169','cbates3o@wikispaces.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (834,'Otter','Shaylyn','7-Jan-1980','278-48-4780','F','05 Onsgard Point','Framingham','MA','01701','183-790-4348','sotterdc@alexa.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (835,'Kitchaside','Olly','5-Oct-1971','489-11-2763','F','05 Shoshone Alley','Worcester','MA','01606','546-559-9289','okitchasidegx@omniture.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (836,'Camillo','Scotty','21-Mar-1955','267-08-1353','M','05 Talisman Trail','Auburn','MA','01501','715-125-5540','scamilloan@whitehouse.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (838,'Fallawe','Helaina','16-May-1984','339-34-1057','F','05 Valley Edge Road','Boston','MA','02108','456-771-9972','hfallaweck@dropbox.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (839,'Cumberlidge','Ronni','15-Jun-1974','211-84-2789','F','05 Westend Drive','Barre','MA','01005','799-238-135','rcumberlidgeke@youku.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (841,'Salmon','Marti','20-Dec-1977','145-52-6203','F','050 Gerald Terrace','Leicester','MA','01524','988-298-8786','msalmonii@tuttocitta.it','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (842,'Arguile','Shea','16-Oct-1986','100-92-6686','M','050 Havey Trail','Fort Devins','MA','01420','907-114-0991','sarguiler3@freewebs.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (843,'Kenninghan','Correy','19-Sep-1972','830-46-8028','F','0502 Graceland Street','Barre','MA','01005','983-580-7562','ckenninghan1u@ox.ac.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (844,'Pacheco','Sharon','5-Jan-1950','109-96-3241','F','0506 Susan Avenue','Shrewsbury','MA','01545','968-207-1310','spachecodp@wikia.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (845,'Young','Annette','13-Feb-1974','526-88-7044','F','051 Mendota Avenue','Worcester','MA','01606','186-283-5858','ayoung76@paginegialle.it','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (846,'Yelyashev','Nataline','2-Mar-1985','500-94-9845','F','051 Tony Street','Rutland','MA','01543','784-350-7370','nyelyashev7d@google.nl','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (847,'Collard','Dugald','12-Sep-1971','660-22-3111','M','0512 Corben Park','Fitchburg','MA','01420','531-472-3137','dcollardlh@ucoz.ru','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (848,'Pruce','Nicoline','25-Apr-1959','558-91-6990','F','05146 Walton Pass','Shrewsbury','MA','01545','332-651-4885','nprucegb@va.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (849,'Harbard','Kathlin','2-Oct-1976','373-76-6563','F','0516 Summit Parkway','Sturbridge','MA','01518','145-382-4136','kharbard9w@indiatimes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (850,'Renad','Brendis','7-Dec-1987','393-75-1744','M','0519 Northfield Crossing','E. Brookfield','MA','01515','263-589-9509','brenadb0@icq.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (851,'Riste','Tricia','9-Dec-1976','395-78-3279','F','052 Carberry Trail','Worcester','MA','01606','561-766-5323','tristep4@amazon.co.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (852,'Eberts','Rhona','21-Jun-1965','833-32-5580','F','052 Express Place','Fitchburg','MA','01420','613-226-8038','rebertsdb@cbsnews.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (853,'Piatti','Arlinda','21-Mar-1974','481-68-3655','F','052 Forest Run Center','Leicester','MA','01524','558-409-1120','apiattio2@free.fr','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (854,'Tompkins','Cross','4-Dec-1982','334-72-6615','M','052 Grover Avenue','Berlin','MA','01503','105-232-4457','ctompkinsee@amazon.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (855,'Brunet','Wilek','26-Sep-1977','422-54-5663','M','052 Prairie Rose Hill','Auburn','MA','01501','720-515-3214','wbrunetdc@amazon.co.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (856,'Crut','Jermaine','10-Feb-1963','168-44-9815','F','052 Westerfield Alley','Leominster','MA','01453','478-953-2312','jcrutdx@phoca.cz','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (857,'Dimock','Trumann','5-Dec-1971','613-38-4363','M','05230 Onsgard Place','Ware','MA','01082','883-453-0546','tdimockpb@qq.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (858,'Sally','Evangelina','14-Jul-1980','127-47-3789','F','05244 Clove Way','Leominster','MA','01453','994-265-2743','esally6x@chronoengine.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (859,'Stiller','Raimondo','9-Aug-1971','452-73-5122','M','05246 Londonderry Center','Oxford','MA','01540','517-227-3048','rstillerat@tmall.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (860,'Eldridge','Sean','13-Jul-1966','326-99-6194','F','0529 Butterfield Center','Spencer','MA','01562','959-246-0991','seldridgek5@yandex.ru','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (862,'Cosens','Joceline','22-Sep-1988','267-30-0563','F','053 Dexter Avenue','Baldwinville','MA','01436','435-297-5225','jcosens8e@nba.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (863,'Tuddall','Hyacinth','25-Sep-1978','573-64-8812','F','05316 Heath Way','Fitchburg','MA','01420','264-623-6765','htuddallf6@cargocollective.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (864,'Tinston','Anderea','26-Apr-1954','238-99-2193','F','0532 Boyd Drive','Blackstone','MA','01504','958-179-8214','atinstonjv@washington.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (865,'Aldred','Brigida','7-Mar-1970','639-43-0096','F','05322 Delladonna Crossing','W. Brookfield','MA','01585','334-578-7101','baldredp8@ibm.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (866,'Yeowell','Evanne','14-Oct-1984','821-53-2229','F','05338 Londonderry Way','Uxbridge','MA','01569','257-689-8855','eyeowellko@shop-pro.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (868,'Nielson','Becca','8-Dec-1968','389-14-5635','F','0534 Harbort Terrace','Marlborough','MA','01752','634-601-6925','bnielsonml@youtu.be','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (869,'Oty','Lindsy','27-Jun-1979','558-03-1007','F','0535 Bartelt Drive','Fitchburg','MA','01420','258-790-7799','lotym4@vistaprint.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (870,'Clinton','Christabel','20-Jun-1988','120-34-7335','F','0535 Butternut Place','Auburn','MA','01501','671-104-9171','cclinton4w@nytimes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (871,'Knighton','Othilia','8-Feb-1970','893-71-5867','F','05368 Vidon Pass','Worcester','MA','01606','512-918-5145','oknightonki@jimdo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (872,'Skaid','Angele','11-May-1950','338-23-8936','F','0538 Chinook Parkway','Sturbridge','MA','01518','830-823-2923','askaid4o@wordpress.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (873,'Decent','Nonna','27-Jun-1970','661-33-1547','F','05389 Fair Oaks Plaza','Shrewsbury','MA','01546','452-199-8342','ndecentqt@patch.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (874,'Gagin','Natka','24-Mar-1987','773-31-7420','F','054 Oneill Junction','Springfield','MA','01101','199-876-6494','ngaginpn@mysql.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (875,'Sandland','Verena','6-Nov-1974','191-65-4257','F','0540 Dexter Parkway','Rutland','MA','01543','271-568-0366','vsandland1e@bravesites.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (876,'Tofful','Vi','12-Jan-1967','448-92-9943','F','05401 Northfield Street','W. Boylston','MA','01583','884-518-7275','vtoffulb5@cyberchimps.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (877,'Morkham','Loraine','1-Nov-1971','556-34-6553','F','05468 American Parkway','Gardner','MA','01440','427-920-3314','lmorkhama6@wufoo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (878,'Dacres','Adelle','24-Jun-1988','341-67-0219','F','0549 Stephen Parkway','Fitchburg','MA','01420','417-363-0638','adacresdn@discuz.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (879,'Nabarro','Baily','18-Apr-1976','625-12-0962','M','05497 Division Lane','Worcester','MA','01606','819-993-7025','bnunesnabarro8@shareasale.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (880,'Eynon','Blair','23-Jul-1963','428-97-1936','M','055 5th Junction','Worcester','MA','01606','746-488-9988','beynonar@desdev.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (881,'Woodhall','Bartolemo','23-May-1979','679-80-8903','M','055 8th Pass','Auburn','MA','01501','981-739-3251','bwoodhallc1@opera.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (882,'Rolfs','Ancell','7-Jul-1984','649-05-1717','M','055 Holy Cross Way','Oxford','MA','01540','301-288-4352','arolfshh@yahoo.co.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (883,'Newlin','Rayna','25-Jul-1976','103-52-1820','F','05504 Bluejay Road','Leicester','MA','01524','902-199-3133','rnewlingt@about.me','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (884,'Zamorano','Hallie','26-Aug-1950','527-90-9806','F','0552 Gateway Parkway','Charlton','MA','01507','704-198-9237','hzamoranof9@fema.gov','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (885,'McElvogue','Ode','15-Nov-1971','364-08-1426','M','0555 4th Center','Holden','MA','01520','435-532-0722','omcelvogue1y@hp.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (886,'Gyrgorcewicx','Gabriello','24-Jul-1984','707-71-5101','M','05579 Pepper Wood Hill','Worcester','MA','01606','945-364-1266','ggyrgorcewicxh2@geocities.jp','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (887,'MacCafferky','Kevin','9-Jan-1975','477-31-7685','M','056 Russell Avenue','Fitchburg','MA','01420','637-441-8084','kmaccafferky76@discuz.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (888,'Yelden','Tobye','18-Feb-1951','722-03-2372','F','056 Stone Corner Park','Springfield','MA','01101','827-205-4222','tyelden2u@51.la','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (889,'Huyge','Rees','20-Nov-1976','377-85-3193','M','0560 Mesta Court','Ware','MA','01082','812-473-0588','rhuyge9r@google.fr','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (890,'Tonnesen','Lucius','18-Oct-1981','297-22-0195','M','0561 Northridge Drive','N. Brookfield','MA','01535','358-472-9782','ltonneseneq@clickbank.net','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (891,'Bracco','Gene','16-Oct-1972','420-18-2225','F','057 Cody Lane','Southbridge','MA','01550','739-407-8613','gbraccocd@dion.ne.jp','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (892,'Lukock','Barnett','6-May-1963','899-90-6515','M','057 Hooker Plaza','N. Brookfield','MA','01535','616-396-0990','blukock57@macromedia.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (893,'McGlone','Lanni','11-Nov-1977','422-17-1296','F','057 Namekagon Road','Springfield','MA','01101','960-324-7557','lmcglone7n@stumbleupon.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (894,'Farrimond','Archy','16-Dec-1986','562-91-1307','M','0572 Armistice Center','Holden','MA','01520','484-774-6020','afarrimond9i@businesswire.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (895,'Speak','Kalila','12-Sep-1973','700-13-2221','F','0574 Kenwood Trail','Lunenburg','MA','01462','259-846-2805','kspeake6@cnn.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (896,'Goodee','Sidney','16-Jan-1967','126-22-3655','M','05744 Rowland Alley','Holden','MA','01520','367-789-9636','sgoodeenx@nyu.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (897,'Surgood','Jinny','12-Jul-1972','293-86-3836','F','0578 Bunker Hill Crossing','Worcester','MA','01606','603-452-0309','jsurgoodn9@independent.co.uk','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (898,'Hupe','Redd','2-Mar-1981','264-35-4123','M','0579 Hooker Court','Worcester','MA','01606','361-506-5236','rhupenh@earthlink.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (899,'Lindenblatt','Gasparo','22-Jun-1970','541-67-8837','M','0580 Truax Crossing','Westminster','MA','01441','341-725-8619','glindenblatt1b@loc.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (900,'Vankov','Corena','15-Jun-1963','373-48-1617','F','05846 Atwood Crossing','Worcester','MA','01606','942-373-8042','cvankov7h@aol.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (902,'Upham','Gerrie','13-Oct-1984','185-88-2121','F','0586 High Crossing Parkway','Baldwinville','MA','01436','364-156-0641','guphamk1@geocities.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (903,'Westmerland','Sandye','26-Mar-1974','412-12-9291','F','05873 Dovetail Crossing','Worcester','MA','01606','111-920-2865','swestmerland3u@latimes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (904,'Mitchell','Matelda','20-May-1968','519-47-7864','F','059 Fieldstone Trail','Worcester','MA','01606','147-883-7522','mmitchell5t@shinystat.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (905,'Bohills','Kendricks','4-Jan-1976','530-62-2223','M','059 Harper Center','Shrewsbury','MA','01546','791-755-5200','kbohillsp6@ft.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (906,'Costa','Amandy','27-Jul-1986','625-48-0823','F','059 Westend Circle','Barre','MA','01005','926-654-8148','acosta4f@youku.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (907,'Bulfield','Hollie','25-Oct-1974','527-07-5065','F','0592 Anhalt Road','Fitchburg','MA','01420','615-694-5178','hbulfield5m@reverbnation.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (908,'Degan','Brietta','10-Oct-1966','503-81-1824','F','05938 Mitchell Circle','Worcester','MA','01606','227-694-1400','bdegan25@webnode.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (909,'Laingmaid','Heddi','14-Oct-1975','732-62-6563','F','05945 Ridge Oak Hill','Leominster','MA','01453','269-139-5092','hlaingmaidj7@virginia.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (910,'Willetts','Elisabeth','10-Mar-1980','605-65-7342','F','0598 Pine View Pass','Leominster','MA','01453','759-256-3916','ewillettsh7@sourceforge.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (911,'Mouat','Quintina','9-Mar-1978','456-74-7582','F','06 Amoth Pass','Leominster','MA','01453','842-917-1550','qmouat3d@jigsy.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (912,'Gashion','Anatole','12-Dec-1969','746-80-2589','M','06 Bultman Road','Worcester','MA','01606','549-134-1911','agashionb6@berkeley.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (913,'Parkman','Bernie','28-Nov-1972','800-39-6055','F','06 Carpenter Trail','Auburn','MA','01501','397-507-0368','bparkmanil@hostgator.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (914,'Allbrook','Ingrim','20-May-1989','879-78-2870','M','06 Charing Cross Junction','Brookfield','MA','01506','379-584-8320','iallbrookgk@macromedia.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (915,'Wormell','Benedict','13-Apr-1971','713-15-4567','M','06 Colorado Circle','Worcester','MA','01606','870-145-1176','bwormellni@indiatimes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (916,'Whinney','Shayne','4-Nov-1960','242-66-5024','M','06 Crest Line Way','Westminster','MA','01441','367-249-8121','swhinneyif@jimdo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (917,'Danielut','Kaylil','23-Jan-1976','493-35-5878','F','06 Dahle Alley','Fitchburg','MA','01420','123-143-6259','kdanielutnh@microsoft.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (918,'Grundell','Babb','19-Mar-1986','116-03-6436','F','06 Eastwood Hill','Worcester','MA','01606','172-462-4877','bgrundell6n@51.la','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (919,'Sinnott','Drusi','6-Aug-1973','335-67-0530','F','06 Fremont Place','Oxford','MA','01540','190-607-5100','dsinnottpa@adobe.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (920,'Leeds','Zaccaria','15-Aug-1968','340-50-8833','M','06 Gerald Lane','Worcester','MA','01606','871-310-6008','zleedsbd@aol.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (921,'Mathers','Waldo','11-Nov-1979','408-33-8310','M','06 Grayhawk Lane','Worcester','MA','01606','530-934-2831','wmathers8m@sfgate.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (922,'Michael','Willem','7-Dec-1980','505-95-0353','M','06 Grim Crossing','Auburn','MA','01501','419-168-6850','wmichael6o@list-manage.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (923,'Braim','Forrester','24-Aug-1976','291-33-8331','M','06 Harbort Center','Worcester','MA','01606','738-857-7057','fbraimfe@yandex.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (924,'Welland','Linda','15-Oct-1954','573-55-8449','F','06 Huxley Parkway','Worcester','MA','01606','360-471-3434','lwellandfu@shinystat.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (925,'Leyman','Magdalene','15-Jan-1971','293-70-9227','F','06 Larry Way','Worcester','MA','01606','901-305-6078','mleymanic@bluehost.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (926,'Kunat','Amory','28-Feb-1987','756-88-1964','M','06 Lillian Lane','E. Brookfield','MA','01515','653-509-2213','akunat2t@admin.ch','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (927,'Goede','Gustav','17-Apr-1972','852-84-6328','M','06 Nelson Pass','Worcester','MA','01606','588-674-4420','ggoedepe@tiny.cc','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (928,'Podd','Nefen','27-Nov-1959','447-74-6438','M','06 Northfield Avenue','Worcester','MA','01606','457-783-3466','npoddar@latimes.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (929,'Shirt','Betta','20-Mar-1972','831-70-2861','F','06 Ohio Drive','Worcester','MA','01606','739-380-0200','bshirtdo@home.pl','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (930,'St. John','Sanford','9-Jul-1989','414-49-1351','M','06 Pierstorff Court','Worcester','MA','01606','127-504-3131','sstjohnnd@hhs.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (931,'Hall-Gough','Lebbie','20-Apr-1975','758-71-4706','F','06 Redwing Hill','Worcester','MA','01606','886-385-5700','lhallgough35@eepurl.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (932,'Uff','Birgit','2-Apr-1964','851-40-6163','F','06 Roxbury Center','Leominster','MA','01453','287-381-9509','buffln@toplist.cz','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (933,'Fyldes','Tracey','22-Jun-1972','696-71-3257','F','06 Roxbury Court','Shrewsbury','MA','01545','405-918-4036','tfyldesrr@wikimedia.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (934,'McQuillin','Marylin','22-Dec-1988','697-20-8962','F','06 Ruskin Terrace','Auburn','MA','01501','257-110-7758','mmcquillinll@soup.io','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (935,'Lambertazzi','Steven','17-May-1979','604-73-2501','M','06 Shasta Trail','Worcester','MA','01606','895-562-7373','slambertazzim2@addthis.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (936,'Gare','Cindee','6-Jun-1962','767-71-8573','F','06 Starling Hill','Worcester','MA','01606','367-217-9041','cgareh1@typepad.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (937,'Aslet','Benoite','20-Jul-1974','294-01-8049','F','06 Sunbrook Junction','Worcester','MA','01606','259-537-5333','basletq2@nifty.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (938,'Schimek','Lauren','5-Nov-1983','270-11-7114','F','06 Thackeray Crossing','Marlborough','MA','01752','291-680-6974','lschimek1d@themeforest.net','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (939,'Syder','Britta','12-Jun-1970','163-38-0522','F','06 Vermont Avenue','Hardwick','MA','01037','422-815-5121','bsyderhx@jigsy.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (940,'Bucktharp','Caye','18-Dec-1969','597-10-3124','F','06 Westridge Trail','Sturbridge','MA','01518','353-954-9117','cbucktharp3y@yellowpages.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (941,'Bischoff','Sonny','23-Feb-1975','191-20-6637','F','060 Bluejay Center','Marlborough','MA','01752','188-868-7638','sbischoffak@mlb.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (942,'Hobbema','Winni','13-Feb-1987','353-83-1574','F','060 Commercial Hill','Rutland','MA','01543','851-224-1643','whobbemaay@omniture.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (943,'Emmines','Roger','22-Nov-1970','565-29-0662','M','060 Dixon Court','Orange','MA','01378','757-818-7752','remmines6i@cyberchimps.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (944,'Lindley','Sherwynd','25-Jul-1952','282-08-0631','M','060 Lawn Road','Northbridge','MA','01534','827-447-4301','slindleyks@cpanel.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (945,'Maron','Tab','1-Mar-1970','482-79-0510','M','0604 Bellgrove Street','W. Brookfield','MA','01585','143-694-3624','tmaronot@51.la','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (946,'Pales','Gardner','2-Sep-1981','780-83-9014','M','0606 Corben Alley','Holden','MA','01520','679-315-7766','lpalesdy@princeton.edu','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (947,'Feyer','Hatti','19-Feb-1978','717-46-8457','F','0606 Stoughton Terrace','Sturbridge','MA','01518','826-682-6832','hfeyerlo@bravesites.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (948,'Gadd','Loy','26-Aug-1959','431-49-3074','M','0608 Donald Junction','Holden','MA','01520','549-402-1933','lgaddb5@aboutads.info','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (949,'Ticksall','Bibbie','16-Mar-1979','742-17-2490','F','456 Carberry Way','Worcester','MA','01606','715-755-7565','bticksallms@myspace.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (950,'Honacker','Emilee','11-Aug-1982','278-80-5502','F','561 Fuller Circle','Charlton','MA','01507','911-535-1412','ehonacker5a@pcworld.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (951,'Sinclair','Ingra','21-Jan-1973','898-57-0569','M','61 Sage Circle','Holden','MA','01520','746-282-9430','isinclairak@kickstarter.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (952,'Reubel','Elladine','4-Sep-1957','843-40-1818','F','610 Merrick Terrace','Springfield','MA','01101','692-329-4679','ereubel1l@skype.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (953,'Reubel','Elladine','20-Aug-1985','214-60-8181','F','0610 Merrick Terrace','Springfield','MA','01101','692-329-4679','ereubel1l_2@skype.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (954,'Patron','Ronni','19-Apr-1987','724-08-5337','F','0610 Tennyson Alley','Leominster','MA','01453','801-489-0975','rpatronjm@seesaa.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (955,'Frangione','Panchito','24-May-1970','111-95-1806','M','0611 Esch Center','Shrewsbury','MA','01546','909-542-4256','pfrangioneeb@blogspot.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (956,'Barraclough','Florri','27-Mar-1962','296-15-9952','F','06127 Merrick Hill','Leicester','MA','01524','316-725-1639','fbarracloughiz@google.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (957,'Emmer','Aldrich','1-Nov-1977','559-12-8789','M','06141 Buell Pass','Athol','MA','01331','800-199-6982','aemmerfs@networkadvertising.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (958,'Perceval','Hilly','28-Oct-1984','884-68-5901','M','06147 Dawn Pass','Auburn','MA','01501','225-556-4852','hpercevalje@lycos.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (959,'Gatus','Lebbie','18-Dec-1979','478-97-9492','F','0616 Mcbride Terrace','Worcester','MA','01606','363-831-5993','lgatusms@ebay.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (960,'Beazey','Corbet','6-Nov-1965','741-49-1237','M','06163 Prairieview Parkway','Clinton','MA','01510','657-322-4196','cbeazeyfi@earthlink.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (961,'Magister','Celka','18-Feb-1976','510-72-1667','F','06190 Mcbride Lane','Shrewsbury','MA','01545','670-228-0401','cmagisterrq@artisteer.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (962,'Zum Felde','Mellisent','16-Nov-1989','699-15-1519','F','06199 Merchant Parkway','Worcester','MA','01606','220-880-4743','mzumfeldekf@europa.eu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (964,'Figliovanni','Teodor','15-Dec-1956','189-26-7253','M','062 Annamark Court','Boylston','MA','01505','933-560-5229','tfigliovannib3@yale.edu','',DEFAULT,'','CIWP','CIES');
INSERT INTO B_tblStudents
    VALUES (965,'Plinck','Gaylord','25-Sep-1975','299-84-8030','M','062 Fordem Plaza','Worcester','MA','01606','342-116-5477','gplinck6y@tuttocitta.it','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (966,'Burgum','Fionnula','11-Oct-1984','425-51-5917','F','0620 Troy Center','Worcester','MA','01606','885-339-7758','fburgum43@hexun.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (967,'Ruegg','Neel','16-Mar-1978','514-42-5426','M','06226 Dwight Hill','E. Brookfield','MA','01515','757-777-0397','nrueggo5@vistaprint.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (968,'Culleton','Karine','26-Jun-1966','133-10-1756','F','0626 Holy Cross Way','Worcester','MA','01606','437-101-9265','kculleton6l@wikispaces.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (969,'Hammonds','Vikki','4-Nov-1978','280-21-7169','F','06271 Erie Terrace','W. Boylston','MA','01583','670-731-7355','vhammondsrr@economist.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (970,'Dabourne','Binky','25-Jun-1988','224-23-4753','M','06289 Bayside Street','Worcester','MA','01606','119-605-6625','bdabourne6k@sina.com.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (972,'Fearey','Aarika','24-Nov-1963','816-28-8399','F','063 New Castle Trail','Springfield','MA','01101','926-578-1366','afearey89@google.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (973,'Marshfield','Zulema','27-Apr-1973','881-01-0748','F','0639 Northridge Way','Auburn','MA','01501','822-460-0120','zmarshfielddj@behance.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (974,'Schaffel','Emlyn','1-Jan-1984','517-66-5787','F','064 Arkansas Parkway','New Braintree','MA','01531','652-203-2966','eschaffelna@comcast.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (975,'Iacobacci','Cecilia','5-Dec-1987','177-16-7592','F','64 Barnett Street','Uxbridge','MA','01569','852-567-4946','ciacobacciop2@sitemeter.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (976,'Iacobacci','Cecilia','6-Mar-1955','051-60-1955','F','64 Barnett Street','Uxbridge','MA','01569','852-567-4946','ciacobacciop@sitemeter.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (977,'Lys','Thekla','13-Feb-1971','744-10-9500','F','0641 Sundown Point','Oxford','MA','01540','184-482-1204','tlysiw@tripod.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (978,'Lidierth','Virge','18-Aug-1989','736-20-7444','M','06473 Elmside Hill','E. Brookfield','MA','01515','496-600-1757','vlidierth3k@time.com','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (979,'Sim','Kerry','8-Apr-1976','817-46-0660','M','0648 Dexter Hill','N. Grafton','MA','01536','785-775-6792','ksimh8@unicef.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (980,'Drillot','Jinny','26-Jun-1951','210-32-6159','F','065 Hermina Parkway','W. Boylston','MA','01583','196-518-3697','jdrillotma@yolasite.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (981,'Doram','Lara','21-Aug-1957','010-61-2293','F','234 Maywood Junction','Barre','MA','01005','978-555-1208','ldoramni@nhs.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (982,'Doram','Lara','25-Jul-1988','146-61-2293','F','234 Maywood Junction','Barre','MA','01005','978-555-1208','ldoramni2@nhs.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (983,'Seefeldt','Biddy','5-Nov-1979','559-65-1209','F','0656 Declaration Plaza','Worcester','MA','01606','330-246-4927','bseefeldt1e@bing.com','',DEFAULT,'','CIES','DB');
INSERT INTO B_tblStudents
    VALUES (984,'Kuller','Dunn','15-Mar-1964','510-12-8047','M','066 International Street','Dudley','MA','01571','806-876-6204','dkullerig@constantcontact.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (985,'Merwede','Andriette','3-Mar-1971','851-08-9291','F','066 Kipling Junction','W. Boylston','MA','01583','332-148-2221','amerwedel0@ftc.gov','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (986,'Everwin','Linette','7-Dec-1982','202-29-2076','F','0660 Ilene Crossing','Wheelwright','MA','01094','170-427-4604','leverwinby@nyu.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (987,'Gosnell','Nick','8-Jan-1974','245-04-0325','M','06617 Crest Line Circle','Worcester','MA','01606','286-127-0555','ngosnell79@stanford.edu','',DEFAULT,'','CIES','');
INSERT INTO B_tblStudents
    VALUES (988,'Insko','Fax','2-Mar-1951','396-86-9624','M','0662 Gina Drive','N. Brookfield','MA','01535','755-304-9572','finskoae@blogtalkradio.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (989,'Simpkin','Boone','23-Aug-1977','628-61-7058','M','0664 Kennedy Point','Worcester','MA','01606','304-434-8847','bsimpkinqh@acquirethisname.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (990,'Poe','Kennith','9-Nov-1984','194-39-4098','M','06641 Golf View Avenue','Ware','MA','01082','612-955-2113','kpoe3p@vistaprint.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (991,'Camacke','Nannie','20-May-1975','772-85-2215','F','06646 Toban Way','Lunenburg','MA','01462','913-148-8317','ncamackeio@unicef.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (992,'Tharme','Tamara','12-Jan-1959','761-86-8600','F','06649 Cambridge Point','Worcester','MA','01606','478-707-8309','ttharmenq@fotki.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (993,'Soares','Gardy','18-Jan-1970','347-43-9003','M','06649 Eagan Parkway','Boylston','MA','01505','888-782-0706','gsoares6x@ovh.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (994,'Berkelay','Christal','7-Jul-1980','102-22-5470','F','0665 Shasta Pass','Southbridge','MA','01550','958-623-6689','cberkelaygd@yolasite.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (995,'Draycott','Jordon','10-Feb-1978','885-13-3154','M','0665 Tennyson Crossing','Leicester','MA','01524','520-529-4241','jdraycottnh@smh.com.au','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (996,'Norwich','Kane','13-Oct-1964','248-83-4050','M','06652 Portage Point','Dudley','MA','01571','163-586-6480','knorwichp@jugem.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (997,'Collishaw','Deeanne','12-Nov-1979','456-63-6367','F','06685 Rigney Trail','Fitchburg','MA','01420','627-159-0675','dcollishaw16@dailymail.co.uk','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (998,'Shuker','Cole','7-Jan-1986','652-61-8383','M','06701 Cardinal Parkway','Dudley','MA','01571','444-166-1035','cshuker4j@amazon.de','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (999,'Dressel','Terrye','1-Apr-1975','192-65-2080','F','06708 Shasta Street','Leominster','MA','01453','817-871-9119','tdresselka@opera.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1000,'Brotherton','Constanta','1-Jun-1953','581-42-3737','F','0674 Montana Plaza','Worcester','MA','01606','257-575-2462','cbrothertonf9@comcast.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1001,'Aprahamian','Shadow','26-Nov-1975','667-82-0265','M','06742 Ramsey Alley','N. Grafton','MA','01536','349-737-3167','saprahamiane0@tamu.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1002,'Butting','Darline','12-Jun-1980','221-01-1178','F','0676 Sunbrook Way','Worcester','MA','01606','984-500-0773','dbuttingn7@desdev.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1003,'Bresland','Deena','28-Jul-1977','355-13-4558','F','06779 Pearson Alley','Hardwick','MA','01037','869-838-0518','dbreslandj6@yellowpages.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1004,'Trenbay','Leeanne','16-Dec-1950','443-34-4215','F','06791 Redwing Place','Worcester','MA','01606','636-441-6308','ltrenbay6p@sourceforge.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1005,'Mulvey','Ally','26-Jul-1979','416-44-5361','F','06796 Gulseth Place','W. Boylston','MA','01583','785-338-0935','amulveypm@yellowpages.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1006,'Bril','Tansy','24-Jul-1985','150-39-0984','F','068 Calypso Way','Leominster','MA','01453','328-924-1403','tbril13@berkeley.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1007,'Coles','Banky','22-Feb-1970','687-84-4016','M','06842 Namekagon Terrace','Worcester','MA','01606','562-319-9643','bcolesf5@feedburner.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1008,'Wholesworth','Ruby','16-Jan-1963','201-45-3819','M','06858 Chinook Pass','Holden','MA','01520','923-241-7755','rwholesworthhb@hc360.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1009,'Dooly','Karel','19-Jul-1979','832-87-0962','F','0688 Hallows Lane','Sturbridge','MA','01518','741-552-9871','kdooly6b@uiuc.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1010,'Sealeaf','Marchelle','20-Jul-1983','818-89-9201','F','069 Browning Circle','Worcester','MA','01606','438-500-6299','msealeafjx@unblog.fr','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1012,'Millership','Nicolea','20-Oct-1961','473-38-2212','F','069 Charing Cross Center','Springfield','MA','01101','183-595-9633','nmillership6f@irs.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1013,'Linforth','Nester','10-Aug-1973','881-89-4965','M','069 Nelson Lane','Holden','MA','01520','888-805-7484','nlinforthm5@ftc.gov','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1014,'Mantz','Gerik','1-Sep-1988','712-53-0798','M','0692 Vermont Terrace','Auburn','MA','01501','994-792-8720','gmantz70@cocolog-nifty.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1015,'Edmett','Kandace','20-Oct-1974','292-62-9803','F','07 8th Park','Oxford','MA','01540','826-377-2991','kedmett87@sakura.ne.jp','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1016,'Widger','Ralf','23-Mar-1951','841-14-8002','M','07 American Center','Ware','MA','01082','365-965-2717','rwidgercl@ovh.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1017,'Littley','Justin','3-Apr-1973','462-65-7569','M','07 Birchwood Parkway','Grafton','MA','01519','205-152-9435','jlittley47@usnews.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1018,'Woolam','Mitchel','10-Feb-1985','255-84-6444','M','07 Bobwhite Street','Shrewsbury','MA','01545','900-321-2897','mwoolamk3@themeforest.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1019,'Boyda','Robinetta','25-Oct-1975','371-48-4032','F','07 Corry Trail','Leominster','MA','01453','388-732-9024','rboydaog@mail.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1020,'Stanett','Rafael','15-Feb-1967','620-08-5916','M','07 Crest Line Circle','Northbridge','MA','01534','194-155-7393','rstanett5m@wiley.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1021,'Grunnill','Porter','26-Oct-1971','349-09-1976','M','07 Dwight Pass','Grafton','MA','01519','689-328-4363','pgrunnillmd@163.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1022,'Brigman','Flora','24-Nov-1980','750-51-1921','F','07 Eggendart Place','Worcester','MA','01606','109-839-9755','fbrigmano4@is.gd','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1023,'Matisse','Rafael','3-Feb-1976','880-87-2552','M','07 Elka Circle','Athol','MA','01331','411-395-8471','rmatisse9o@indiatimes.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (1024,'Burgett','Natasha','19-Mar-1956','798-69-9539','F','07 Fairfield Center','Worcester','MA','01606','434-759-4423','nburgett5w@state.tx.us','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1025,'Cerman','Morgen','6-Nov-1979','511-34-3133','M','07 Forster Place','Worcester','MA','01606','523-219-3555','mcerman1a@squidoo.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1026,'Castano','Anderea','17-Sep-1982','614-22-9841','F','07 Grim Way','Shrewsbury','MA','01545','553-277-9287','acastano3o@cpanel.net','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1027,'Syder','Worth','15-May-1972','790-87-7865','M','07 Hallows Street','Auburn','MA','01501','788-888-1168','wsyderdz@china.com.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1028,'Kingswell','Karrah','14-Jun-1952','759-81-3200','F','07 Hollow Ridge Trail','Springfield','MA','01101','280-249-5578','kkingswellqz@ucoz.ru','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1030,'Ordemann','Curtis','3-Apr-1980','488-12-1443','M','07 Knutson Avenue','Worcester','MA','01606','129-546-7511','cordemannma@wikia.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1031,'Ceeley','Forester','5-Mar-1972','111-84-9004','M','07 Lyons Way','Grafton','MA','01519','798-997-1123','fceeleye7@networksolutions.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1032,'Mealand','Saunder','16-Jun-1959','844-69-7177','M','07 Main Way','Holden','MA','01520','900-570-6924','smealandjc@nifty.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1033,'Boylin','Regina','13-Apr-1970','616-67-0956','F','07 Mcbride Crossing','West Boylston','MA','01583','339-207-4466','rboylinlc@about.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1035,'Kiely','Sayer','13-Mar-1974','609-24-5408','M','07 Mendota Pass','Orange','MA','01378','921-662-3064','skielyo7@woothemes.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1036,'Caurah','Natalya','12-Nov-1956','163-99-8626','F','07 Montana Court','Worcester','MA','01606','315-468-8521','ncauraho6@e-recht24.de','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1037,'Polycote','Alard','18-May-1975','561-72-5935','M','07 Novick Parkway','Worcester','MA','01606','373-760-7784','apolycoteea@qq.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1038,'Zelner','Opaline','23-Jul-1984','527-59-4438','F','07 Roxbury Drive','Ashburnham','MA','01430','831-900-0046','ozelnerfl@yale.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1039,'Ulster','Bibbie','21-Oct-1974','253-66-2939','F','07 Spaight Plaza','Fitchburg','MA','01420','647-793-3203','bulster6k@oaic.gov.au','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1040,'McIntosh','Dill','28-Nov-1961','477-89-4239','M','07 Springview Street','Fitchburg','MA','01420','564-311-9943','dmcintoshlk@ft.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1041,'Airlie','Meriel','6-Apr-1971','767-16-2477','F','07 Steensland Center','Leicester','MA','01524','953-776-5266','mairliel8@smh.com.au','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1042,'McGarry','Sheryl','19-Jul-1984','344-22-4781','F','07 Stoughton Place','Rutland','MA','01543','275-352-7079','smcgarryhp@soundcloud.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1043,'Glasper','Kipp','15-Nov-1978','277-99-0673','F','07 Sutherland Park','Shrewsbury','MA','01546','813-208-9343','kglasperi@imgur.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1044,'Curgenven','Abbot','25-Jan-1952','368-03-2091','M','07 Union Way','Boylston','MA','01505','732-537-7049','acurgenveniq@biblegateway.com','',DEFAULT,'','CIWP','');
INSERT INTO B_tblStudents
    VALUES (1045,'Willard','Lammond','10-Jul-1977','450-77-5618','M','070 Ruskin Avenue','Northbridge','MA','01534','303-499-0452','lwillardlx@360.cn','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1046,'Knell','Armstrong','17-Oct-1987','279-54-5741','M','07014 Canary Hill','Worcester','MA','01606','601-316-2058','aknell18@princeton.edu','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1047,'Dottrell','Jeanelle','16-May-1973','743-84-9550','F','0702 Merrick Place','Northbridge','MA','01534','939-496-8982','jdottrelljb@mashable.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1048,'Gritland','Dolph','3-Aug-1964','469-45-9016','M','07027 Steensland Point','Worcester','MA','01606','467-769-0121','dgritlandn6@cnbc.com','',DEFAULT,'','CITR','');
INSERT INTO B_tblStudents
    VALUES (1049,'Jakovijevic','Correna','3-Nov-1976','203-96-9822','F','0703 Dunning Alley','Shrewsbury','MA','01545','170-287-3265','cjakovijevicc1@walmart.com','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1050,'Worral','Sile','8-Mar-1984','346-53-7919','F','07033 Darwin Center','Fitchburg','MA','01420','176-124-7232','sworralok@wikimedia.org','',DEFAULT,'',DEFAULT,'');
INSERT INTO B_tblStudents
    VALUES (1051,'Dendle','Devonna','2-Nov-1954','800-61-4930','F','230 2nd Trail','Leominster','MA','01453','784-120-0357','ddendle4k@1688.com','',DEFAULT,'',DEFAULT,'');


INSERT INTO B_tblSchools
    VALUES ('BET','Business, Engineering & Technology',2312);



INSERT INTO B_tblClass_Sections
    VALUES (1,2015,30,'CIS','105','01','WBS','S','207','-M-W-F-','12:00P-12:50');

INSERT INTO B_tblClass_Sections
    VALUES (2,2015,30,'CIS','105','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (3,2015,30,'CIS','111','01','WBS','S','123','-M-W-F-','8:00A-8:50A');

INSERT INTO B_tblClass_Sections
    VALUES (4,2015,30,'CIS','111','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (5,2015,30,'CIS','121','40','WBS','S','207','-M-----','4:00P-6:50P');

INSERT INTO B_tblClass_Sections
    VALUES (6,2015,30,'CIS','134','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (7,2015,30,'ENG','101','01','WBS','S','120','--T-R--','9:30A-10:45A');

INSERT INTO B_tblClass_Sections
    VALUES (8,2015,30,'ENG','101','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (9,2015,30,'MAT','100','01','WBS','S','122','--T-R--','8:00A-8:50A');

INSERT INTO B_tblClass_Sections
    VALUES (10,2015,40,'CIS','111','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (11,2015,50,'ACC','101','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (12,2015,50,'CIS','223','01','WBS','S','207','---W---','1:00P-3:50P');

INSERT INTO B_tblClass_Sections
    VALUES (13,2015,50,'ENG','102','B1','WBS','S','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (14,2015,50,'MAT','122','01','WBS','S','122','--T-R--','9:30A-10:45P');

INSERT INTO B_tblClass_Sections
    VALUES (15,2015,50,'MAT','123','01','WBS','S','122','--T-R--','8:00A-9:15A');

INSERT INTO B_tblClass_Sections
    VALUES (16,2015,50,'CIS','228','01','WBS','S','207','-----F-','1:00P-3:50P');

INSERT INTO B_tblClass_Sections
    VALUES (17,2016,10,'CIS','111','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (18,2016,10,'CIS','141','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (19,2016,30,'CIS','134','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (20,2016,30,'CIS','226','70','WBS','S','207','---W---','7:00P-9:50P');

INSERT INTO B_tblClass_Sections
    VALUES (21,2016,30,'CIS','232','01','WBS','S','207','-M-----','1:00P-3:50P');

INSERT INTO B_tblClass_Sections
    VALUES (22,2016,30,'CPS','298','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (23,2016,30,'MAT','125','01','WBS','S','120','--T-R--','11:00A-12:15');

INSERT INTO B_tblClass_Sections
    VALUES (24,2016,30,'SPH','101','01','WBS','S','120','--T-R--','12:30P-1:45P');

INSERT INTO B_tblClass_Sections
    VALUES (25,2016,40,'CIS','111','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (26,2016,50,'CIS','111','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (27,2016,50,'CIS','241','01','WBS','S','207','---W---','1:00P-3:50P');

INSERT INTO B_tblClass_Sections
    VALUES (28,2016,50,'CIS','299','01','WBS','S','207','-M-W-F-','12:00P-12:50P');

INSERT INTO B_tblClass_Sections
    VALUES (29,2017,10,'CIS','111','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (30,2017,10,'CIS','141','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (31,2017,20,'CIS','111','B2','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (32,2017,20,'CIS','141','B2','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (33,2017,30,'CIS','105','01','WBS','S','207','-M-W-F-','12:00P-12:50');

INSERT INTO B_tblClass_Sections
    VALUES (34,2017,30,'CIS','105','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (35,2017,30,'CIS','111','01','WBS','S','123','-M-W-F-','8:00A-8:50A');

INSERT INTO B_tblClass_Sections
    VALUES (36,2017,30,'CIS','111','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (37,2017,30,'CIS','121','40','WBS','S','207','-M-----','4:00P-6:50P');

INSERT INTO B_tblClass_Sections
    VALUES (38,2017,30,'CIS','134','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (39,2017,30,'ENG','101','01','WBS','S','120','--T-R--','9:30A-10:45A');

INSERT INTO B_tblClass_Sections
    VALUES (40,2017,30,'ENG','101','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (41,2017,30,'MAT','100','01','WBS','S','122','--T-R--','8:00A-8:50A');

INSERT INTO B_tblClass_Sections
    VALUES (42,2017,40,'CIS','111','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (43,2017,50,'ACC','101','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (44,2017,50,'CIS','223','01','WBS','S','207','---W---','1:00P-3:50P');

INSERT INTO B_tblClass_Sections
    VALUES (45,2017,50,'CIS','228','01','WBS','S','207','-----F-','1:00P-3:50P');

INSERT INTO B_tblClass_Sections
    VALUES (46,2017,50,'ENG','102','B1','WBS','S','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (47,2017,50,'MAT','122','01','WBS','S','122','--T-R--','9:30A-10:45P');

INSERT INTO B_tblClass_Sections
    VALUES (48,2017,50,'MAT','123','01','WBS','S','122','--T-R--','8:00A-9:15A');

INSERT INTO B_tblClass_Sections
    VALUES (49,2018,10,'CIS','111','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (50,2018,10,'CIS','141','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (51,2018,30,'CIS','134','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (52,2018,30,'CIS','226','70','WBS','S','207','---W---','7:00P-9:50P');

INSERT INTO B_tblClass_Sections
    VALUES (53,2018,30,'CIS','232','01','WBS','S','207','-M-----','1:00P-3:50P');

INSERT INTO B_tblClass_Sections
    VALUES (54,2018,30,'CPS','298','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (55,2018,30,'MAT','125','01','WBS','S','120','--T-R--','11:00A-12:15');

INSERT INTO B_tblClass_Sections
    VALUES (56,2018,30,'SPH','101','01','WBS','S','120','--T-R--','12:30P-1:45P');

INSERT INTO B_tblClass_Sections
    VALUES (57,2018,40,'CIS','111','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (58,2018,50,'CIS','111','B1','WBS','','ONLINE','','');

INSERT INTO B_tblClass_Sections
    VALUES (59,2018,50,'CIS','223','01','WBS','S','207','---W---','1:00P-3:50P');

INSERT INTO B_tblClass_Sections
    VALUES (60,2018,50,'CIS','228','40','WBS','S','207','-M-----','4:00P-6:50P');

INSERT INTO B_tblClass_Sections
    VALUES (61,2018,50,'CIS','232','40','WBS','S','207','---W---','4:00P-6:50P');

INSERT INTO B_tblClass_Sections
    VALUES (62,2018,50,'CIS','241','01','WBS','S','207','---W---','1:00P-3:50P');

INSERT INTO B_tblClass_Sections
    VALUES (63,2018,50,'CIS','244','01','WBS','S','207','-M-----','1:00P-3:50P');

INSERT INTO B_tblClass_Sections
    VALUES (64,2018,50,'CIS','247','40','WBS','S','207','--T----','4:00P-6:50P');

INSERT INTO B_tblClass_Sections
    VALUES (65,2018,50,'CIS','299','01','WBS','S','207','-M-W-F-','12:00P-12:50P');


INSERT INTO B_tblEnrollments
    VALUES (1,57,1,'B+','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (2,57,3,'B','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (3,57,5,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (4,57,19,'B','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (5,57,18,'C','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (6,57,12,'C+','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (7,57,20,'NR','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (8,57,21,'A-','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (9,57,15,'C','C-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (10,81,1,'NR','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (11,81,3,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (12,81,6,'A-','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (13,81,7,'B+','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (14,81,13,'A-','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (15,106,4,'C','C','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (16,106,19,'D+','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (17,106,18,'F','C-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (18,106,16,'B','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (19,106,9,'A','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (20,110,10,'D','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (21,110,15,'B+','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (22,113,1,'NR','C','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (23,113,17,'D','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (24,113,7,'F','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (25,106,11,'B','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (26,144,11,'B','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (27,144,10,'B','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (28,144,19,'B+','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (29,144,18,'A','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (30,144,16,'A-','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (31,148,11,'C','C','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (32,148,1,'B','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (33,148,4,'A','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (34,148,5,'A-','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (35,148,12,'B+','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (36,148,20,'B','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (37,148,16,'A-','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (38,148,21,'B','C-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (39,148,15,'B-','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (40,154,7,'A-','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (41,154,13,'B','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (42,154,9,'C','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (43,174,2,'NR','IR','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (44,174,3,'C','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (45,174,8,'B','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (46,174,9,'C','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (47,175,17,'A-','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (48,214,2,'B','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (49,214,17,'B','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (50,214,19,'C','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (51,214,8,'B','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (52,214,13,'B','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (53,214,9,'C+','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (54,214,14,'B','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (55,238,11,'C','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (56,238,3,'D','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (57,238,5,'D+','C','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (58,238,12,'B-','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (59,238,20,'B','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (60,238,21,'NR','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (61,238,7,'D-','C-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (62,285,10,'C+','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (63,333,4,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (64,333,6,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (65,333,18,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (66,333,15,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (67,398,7,'B','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (68,398,13,'B','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (69,398,9,'A','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (70,469,14,'D','D','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (71,469,12,'D+','C','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (72,540,11,'B','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (73,540,4,'B-','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (74,540,6,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (75,608,17,'A','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (76,608,18,'A-','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (77,608,8,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (78,1023,17,'B-','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (79,1023,8,'B','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (80,1023,13,'A-','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (81,1023,14,'A-','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (82,1048,17,'B','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (83,1048,9,'C','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (84,4,1,'C+','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (85,4,4,'A-','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (86,4,16,'C+','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (87,52,11,'C+','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (88,52,10,'C','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (89,52,7,'C+','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (90,200,2,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (91,200,3,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (92,200,5,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (93,200,19,'NR','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (94,200,18,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (95,200,12,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (96,200,16,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (97,200,21,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (98,200,20,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (99,200,14,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (100,288,10,'A-','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (101,337,3,'B','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (102,337,6,'B+','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (103,337,7,'B-','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (104,337,13,'A-','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (105,337,9,'B','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (106,337,14,'B-','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (107,382,2,'C','D+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (108,382,4,'D-','C-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (109,382,5,'B','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (110,382,19,'C','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (111,382,18,'C+','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (112,382,12,'B','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (113,382,20,'B-','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (114,382,21,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (115,482,2,'B','C','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (116,482,3,'B','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (117,482,6,'NR','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (118,572,11,'B','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (119,572,8,'B+','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (120,572,14,'B+','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (121,619,1,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (122,619,4,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (123,619,5,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (124,619,6,'NR','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (125,619,18,'A-','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (126,619,16,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (127,619,20,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (128,711,7,'B','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (129,711,14,'B','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (130,723,1,'C','B','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (131,723,8,'B','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (132,723,13,'B+','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (133,723,15,'C-','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (134,738,3,'B','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (135,738,5,'A','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (136,738,19,'A-','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (137,738,12,'B','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (138,738,16,'C-','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (139,738,20,'B','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (140,738,9,'B+','A-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (141,767,8,'NR','B+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (142,767,14,'B','B-','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (143,803,10,'C','D+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (144,803,19,'C-','C+','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (145,803,8,'A','A','GRADED','');

INSERT INTO B_tblEnrollments
    VALUES (146,803,14,'C-','B+','GRADED','');

INSERT INTO B_tblClass_Assignments
    VALUES (1,1,2315);

INSERT INTO B_tblClass_Assignments
    VALUES (2,2,2325);

INSERT INTO B_tblClass_Assignments
    VALUES (3,3,2312);

INSERT INTO B_tblClass_Assignments
    VALUES (4,4,2305);

INSERT INTO B_tblClass_Assignments
    VALUES (5,5,2315);

INSERT INTO B_tblClass_Assignments
    VALUES (6,6,2315);

INSERT INTO B_tblClass_Assignments
    VALUES (7,7,2308);

INSERT INTO B_tblClass_Assignments
    VALUES (8,8,2348);

INSERT INTO B_tblClass_Assignments
    VALUES (9,10,2315);

INSERT INTO B_tblClass_Assignments
    VALUES (10,11,2331);

INSERT INTO B_tblClass_Assignments
    VALUES (11,12,2305);

INSERT INTO B_tblClass_Assignments
    VALUES (12,13,2348);

INSERT INTO B_tblClass_Assignments
    VALUES (13,9,2331);

INSERT INTO B_tblClass_Assignments
    VALUES (14,14,2321);

INSERT INTO B_tblClass_Assignments
    VALUES (15,15,2321);

INSERT INTO B_tblClass_Assignments
    VALUES (16,16,2305);

INSERT INTO B_tblClass_Assignments
    VALUES (17,17,2305);

INSERT INTO B_tblClass_Assignments
    VALUES (18,18,2305);

INSERT INTO B_tblClass_Assignments
    VALUES (19,19,2315);

INSERT INTO B_tblClass_Assignments
    VALUES (20,20,2312);

INSERT INTO B_tblClass_Assignments
    VALUES (21,21,2305);

INSERT INTO B_tblClass_Assignments
    VALUES (22,22,2346);

INSERT INTO B_tblClass_Assignments
    VALUES (23,23,2321);

INSERT INTO B_tblClass_Assignments
    VALUES (24,24,2338);

INSERT INTO B_tblClass_Assignments
    VALUES (25,25,2341);

INSERT INTO B_tblClass_Assignments
    VALUES (26,26,2341);

INSERT INTO B_tblClass_Assignments
    VALUES (27,27,2305);

INSERT INTO B_tblClass_Assignments
    VALUES (28,28,2315);

INSERT INTO B_tblClass_Assignments
    VALUES (29,29,2325);

INSERT INTO B_tblClass_Assignments
    VALUES (30,30,2305);

INSERT INTO B_tblClass_Assignments
    VALUES (31,31,2341);

INSERT INTO B_tblClass_Assignments
    VALUES (32,32,2305);

INSERT INTO B_tblClass_Assignments
    VALUES (33,33,2315);

INSERT INTO B_tblClass_Assignments
    VALUES (34,34,2315);

INSERT INTO B_tblClass_Assignments
    VALUES (35,35,2341);

INSERT INTO B_tblClass_Assignments
    VALUES (36,36,2341);

INSERT INTO B_tblClass_Assignments
    VALUES (37,37,2305);

INSERT INTO B_tblClass_Assignments
    VALUES (38,38,2315);

INSERT INTO B_tblClass_Assignments
    VALUES (39,39,2308);

INSERT INTO B_tblClass_Assignments
    VALUES (40,40,2338);

INSERT INTO B_tblClass_Assignments
    VALUES (41,41,2331);

INSERT INTO B_tblClass_Assignments
    VALUES (42,42,2341);

INSERT INTO B_tblClass_Assignments
    VALUES (43,43,2331);

INSERT INTO B_tblClass_Assignments
    VALUES (44,44,2305);

INSERT INTO B_tblClass_Assignments
    VALUES (45,45,2305);

INSERT INTO B_tblClass_Assignments
    VALUES (46,46,2308);

INSERT INTO B_tblClass_Assignments
    VALUES (47,47,2321);

INSERT INTO B_tblClass_Assignments
    VALUES (48,48,2331);

ALTER TABLE B_tblDepartments
    DROP CONSTRAINT DEPARTMENT_SCHOOLID_FK;

ALTER TABLE B_tblDepartments
    DROP CONSTRAINT DEPARTMENT_DEPT_CHAIRID_FK;

ALTER TABLE B_tblArea_Of_Studys
    DROP CONSTRAINT MAJORS_DEPTID_FK;

ALTER TABLE B_tblStudents
    DROP CONSTRAINT STUDENTS_STATECODE_FK;

ALTER TABLE B_tblStudents
    DROP CONSTRAINT STUDENTS_AAOS_1_FK;

ALTER TABLE B_tblStudents
    DROP CONSTRAINT STUDENTS_AAOS_2_FK;

ALTER TABLE B_tblEmployees
    DROP CONSTRAINT EMPLOYEES_STATECODE_FK;

ALTER TABLE B_tblEmployees
    DROP CONSTRAINT EMPLOY_A_PRIMARY_DEPTID_FK;

ALTER TABLE B_tblCourses
    DROP CONSTRAINT COURSES_DEPTID_FK;

ALTER TABLE B_tblClass_Assignments
    DROP CONSTRAINT CASSIGNMENTS_CSECT_FK;

ALTER TABLE B_tblClass_Assignments
    DROP CONSTRAINT CASSIGNMENTS_INSTRUCTORID_FK;

ALTER TABLE B_tblClass_Sections
    DROP CONSTRAINT CLASSSECT_SEMESTERCODE_FK;

ALTER TABLE B_tblEnrollments
    DROP CONSTRAINT ENROLLMENTS_CLASSSECTID;

ALTER TABLE B_tblDepartments
    ADD CONSTRAINT DEPARTMENT_SCHOOLID_FK  FOREIGN KEY (SCHOOLID)
            REFERENCES B_tblSchools (SCHOOLID);

ALTER TABLE B_tblDepartments
    ADD CONSTRAINT DEPARTMENT_DEPT_CHAIRID_FK  FOREIGN KEY (DEPT_CHAIRID)
            REFERENCES B_tblEmployees (EMPLOYEEID);

ALTER TABLE B_tblArea_Of_Studys
    ADD    CONSTRAINT MAJORS_DEPTID_FK  FOREIGN KEY (DEPTID)
               REFERENCES B_tblDepartments (DEPTID);

ALTER TABLE B_tblStudents
    ADD    CONSTRAINT STUDENTS_STATECODE_FK  FOREIGN KEY (STATE_CODE)
               REFERENCES B_tblStates (STATE_CODE);

ALTER TABLE B_tblStudents
    ADD    CONSTRAINT STUDENTS_AAOS_1_FK  FOREIGN KEY (ACT_AOS_ID1)
               REFERENCES B_tblArea_Of_Studys (AOSID);

ALTER TABLE B_tblStudents
    ADD    CONSTRAINT STUDENTS_AAOS_2_FK  FOREIGN KEY (ACT_AOS_ID2)
               REFERENCES B_tblArea_Of_Studys (AOSID);

ALTER TABLE B_tblEmployees
    ADD    CONSTRAINT EMPLOYEES_STATECODE_FK  FOREIGN KEY (STATE_CODE)
               REFERENCES B_tblStates (STATE_CODE);

ALTER TABLE B_tblEmployees
    ADD    CONSTRAINT EMPLOY_B_PRIMARY_DEPTID_FK  FOREIGN KEY (A_PRIMARY_ADEPTID)
               REFERENCES B_tblDepartments (DEPTID);

ALTER TABLE B_tblCourses
    ADD        CONSTRAINT COURSES_DEPTID_FK  FOREIGN KEY (DEPTID)
               REFERENCES B_tblDepartments (DEPTID); 
 
ALTER TABLE B_tblClass_Assignments
    ADD   CONSTRAINT CASSIGNMENTS_CSECT_FK  FOREIGN KEY (CLASS_SECTID)
               REFERENCES B_tblClass_Sections (CLASS_SECTID);

ALTER TABLE B_tblClass_Assignments
    ADD        CONSTRAINT CASSIGNMENTS_INSTRUCTORID_FK  FOREIGN KEY (INSTRUCTORID)
               REFERENCES B_tblEmployees (EMPLOYEEID);

ALTER TABLE B_tblClass_Sections
    ADD        CONSTRAINT CLASSSECT_SEMESTERCODE_FK FOREIGN KEY (DEPTID)
               REFERENCES B_tblDepartments (DEPTID);

ALTER TABLE B_tblEnrollments
    ADD        CONSTRAINT ENROLLMENTS_CLASSSECTID FOREIGN KEY (CLASS_SECTID)
               REFERENCES B_tblClass_Sections (CLASS_SECTID);
INSERT INTO b_tblsemestercodes (semester_code, semester_title)
    VALUES ('10', 'Summer I');
INSERT INTO b_tblsemestercodes (semester_code, semester_title)
    VALUES ('20', 'Summer II');
INSERT INTO b_tblsemestercodes (semester_code, semester_title)
    VALUES ('30', 'FALL');
INSERT INTO b_tblsemestercodes (semester_code, semester_title)
    VALUES ('40', 'Intersession');
INSERT INTO b_tblsemestercodes (semester_code, semester_title)
    VALUES ('50', 'Spring');   
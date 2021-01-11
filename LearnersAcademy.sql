-- Dump  database
DROP DATABASE learners_academy;


-- Create database
CREATE DATABASE learners_academy

-- Drop tables
DROP TABLE IF EXISTS public.users cascade;
DROP TABLE IF EXISTS public.classes cascade;
DROP TABLE IF EXISTS public.students cascade;
DROP TABLE IF EXISTS public.teachers cascade;
DROP TABLE IF EXISTS public.subjects cascade;
DROP TABLE IF EXISTS public.class_subjects_teachers cascade;


-- Create table users
CREATE TABLE public.users
(
    user_id SERIAL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(50) NOT NULL,
	role VARCHAR(20) NOT NULL,
    CONSTRAINT user_pkey PRIMARY KEY (user_id)
);


-- Create table classes
CREATE TABLE public.classes
(
    class_id SERIAL,
    class_name VARCHAR(50) NOT NULL,
    seats integer DEFAULT 50,
    CONSTRAINT class_pkey PRIMARY KEY (class_id)
);

-- Create table students
CREATE TABLE public.students
(
    student_id SERIAL,
    name VARCHAR(100) NOT NULL,
    age integer DEFAULT 0,
    gender VARCHAR(10),
    email_id VARCHAR(100),
    class_id integer NOT NULL,
    CONSTRAINT student_pkey PRIMARY KEY (student_id),
    CONSTRAINT fk_class FOREIGN KEY (class_id)
        REFERENCES public.classes (class_id) 
			ON UPDATE CASCADE 
			ON DELETE CASCADE
);


-- Create table teachers
CREATE TABLE public.teachers
(
    teacher_id SERIAL,
    name VARCHAR(100) NOT NULL,
    age integer DEFAULT 0,
    gender VARCHAR(10),
    email_id VARCHAR(100),
    CONSTRAINT teacher_pkey PRIMARY KEY (teacher_id)
);


-- Create table subjects
CREATE TABLE public.subjects
(
    subject_id SERIAL,
    name VARCHAR(200)NOT NULL,
    CONSTRAINT subject_pkey PRIMARY KEY (subject_id)
);


-- Create table class_subjects_teachers
CREATE TABLE public.class_subjects_teachers
(
    class_id integer NOT NULL CONSTRAINT class_ref_subject_teacher REFERENCES public.classes ON UPDATE CASCADE ON DELETE CASCADE,
    subject_id integer NOT NULL CONSTRAINT subject_ref_class_teacher REFERENCES public.subjects ON UPDATE CASCADE ON DELETE CASCADE,
    teacher_id integer NOT NULL CONSTRAINT teacher_ref_class_subject REFERENCES public.teachers ON UPDATE CASCADE ON DELETE CASCADE,
    /*CONSTRAINT class_subjects_pkey PRIMARY KEY (class_id, subject_id),*/
    FOREIGN KEY (class_id)
        REFERENCES public.classes (class_id),
    FOREIGN KEY (subject_id)
        REFERENCES public.subjects (subject_id),
    FOREIGN KEY (teacher_id)
        REFERENCES public.teachers (teacher_id)
);


-- DATA

-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--
INSERT INTO public.users (user_id, name, email, password, role) VALUES (1, 'admin', 'riyaz.j@admin.com', 'admin', 'ADMIN');



-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: postgres
--
insert into public.classes (class_name, seats) values ('Class 1', 100);
insert into public.classes (class_name, seats) values ('Class 2', 100);
insert into public.classes (class_name, seats) values ('Class 3', 100);
insert into public.classes (class_name, seats) values ('Class 4', 100);
insert into public.classes (class_name, seats) values ('Class 5', 100);
insert into public.classes (class_name, seats) values ('Class 6', 100);
insert into public.classes (class_name, seats) values ('Class 7', 100);
insert into public.classes (class_name, seats) values ('Class 8', 100);
insert into public.classes (class_name, seats) values ('Class 9', 100);
insert into public.classes (class_name, seats) values ('Class 10', 100);



-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (430, 'Abby', 6, 'Female', 'abifield4a@cornell.edu', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (435, 'Kimball', 6, 'Male', 'kelkington4f@indiatimes.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (438, 'Emmett', 6, 'Male', 'ecrowd4i@weibo.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (4, 'Millicent', 9, 'Female', 'mdarby3@columbia.edu', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (11, 'Nickie', 9, 'Male', 'nbracea@ftc.gov', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (15, 'Camey', 9, 'Male', 'cparfitte@squidoo.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (40, 'Charmain', 9, 'Female', 'cgulleforde@altervista.org', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (5, 'Terrence', 11, 'Male', 'tparks4@pbs.org', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (10, 'Kit', 11, 'Male', 'ktiley9@aol.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (14, 'Davidde', 11, 'Male', 'djerdeind@cbsnews.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (25, 'Junie', 11, 'Female', 'jhealingo@va.gov', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (26, 'Winonah', 11, 'Female', 'wcorse0@virginia.edu', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (38, 'Ferris', 11, 'Male', 'fhurkettc@google.ca', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (45, 'Yule', 11, 'Male', 'ykeyj@hud.gov', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (52, 'Kelwin', 11, 'Male', 'kkirkhouse1@cafepress.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (70, 'Jamil', 11, 'Male', 'jvakhrushinj@tripadvisor.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (97, 'Collete', 11, 'Female', 'ccratl@cbsnews.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (100, 'Amata', 11, 'Female', 'abrydeo@army.mil', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (7, 'Raimundo', 7, 'Male', 'rspringthorp6@qq.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (9, 'Doll', 7, 'Female', 'dfeehan8@nytimes.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (3, 'Mitzi', 12, 'Female', 'mglowinski2@cpanel.net', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (18, 'Baillie', 12, 'Male', 'bmedlandh@slashdot.org', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (16, 'Ricard', 7, 'Male', 'rbraunsteinf@networksolutions.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (27, 'Rosy', 12, 'Female', 'rcasado1@java.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (21, 'Jenelle', 7, 'Female', 'jlimbournek@msn.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (35, 'Andrew', 7, 'Male', 'ariseborough9@usgs.gov', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (63, 'Zachary', 7, 'Male', 'zkenwrickc@smh.com.au', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (66, 'Ariana', 7, 'Female', 'abauldryf@princeton.edu', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (68, 'Nataniel', 9, 'Male', 'nmenaryh@engadget.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (75, 'Dore', 9, 'Male', 'dhoodlesso@qq.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (81, 'Foss', 7, 'Male', 'fglyde5@goodreads.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (95, 'Otis', 9, 'Male', 'ooggerj@nymag.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (98, 'Malory', 9, 'Female', 'msothcottm@netvibes.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (102, 'Launce', 9, 'Male', 'lslaffordq@oakley.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (8, 'Gerladina', 10, 'Female', 'glukash7@sbwire.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (29, 'Con', 10, 'Male', 'cbanishevitz3@nature.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (53, 'Noby', 10, 'Male', 'nogrowgane2@gmpg.org', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (64, 'Mauricio', 10, 'Male', 'mmohamedd@kickstarter.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (93, 'Laureen', 7, 'Female', 'lrudyardh@hatena.ne.jp', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (34, 'Frederick', 8, 'Male', 'fshippam8@trellian.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (447, 'Yevette', 6, 'Female', 'ysuller4r@123-reg.co.uk', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (454, 'Tobi', 6, 'Female', 'tdolbey4y@blinklist.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (459, 'Frannie', 6, 'Female', 'fgrollmann53@ebay.co.uk', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (468, 'Terza', 6, 'Female', 'ttanby5c@is.gd', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (39, 'Melony', 8, 'Female', 'mgeevesd@macromedia.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (48, 'Minetta', 8, 'Female', 'mtayem@dell.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (51, 'Sig', 8, 'Male', 'srapaport0@bbc.co.uk', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (91, 'Nealson', 10, 'Male', 'nmaryonf@wordpress.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (33, 'Tammy', 12, 'Male', 'tvenmore7@scribd.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (41, 'Lonni', 12, 'Female', 'lbarentsf@arstechnica.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (50, 'Tasia', 12, 'Female', 'tdjokovico@domainmarket.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (55, 'Kendell', 12, 'Male', 'ksparling4@prweb.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (57, 'Basilius', 12, 'Male', 'bborsnall6@mtv.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (65, 'Brew', 12, 'Male', 'bpettegree@furl.net', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (2, 'Denney', 13, 'Male', 'dlatan1@instagram.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (12, 'Garrott', 13, 'Male', 'gbeatsonb@gmpg.org', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (24, 'Rodrick', 13, 'Male', 'rweedenburgn@jimdo.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (30, 'Brendan', 13, 'Male', 'bnorree4@addtoany.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (44, 'Guillermo', 13, 'Male', 'gsturgei@samsung.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (59, 'Minta', 13, 'Female', 'mstandage8@yahoo.co.jp', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (60, 'Deloria', 13, 'Female', 'dsibthorpe9@facebook.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (62, 'Ulick', 13, 'Male', 'ujoveyb@examiner.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (83, 'Heinrik', 13, 'Male', 'hkirman7@desdev.cn', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (90, 'Elsbeth', 13, 'Female', 'emarsaye@economist.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (19, 'Maxy', 14, 'Male', 'mwolfendalei@tamu.edu', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (20, 'Jaime', 14, 'Male', 'jcalteraj@pcworld.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (43, 'Gusella', 14, 'Female', 'gbrunh@arstechnica.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (54, 'Cecil', 14, 'Female', 'crisom3@tiny.cc', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (67, 'Nert', 14, 'Female', 'nkettlestringg@ucoz.ru', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (69, 'Denni', 14, 'Female', 'dduggaryi@addthis.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (80, 'Irma', 14, 'Female', 'icrowd4@weather.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (17, 'Igor', 15, 'Male', 'ifuzzensg@biblegateway.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (23, 'Mia', 15, 'Female', 'morchartm@altervista.org', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (42, 'Malinde', 15, 'Female', 'mjuhrukeg@arizona.edu', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (46, 'Glynnis', 15, 'Female', 'gshovelk@usatoday.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (86, 'Garrard', 15, 'Male', 'gjoannidia@usatoday.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (87, 'Claus', 15, 'Male', 'cdoolyb@blogtalkradio.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (99, 'Gypsy', 15, 'Female', 'gwillshawn@w3.org', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (1, 'Riyaz', 15, 'Male', 'j.riyazu@outlook.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (121, 'Amberly', 7, 'Female', 'areside19@free.fr', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (124, 'Merry', 7, 'Female', 'mmerwood1c@soundcloud.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (516, 'Adolphe', 6, 'Male', 'ahaggerston14@creativecommons.org', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (152, 'Maxi', 7, 'Female', 'mmugg24@shareasale.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (166, 'Kiel', 7, 'Male', 'karmitage2i@cyberchimps.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (169, 'Rodge', 7, 'Male', 'rettles2l@china.com.cn', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (171, 'Dana', 7, 'Female', 'dheinel2n@unicef.org', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (178, 'Jayson', 7, 'Male', 'jmorlon2u@upenn.edu', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (108, 'Velvet', 10, 'Female', 'vravenshaww@whitehouse.gov', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (119, 'Leesa', 10, 'Female', 'losan17@nymag.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (122, 'Lori', 10, 'Female', 'ltackes1a@timesonline.co.uk', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (126, 'Lib', 10, 'Female', 'lfeuell1e@nifty.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (138, 'Kayne', 10, 'Male', 'kpeniman1q@cloudflare.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (174, 'Talbert', 10, 'Male', 'tatkirk2q@upenn.edu', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (196, 'Hildegarde', 10, 'Female', 'halps3c@shinystat.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (116, 'Emelia', 11, 'Female', 'ecarlyon14@google.co.uk', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (129, 'Del', 11, 'Female', 'dschreiner1h@canalblog.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (182, 'Moreen', 7, 'Female', 'mriddington2y@comsenz.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (186, 'Christoper', 7, 'Male', 'csemour32@ow.ly', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (133, 'Annnora', 11, 'Female', 'aswadon1l@hugedomains.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (146, 'Bethina', 11, 'Female', 'bshire1y@hatena.ne.jp', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (151, 'Ronnie', 11, 'Male', 'rthewys23@artisteer.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (156, 'Fonsie', 11, 'Male', 'fpinney28@abc.net.au', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (113, 'Rosamond', 13, 'Female', 'rimore11@purevolume.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (117, 'Roosevelt', 13, 'Male', 'rnewdick15@devhub.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (128, 'Fields', 13, 'Male', 'friggey1g@google.fr', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (130, 'Demetrius', 13, 'Male', 'dhauck1i@sakura.ne.jp', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (140, 'Sybila', 13, 'Female', 'sbalasini1s@jigsy.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (142, 'Hailee', 13, 'Female', 'hboick1u@pcworld.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (148, 'Kaila', 13, 'Female', 'kcorkan20@psu.edu', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (107, 'Kellina', 8, 'Female', 'kmetsonv@livejournal.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (111, 'Nina', 8, 'Female', 'nrainonz@independent.co.uk', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (123, 'Tasia', 8, 'Female', 'tgunbie1b@rambler.ru', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (164, 'Yorgos', 11, 'Male', 'yorwell2g@tripod.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (176, 'Sarge', 11, 'Male', 'sshellsheere2s@harvard.edu', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (141, 'Emory', 8, 'Male', 'esimic1t@sfgate.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (177, 'Di', 11, 'Female', 'dcreasey2t@blogs.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (192, 'Julius', 11, 'Male', 'jarlow38@cbc.ca', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (193, 'Jefferson', 11, 'Male', 'jtebald39@t.co', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (105, 'Estevan', 12, 'Male', 'edouset@delicious.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (110, 'Winna', 12, 'Female', 'warrelly@google.cn', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (112, 'Francesco', 12, 'Male', 'fchate10@gmpg.org', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (158, 'Bary', 8, 'Male', 'bshute2a@scientificamerican.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (120, 'Casie', 12, 'Female', 'ctrenear18@seattletimes.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (106, 'Anatola', 9, 'Female', 'abarcku@sbwire.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (114, 'Saxon', 9, 'Male', 'sdunnion12@theguardian.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (147, 'Mirabelle', 9, 'Female', 'mkanter1z@homestead.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (149, 'Callean', 9, 'Male', 'cmeletti21@goodreads.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (162, 'Mathe', 9, 'Male', 'mlebreton2e@wufoo.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (168, 'Kristofer', 9, 'Male', 'kpummell2k@naver.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (185, 'Hilde', 9, 'Female', 'htwigg31@psu.edu', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (189, 'Mala', 9, 'Female', 'mcromie35@stanford.edu', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (137, 'Gordan', 12, 'Male', 'gkeyson1p@census.gov', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (172, 'Martynne', 12, 'Female', 'mdegoix2o@hubpages.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (203, 'Olia', 12, 'Female', 'ostrafen3j@canalblog.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (154, 'Fancie', 13, 'Female', 'fvalentinetti26@drupal.org', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (155, 'Dorthy', 13, 'Female', 'dbeevens27@so-net.ne.jp', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (159, 'Bearnard', 13, 'Male', 'bpaolucci2b@furl.net', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (167, 'Bryna', 13, 'Female', 'bcurman2j@amazon.de', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (170, 'Ignacio', 13, 'Male', 'imieville2m@aboutads.info', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (197, 'Erv', 13, 'Male', 'ecochern3d@squidoo.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (145, 'Giordano', 14, 'Male', 'gigo1x@opensource.org', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (157, 'Jennie', 14, 'Female', 'jbartoloma29@unblog.fr', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (165, 'Julio', 14, 'Male', 'jbackes2h@photobucket.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (183, 'Yoshi', 14, 'Female', 'ycourteney2z@unesco.org', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (131, 'Eric', 15, 'Male', 'emcartan1j@mediafire.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (160, 'Kacey', 15, 'Female', 'klahive2c@dailymail.co.uk', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (175, 'Jamey', 15, 'Male', 'jpalatino2r@list-manage.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (199, 'Gayler', 15, 'Male', 'ghowells3f@jalbum.net', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (524, 'Reeta', 6, 'Female', 'rreinbeck1c@gravatar.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (527, 'Tabby', 6, 'Male', 'tdadda1f@e-recht24.de', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (217, 'Gayle', 9, 'Male', 'gwigmore3x@usa.gov', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (225, 'Gearard', 9, 'Male', 'gjosiah45@ftc.gov', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (244, 'Minny', 9, 'Female', 'mhussey4o@elpais.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (205, 'Zitella', 7, 'Female', 'zjadczak3l@dagondesign.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (246, 'Piper', 9, 'Female', 'pstowell4q@godaddy.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (250, 'Vladamir', 9, 'Male', 'vcrosdill4u@weebly.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (208, 'Abbie', 7, 'Male', 'aadamovsky3o@ucla.edu', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (234, 'Ely', 11, 'Male', 'etaffurelli4e@miibeian.gov.cn', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (251, 'Morgan', 11, 'Male', 'mbranche4v@baidu.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (253, 'Jessika', 9, 'Female', 'jcarr4x@earthlink.net', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (271, 'Immanuel', 9, 'Male', 'igirardetti5f@va.gov', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (252, 'Jaquelyn', 11, 'Female', 'jskettles4w@sina.com.cn', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (263, 'Falito', 11, 'Male', 'ffaltin57@yellowbook.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (265, 'Freeman', 11, 'Male', 'fgravenell59@meetup.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (274, 'Myranda', 11, 'Female', 'mdargavel5i@odnoklassniki.ru', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (279, 'Vinson', 11, 'Male', 'vrobertsen3@blinklist.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (284, 'Lilith', 11, 'Female', 'lladen8@php.net', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (281, 'Dale', 9, 'Male', 'dmaciak5@fastcompany.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (291, 'Manfred', 11, 'Male', 'mdennittsf@hud.gov', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (302, 'Gare', 11, 'Male', 'gmcrobertsq@mapquest.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (211, 'Cymbre', 12, 'Female', 'csore3r@com.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (214, 'Vikki', 12, 'Female', 'vbridson3u@squarespace.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (215, 'Shir', 12, 'Female', 'smurton3v@addthis.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (229, 'Rona', 12, 'Female', 'rheddy49@google.cn', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (238, 'Aubrie', 12, 'Female', 'acrowne4i@whitehouse.gov', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (209, 'Chevy', 7, 'Male', 'cjiroudek3p@themeforest.net', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (294, 'Giavani', 9, 'Male', 'gjurgesi@delicious.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (303, 'Marsh', 9, 'Male', 'mmenir@altervista.org', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (213, 'Forester', 10, 'Male', 'fnealey3t@hatena.ne.jp', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (264, 'Fredi', 10, 'Female', 'fpitsall58@jiathis.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (275, 'Arny', 10, 'Male', 'awardall5j@ibm.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (220, 'Gail', 7, 'Male', 'gscully40@altervista.org', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (278, 'Paulita', 10, 'Female', 'pputnam2@ucoz.ru', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (233, 'Titus', 7, 'Male', 'trushman4d@ebay.co.uk', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (298, 'Sonny', 10, 'Female', 'sserjeantm@multiply.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (237, 'Daren', 7, 'Male', 'dshark4h@opensource.org', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (277, 'Larissa', 12, 'Female', 'lsibylla1@miibeian.gov.cn', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (301, 'Yolanthe', 12, 'Female', 'ycastagnetop@weather.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (257, 'Olag', 7, 'Male', 'ocaltun51@t.co', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (248, 'Joelynn', 13, 'Female', 'jspere4s@goo.ne.jp', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (286, 'Gualterio', 7, 'Male', 'gnutta@hostgator.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (256, 'Wandie', 13, 'Female', 'wpevreal50@typepad.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (290, 'Lance', 7, 'Male', 'lpurselowe@gov.uk', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (535, 'Denny', 6, 'Male', 'dtraut1n@miitbeian.gov.cn', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (551, 'Lucias', 6, 'Male', 'llendon23@ucla.edu', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (292, 'Ugo', 7, 'Male', 'ustedmang@t.co', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (297, 'Theda', 7, 'Female', 'trubinsohnl@bluehost.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (224, 'Lennard', 8, 'Male', 'lsalaman44@nationalgeographic.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (227, 'Sallyanne', 8, 'Female', 'shazeldine47@multiply.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (235, 'Pren', 8, 'Male', 'pcommins4f@paginegialle.it', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (239, 'Caryn', 8, 'Female', 'cdemerida4j@nifty.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (242, 'Nahum', 8, 'Male', 'nassiratti4m@etsy.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (255, 'Julie', 8, 'Female', 'jhargerie4z@flavors.me', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (268, 'Anselma', 8, 'Female', 'aoduane5c@facebook.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (269, 'Noelyn', 8, 'Female', 'nphilliphs5d@cpanel.net', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (280, 'Bellanca', 13, 'Female', 'bbastard4@barnesandnoble.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (287, 'Ralf', 13, 'Male', 'rallsupb@ustream.tv', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (288, 'Nanine', 13, 'Female', 'nbrasierc@biblegateway.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (293, 'Darren', 13, 'Male', 'dwrintmoreh@digg.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (299, 'Eran', 13, 'Female', 'eneenann@g.co', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (206, 'Ileane', 14, 'Female', 'iphinnessy3m@e-recht24.de', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (216, 'Kaleena', 14, 'Female', 'kvitler3w@dailymail.co.uk', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (219, 'Donny', 14, 'Female', 'dhailston3z@wiley.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (223, 'Mahala', 14, 'Female', 'mmattock43@smh.com.au', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (236, 'Hatti', 14, 'Female', 'hdallmann4g@spotify.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (262, 'Jozef', 14, 'Male', 'jengelbrecht56@skyrock.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (285, 'Yehudi', 14, 'Male', 'ynajafian9@liveinternet.ru', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (295, 'Chucho', 14, 'Male', 'celionj@ca.gov', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (210, 'Rosco', 15, 'Male', 'rdower3q@exblog.jp', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (228, 'Lon', 15, 'Male', 'lswine48@apple.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (240, 'Micky', 15, 'Female', 'mwillishire4k@japanpost.jp', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (243, 'Arch', 15, 'Male', 'aarendsen4n@amazon.co.jp', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (247, 'Zorana', 15, 'Female', 'zeassom4r@sakura.ne.jp', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (296, 'Kristo', 15, 'Male', 'kcraufordk@nhs.uk', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (305, 'Rodrigo', 7, 'Male', 'rpaulint@dyndns.org', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (332, 'Kristian', 11, 'Male', 'krobion1k@sfgate.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (270, 'Ahmed', 6, 'Male', 'alinke5e@hatena.ne.jp', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (556, 'Elladine', 6, 'Female', 'ebonhan28@parallels.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (342, 'Dani', 11, 'Male', 'dfontenot1u@people.com.cn', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (345, 'Bryanty', 11, 'Male', 'bandroli1x@slashdot.org', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (346, 'Si', 11, 'Male', 'ssouthwood1y@shutterfly.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (368, 'Corby', 11, 'Male', 'cdarco2k@chicagotribune.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (390, 'Hobard', 11, 'Male', 'hgodsmark36@noaa.gov', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (399, 'Averill', 11, 'Male', 'aopfer3f@cornell.edu', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (304, 'Alene', 12, 'Female', 'aglassons@i2i.jp', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (307, 'Ira', 12, 'Female', 'ihaylandv@toplist.cz', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (311, 'Clair', 12, 'Female', 'cpabstz@chronoengine.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (338, 'Helenelizabeth', 12, 'Female', 'hbourgour1q@usgs.gov', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (353, 'Clemmy', 12, 'Female', 'charwood25@yahoo.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (364, 'Fletch', 12, 'Male', 'fmulholland2g@plala.or.jp', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (369, 'Curt', 12, 'Male', 'cpatinkin2l@yahoo.co.jp', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (388, 'Hi', 12, 'Male', 'hofergus34@purevolume.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (398, 'Darline', 12, 'Female', 'drainer3e@sina.com.cn', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (402, 'Emmy', 12, 'Female', 'ejefferson3i@sina.com.cn', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (322, 'Marcellina', 13, 'Female', 'msleath1a@cisco.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (340, 'Calhoun', 13, 'Male', 'cbishell1s@xrea.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (375, 'Granger', 7, 'Male', 'gcambden2r@intel.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (310, 'Gianina', 8, 'Female', 'gbollandy@icq.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (325, 'Karoly', 8, 'Female', 'klethbridge1d@bbc.co.uk', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (326, 'Cris', 8, 'Male', 'ccradey1e@hao123.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (306, 'Marillin', 9, 'Female', 'mkunesu@pcworld.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (309, 'Romona', 9, 'Female', 'rfettesx@huffingtonpost.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (313, 'Kial', 9, 'Female', 'khickeringill11@networkadvertising.org', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (317, 'Nadia', 9, 'Female', 'nroycroft15@dell.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (359, 'Herby', 13, 'Male', 'hathridge2b@mozilla.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (557, 'Briano', 6, 'Male', 'bhankin29@nature.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (575, 'Nial', 6, 'Male', 'nswindin2r@nasa.gov', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (587, 'Alexio', 6, 'Male', 'aelcox33@phpbb.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (602, 'Wallace', 6, 'Male', 'wchalles3i@utexas.edu', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (620, 'Cyrille', 6, 'Male', 'cjerrams40@businessweek.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (324, 'Walt', 9, 'Male', 'wjunkin1c@eepurl.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (331, 'Onfroi', 9, 'Male', 'oboyes1j@admin.ch', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (377, 'Lanny', 9, 'Female', 'lchildes2t@europa.eu', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (385, 'Horacio', 9, 'Male', 'hjakubowicz31@plala.or.jp', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (394, 'Skye', 9, 'Male', 'shuey3a@dailymotion.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (323, 'Brad', 10, 'Male', 'bkingscott1b@wikimedia.org', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (337, 'Pren', 10, 'Male', 'psneller1p@wsj.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (354, 'Ibbie', 10, 'Female', 'iacory26@cbc.ca', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (365, 'Grissel', 10, 'Female', 'gdenyukin2h@gravatar.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (380, 'George', 10, 'Male', 'gfeld2w@cargocollective.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (387, 'Francisca', 10, 'Female', 'fmaltby33@globo.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (400, 'Cymbre', 10, 'Female', 'clenthall3g@istockphoto.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (362, 'Mandel', 13, 'Male', 'msibbit2e@wp.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (367, 'Hersch', 13, 'Male', 'hcuttler2j@amazonaws.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (371, 'Delaney', 13, 'Male', 'djolley2n@admin.ch', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (372, 'Agnella', 13, 'Female', 'acroser2o@sbwire.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (404, 'Eleanore', 13, 'Female', 'ecaulcott3k@google.it', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (315, 'Salomo', 14, 'Male', 'sisenor13@patch.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (316, 'Othelia', 14, 'Female', 'ocashley14@parallels.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (319, 'Philis', 14, 'Female', 'pdoag17@nymag.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (320, 'Tomaso', 14, 'Male', 'tfeldstern18@furl.net', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (334, 'Ly', 14, 'Male', 'ldoige1m@tinypic.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (339, 'Renaud', 14, 'Male', 'rcronchey1r@unc.edu', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (343, 'Reinaldos', 14, 'Male', 'rmelan1v@globo.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (348, 'Wade', 14, 'Male', 'wwhitehorne20@google.pl', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (355, 'Currie', 14, 'Male', 'ckniveton27@clickbank.net', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (370, 'Nap', 14, 'Male', 'nrubinsohn2m@bandcamp.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (373, 'Camile', 14, 'Female', 'cconstantine2p@cam.ac.uk', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (382, 'Sansone', 14, 'Male', 'smullane2y@phoca.cz', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (403, 'Martin', 14, 'Male', 'mcron3j@goo.gl', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (308, 'Martina', 15, 'Female', 'mrappw@nature.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (333, 'Skippie', 15, 'Male', 'smcrill1l@elegantthemes.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (335, 'Sidney', 15, 'Male', 'sfritzer1n@chicagotribune.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (344, 'Cecily', 15, 'Female', 'ccamus1w@weebly.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (347, 'Emmit', 15, 'Male', 'eroast1z@google.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (349, 'Ottilie', 15, 'Female', 'olanders21@ycombinator.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (357, 'Car', 15, 'Male', 'ccannaway29@huffingtonpost.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (360, 'Roseline', 15, 'Female', 'rsutor2c@opensource.org', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (395, 'Cort', 15, 'Male', 'cquakley3b@trellian.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (276, 'Andonis', 6, 'Male', 'acolafate0@eventbrite.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (289, 'Bradly', 6, 'Male', 'bbleezed@intel.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (300, 'Bobbie', 6, 'Male', 'bkharchinskio@naver.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (312, 'Thia', 6, 'Female', 'tpettyfer10@wix.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (318, 'Niki', 6, 'Female', 'ngelder16@bing.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (622, 'Jolee', 6, 'Female', 'jtrusty42@cdc.gov', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (629, 'Lorie', 6, 'Female', 'ledelston49@jugem.jp', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (660, 'Phip', 6, 'Male', 'pmueller54@smugmug.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (411, 'Amby', 11, 'Male', 'abeane3r@tumblr.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (426, 'Tucker', 11, 'Male', 'tplose46@wiley.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (427, 'Deane', 11, 'Male', 'dosheeryne47@nbcnews.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (452, 'Calida', 11, 'Female', 'ccatherine4w@ycombinator.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (460, 'Tedie', 11, 'Male', 'tmioni54@mtv.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (471, 'Normie', 11, 'Male', 'npincott5f@statcounter.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (417, 'Sancho', 7, 'Male', 'scansfield3x@walmart.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (433, 'Corbet', 7, 'Male', 'cwotton4d@intel.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (440, 'Krispin', 7, 'Male', 'kcometson4k@webmd.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (408, 'Cyndy', 12, 'Female', 'cstetson3o@cbsnews.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (409, 'Hartley', 12, 'Male', 'htramel3p@google.ca', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (410, 'Quinn', 12, 'Male', 'qweiner3q@dagondesign.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (414, 'Sioux', 12, 'Female', 'sbettanay3u@php.net', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (441, 'Chrystel', 12, 'Female', 'ctabner4l@devhub.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (442, 'Patrice', 13, 'Male', 'pmcreidy4m@so-net.ne.jp', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (444, 'Harrie', 13, 'Female', 'hgambell4o@tripadvisor.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (448, 'Ignazio', 13, 'Male', 'ieggleton4s@prweb.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (457, 'Dennison', 13, 'Male', 'dcroke51@squarespace.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (463, 'Teresa', 13, 'Female', 'tmacrannell57@nasa.gov', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (443, 'Nona', 7, 'Female', 'nclaye4n@liveinternet.ru', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (445, 'Celine', 7, 'Female', 'cgilhool4p@usda.gov', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (451, 'Legra', 7, 'Female', 'lwilkins4v@reverbnation.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (458, 'Jesselyn', 7, 'Female', 'jraiker52@apple.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (418, 'Verla', 8, 'Female', 'vgianninotti3y@ehow.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (431, 'Man', 8, 'Male', 'mgoldhawk4b@shutterfly.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (465, 'Lloyd', 8, 'Male', 'ljacquet59@ow.ly', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (474, 'Rosette', 8, 'Female', 'rgarbutt5i@1und1.de', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (413, 'Kelli', 9, 'Female', 'kpotkins3t@addtoany.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (416, 'Alaster', 10, 'Male', 'arannigan3w@soundcloud.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (464, 'Flemming', 13, 'Male', 'fnorton58@cyberchimps.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (466, 'Kelley', 13, 'Female', 'kbage5a@cafepress.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (467, 'Georgette', 13, 'Female', 'gstronack5b@angelfire.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (472, 'Araldo', 13, 'Male', 'acarmo5g@webnode.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (406, 'Hildy', 14, 'Female', 'hsykes3m@booking.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (421, 'Clayborne', 10, 'Male', 'cgirodier41@de.vu', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (407, 'Gwyn', 14, 'Female', 'gfanton3n@hubpages.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (415, 'Ephraim', 14, 'Male', 'etallant3v@multiply.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (424, 'Blakelee', 10, 'Female', 'bskippings44@simplemachines.org', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (434, 'Norah', 10, 'Female', 'nmillery4e@google.ru', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (672, 'Terese', 6, 'Female', 'tletteresse5g@people.com.cn', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (673, 'Ginelle', 6, 'Female', 'gzemler5h@indiatimes.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (674, 'Carlye', 6, 'Female', 'cpirt5i@washingtonpost.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (684, 'Marinna', 6, 'Female', 'mproback8@fc2.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (694, 'Teresita', 6, 'Female', 'tantoniettii@reuters.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (765, 'Marcile', 6, 'Female', 'mrentcome2h@vimeo.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (770, 'Elianora', 6, 'Female', 'ethurling2m@unc.edu', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (455, 'Weber', 10, 'Male', 'wholburn4z@reverbnation.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (456, 'Joye', 10, 'Female', 'jsessions50@lulu.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (461, 'Douglas', 10, 'Male', 'dstot55@wordpress.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (462, 'Udall', 10, 'Male', 'ugomm56@hexun.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (469, 'May', 10, 'Female', 'mgianettini5d@chicagotribune.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (470, 'Maia', 10, 'Female', 'mgarfitt5e@github.io', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (473, 'Thorstein', 10, 'Male', 'tpfleger5h@meetup.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (422, 'Hannis', 14, 'Female', 'hcasarino42@weibo.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (423, 'Crissie', 14, 'Female', 'cstapleton43@taobao.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (436, 'Ardyce', 14, 'Female', 'acrapper4g@ft.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (446, 'Anna-maria', 14, 'Female', 'acolliford4q@canalblog.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (453, 'Bucky', 14, 'Male', 'bquarles4x@netvibes.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (405, 'Ailyn', 15, 'Female', 'abraga3l@oakley.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (420, 'Emlynne', 15, 'Female', 'ehickisson40@github.io', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (429, 'Idelle', 15, 'Female', 'isexti49@free.fr', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (437, 'Gardy', 15, 'Male', 'gferrant4h@unc.edu', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (439, 'Torrey', 15, 'Male', 'tedgeon4j@uol.com.br', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (449, 'Jo-anne', 15, 'Female', 'jyerrall4t@paginegialle.it', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (480, 'Aubert', 10, 'Male', 'aexelby4@miitbeian.gov.cn', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (496, 'Cristian', 10, 'Male', 'cglassardk@hc360.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (504, 'Thia', 10, 'Female', 'tmartinss@xing.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (517, 'Andros', 10, 'Male', 'aworley15@cdbaby.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (525, 'Sayre', 10, 'Female', 'sbairnsfather1d@altervista.org', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (532, 'Myrtice', 10, 'Female', 'moregan1k@smugmug.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (544, 'Madlin', 10, 'Female', 'mhumfrey1w@vinaora.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (548, 'Orelle', 10, 'Female', 'ocasina20@yahoo.co.jp', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (554, 'Zaneta', 10, 'Female', 'zcollcutt26@cdc.gov', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (559, 'Jabez', 10, 'Male', 'jcaldroni2b@weebly.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (560, 'Curtis', 10, 'Male', 'cbosher2c@cbc.ca', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (563, 'Irvin', 10, 'Male', 'ibeckhouse2f@cyberchimps.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (485, 'Jameson', 11, 'Male', 'jshelbourne9@theatlantic.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (489, 'Aluin', 13, 'Male', 'amalmard@unicef.org', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (506, 'Krysta', 13, 'Female', 'khaldenu@mac.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (520, 'Karia', 13, 'Female', 'kmatic18@nifty.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (526, 'Ancell', 13, 'Male', 'aorris1e@nydailynews.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (537, 'Lionel', 13, 'Male', 'llortzing1p@about.me', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (555, 'Chancey', 13, 'Male', 'ccaren27@goo.ne.jp', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (558, 'Early', 13, 'Male', 'egilchriest2a@reverbnation.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (529, 'Mirabelle', 14, 'Female', 'mmilliken1h@shareasale.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (543, 'Westleigh', 14, 'Male', 'wskains1v@studiopress.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (564, 'Ricki', 14, 'Female', 'ryelding2g@smugmug.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (481, 'Sid', 15, 'Male', 'smaryin5@ovh.net', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (509, 'Ola', 15, 'Female', 'oraeburnx@ibm.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (482, 'Elvin', 7, 'Male', 'eprisk6@lulu.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (491, 'Gare', 7, 'Male', 'gwhitlamf@bbc.co.uk', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (492, 'Tannie', 7, 'Male', 'toxxg@dion.ne.jp', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (500, 'Lisabeth', 7, 'Female', 'lamyso@ucoz.ru', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (512, 'Hannie', 7, 'Female', 'hnowakowska10@cmu.edu', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (487, 'Nanny', 11, 'Female', 'nemeryb@gizmodo.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (495, 'Liz', 11, 'Female', 'lcallowayj@twitpic.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (505, 'Florri', 11, 'Female', 'fspencelayht@ucoz.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (513, 'Wilden', 11, 'Male', 'wrivitt11@who.int', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (502, 'Sheppard', 12, 'Male', 'smandersq@ucla.edu', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (503, 'Katharyn', 12, 'Female', 'kcruddacer@umn.edu', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (511, 'Teodorico', 12, 'Male', 'tformoyz@narod.ru', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (528, 'Urbain', 12, 'Male', 'urucklesse1g@salon.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (542, 'Wenda', 12, 'Female', 'wbarehead1u@issuu.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (546, 'Jasmin', 12, 'Female', 'jdrance1y@plala.or.jp', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (549, 'Merralee', 12, 'Female', 'myaknov21@accuweather.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (786, 'Woody', 6, 'Male', 'wboon32@bravesites.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (787, 'Travers', 6, 'Male', 'tburney33@census.gov', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (794, 'Magdalena', 6, 'Female', 'mwoodfin3a@foxnews.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (807, 'Brok', 6, 'Male', 'bfenck3n@nba.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (814, 'Delmore', 6, 'Male', 'dwrigley3u@state.gov', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (817, 'Natale', 6, 'Male', 'nconaghy3x@smh.com.au', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (819, 'Penrod', 6, 'Male', 'pmckeaveney3z@utexas.edu', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (515, 'Skylar', 7, 'Male', 'sklees13@addtoany.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (534, 'Kimberly', 7, 'Female', 'klighten1m@seattletimes.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (538, 'Rudolf', 7, 'Male', 'randries1q@ihg.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (541, 'Elmira', 7, 'Female', 'ebeirne1t@chronoengine.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (550, 'Arney', 7, 'Male', 'amichelotti22@noaa.gov', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (552, 'Darell', 7, 'Female', 'dwillcott24@berkeley.edu', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (476, 'Andie', 9, 'Male', 'abrockbank0@unc.edu', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (477, 'Brinna', 9, 'Female', 'bheal1@xinhuanet.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (478, 'Andres', 9, 'Male', 'agartsyde2@springer.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (479, 'Ephrem', 9, 'Male', 'ebasezzi3@prweb.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (484, 'Dewie', 9, 'Male', 'dsomerbell8@1und1.de', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (486, 'Rani', 9, 'Female', 'rgarbetta@delicious.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (488, 'Nettle', 9, 'Female', 'nbuzzac@bravesites.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (493, 'Stephani', 9, 'Female', 'sroblouh@mac.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (498, 'Garek', 9, 'Male', 'galbersm@tiny.cc', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (518, 'Sampson', 9, 'Male', 'sstepney16@elegantthemes.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (519, 'Tiffi', 9, 'Female', 'tcamacho17@marketwatch.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (522, 'Candra', 9, 'Female', 'cmenelaws1a@sun.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (547, 'Maryellen', 9, 'Female', 'mroyston1z@hugedomains.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (514, 'Janessa', 15, 'Female', 'jfallen12@yolasite.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (530, 'Ottilie', 15, 'Female', 'ocargo1i@usda.gov', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (553, 'Jo', 15, 'Male', 'jshirrell25@phoca.cz', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (561, 'Adolph', 15, 'Male', 'amathiot2d@irs.gov', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (588, 'Kippy', 9, 'Male', 'kwyrill34@senate.gov', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (589, 'Rube', 9, 'Male', 'rswynley35@behance.net', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (590, 'Raynard', 9, 'Male', 'rwrates36@discovery.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (595, 'Fabiano', 9, 'Male', 'fmoniker3b@free.fr', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (574, 'Georgine', 10, 'Female', 'gsacase2q@fotki.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (594, 'Peria', 10, 'Female', 'pelesander3a@bravesites.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (596, 'Ellary', 10, 'Male', 'earmstrong3c@webeden.co.uk', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (599, 'Gae', 10, 'Female', 'gtant3f@sitemeter.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (606, 'Maxie', 10, 'Female', 'msteffan3m@springer.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (607, 'Orran', 10, 'Male', 'opeidro3n@prweb.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (609, 'Emmi', 10, 'Female', 'emottinelli3p@statcounter.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (623, 'Vivien', 10, 'Female', 'vhaseley43@hexun.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (567, 'Dorie', 11, 'Male', 'dgodrich2j@icio.us', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (573, 'Verena', 11, 'Female', 'vhazelgrove2p@mashable.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (581, 'Letty', 11, 'Female', 'ltoovey2x@oakley.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (582, 'Tully', 11, 'Male', 'tstamper2y@redcross.org', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (592, 'Rani', 11, 'Female', 'rseeler38@mtv.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (616, 'Twyla', 11, 'Female', 'tpashenkov3w@bigcartel.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (642, 'Arlyn', 11, 'Female', 'anowland4m@timesonline.co.uk', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (655, 'Faustina', 11, 'Female', 'fmcilmorow4z@independent.co.uk', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (572, 'Baxy', 12, 'Male', 'bclaypool2o@constantcontact.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (577, 'Anni', 12, 'Female', 'alecornu2t@pinterest.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (597, 'Early', 7, 'Male', 'emoy3d@techcrunch.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (600, 'Peggi', 7, 'Female', 'pwootton3g@addthis.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (825, 'Romain', 6, 'Male', 'rsail45@ocn.ne.jp', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (834, 'Lolly', 6, 'Female', 'lyakobowitch4e@dyndns.org', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (604, 'Tildie', 9, 'Female', 'tdjurevic3k@about.me', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (631, 'Paddy', 9, 'Male', 'pjosskovitz4b@google.com.au', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (840, 'Violante', 6, 'Female', 'vquinnelly4k@alibaba.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (849, 'Jeromy', 6, 'Male', 'jwillock4t@netvibes.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (650, 'Erna', 9, 'Female', 'esaxby4u@google.pl', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (657, 'Agnesse', 9, 'Female', 'aredhouse51@mlb.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (852, 'Petronille', 6, 'Female', 'psalle4w@digg.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (376, 'Brennan', 6, 'Male', 'broston2s@exblog.jp', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (389, 'Park', 6, 'Male', 'pwhitfield35@exblog.jp', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (391, 'Gare', 6, 'Male', 'gscase37@whitehouse.gov', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (327, 'Fabe', 6, 'Male', 'fcullingworth1f@ocn.ne.jp', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (350, 'Elisha', 6, 'Male', 'eleeke22@un.org', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (611, 'Griffie', 7, 'Male', 'gjerger3r@lulu.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (618, 'Sly', 7, 'Male', 'sstruther3y@archive.org', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (568, 'Ethyl', 8, 'Female', 'ebellfield2k@epa.gov', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (570, 'Royall', 8, 'Male', 'rdragon2m@trellian.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (585, 'John', 8, 'Male', 'jbrockhouse31@networkadvertising.org', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (586, 'Nelly', 8, 'Female', 'ndodwell32@issuu.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (624, 'Kev', 10, 'Male', 'kforge44@statcounter.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (658, 'Welbie', 10, 'Male', 'wdocker52@foxnews.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (578, 'Blondy', 12, 'Female', 'bbullent2u@sbwire.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (580, 'Shalna', 12, 'Female', 'sbuckby2w@nymag.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (613, 'Husain', 12, 'Male', 'howthwaite3t@msu.edu', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (626, 'Andeee', 12, 'Female', 'abarnaby46@bing.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (635, 'Audrey', 12, 'Female', 'amcelory4f@google.de', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (636, 'Jody', 12, 'Female', 'jmunton4g@t.co', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (641, 'Clemmy', 12, 'Female', 'charber4l@prweb.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (644, 'Chery', 12, 'Female', 'clurner4o@soundcloud.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (654, 'Kristin', 12, 'Female', 'kchaney4y@adobe.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (666, 'Craggie', 12, 'Male', 'cgypson5a@ning.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (576, 'Irene', 13, 'Female', 'igillett2s@adobe.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (605, 'Maurita', 13, 'Female', 'mdewberry3l@columbia.edu', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (608, 'Howard', 13, 'Male', 'hboxell3o@domainmarket.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (612, 'Alfreda', 13, 'Female', 'awynes3s@telegraph.co.uk', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (632, 'Florinda', 13, 'Female', 'fconws4c@fda.gov', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (633, 'Glendon', 13, 'Male', 'ggotliffe4d@stanford.edu', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (651, 'Barbette', 13, 'Female', 'beltune4v@elegantthemes.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (652, 'Kaitlynn', 13, 'Female', 'ksaunton4w@flickr.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (656, 'Obie', 13, 'Male', 'ogemnett50@nba.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (663, 'Kirsteni', 13, 'Female', 'kclassen57@cocolog-nifty.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (566, 'Perry', 14, 'Female', 'pcisson2i@gizmodo.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (569, 'Shelly', 14, 'Female', 'skurtis2l@digg.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (571, 'Milzie', 14, 'Female', 'mbaston2n@nbcnews.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (583, 'Nobie', 14, 'Male', 'nmoody2z@globo.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (603, 'Eli', 14, 'Male', 'emorstatt3j@bluehost.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (627, 'Lizzy', 14, 'Female', 'lnawton47@dion.ne.jp', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (653, 'Anastassia', 14, 'Female', 'aeringey4x@omniture.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (579, 'Phillie', 15, 'Female', 'psturror2v@qq.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (601, 'Devan', 15, 'Female', 'dspellar3h@mapquest.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (617, 'Christabel', 15, 'Female', 'cgullivan3x@constantcontact.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (628, 'Elmo', 15, 'Male', 'emariette48@prweb.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (630, 'Petronella', 15, 'Female', 'pcosti4a@wikipedia.org', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (634, 'Haywood', 15, 'Male', 'hyellop4e@csmonitor.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (637, 'Thayne', 15, 'Male', 'tcruwys4h@studiopress.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (639, 'Sallie', 15, 'Female', 'skares4j@opensource.org', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (665, 'Brynn', 15, 'Female', 'bcornock59@constantcontact.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (668, 'Isadore', 11, 'Male', 'irothert5c@facebook.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (677, 'Archibold', 11, 'Male', 'aniset1@washington.edu', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (685, 'Carine', 11, 'Female', 'cstango9@posterous.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (687, 'Ardys', 11, 'Female', 'aoventonb@comcast.net', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (696, 'Clemente', 11, 'Male', 'cellamank@paypal.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (708, 'Alayne', 11, 'Female', 'agarrudw@businesswire.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (714, 'Mariam', 11, 'Female', 'mgorgl12@shinystat.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (723, 'Geraldine', 11, 'Female', 'gbladder1b@bbb.org', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (755, 'Cornall', 11, 'Male', 'cwetherick27@jugem.jp', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (756, 'Elka', 11, 'Female', 'efeldklein28@cocolog-nifty.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (757, 'Archer', 11, 'Male', 'awinyard29@reddit.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (760, 'Malissa', 11, 'Female', 'mbirkenhead2c@ucla.edu', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (678, 'Daryl', 12, 'Female', 'dgeorgins2@dot.gov', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (702, 'Torre', 12, 'Male', 'tbradnockq@slideshare.net', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (705, 'Paulie', 12, 'Female', 'pmuntt@boston.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (719, 'See', 12, 'Male', 'sstanwix17@google.de', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (667, 'Lisette', 7, 'Female', 'lcrosskell5b@dailymail.co.uk', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (682, 'Aaren', 7, 'Female', 'astainson6@home.pl', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (713, 'Della', 7, 'Female', 'ddearnaley11@guardian.co.uk', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (720, 'Sal', 7, 'Male', 'sjantet18@wikipedia.org', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (669, 'Moll', 8, 'Female', 'mbrandrick5d@unc.edu', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (671, 'Lucinda', 8, 'Female', 'lmacdonald5f@quantcast.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (675, 'Angus', 8, 'Male', 'aryce5j@unblog.fr', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (683, 'Chrystel', 9, 'Female', 'cbiddwell7@istockphoto.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (690, 'Demetris', 9, 'Male', 'dcarnocke@elpais.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (710, 'Kathie', 9, 'Female', 'krawcliffy@google.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (721, 'Pavia', 9, 'Female', 'pshee19@feedburner.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (726, 'Shara', 9, 'Female', 'snorssister1e@gizmodo.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (734, 'Zechariah', 9, 'Male', 'zverriour1m@skype.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (744, 'Margarette', 9, 'Female', 'mdillingham1w@drupal.org', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (740, 'Ettie', 12, 'Female', 'ekinnach1s@tripod.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (750, 'Cordi', 9, 'Female', 'cjeckells22@ft.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (741, 'Griselda', 12, 'Female', 'gslaymaker1t@msn.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (745, 'Northrop', 12, 'Male', 'ntitheridge1x@barnesandnoble.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (753, 'Nial', 12, 'Male', 'nkeech25@comsenz.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (693, 'Walden', 10, 'Male', 'wslowcockh@51.la', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (703, 'Rea', 10, 'Female', 'rmcmahonr@blogs.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (715, 'Stacia', 10, 'Female', 'sskyrm13@tripadvisor.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (728, 'Ailene', 10, 'Female', 'aackland1g@bing.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (737, 'Amalle', 10, 'Female', 'amcvey1p@smugmug.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (759, 'Mommy', 12, 'Female', 'mangove2b@house.gov', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (681, 'Alvie', 13, 'Male', 'arossiter5@wikimedia.org', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (692, 'Theresa', 13, 'Female', 'tbyramg@google.cn', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (712, 'Lia', 13, 'Female', 'linchcomb10@paginegialle.it', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (722, 'Peria', 13, 'Female', 'pcoverdale1a@hc360.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (727, 'Cherilyn', 13, 'Female', 'cmacconchie1f@nymag.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (730, 'Harlene', 13, 'Female', 'hjudkins1i@bbc.co.uk', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (738, 'Curry', 13, 'Male', 'clavigne1q@blogtalkradio.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (743, 'Graeme', 13, 'Male', 'ggregoriou1v@dot.gov', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (752, 'Dorotea', 13, 'Female', 'dcotesford24@thetimes.co.uk', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (680, 'Laina', 14, 'Female', 'llatus4@example.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (686, 'Chick', 14, 'Male', 'clillowa@163.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (691, 'Alain', 14, 'Male', 'alilburnef@un.org', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (695, 'Katine', 14, 'Female', 'kdillawayj@studiopress.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (697, 'Maritsa', 14, 'Female', 'mjollyel@list-manage.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (699, 'Reider', 14, 'Male', 'rharrhyn@yahoo.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (716, 'Gannie', 14, 'Male', 'ggulliver14@amazon.co.uk', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (718, 'Sim', 14, 'Male', 'squarry16@soundcloud.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (724, 'Sascha', 14, 'Male', 'screavan1c@sphinn.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (746, 'Griselda', 14, 'Female', 'gweond1y@printfriendly.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (688, 'Darda', 15, 'Female', 'dluxmoorec@drupal.org', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (689, 'Nicolais', 15, 'Male', 'nzaniolettid@ocn.ne.jp', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (701, 'Junina', 15, 'Female', 'jdreakinp@pinterest.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (711, 'Blane', 15, 'Male', 'bsantarelliz@cbc.ca', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (717, 'Alley', 15, 'Male', 'agladdifh15@comcast.net', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (725, 'Berny', 15, 'Female', 'bfrandsen1d@china.com.cn', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (732, 'Hernando', 15, 'Male', 'hparriss1k@bing.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (749, 'Karin', 15, 'Female', 'khillan21@vinaora.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (758, 'Tulley', 15, 'Male', 'thyrons2a@miitbeian.gov.cn', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (762, 'Putnam', 15, 'Male', 'pcabble2e@jugem.jp', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (766, 'Dacy', 15, 'Female', 'dmarson2i@mozilla.org', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (768, 'Adler', 10, 'Male', 'ahazleton2k@dailymail.co.uk', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (809, 'Kelly', 10, 'Female', 'ktrayling3p@people.com.cn', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (810, 'Kippy', 10, 'Male', 'kpovall3q@soup.io', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (823, 'Moss', 10, 'Male', 'mmassey43@wordpress.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (831, 'Chic', 10, 'Male', 'cogley4b@nyu.edu', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (843, 'Ingunna', 10, 'Female', 'igaler4n@nbcnews.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (845, 'Channa', 10, 'Female', 'croos4p@gmpg.org', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (855, 'Lila', 10, 'Female', 'ldunseath4z@cornell.edu', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (863, 'Kalindi', 10, 'Female', 'kmargram57@chron.com', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (775, 'Red', 11, 'Male', 'rforre2r@ask.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (798, 'Zebadiah', 11, 'Male', 'znoriega3e@amazon.de', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (800, 'Arthur', 11, 'Male', 'ahammelberg3g@chron.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (865, 'Ofelia', 11, 'Female', 'oschapero59@wikispaces.com', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (779, 'Brittni', 12, 'Female', 'bdrewe2v@fc2.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (802, 'Crystal', 12, 'Female', 'cforan3i@reference.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (772, 'Heinrick', 13, 'Male', 'hchecketts2o@nydailynews.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (777, 'Reid', 13, 'Male', 'rleeves2t@oracle.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (796, 'Pippa', 13, 'Female', 'pwestley3c@xrea.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (815, 'Ted', 13, 'Male', 'tramalhete3v@dyndns.org', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (818, 'Maison', 13, 'Male', 'mdorning3y@yellowbook.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (828, 'Phillie', 13, 'Female', 'pembling48@icq.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (844, 'Nataniel', 13, 'Male', 'nforge4o@harvard.edu', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (780, 'Oralie', 14, 'Female', 'otomanek2w@hud.gov', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (854, 'Frederich', 14, 'Male', 'fcoltart4y@vkontakte.ru', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (767, 'Rutter', 7, 'Male', 'rnoton2j@huffingtonpost.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (781, 'Des', 7, 'Male', 'dstandfield2x@businesswire.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (782, 'Viviene', 7, 'Female', 'vlivingstone2y@tamu.edu', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (791, 'Bevvy', 7, 'Female', 'blantuff37@netvibes.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (821, 'Wilow', 12, 'Female', 'wfaulo41@4shared.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (826, 'Dal', 12, 'Male', 'dablewhite46@marketwatch.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (792, 'Basilio', 7, 'Male', 'btolan38@jiathis.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (829, 'Tuckie', 12, 'Male', 'tduchenne49@networksolutions.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (836, 'Thomasin', 12, 'Female', 'tflatt4g@squarespace.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (838, 'Mab', 12, 'Female', 'mbaudone4i@parallels.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (839, 'Gasper', 12, 'Male', 'gsignorelli4j@salon.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (859, 'Lenci', 12, 'Male', 'lbendell53@nydailynews.com', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (862, 'Ricca', 12, 'Female', 'rsurgood56@amazon.co.uk', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (866, 'Gilemette', 12, 'Female', 'gtrevon5a@earthlink.net', 7);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (861, 'Enrica', 14, 'Female', 'ecobb55@comsenz.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (813, 'Rori', 7, 'Female', 'rcotillard3t@vistaprint.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (830, 'Stephen', 7, 'Male', 'smcilwraith4a@google.co.jp', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (837, 'Dall', 7, 'Male', 'dmcshirrie4h@barnesandnoble.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (841, 'Lurleen', 7, 'Female', 'lkidwell4l@google.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (850, 'Yehudi', 7, 'Male', 'ybear4u@goo.ne.jp', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (774, 'Peggie', 8, 'Female', 'pmaidstone2q@forbes.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (773, 'Wade', 9, 'Male', 'wmacilurick2p@fotki.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (776, 'Ewen', 9, 'Male', 'edauby2s@aboutads.info', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (783, 'Harlin', 9, 'Male', 'hbattle2z@people.com.cn', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (784, 'Piper', 9, 'Female', 'pgrossman30@elpais.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (790, 'Paxon', 9, 'Male', 'pgerhardt36@t-online.de', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (797, 'Johna', 9, 'Female', 'jrivett3d@acquirethisname.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (801, 'Francene', 9, 'Female', 'fsturdy3h@bigcartel.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (805, 'Virgina', 9, 'Female', 'vdallaghan3l@chicagotribune.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (811, 'Orbadiah', 9, 'Male', 'ofitzgerald3r@scribd.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (816, 'Theadora', 9, 'Female', 'tmccrackan3w@squarespace.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (822, 'Brook', 9, 'Male', 'bcrouse42@webeden.co.uk', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (833, 'Jaine', 9, 'Female', 'jwooding4d@accuweather.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (835, 'Jemmie', 9, 'Female', 'jadamo4f@usnews.com', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (846, 'Sissy', 9, 'Female', 'swolfart4q@ovh.net', 4);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (769, 'Stacy', 15, 'Female', 'sburris2l@fotki.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (778, 'Rolfe', 15, 'Male', 'rmclarnon2u@berkeley.edu', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (785, 'Enoch', 15, 'Male', 'earchbutt31@census.gov', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (788, 'Janot', 15, 'Female', 'jpeabody34@netscape.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (789, 'Ophelia', 15, 'Female', 'oireland35@ucoz.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (793, 'Sarina', 15, 'Female', 'slongega39@tinypic.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (795, 'Sande', 15, 'Female', 'sradki3b@fastcompany.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (804, 'Simonette', 15, 'Female', 'sprandy3k@buzzfeed.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (812, 'Frans', 15, 'Male', 'fvreiberg3s@ft.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (820, 'Bibbye', 15, 'Female', 'bpigeon40@ucla.edu', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (848, 'Wadsworth', 15, 'Male', 'wbrocking4s@bandcamp.com', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (851, 'Alis', 15, 'Female', 'acoppock4v@miitbeian.gov.cn', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (864, 'Simonette', 15, 'Female', 'swilflinger58@pen.io', 10);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (869, 'Bryn', 7, 'Female', 'bglennon5d@w3.org', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (872, 'Marybelle', 7, 'Female', 'mjekel5g@histats.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (873, 'Monah', 8, 'Female', 'mkarpfen5h@last.fm', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (870, 'Charo', 10, 'Female', 'cgalliver5e@pbs.org', 5);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (871, 'Isaak', 11, 'Male', 'irichards5f@nasa.gov', 6);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (868, 'Stanley', 13, 'Male', 'stowers5c@yellowbook.com', 8);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (875, 'Kristien', 14, 'Female', 'kcoomer5j@chicagotribune.com', 9);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (314, 'Aurelie', 7, 'Female', 'ahughland12@flickr.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (330, 'Georas', 7, 'Male', 'gbigglestone1i@rakuten.co.jp', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (378, 'Robby', 7, 'Female', 'rmuckeen2u@opera.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (379, 'Kent', 7, 'Male', 'kbeckinsale2v@nifty.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (381, 'Brad', 7, 'Male', 'bdooney2x@imgur.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (85, 'Valaria', 8, 'Female', 'vhesser9@geocities.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (188, 'Janis', 8, 'Female', 'jattawell34@nature.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (191, 'Hadrian', 8, 'Male', 'hfilipputti37@mac.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (198, 'Arel', 8, 'Male', 'aparcell3e@squarespace.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (200, 'Mill', 8, 'Male', 'mdehailes3g@4shared.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (202, 'Lucho', 8, 'Male', 'lwrightam3i@sfgate.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (329, 'Giacopo', 8, 'Male', 'ghedden1h@instagram.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (341, 'Timothy', 8, 'Male', 'tstquenin1t@angelfire.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (352, 'Rube', 8, 'Male', 'relby24@samsung.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (358, 'Siegfried', 8, 'Male', 'scallaby2a@berkeley.edu', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (366, 'Hyman', 8, 'Male', 'hcufley2i@typepad.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (396, 'Cherie', 8, 'Female', 'cdunstall3c@apple.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (397, 'Roz', 8, 'Female', 'rchat3d@technorati.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (84, 'Gustave', 6, 'Male', 'gcureton8@yahoo.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (88, 'Kevyn', 6, 'Female', 'kwrittlec@technorati.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (101, 'Ruttger', 6, 'Male', 'rhinchamp@theguardian.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (195, 'Shep', 6, 'Male', 'slohan3b@youtu.be', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (180, 'Gualterio', 6, 'Male', 'gfeldfisher2w@xinhuanet.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (181, 'Gasparo', 6, 'Male', 'gmowsley2x@fotki.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (232, 'Addie', 6, 'Female', 'agero4c@va.gov', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (241, 'Carmelina', 6, 'Female', 'cdevin4l@wp.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (254, 'Nisse', 6, 'Female', 'ngostyke4y@w3.org', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (351, 'Brand', 6, 'Male', 'bmacgiollapheadair23@unblog.fr', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (363, 'Whittaker', 6, 'Male', 'wcaltera2f@opensource.org', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (374, 'Veronika', 6, 'Female', 'vsmythe2q@un.org', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (625, 'Peggie', 7, 'Female', 'pchalles45@tumblr.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (648, 'Gareth', 7, 'Male', 'gphoebe4s@ow.ly', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (649, 'Geoffry', 7, 'Male', 'gstaniforth4t@123-reg.co.uk', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (661, 'Nicholle', 7, 'Female', 'npiggrem55@cornell.edu', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (662, 'Walden', 7, 'Male', 'wmulrooney56@mac.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (729, 'Gauthier', 7, 'Male', 'gsnoden1h@berkeley.edu', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (733, 'Gisele', 7, 'Female', 'gmynard1l@issuu.com', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (739, 'Doreen', 7, 'Female', 'dreubel1r@ow.ly', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (853, 'Isobel', 7, 'Female', 'istansell4x@npr.org', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (860, 'Faythe', 7, 'Female', 'fbenedito54@irs.gov', 2);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (483, 'Lianne', 8, 'Female', 'lpettisall7@goo.ne.jp', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (490, 'Suzann', 8, 'Female', 'shoulaghane@csmonitor.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (499, 'Dall', 8, 'Male', 'dinchcombn@skyrock.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (507, 'Jasmine', 8, 'Female', 'jegleofgermanyv@ameblo.jp', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (533, 'Evelina', 8, 'Female', 'eroadknight1l@dyndns.org', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (539, 'Christabella', 8, 'Female', 'cjackes1r@google.pl', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (545, 'Ferrell', 8, 'Male', 'fgolightly1x@discuz.net', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (562, 'Elias', 8, 'Male', 'eharrad2e@about.me', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (593, 'Michele', 8, 'Female', 'mfritschmann39@patch.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (598, 'Drake', 8, 'Male', 'demanuelli3e@shareasale.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (610, 'Nelie', 8, 'Female', 'npoytres3q@printfriendly.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (614, 'Lyndsie', 8, 'Female', 'lbirds3u@ucoz.ru', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (638, 'Malia', 8, 'Female', 'mmcatamney4i@wsj.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (640, 'Brocky', 8, 'Male', 'bgreenshiels4k@so-net.ne.jp', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (645, 'Gretna', 8, 'Female', 'gsorbie4p@shutterfly.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (646, 'Mauricio', 8, 'Male', 'mlemonby4q@mediafire.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (659, 'Malanie', 8, 'Female', 'mjerrom53@weibo.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (676, 'Juliet', 8, 'Female', 'jquin0@booking.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (679, 'Nari', 8, 'Female', 'nfeasey3@hp.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (698, 'Theressa', 8, 'Female', 'tpohlingm@paginegialle.it', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (700, 'Amby', 8, 'Male', 'abaskeyfiedo@mashable.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (704, 'Garwin', 8, 'Male', 'gcabells@ezinearticles.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (707, 'Dewitt', 8, 'Male', 'dcheckleyv@mozilla.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (742, 'Colette', 8, 'Female', 'cinfantino1u@webeden.co.uk', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (764, 'Heddie', 8, 'Female', 'hnutbean2g@istockphoto.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (824, 'Augy', 8, 'Male', 'adibiagi44@booking.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (827, 'Wilfrid', 8, 'Male', 'wreace47@prnewswire.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (842, 'Elissa', 8, 'Female', 'eoxbury4m@prweb.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (856, 'Dannie', 8, 'Female', 'dechlin50@amazon.co.jp', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (857, 'Amery', 8, 'Male', 'acarman51@arstechnica.com', 3);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (401, 'Perceval', 6, 'Male', 'psapson3h@ft.com', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (706, 'Urbain', 6, 'Male', 'ustangelu@123-reg.co.uk', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (709, 'Tobit', 6, 'Male', 'tbachmannx@furl.net', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (747, 'Benson', 6, 'Male', 'boutridge1z@tamu.edu', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (751, 'Rawley', 6, 'Male', 'rskrine23@dailymail.co.uk', 1);
INSERT INTO public.students (student_id, name, age, gender, email_id, class_id) VALUES (754, 'Brien', 6, 'Male', 'bkewish26@barnesandnoble.com', 1);



-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--
INSERT INTO public.subjects (subject_id, name) VALUES (1, 'Hindi');
INSERT INTO public.subjects (subject_id, name) VALUES (2, 'English');
INSERT INTO public.subjects (subject_id, name) VALUES (4, 'Mathematics');
INSERT INTO public.subjects (subject_id, name) VALUES (5, 'Science');
INSERT INTO public.subjects (subject_id, name) VALUES (6, 'Chemistry');
INSERT INTO public.subjects (subject_id, name) VALUES (7, 'Biology');
INSERT INTO public.subjects (subject_id, name) VALUES (10, 'Sports');
INSERT INTO public.subjects (subject_id, name) VALUES (11, 'History');
INSERT INTO public.subjects (subject_id, name) VALUES (12, 'Geography');
INSERT INTO public.subjects (subject_id, name) VALUES (13, 'Computers');
INSERT INTO public.subjects (subject_id, name) VALUES (3, 'Arts');
INSERT INTO public.subjects (subject_id, name) VALUES (9, 'General Knowledge');
INSERT INTO public.subjects (subject_id, name) VALUES (15, 'Environmental Studies');
INSERT INTO public.subjects (subject_id, name) VALUES (16, 'Social');
INSERT INTO public.subjects (subject_id, name) VALUES (14, 'Health');
INSERT INTO public.subjects (subject_id, name) VALUES (8, 'Physics');


-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (1, 'Alphonso', 55, 'Male', 'atruter0@hc360.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (2, 'Nelie', 50, 'Female', 'nredrup1@vk.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (3, 'Editha', 54, 'Female', 'echolwell2@pinterest.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (4, 'Beaufort', 45, 'Male', 'bsoigne3@reddit.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (5, 'Pauly', 44, 'Male', 'pharewood4@census.gov');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (6, 'Regen', 26, 'Male', 'rnussii5@rediff.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (7, 'Dayle', 34, 'Female', 'dpetrolli6@hc360.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (8, 'Caron', 35, 'Female', 'cfeldmann7@nba.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (9, 'Mallissa', 26, 'Female', 'mgontier8@ameblo.jp');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (10, 'Cally', 54, 'Female', 'cdyos9@ca.gov');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (11, 'Nedda', 32, 'Female', 'nwoolagera@free.fr');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (12, 'Hoebart', 30, 'Male', 'hissitb@ucsd.edu');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (13, 'Katheryn', 39, 'Female', 'kwilksc@reference.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (14, 'Berrie', 38, 'Female', 'bsemand@yellowpages.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (15, 'Enoch', 26, 'Male', 'efurbye@earthlink.net');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (16, 'Thekla', 50, 'Female', 'tdarthef@sun.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (17, 'Gabe', 46, 'Male', 'goreheadg@gravatar.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (18, 'Killy', 51, 'Male', 'khammentsh@posterous.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (19, 'Melania', 43, 'Female', 'mbandi@cdc.gov');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (20, 'Hatty', 44, 'Female', 'hchildrenj@google.pl');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (21, 'Emmie', 27, 'Female', 'escamerdinek@over-blog.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (22, 'Glenda', 39, 'Female', 'gposseltl@artisteer.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (23, 'Harris', 47, 'Male', 'hglassonm@hexun.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (24, 'Tally', 36, 'Male', 'tlevanen@va.gov');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (25, 'Doug', 54, 'Male', 'dgogartyo@mozilla.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (26, 'Lorant', 47, 'Male', 'lbollandsp@twitter.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (27, 'Amandi', 53, 'Female', 'acouttesq@usatoday.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (28, 'Parnell', 32, 'Male', 'papplefordr@google.fr');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (29, 'Brunhilde', 43, 'Female', 'bkeniwells@dagondesign.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (30, 'Nata', 50, 'Female', 'nrihosekt@ebay.co.uk');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (31, 'Austina', 51, 'Female', 'amatthausu@alexa.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (32, 'Marvin', 26, 'Male', 'mgrishakovv@bravesites.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (33, 'Elvis', 34, 'Male', 'efolkerdw@indiegogo.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (34, 'Sigfrid', 54, 'Male', 'ssweetmanx@addtoany.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (35, 'Doralia', 53, 'Female', 'dclellandy@ucoz.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (36, 'Maurita', 52, 'Female', 'mbeardshallz@latimes.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (37, 'Mohammed', 40, 'Male', 'mbritnell10@va.gov');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (38, 'Maryl', 53, 'Female', 'myannikov11@1und1.de');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (39, 'Christian', 55, 'Female', 'creisenstein12@comsenz.com');
INSERT INTO public.teachers (teacher_id, name, age, gender, email_id) VALUES (40, 'Andree', 44, 'Female', 'aoneal13@icio.us');



-- Data for Name: class_subjects_teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (2, 5, 5);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (3, 5, 5);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (7, 10, 26);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (7, 13, 27);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (7, 14, 28);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (7, 15, 28);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (7, 16, 29);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (8, 1, 29);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (8, 2, 29);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (8, 4, 30);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (1, 4, 30);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (8, 5, 31);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (8, 6, 32);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (8, 7, 32);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (8, 9, 34);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (8, 10, 34);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (8, 12, 34);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (5, 8, 8);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (8, 13, 35);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (6, 16, 35);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (3, 4, 35);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (8, 16, 36);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (9, 1, 36);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (1, 9, 9);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (9, 2, 37);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (10, 2, 38);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (9, 5, 38);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (9, 6, 39);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (4, 9, 9);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (10, 6, 39);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (10, 7, 40);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (9, 7, 40);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (10, 10, 5);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (9, 11, 25);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (9, 12, 6);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (10, 12, 10);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (10, 13, 10);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (9, 13, 12);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (9, 15, 15);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (10, 15, 15);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (3, 1, 1);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (10, 16, 30);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (6, 1, 1);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (10, 1, 1);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (1, 2, 2);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (6, 2, 2);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (2, 2, 37);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (2, 3, 3);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (3, 2, 38);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (4, 3, 3);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (2, 4, 4);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (4, 1, 27);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (5, 1, 27);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (5, 5, 20);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (6, 4, 4);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (4, 5, 21);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (6, 13, 17);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (9, 16, 17);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (3, 11, 11);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (1, 14, 14);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (4, 15, 15);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (2, 16, 16);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (5, 16, 16);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (1, 1, 17);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (2, 1, 18);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (1, 3, 19);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (3, 3, 20);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (5, 4, 21);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (6, 8, 22);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (6, 9, 22);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (7, 9, 23);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (7, 1, 23);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (7, 2, 23);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (7, 4, 24);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (7, 8, 25);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (7, 7, 25);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (8, 15, 18);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (9, 4, 11);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (10, 4, 12);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (10, 5, 33);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (9, 10, 33);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (1, 15, 7);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (2, 15, 7);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (3, 15, 6);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (6, 15, 8);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (4, 2, 13);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (5, 2, 13);
INSERT INTO public.class_subjects_teachers (class_id, subject_id, teacher_id) VALUES (4, 4, 26);

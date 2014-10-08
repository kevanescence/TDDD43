CREATE TABLE Experts
(
id	int IDENTITY(1,1) PRIMARY KEY,
name varchar(100) NOT NULL,
email varchar(50) UNIQUE,
expert_description text
);

CREATE TABLE Topics
(
id int IDENTITY(1,1) PRIMARY KEY,
name varchar(50) NOT NULL UNIQUE,
topic_description text,
originator int FOREIGN KEY REFERENCES Experts(id)
);

CREATE TABLE Subtopics
(
parent_id int FOREIGN KEY REFERENCES Topics(id),
child_id int FOREIGN KEY REFERENCES Topics(id),
CONSTRAINT pk_subtopics PRIMARY KEY (parent_id, child_id)
);

CREATE TABLE Expert_in
(
expert_id int FOREIGN KEY REFERENCES Experts(id),
topic_id int FOREIGN KEY REFERENCES Topics(id),
CONSTRAINT pk_experts_in PRIMARY KEY (expert_id, topic_id)
);

CREATE TABLE Recommends
(
recommender int FOREIGN KEY REFERENCES Experts(id),
recommended int FOREIGN KEY REFERENCES Experts(id),
comment text,
CONSTRAINT pk_recommends PRIMARY KEY (recommender, recommended)
);
DELETE FROM Topics;	
DELETE FROM Experts;

INSERT INTO Experts(name,email) 
VALUES  ('Elsa VERSAIRE', 'elsav@outlook.com'), -- -8
		('Rose VERSAIRE', 'rosev@outlook.com'),
		('Laure VERSAIRE', 'laurev@outlook.com'),
		('Annie VERSAIRE', 'anniev@outlook.com'),
		('Jean-Michel MARTIN', 'jmm@gmail.com'), --4
		('Jean-Jacques De Compostelle', 'jjc@hotmail.com'),
		('Rémy MARTIN', 'rm@yahoo.fr'),
		('Bernard DUPONT', 'lebogossedu38@gmail.com'),
		('Yvon ANCHIER', 'ya@outlook.com');
		
		
	
INSERT INTO Topics(name, topic_description, originator)
VALUES  ('Management' , 'Learn to lead a team', IDENT_CURRENT( 'Experts' ) - 6), -- -13
		('Human science' , 'All HS fields', IDENT_CURRENT( 'Experts' ) - 7),
		('Psychology' , 'Learn how people minds work', IDENT_CURRENT( 'Experts' ) - 6),
		('Communication' , 'How to solve communication issues', IDENT_CURRENT( 'Experts' ) - 8),-- -10
		('Advertising' , 'Learn how to drive people into buying our product', IDENT_CURRENT( 'Experts' ) - 6), 
		('Marketing' , 'How people can have a good image of our product', IDENT_CURRENT( 'Experts' ) - 7),
		('SQL', 'Language for data bases', IDENT_CURRENT( 'Experts' ) - 4 ),
		('Algorithm', 'How algorithm work', IDENT_CURRENT( 'Experts' ) - 2 ),
		('Data structures', 'Basic data structures', IDENT_CURRENT( 'Experts' ) - 2 ), -- -5
		('Parallel programming', 'Parallel algorithms', IDENT_CURRENT( 'Experts' ) - 1 ), 
		('DB', 'All data bases technologies',IDENT_CURRENT( 'Experts' ) - 4 ),
		('CS', 'Computer science' ,IDENT_CURRENT( 'Experts' ) - 2),
		('UML', 'Unified modeling language', IDENT_CURRENT( 'Experts' ) - 1),
		('Software engineering', 'Software engineering', IDENT_CURRENT( 'Experts' ));

delete from Expert_in;
-- topic's originator is an expert of this topic
INSERT INTO Expert_in (topic_id, expert_id)
VALUES		(IDENT_CURRENT( 'Topics' ) - 13, IDENT_CURRENT( 'Experts' ) - 6),
		(IDENT_CURRENT( 'Topics' ) - 12, IDENT_CURRENT( 'Experts' ) - 7),
		(IDENT_CURRENT( 'Topics' ) - 11, IDENT_CURRENT( 'Experts' ) - 6),
		(IDENT_CURRENT( 'Topics' ) - 10, IDENT_CURRENT( 'Experts' ) - 8),
		(IDENT_CURRENT( 'Topics' ) - 9, IDENT_CURRENT( 'Experts' ) - 6),
		(IDENT_CURRENT( 'Topics' ) - 8, IDENT_CURRENT( 'Experts' ) - 7),
		(IDENT_CURRENT( 'Topics' ) - 7, IDENT_CURRENT( 'Experts' ) - 4),
		(IDENT_CURRENT( 'Topics' ) - 6, IDENT_CURRENT( 'Experts' ) - 2),
		(IDENT_CURRENT( 'Topics' ) - 5, IDENT_CURRENT( 'Experts' ) - 2),
		(IDENT_CURRENT( 'Topics' ) - 4, IDENT_CURRENT( 'Experts' ) - 1),
		(IDENT_CURRENT( 'Topics' ) - 3, IDENT_CURRENT( 'Experts' ) - 4),
		(IDENT_CURRENT( 'Topics' ) - 2, IDENT_CURRENT( 'Experts' ) - 2),
		(IDENT_CURRENT( 'Topics' ) - 1, IDENT_CURRENT( 'Experts' ) - 1),
		(IDENT_CURRENT( 'Topics' ), IDENT_CURRENT( 'Experts' ));

-- aditional experts association
INSERT INTO Expert_in (expert_id, topic_id)
VALUES  (IDENT_CURRENT( 'Experts' ) - 8, IDENT_CURRENT( 'Topics' )-13),
		(IDENT_CURRENT( 'Experts' ) - 8, IDENT_CURRENT( 'Topics' )-11),
		(IDENT_CURRENT( 'Experts' ) - 5, IDENT_CURRENT( 'Topics' )-10),
		(IDENT_CURRENT( 'Experts' ) - 3, IDENT_CURRENT( 'Topics' )-1),
		(IDENT_CURRENT( 'Experts' ) - 2, IDENT_CURRENT( 'Topics' )-4),
		(IDENT_CURRENT( 'Experts' ) - 1, IDENT_CURRENT( 'Topics' )-2),
		(IDENT_CURRENT( 'Experts' ), IDENT_CURRENT( 'Topics' )-1);


INSERT INTO Subtopics(parent_id, child_id)
VALUES (IDENT_CURRENT( 'Topics') -12, IDENT_CURRENT( 'Topics' )-13),
	   (IDENT_CURRENT( 'Topics') -11, IDENT_CURRENT( 'Topics' )-13),
	   (IDENT_CURRENT( 'Topics') -12, IDENT_CURRENT( 'Topics' )-11),
	   (IDENT_CURRENT( 'Topics') -12, IDENT_CURRENT( 'Topics' )-10),
	   (IDENT_CURRENT( 'Topics') -8, IDENT_CURRENT( 'Topics' )-9),
	   (IDENT_CURRENT( 'Topics') -2, IDENT_CURRENT( 'Topics' )-7),
	   (IDENT_CURRENT( 'Topics') -3, IDENT_CURRENT( 'Topics' )-7),
	   (IDENT_CURRENT( 'Topics') -2, IDENT_CURRENT( 'Topics' )-8),
	   
	   (IDENT_CURRENT( 'Topics') -6, IDENT_CURRENT( 'Topics' )-5),
	   (IDENT_CURRENT( 'Topics') -2, IDENT_CURRENT( 'Topics' )-5),
	   
	   (IDENT_CURRENT( 'Topics') -5, IDENT_CURRENT( 'Topics' )-4),
	   (IDENT_CURRENT( 'Topics') -2, IDENT_CURRENT( 'Topics' )-4),
	   
		(IDENT_CURRENT( 'Topics' )-2, IDENT_CURRENT( 'Topics' ) - 3),
		(IDENT_CURRENT( 'Topics') -2, IDENT_CURRENT( 'Topics' ) - 1 ),
		(IDENT_CURRENT( 'Topics'), IDENT_CURRENT( 'Topics' ) - 1 ),
		(IDENT_CURRENT( 'Topics') - 2, IDENT_CURRENT( 'Topics' ));
		
delete from Recommends;
INSERT INTO Recommends(recommender, recommended)
VALUES (IDENT_CURRENT( 'Experts' ) - 8, IDENT_CURRENT( 'Experts' ) - 3),
		(IDENT_CURRENT( 'Experts' ) - 7, IDENT_CURRENT( 'Experts' ) - 3),
		(IDENT_CURRENT( 'Experts' ) - 6, IDENT_CURRENT( 'Experts' ) - 1),
		(IDENT_CURRENT( 'Experts' ) - 7, IDENT_CURRENT( 'Experts' ) - 1),
		(IDENT_CURRENT( 'Experts' ) - 4, IDENT_CURRENT( 'Experts' ) - 1),
		(IDENT_CURRENT( 'Experts' ) - 3, IDENT_CURRENT( 'Experts' ) - 1);
		
INSERT INTO Recommends(recommender, recommended, comment)
VALUES  (IDENT_CURRENT( 'Experts' ) - 4, IDENT_CURRENT( 'Experts' ) - 7, 'never late' ),
		(IDENT_CURRENT( 'Experts' ) - 2, IDENT_CURRENT( 'Experts' ) - 6, 'serious at job'),
		(IDENT_CURRENT( 'Experts' ) - 3, IDENT_CURRENT( 'Experts' ) - 6, 'has lot of experience'),
		(IDENT_CURRENT( 'Experts' ) - 3, IDENT_CURRENT( 'Experts' ) - 5, 'know to learn people'),
		(IDENT_CURRENT( 'Experts' ) - 3, IDENT_CURRENT( 'Experts' ) - 2, 'a cool comment');
		
											
select  topic_id, expert_id from Expert_in order by topic_id ;
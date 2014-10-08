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
VALUES ('Jean-Michel MARTIN', 'jmm@gmail.com'),
		('Jean-Jacques De Compostelle', 'jjc@hotmail.com'),
		('Rémy MARTIN', 'rm@yahoo.fr'),
		('Bernard DUPONT', 'lebogossedu38@gmail.com'),
		('Yvon ANCHIER', 'ya@outlook.com');
		
	
INSERT INTO Topics(name, topic_description, originator)
VALUES ('SQL', 'Language for data bases', IDENT_CURRENT( 'Experts' ) - 4 ),
		('DB', 'All data bases technologies',IDENT_CURRENT( 'Experts' ) - 4 ),
		('CS', 'Computer science' ,IDENT_CURRENT( 'Experts' ) - 2),
		('UML', 'Unified modeling language', IDENT_CURRENT( 'Experts' ) - 1),
		('Software engineering', 'Software engineering', IDENT_CURRENT( 'Experts' ));
		
INSERT INTO Expert_in (expert_id, topic_id)
VALUES (IDENT_CURRENT( 'Experts' ) - 4, IDENT_CURRENT( 'Topics' )-4),
		(IDENT_CURRENT( 'Experts' ) - 4, IDENT_CURRENT( 'Topics' )-3),
		(IDENT_CURRENT( 'Experts' ) - 3, IDENT_CURRENT( 'Topics' )-2),
		(IDENT_CURRENT( 'Experts' ), IDENT_CURRENT( 'Topics' )-1),
		(IDENT_CURRENT( 'Experts' ), IDENT_CURRENT( 'Topics' ));
		
INSERT INTO Subtopics(parent_id, child_id)
VALUES (IDENT_CURRENT( 'Topics') -3, IDENT_CURRENT( 'Topics' )-4),
		(IDENT_CURRENT( 'Topics' )-2, IDENT_CURRENT( 'Topics' ) - 3),
		(IDENT_CURRENT( 'Topics' ), IDENT_CURRENT( 'Topics' ) - 1),
		(IDENT_CURRENT( 'Topics') -2, IDENT_CURRENT( 'Topics' ));
		
INSERT INTO Recommends(recommender, recommended)
VALUES (IDENT_CURRENT( 'Experts' ) - 4, IDENT_CURRENT( 'Experts' ) - 3),
		(IDENT_CURRENT( 'Experts' ) - 2, IDENT_CURRENT( 'Experts' ) - 3),
		(IDENT_CURRENT( 'Experts' ) - 3, IDENT_CURRENT( 'Experts' ) - 1);

		
		
		



USE master;
GO
DROP DATABASE IF EXISTS Anime_Quiz;

CREATE DATABASE Anime_Quiz;
GO

USE Anime_Quiz;
GO

CREATE TABLE questions (
        question_id int IDENTITY(1, 1) NOT NULL,
        question_text varchar(300) NOT NULL,
	CONSTRAINT PK_question_id PRIMARY KEY(question_id)
	);
	
CREATE TABLE answers (
        answer_id int IDENTITY(1, 1) NOT NULL,
        question_id int NOT NULL,
	answer_text varchar(100) NOT NULL,
        sincerity_vs_satire_impact int NOT NULL,
	light_vs_heavy_impact int NOT NULL,
	surface_vs_depth_impact int NOT NULL,
	optimism_vs_pessimism_impact int NOT NULL,
	fantasy_vs_reality_impact int NOT NULL,
	sentimentality_impact int NOT NULL,
	humor_impact int NOT NULL,
	romance_impact int NOT NULL,
	controversy_impact int NOT NULL,
	CONSTRAINT PK_answer_id PRIMARY KEY(answer_id),
	CONSTRAINT FK_questions_answers FOREIGN KEY(question_id) REFERENCES questions (question_id)
	);


USE master;
GO
DROP DATABASE IF EXISTS Anime_Shows;

CREATE DATABASE Anime_Shows;
GO

USE Anime_Shows;
GO

CREATE TABLE anime_shows (
    show_id int IDENTITY(1, 1) NOT NULL,
	show_title varchar(100) NOT NULL,
    sincerity_vs_satire_score int NOT NULL,
	light_vs_heavy_score int NOT NULL,
	surface_vs_depth_score int NOT NULL,
	optimism_vs_pessimism_score int NOT NULL,
	fantasy_vs_reality_score int NOT NULL,
	sentimentality_score int NOT NULL,
	humor_score int NOT NULL,
	romance_score int NOT NULL,
	controversy_score int NOT NULL,
	description varchar(2000) NOT NULL,
	CONSTRAINT PK_show_title PRIMARY KEY(show_id));
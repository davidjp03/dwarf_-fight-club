CREATE DATABASE dwarf_fight_club;

CREATE TABLE Fighters (
    fighter_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    league VARCHAR(50),
    wins INT DEFAULT 0
);

CREATE TABLE Weapons (
    weapon_id SERIAL PRIMARY KEY,
    weapon_name VARCHAR(100),
    times_used INT DEFAULT 0
);

CREATE TABLE Environments (
    environment_id SERIAL PRIMARY KEY,
    environment_name VARCHAR(100),
    fights_held INT DEFAULT 0
);

CREATE TABLE Fights (
    fight_id SERIAL PRIMARY KEY,
    environment_id INT REFERENCES Environments(environment_id),
    ai_used BOOLEAN
);

CREATE TABLE Fight_Participants (
    fight_id INT REFERENCES Fights(fight_id),
    fighter_id INT REFERENCES Fighters(fighter_id),
    weapon_id INT REFERENCES Weapons(weapon_id)
);

INSERT INTO Fighters (name, league, wins)
VALUES
('LeBron James', 'NBA', 10),
('Kobe Bryant', 'NBA', 12),
('Pau Gasol', 'NBA', 8),
('Stephen Curry', 'NBA', 15),
('John Doe', 'ACB', 6),
('Jane Smith', 'MMA', 9);

INSERT INTO Weapons (weapon_name, times_used)
VALUES
('Sword', 5),
('Shield', 3),
('Laser Gun', 7),
('AI Robot', 4);

INSERT INTO Environments (environment_name, fights_held)
VALUES
('Steel Cage Warehouse', 6),
('Skyline Roof Arena', 4),
('Tech Lab', 3),
('Concrete Jungle', 8);

INSERT INTO Fights (environment_id, ai_used)
VALUES
(1, TRUE),
(2, FALSE),
(3, TRUE),
(4, FALSE),
(1, FALSE),
(2, TRUE);

INSERT INTO Fight_Participants (fight_id, fighter_id, weapon_id)
VALUES
(1, 1, 4),  -- LeBron James usando AI Robot en la pelea 1
(1, 2, 1),  -- Kobe Bryant usando Sword en la pelea 1
(2, 3, 2),  -- Pau Gasol usando Shield en la pelea 2
(3, 4, 4),  -- Stephen Curry usando AI Robot en la pelea 3
(4, 5, 3),  -- John Doe usando Laser Gun en la pelea 4
(5, 6, 1);  -- Jane Smith usando Sword en la pelea 5

--All NBA fighters
SELECT name FROM Fighters WHERE league = 'NBA';

--Fighter with the most wins
SELECT name FROM Fighters ORDER BY wins DESC LIMIT 1;

--Most used weapon
SELECT weapon_name FROM Weapons ORDER BY times_used DESC LIMIT 1;

--the environment that has hosted the most fights
SELECT environment_name FROM Environments ORDER BY fights_held DESC LIMIT 1;

--Fights where an AI robot was used as a weapon
SELECT fight_id FROM Fights WHERE ai_used = TRUE;


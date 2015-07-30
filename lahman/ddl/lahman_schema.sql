-- ----------------------------
--  Table structure for AllstarFull
-- ----------------------------
DROP TABLE IF EXISTS AllstarFull;
CREATE TABLE AllstarFull (
	playerID varchar(9) NOT NULL,
	yearID int NOT NULL,
	gameNum int NOT NULL,
	gameID varchar(12),
	teamID varchar(3),
	lgID varchar(2),
	GP int,
	startingPos int
);

-- ----------------------------
--  Table structure for Appearances
-- ----------------------------
DROP TABLE IF EXISTS Appearances;
CREATE TABLE Appearances (
	yearID int NOT NULL,
	teamID varchar(3) NOT NULL,
	lgID varchar(2),
	playerID varchar(9) NOT NULL,
	G_all int,
	GS int,
	G_batting int,
	G_defense int,
	G_p int,
	G_c int,
	G_1b int,
	G_2b int,
	G_3b int,
	G_ss int,
	G_lf int,
	G_cf int,
	G_rf int,
	G_of int,
	G_dh int,
	G_ph int,
	G_pr int
);

-- ----------------------------
--  Table structure for AwardsManagers
-- ----------------------------
DROP TABLE IF EXISTS AwardsManagers;
CREATE TABLE AwardsManagers (
	playerID varchar(10) NOT NULL,
	awardID varchar(75) NOT NULL,
	yearID int NOT NULL,
	lgID varchar(2) NOT NULL,
	tie varchar(1),
	notes varchar(100)
);

-- ----------------------------
--  Table structure for AwardsPlayers
-- ----------------------------
DROP TABLE IF EXISTS AwardsPlayers;
CREATE TABLE AwardsPlayers (
	playerID varchar(9) NOT NULL,
	awardID varchar(255) NOT NULL,
	yearID int NOT NULL,
	lgID varchar(2) NOT NULL,
	tie varchar(1),
	notes varchar(100)
);

-- ----------------------------
--  Table structure for AwardsShareManagers
-- ----------------------------
DROP TABLE IF EXISTS AwardsShareManagers;
CREATE TABLE AwardsShareManagers (
	awardID varchar(25) NOT NULL,
	yearID int NOT NULL,
	lgID varchar(2) NOT NULL,
	playerID varchar(10) NOT NULL,
	pointsWon int,
	pointsMax int,
	votesFirst int
);

-- ----------------------------
--  Table structure for AwardsSharePlayers
-- ----------------------------
DROP TABLE IF EXISTS AwardsSharePlayers;
CREATE TABLE AwardsSharePlayers (
	awardID varchar(25) NOT NULL,
	yearID int NOT NULL,
	lgID varchar(2) NOT NULL,
	playerID varchar(9) NOT NULL,
	pointsWon float8,
	pointsMax int,
	votesFirst float8
);

-- ----------------------------
--  Table structure for Batting
-- ----------------------------
DROP TABLE IF EXISTS Batting;
CREATE TABLE Batting (
	playerID varchar(9) NOT NULL,
	yearID int NOT NULL,
	stint int NOT NULL,
	teamID varchar(3),
	lgID varchar(2),
	G int,
	G_batting int,
	AB int,
	R int,
	H int,
	2B int,
	3B int,
	HR int,
	RBI int,
	SB int,
	CS int,
	BB int,
	SO int,
	IBB int,
	HBP int,
	SH int,
	SF int,
	GIDP int,
	G_old int
);

-- ----------------------------
--  Table structure for BattingPost
-- ----------------------------
DROP TABLE IF EXISTS BattingPost;
CREATE TABLE BattingPost (
	yearID int NOT NULL,
	round varchar(10) NOT NULL,
	playerID varchar(9) NOT NULL,
	teamID varchar(3),
	lgID varchar(2),
	G int,
	AB int,
	R int,
	H int,
	2B int,
	3B int,
	HR int,
	RBI int,
	SB int,
	CS int,
	BB int,
	SO int,
	IBB int,
	HBP int,
	SH int,
	SF int,
	GIDP int
);

-- ----------------------------
--  Table structure for CollegePlaying
-- ----------------------------
DROP TABLE IF EXISTS CollegePlaying;
CREATE TABLE CollegePlaying (
	playerID varchar(9),
	schoolID varchar(15),
	yearID int
);

-- ----------------------------
--  Table structure for Fielding
-- ----------------------------
DROP TABLE IF EXISTS Fielding;
CREATE TABLE Fielding (
	playerID varchar(9) NOT NULL,
	yearID int NOT NULL,
	stint int NOT NULL,
	teamID varchar(3),
	lgID varchar(2),
	POS varchar(2) NOT NULL,
	G int,
	GS int,
	InnOuts int,
	PO int,
	A int,
	E int,
	DP int,
	PB int,
	WP int,
	SB int,
	CS int,
	ZR float8
);

-- ----------------------------
--  Table structure for FieldingOF
-- ----------------------------
DROP TABLE IF EXISTS FieldingOF;
CREATE TABLE FieldingOF (
	playerID varchar(9) NOT NULL,
	yearID int NOT NULL,
	stint int NOT NULL,
	Glf int,
	Gcf int,
	Grf int
);

-- ----------------------------
--  Table structure for FieldingPost
-- ----------------------------
DROP TABLE IF EXISTS FieldingPost;
CREATE TABLE FieldingPost (
	playerID varchar(9) NOT NULL,
	yearID int NOT NULL,
	teamID varchar(3),
	lgID varchar(2),
	round varchar(10) NOT NULL,
	POS varchar(2) NOT NULL,
	G int,
	GS int,
	InnOuts int,
	PO int,
	A int,
	E int,
	DP int,
	TP int,
	PB int,
	SB int,
	CS int
);

-- ----------------------------
--  Table structure for HallOfFame
-- ----------------------------
DROP TABLE IF EXISTS HallOfFame;
CREATE TABLE HallOfFame (
	playerID varchar(10) NOT NULL,
	yearid int NOT NULL,
	votedBy varchar(64) NOT NULL,
	ballots int,
	needed int,
	votes int,
	inducted varchar(1),
	category varchar(20),
	needed_note varchar(25)
);

-- ----------------------------
--  Table structure for Managers
-- ----------------------------
DROP TABLE IF EXISTS Managers;
CREATE TABLE Managers (
	playerID varchar(10),
	yearID int NOT NULL,
	teamID varchar(3) NOT NULL,
	lgID varchar(2),
	inseason int NOT NULL,
	G int,
	W int,
	L int,
	rank int,
	plyrMgr varchar(1)
);

-- ----------------------------
--  Table structure for ManagersHalf
-- ----------------------------
DROP TABLE IF EXISTS ManagersHalf;
CREATE TABLE ManagersHalf (
	playerID varchar(10) NOT NULL,
	yearID int NOT NULL,
	teamID varchar(3) NOT NULL,
	lgID varchar(2),
	inseason int,
	half int NOT NULL,
	G int,
	W int,
	L int,
	rank int
);

-- ----------------------------
--  Table structure for Master
-- ----------------------------
DROP TABLE IF EXISTS Master;
CREATE TABLE Master (
	playerID varchar(10) NOT NULL,
	birthYear int,
	birthMonth int,
	birthDay int,
	birthCountry varchar(50),
	birthState varchar(2),
	birthCity varchar(50),
	deathYear int,
	deathMonth int,
	deathDay int,
	deathCountry varchar(50),
	deathState varchar(2),
	deathCity varchar(50),
	nameFirst varchar(50),
	nameLast varchar(50),
	nameGiven varchar(255),
	weight int,
	height float8,
	bats varchar(1),
	throws varchar(1),
	debut timestamp NULL,
	finalGame timestamp NULL,
	retroID varchar(9),
	bbrefID varchar(9)
);

-- ----------------------------
--  Table structure for Pitching
-- ----------------------------
DROP TABLE IF EXISTS Pitching;
CREATE TABLE Pitching (
	playerID varchar(9) NOT NULL,
	yearID int NOT NULL,
	stint int NOT NULL,
	teamID varchar(3),
	lgID varchar(2),
	W int,
	L int,
	G int,
	GS int,
	CG int,
	SHO int,
	SV int,
	IPouts int,
	H int,
	ER int,
	HR int,
	BB int,
	SO int,
	BAOpp float8,
	ERA float8,
	IBB int,
	WP int,
	HBP int,
	BK int,
	BFP int,
	GF int,
	R int,
	SH int,
	SF int,
	GIDP int
);

-- ----------------------------
--  Table structure for PitchingPost
-- ----------------------------
DROP TABLE IF EXISTS PitchingPost;
CREATE TABLE PitchingPost (
	playerID varchar(9) NOT NULL,
	yearID int NOT NULL,
	round varchar(10) NOT NULL,
	teamID varchar(3),
	lgID varchar(2),
	W int,
	L int,
	G int,
	GS int,
	CG int,
	SHO int,
	SV int,
	IPouts int,
	H int,
	ER int,
	HR int,
	BB int,
	SO int,
	BAOpp float8,
	ERA float8,
	IBB int,
	WP int,
	HBP int,
	BK int,
	BFP int,
	GF int,
	R int,
	SH int,
	SF int,
	GIDP int
);

-- ----------------------------
--  Table structure for Salaries
-- ----------------------------
DROP TABLE IF EXISTS Salaries;
CREATE TABLE Salaries (
	yearID int NOT NULL,
	teamID varchar(3) NOT NULL,
	lgID varchar(2) NOT NULL,
	playerID varchar(9) NOT NULL,
	salary float8
);

-- ----------------------------
--  Table structure for Schools
-- ----------------------------
DROP TABLE IF EXISTS Schools;
CREATE TABLE Schools (
	schoolID varchar(15) NOT NULL,
	name_full varchar(255),
	city varchar(55),
	state varchar(55),
	country varchar(55)
);

-- ----------------------------
--  Table structure for SeriesPost
-- ----------------------------
DROP TABLE IF EXISTS SeriesPost;
CREATE TABLE SeriesPost (
	yearID int NOT NULL,
	round varchar(5) NOT NULL,
	teamIDwinner varchar(3),
	lgIDwinner varchar(2),
	teamIDloser varchar(3),
	lgIDloser varchar(2),
	wins int,
	losses int,
	ties int
);

-- ----------------------------
--  Table structure for Teams
-- ----------------------------
DROP TABLE IF EXISTS Teams;
CREATE TABLE Teams (
	yearID int NOT NULL,
	lgID varchar(2) NOT NULL,
	teamID varchar(3) NOT NULL,
	franchID varchar(3),
	divID varchar(1),
	Rank int,
	G int,
	Ghome int,
	W int,
	L int,
	DivWin varchar(1),
	WCWin varchar(1),
	LgWin varchar(1),
	WSWin varchar(1),
	R int,
	AB int,
	H int,
	2B int,
	3B int,
	HR int,
	BB int,
	SO int,
	SB int,
	CS int,
	HBP int,
	SF int,
	RA int,
	ER int,
	ERA float8,
	CG int,
	SHO int,
	SV int,
	IPouts int,
	HA int,
	HRA int,
	BBA int,
	SOA int,
	E int,
	DP int,
	FP float8,
	name varchar(50),
	park varchar(255),
	attendance int,
	BPF int,
	PPF int,
	teamIDBR varchar(3),
	teamIDlahman45 varchar(3),
	teamIDretro varchar(3)
);

-- ----------------------------
--  Table structure for TeamsFranchises
-- ----------------------------
DROP TABLE IF EXISTS TeamsFranchises;
CREATE TABLE TeamsFranchises (
	franchID varchar(3) NOT NULL,
	franchName varchar(50),
	active varchar(2),
	NAassoc varchar(3)
);

-- ----------------------------
--  Table structure for TeamsHalf
-- ----------------------------
DROP TABLE IF EXISTS TeamsHalf;
CREATE TABLE TeamsHalf (
	yearID int NOT NULL,
	lgID varchar(2) NOT NULL,
	teamID varchar(3) NOT NULL,
	Half varchar(1) NOT NULL,
	divID varchar(1),
	DivWin varchar(1),
	Rank int,
	G int,
	W int,
	L int
);

-- ----------------------------
--  Primary key structure for table AllstarFull
-- ----------------------------
ALTER TABLE AllstarFull ADD PRIMARY KEY (playerID, yearID, gameNum) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table Appearances
-- ----------------------------
ALTER TABLE Appearances ADD PRIMARY KEY (yearID, teamID, playerID) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table AwardsManagers
-- ----------------------------
ALTER TABLE AwardsManagers ADD PRIMARY KEY (yearID, awardID, lgID, playerID) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table AwardsPlayers
-- ----------------------------
ALTER TABLE AwardsPlayers ADD PRIMARY KEY (yearID, awardID, lgID, playerID) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table AwardsShareManagers
-- ----------------------------
ALTER TABLE AwardsShareManagers ADD PRIMARY KEY (awardID, yearID, lgID, playerID) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table AwardsSharePlayers
-- ----------------------------
ALTER TABLE AwardsSharePlayers ADD PRIMARY KEY (awardID, yearID, lgID, playerID) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table Batting
-- ----------------------------
ALTER TABLE Batting ADD PRIMARY KEY (playerID, yearID, stint) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table BattingPost
-- ----------------------------
ALTER TABLE BattingPost ADD PRIMARY KEY (yearID, round, playerID) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table Fielding
-- ----------------------------
ALTER TABLE Fielding ADD PRIMARY KEY (playerID, yearID, stint, POS) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table FieldingOF
-- ----------------------------
ALTER TABLE FieldingOF ADD PRIMARY KEY (playerID, yearID, stint) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table FieldingPost
-- ----------------------------
ALTER TABLE FieldingPost ADD PRIMARY KEY (playerID, yearID, round, POS) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table HallOfFame
-- ----------------------------
ALTER TABLE HallOfFame ADD PRIMARY KEY (playerID, yearid, votedBy) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table Managers
-- ----------------------------
ALTER TABLE Managers ADD PRIMARY KEY (yearID, teamID, inseason) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table ManagersHalf
-- ----------------------------
ALTER TABLE ManagersHalf ADD PRIMARY KEY (yearID, teamID, playerID, half) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table Master
-- ----------------------------
ALTER TABLE Master ADD PRIMARY KEY (playerID) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table Pitching
-- ----------------------------
ALTER TABLE Pitching ADD PRIMARY KEY (playerID, yearID, stint) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table PitchingPost
-- ----------------------------
ALTER TABLE PitchingPost ADD PRIMARY KEY (playerID, yearID, round) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table Salaries
-- ----------------------------
ALTER TABLE Salaries ADD PRIMARY KEY (yearID, teamID, lgID, playerID) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table Schools
-- ----------------------------
ALTER TABLE Schools ADD PRIMARY KEY (schoolID) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table SeriesPost
-- ----------------------------
ALTER TABLE SeriesPost ADD PRIMARY KEY (yearID, round) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table Teams
-- ----------------------------
ALTER TABLE Teams ADD PRIMARY KEY (yearID, lgID, teamID) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table TeamsFranchises
-- ----------------------------
ALTER TABLE TeamsFranchises ADD PRIMARY KEY (franchID) NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table TeamsHalf
-- ----------------------------
ALTER TABLE TeamsHalf ADD PRIMARY KEY (yearID, teamID, lgID, Half) NOT DEFERRABLE INITIALLY IMMEDIATE;


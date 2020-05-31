-- createdb ho
-- createuser ho

--ALTER USER ho WITH PASSWORD 'password';
--grant all privileges on database ho to ho;

-- Changes prior to 1.435 are ignored.

-- 1.435
CREATE TABLE SCOUT(
PLAYERID INTEGER NOT NULL,
NAME VARCHAR(127),
INFO VARCHAR(256) NOT NULL,
AGE INTEGER NOT NULL,
MARKTWERT INTEGER NOT NULL,
SPECIALITY INTEGER NOT NULL,
KONDITION INTEGER NOT NULL,
ERFAHRUNG INTEGER NOT NULL,
FORM INTEGER NOT NULL,
TORWART INTEGER NOT NULL,
VERTEIDIGUNG INTEGER NOT NULL,
SPIELAUFBAU INTEGER NOT NULL,
FLUEGEL INTEGER NOT NULL,
TORSCHUSS INTEGER NOT NULL,
PASSPIEL INTEGER NOT NULL,
STANDARDS INTEGER NOT NULL,
PRICE INTEGER NOT NULL,
DEADLINE TIMESTAMP NOT NULL,
WECKER BOOLEAN NOT NULL,
AGEDAYS INTEGER NOT NULL,
AGREEABILITY INTEGER NOT NULL,
BASEWAGE INTEGER NOT NULL,
NATIONALITY INTEGER NOT NULL,
LEADERSHIP INTEGER NOT NULL,
LOYALTY INTEGER NOT NULL,
MOTHERCLUB BOOLEAN NOT NULL);

CREATE TABLE MATCHLINEUPPENALTYTAKER(
PLAYERID INTEGER NOT NULL,
POS INTEGER NOT NULL,
LINEUPNAME VARCHAR(256) NOT NULL);

CREATE INDEX PENALTYTAKERS_3 ON MATCHLINEUPPENALTYTAKER(LINEUPNAME);

CREATE TABLE MATCHLINEUP(
MATCHID INTEGER NOT NULL PRIMARY KEY,
MATCHTYP INTEGER NOT NULL,
HEIMNAME VARCHAR(256) NOT NULL,
HEIMID INTEGER NOT NULL,
GASTNAME VARCHAR(256) NOT NULL,
GASTID INTEGER NOT NULL,
FETCHDATE VARCHAR(256) NOT NULL,
MATCHDATE VARCHAR(256) NOT NULL,
ARENAID INTEGER NOT NULL,
ARENANAME VARCHAR(256) NOT NULL);

CREATE INDEX IMATCHLINEUP_1 ON MATCHLINEUP(MATCHID);

CREATE TABLE MATCHSUBSTITUTION(
MATCHID INTEGER NOT NULL,
TEAMID INTEGER NOT NULL,
HRFID INTEGER NOT NULL,
PLAYERORDERID INTEGER NOT NULL,
PLAYERIN INTEGER NOT NULL,
PLAYEROUT INTEGER NOT NULL,
ORDERTYPE INTEGER NOT NULL,
MATCHMINUTECRITERIA INTEGER NOT NULL,
POS INTEGER NOT NULL,
BEHAVIOUR INTEGER NOT NULL,
CARD INTEGER NOT NULL,
STANDING INTEGER NOT NULL,
LINEUPNAME VARCHAR(256) NOT NULL);

CREATE INDEX IMATCHSUBSTITUTION_1 ON MATCHSUBSTITUTION(PLAYERORDERID);
CREATE INDEX IMATCHSUBSTITUTION_2 ON MATCHSUBSTITUTION(MATCHID,TEAMID);
CREATE INDEX IMATCHSUBSTITUTION_3 ON MATCHSUBSTITUTION(HRFID);

-- International friendly?
CREATE TABLE IFA_MATCHES(
MATCHID INTEGER NOT NULL PRIMARY KEY,
PLAYEDDATE VARCHAR(25) NOT NULL,
HOMETEAMID INTEGER NOT NULL,
AWAYTEAMID INTEGER NOT NULL,
HOMETEAMGOALS INTEGER NOT NULL,
AWAYTEAMGOALS INTEGER NOT NULL,
HOME_LEAGUEID INTEGER NOT NULL,
AWAY_LEAGUEID INTEGER NOT NULL);

-- Team Analyser favourite
CREATE TABLE TA_FAVORITE(
TEAMID INTEGER NOT NULL PRIMARY KEY,
NAME VARCHAR(20));

CREATE TABLE BASICS(
HRF_ID INTEGER NOT NULL PRIMARY KEY,
MANAGER VARCHAR(127) NOT NULL,
TEAMID INTEGER NOT NULL,
TEAMNAME VARCHAR(127) NOT NULL,
LAND INTEGER NOT NULL,
LIGA INTEGER NOT NULL,
SAISON INTEGER NOT NULL,
SPIELTAG INTEGER NOT NULL,
DATUM TIMESTAMP NOT NULL,
REGION INTEGER NOT NULL,
HASSUPPORTER BOOLEAN NOT NULL,
ACTIVATIONDATE TIMESTAMP);

CREATE INDEX IBASICS_1 ON BASICS(HRF_ID);
CREATE INDEX IBASICS_2 ON BASICS(DATUM);


CREATE TABLE FUTURETRAINING(
TYPE INTEGER NOT NULL,

INTENSITY INTEGER NOT NULL,

WEEK INTEGER NOT NULL,

SEASON INTEGER NOT NULL,

STAMINATRAININGPART INTEGER NOT NULL);

CREATE TABLE HRF(
HRF_ID INTEGER NOT NULL PRIMARY KEY,

NAME VARCHAR(256) NOT NULL,

DATUM TIMESTAMP NOT NULL);

CREATE INDEX IHRF_1 ON HRF(DATUM);


CREATE TABLE SPIELERNOTIZ(
SPIELERID INTEGER NOT NULL PRIMARY KEY,
NOTIZ VARCHAR(2048) NOT NULL,
SPIELBERECHTIGT BOOLEAN NOT NULL,
TEAMINFOSMILIE VARCHAR(127) NOT NULL,
MANUELLERSMILIE VARCHAR(127) NOT NULL,
USERPOS INTEGER NOT NULL);

CREATE INDEX ISPIELERNOTIZ_1 ON SPIELERNOTIZ(SPIELERID);

CREATE TABLE MODULE_CONFIGURATION(
CONFIG_KEY VARCHAR(50) NOT NULL PRIMARY KEY,
CONFIG_VALUE VARCHAR(256),
CONFIG_DATATYPE INTEGER NOT NULL);

CREATE TABLE HT_WORLDDETAILS(
LEAGUE_ID INTEGER NOT NULL PRIMARY KEY,
COUNTRY_ID INTEGER NOT NULL,
COUNTRYNAME VARCHAR(128) NOT NULL,
ACTIVE_USER INTEGER NOT NULL);

CREATE TABLE POSITIONEN(
HRF_ID INTEGER NOT NULL,
ID INTEGER NOT NULL,
AUFSTELLUNGSNAME VARCHAR(256) NOT NULL,
SPIELERID INTEGER NOT NULL,
TAKTIK INTEGER NOT NULL);

CREATE TABLE FINANZEN(
HRF_ID INTEGER NOT NULL PRIMARY KEY,
DATUM TIMESTAMP NOT NULL,
SUPPORTER INTEGER NOT NULL,
SPONSOREN INTEGER NOT NULL,
FINANZEN INTEGER NOT NULL,
EINSPONSOREN INTEGER NOT NULL,
EINZUSCHAUER INTEGER NOT NULL,
EINZINSEN INTEGER NOT NULL,
EINSONSTIGES INTEGER NOT NULL,
EINGESAMT INTEGER NOT NULL,
KOSTSPIELER INTEGER NOT NULL,
KOSTTRAINER INTEGER NOT NULL,
KOSTSTADION INTEGER NOT NULL,
KOSTJUGEND INTEGER NOT NULL,
KOSTZINSEN INTEGER NOT NULL,
KOSTSONSTIGES INTEGER NOT NULL,
KOSTGESAMT INTEGER NOT NULL,
GEWINNVERLUST INTEGER NOT NULL,
LETZTEEINSPONSOREN INTEGER NOT NULL,
LETZTEEINZUSCHAUER INTEGER NOT NULL,
LETZTEEINZINSEN INTEGER NOT NULL,
LETZTEEINSONSTIGES INTEGER NOT NULL,
LETZTEEINGESAMT INTEGER NOT NULL,
LETZTEKOSTSPIELER INTEGER NOT NULL,
LETZTEKOSTTRAINER INTEGER NOT NULL,
LETZTEKOSTSTADION INTEGER NOT NULL,
LETZTEKOSTJUGEND INTEGER NOT NULL,
LETZTEKOSTZINSEN INTEGER NOT NULL,
LETZTEKOSTSONSTIGES INTEGER NOT NULL,
LETZTEKOSTGESAMT INTEGER NOT NULL,
LETZTEGEWINNVERLUST INTEGER NOT NULL);

CREATE INDEX IFINANZEN_1 ON FINANZEN(HRF_ID, DATUM);
CREATE INDEX IFINANZEN_2 ON FINANZEN(HRF_ID);

CREATE TABLE SPIELERSKILLUP(
HRF_ID INTEGER NOT NULL,
DATUM TIMESTAMP NOT NULL,
SPIELERID INTEGER NOT NULL,
SKILL INTEGER NOT NULL,
VALUE INTEGER NOT NULL);

CREATE INDEX ISKILLUP_1 ON SPIELERSKILLUP(SPIELERID);
CREATE INDEX ISKILLUP_2 ON SPIELERSKILLUP(SPIELERID, SKILL);

CREATE TABLE TEAM(
HRF_ID INTEGER NOT NULL PRIMARY KEY,
TRAININGSINTENSITAET INTEGER NOT NULL,
TRAININGSART INTEGER NOT NULL,
STRAININGSART VARCHAR(127),
ISTIMMUNG INTEGER NOT NULL,
SSTIMMUNG VARCHAR(127),
ISELBSTVERTRAUEN INTEGER NOT NULL,
SSELBSTVERTRAUEN VARCHAR(127),
IERFAHRUNG541 INTEGER NOT NULL,
IERFAHRUNG433 INTEGER NOT NULL,
IERFAHRUNG352 INTEGER NOT NULL,
IERFAHRUNG451 INTEGER NOT NULL,
IERFAHRUNG532 INTEGER NOT NULL,
IERFAHRUNG343 INTEGER NOT NULL,
STAMINATRAININGPART INTEGER NOT NULL,
IERFAHRUNG442 INTEGER NOT NULL,
IERFAHRUNG523 INTEGER NOT NULL,
IERFAHRUNG550 INTEGER NOT NULL,
IERFAHRUNG253 INTEGER NOT NULL);

CREATE INDEX ITEAM_1 ON TEAM(HRF_ID);

CREATE TABLE MATCHHIGHLIGHTS(
MATCHID INTEGER NOT NULL,
GASTTORE INTEGER NOT NULL,
HEIMTORE INTEGER NOT NULL,
TYP INTEGER NOT NULL,
MINUTE INTEGER NOT NULL,
SPIELERID INTEGER NOT NULL,
SPIELERNAME VARCHAR(256) NOT NULL,
TEAMID INTEGER NOT NULL,
SUBTYP INTEGER NOT NULL,
SPIELERHEIM BOOLEAN NOT NULL,
GEHILFEID INTEGER NOT NULL,
GEHILFENAME VARCHAR(256) NOT NULL,
GEHILFEHEIM BOOLEAN NOT NULL,
EVENTTEXT VARCHAR(5000) NOT NULL);

CREATE INDEX IMATCHHIGHLIGHTS_1 ON MATCHHIGHLIGHTS(MATCHID);

CREATE TABLE AUFSTELLUNG(
HRF_ID INTEGER NOT NULL,
KICKER INTEGER NOT NULL,
KAPITAEN INTEGER NOT NULL,
ATTITUDE INTEGER NOT NULL,
TACTIC INTEGER NOT NULL,
AUFSTELLUNGSNAME VARCHAR(256) NOT NULL,
STYLEOFPLAY INTEGER NOT NULL);

CREATE TABLE MATCHLINEUPTEAM(
MATCHID INTEGER NOT NULL,
ERFAHRUNG INTEGER NOT NULL,
TEAMNAME VARCHAR(256) NOT NULL,
TEAMID INTEGER NOT NULL,
STYLEOFPLAY INTEGER NOT NULL);

CREATE TABLE VEREIN(
HRF_ID INTEGER NOT NULL PRIMARY KEY,
TWTRAINER INTEGER NOT NULL,
COTRAINER INTEGER NOT NULL,
PHYSIOLOGEN INTEGER NOT NULL,
PSCHYOLOGEN INTEGER NOT NULL,
FINANZBERATER INTEGER NOT NULL,
PRMANAGER INTEGER NOT NULL,
AERZTE INTEGER NOT NULL,
JUGEND INTEGER NOT NULL,
SIEGE INTEGER NOT NULL,
UNGESCHLAGEN INTEGER NOT NULL,
FANS INTEGER NOT NULL,
TACTICASSIST INTEGER NOT NULL,
FORMASSIST INTEGER NOT NULL);

CREATE INDEX IVEREIN_1 ON VEREIN(HRF_ID);

CREATE TABLE TRANSFER(
TRANSFERID INTEGER NOT NULL PRIMARY KEY,
DATE TIMESTAMP,
WEEK INTEGER,
SEASON INTEGER,
PLAYERID INTEGER NOT NULL,
PLAYERNAME VARCHAR(127),
BUYERID INTEGER,
BUYERNAME VARCHAR(256),
SELLERID INTEGER,
SELLERNAME VARCHAR(256),
PRICE INTEGER,
MARKETVALUE INTEGER,
TSI INTEGER);

CREATE INDEX PL_ID ON TRANSFER(PLAYERID);
CREATE INDEX BUY_ID ON TRANSFER(BUYERID);
CREATE INDEX SELL_ID ON TRANSFER(SELLERID);

CREATE TABLE PAARUNG(
LIGAID INTEGER NOT NULL,
SAISON INTEGER NOT NULL,
HEIMNAME VARCHAR(256) NOT NULL,
GASTNAME VARCHAR(256) NOT NULL,
DATUM VARCHAR(256) NOT NULL,
SPIELTAG INTEGER NOT NULL,
HEIMID INTEGER NOT NULL,
GASTID INTEGER NOT NULL,
HEIMTORE INTEGER NOT NULL,
GASTTORE INTEGER NOT NULL,
MATCHID INTEGER NOT NULL);

CREATE TABLE TA_PLAYER(
TEAMID INTEGER NOT NULL,
PLAYERID INTEGER,
STATUS INTEGER,
SPECIALEVENT INTEGER,
TSI INTEGER,
FORM INTEGER,
AGE INTEGER,
EXPERIENCE INTEGER,
WEEK INTEGER);

CREATE INDEX ITA_PLAYER_PLAYERID_WEEK ON TA_PLAYER(PLAYERID, WEEK);

CREATE TABLE MATCHLINEUPPLAYER(
MATCHID INTEGER NOT NULL,
TEAMID INTEGER NOT NULL,
SPIELERID INTEGER NOT NULL,
ROLEID INTEGER NOT NULL,
TAKTIK INTEGER NOT NULL,
POSITIONCODE INTEGER NOT NULL,
VNAME VARCHAR(255) NOT NULL,
NICKNAME VARCHAR(255) NOT NULL,
NAME VARCHAR(255) NOT NULL,
RATING DOUBLE PRECISION NOT NULL,
HOPOSCODE INTEGER NOT NULL,
STATUS INTEGER NOT NULL,
FIELDPOS INTEGER NOT NULL,
RATINGSTARSENDOFMATCH DOUBLE PRECISION NOT NULL,
STARTPOSITION INTEGER NOT NULL,
STARTBEHAVIOUR INTEGER NOT NULL);

CREATE INDEX IMATCHLINEUPPLAYER_1 ON MATCHLINEUPPLAYER(SPIELERID);
CREATE INDEX IMATCHLINEUPPLAYER_2 ON MATCHLINEUPPLAYER(MATCHID, TEAMID);

CREATE TABLE SPIELPLAN(
LIGAID INTEGER NOT NULL,
LIGANAME VARCHAR(256),
SAISON INTEGER NOT NULL,
FETCHDATE TIMESTAMP NOT NULL);

CREATE TABLE STADION(
HRF_ID INTEGER NOT NULL PRIMARY KEY,
STADIONNAME VARCHAR(127) NOT NULL,
GESAMTGR INTEGER NOT NULL,
ANZSTEH INTEGER NOT NULL,
ANZSITZ INTEGER NOT NULL,
ANZDACH INTEGER NOT NULL,
ANZLOGEN INTEGER NOT NULL,
AUSBAUSTEH INTEGER NOT NULL,
AUSBAUSITZ INTEGER NOT NULL,
AUSBAUDACH INTEGER NOT NULL,
AUSBAULOGEN INTEGER NOT NULL,
AUSBAU INTEGER NOT NULL,
AUSBAUKOSTEN INTEGER NOT NULL,
ARENAID INTEGER NOT NULL);

CREATE TABLE SPIELER(
HRF_ID INTEGER NOT NULL,
DATUM TIMESTAMP NOT NULL,
GELBEKARTEN INTEGER NOT NULL,
SPIELERID INTEGER NOT NULL,
NAME VARCHAR(127),
AGE INTEGER NOT NULL,
KONDITION INTEGER NOT NULL,
FORM INTEGER NOT NULL,
TORWART INTEGER NOT NULL,
VERTEIDIGUNG INTEGER NOT NULL,
SPIELAUFBAU INTEGER NOT NULL,
FLUEGEL INTEGER NOT NULL,
TORSCHUSS INTEGER NOT NULL,
PASSPIEL INTEGER NOT NULL,
STANDARDS INTEGER NOT NULL,
SUBTORWART DOUBLE PRECISION  NOT NULL,
SUBVERTEIDIGUNG DOUBLE PRECISION  NOT NULL,
SUBSPIELAUFBAU DOUBLE PRECISION  NOT NULL,
SUBFLUEGEL DOUBLE PRECISION  NOT NULL,
SUBTORSCHUSS DOUBLE PRECISION  NOT NULL,
SUBPASSPIEL DOUBLE PRECISION  NOT NULL,
SUBSTANDARDS DOUBLE PRECISION  NOT NULL,
OFFSETTORWART DOUBLE PRECISION  NOT NULL,
OFFSETVERTEIDIGUNG DOUBLE PRECISION  NOT NULL,
OFFSETSPIELAUFBAU DOUBLE PRECISION  NOT NULL,
OFFSETFLUEGEL DOUBLE PRECISION  NOT NULL,
OFFSETTORSCHUSS DOUBLE PRECISION  NOT NULL,
OFFSETPASSPIEL DOUBLE PRECISION  NOT NULL,
OFFSETSTANDARDS DOUBLE PRECISION  NOT NULL,
ISPEZIALITAET INTEGER NOT NULL,
ICHARAKTER INTEGER NOT NULL,
IANSEHEN INTEGER NOT NULL,
IAGRESSIVITAET INTEGER NOT NULL,
FUEHRUNG INTEGER NOT NULL,
ERFAHRUNG INTEGER NOT NULL,
GEHALT INTEGER NOT NULL,
BONUS INTEGER NOT NULL,
LAND INTEGER NOT NULL,
MARKTWERT INTEGER NOT NULL,
VERLETZT INTEGER NOT NULL,
TOREFREUND INTEGER NOT NULL,
TORELIGA INTEGER NOT NULL,
TOREPOKAL INTEGER NOT NULL,
TOREGESAMT INTEGER NOT NULL,
HATTRICK INTEGER NOT NULL,
BEWERTUNG INTEGER NOT NULL,
TRAINERTYP INTEGER NOT NULL,
TRAINER INTEGER NOT NULL,
PLAYERNUMBER INTEGER NOT NULL,
TRANSFERLISTED INTEGER NOT NULL,
CAPS INTEGER NOT NULL,
CAPSU20 INTEGER NOT NULL,
AGEDAYS INTEGER NOT NULL,
TRAININGBLOCK BOOLEAN NOT NULL,
LOYALTY INTEGER NOT NULL,
HOMEGROWN BOOLEAN NOT NULL);

CREATE INDEX ISPIELER_1 ON SPIELER(SPIELERID, DATUM);
CREATE INDEX ISPIELER_2 ON SPIELER(HRF_ID);

CREATE TABLE MATCHESKURZINFO(
MATCHID INTEGER NOT NULL PRIMARY KEY,
MATCHTYP INTEGER NOT NULL,
HEIMNAME VARCHAR(256) NOT NULL,
HEIMID INTEGER NOT NULL,
GASTNAME VARCHAR(256) NOT NULL,
GASTID INTEGER NOT NULL,
MATCHDATE VARCHAR(256) NOT NULL,
HEIMTORE INTEGER NOT NULL,
GASTTORE INTEGER NOT NULL,
AUFSTELLUNG BOOLEAN NOT NULL,
STATUS INTEGER NOT NULL);

CREATE INDEX IMATCHKURZINFO_1 ON MATCHESKURZINFO(MATCHID);

CREATE TABLE STAFF(
HRFID INTEGER NOT NULL,
INDEX INTEGER NOT NULL,
ID INTEGER NOT NULL,
STAFFTYPE INTEGER NOT NULL,
LEVEL INTEGER NOT NULL,
COST INTEGER NOT NULL,
NAME VARCHAR(127) NOT NULL);

CREATE TABLE TRAINING(
WEEK INTEGER NOT NULL,
YEAR INTEGER NOT NULL,
TYP INTEGER NOT NULL,
INTENSITY INTEGER NOT NULL,
STAMINATRAININGPART INTEGER NOT NULL);

CREATE TABLE USERCONFIGURATION(
CONFIG_KEY VARCHAR(50) NOT NULL PRIMARY KEY,
CONFIG_VALUE VARCHAR(256));

CREATE TABLE MATCHDETAILS(
MATCHID INTEGER NOT NULL PRIMARY KEY,
ARENAID INTEGER NOT NULL,
ARENANAME VARCHAR(256) NOT NULL,
FETCHDATUM TIMESTAMP NOT NULL,
GASTNAME VARCHAR(256) NOT NULL,
GASTID INTEGER NOT NULL,
GASTEINSTELLUNG INTEGER NOT NULL,
GASTTORE INTEGER NOT NULL,
GASTLEFTATT INTEGER NOT NULL,
GASTLEFTDEF INTEGER NOT NULL,
GASTMIDATT INTEGER NOT NULL,
GASTMIDDEF INTEGER NOT NULL,
GASTMIDFIELD INTEGER NOT NULL,
GASTRIGHTATT INTEGER NOT NULL,
GASTRIGHTDEF INTEGER NOT NULL,
GASTTACTICSKILL INTEGER NOT NULL,
GASTTACTICTYPE INTEGER NOT NULL,
GASTHATSTATS INTEGER NOT NULL,
HEIMNAME VARCHAR(256) NOT NULL,
HEIMID INTEGER NOT NULL,
HEIMEINSTELLUNG INTEGER NOT NULL,
HEIMTORE INTEGER NOT NULL,
HEIMLEFTATT INTEGER NOT NULL,
HEIMLEFTDEF INTEGER NOT NULL,
HEIMMIDATT INTEGER NOT NULL,
HEIMMIDDEF INTEGER NOT NULL,
HEIMMIDFIELD INTEGER NOT NULL,
HEIMRIGHTATT INTEGER NOT NULL,
HEIMRIGHTDEF INTEGER NOT NULL,
HEIMTACTICSKILL INTEGER NOT NULL,
HEIMTACTICTYPE INTEGER NOT NULL,
HEIMHATSTATS INTEGER NOT NULL,
SPIELDATUM TIMESTAMP NOT NULL,
WETTERID INTEGER NOT NULL,
ZUSCHAUER INTEGER NOT NULL,
MATCHREPORT VARCHAR(15000) NOT NULL,
REGIONID INTEGER NOT NULL,
SOLDTERRACES INTEGER NOT NULL,
SOLDBASIC INTEGER NOT NULL,
SOLDROOF INTEGER NOT NULL,
SOLDVIP INTEGER NOT NULL);

CREATE INDEX IMATCHDETAILS_1 ON MATCHDETAILS(MATCHID);

CREATE TABLE LIGA(
HRF_ID INTEGER NOT NULL PRIMARY KEY,
LIGANAME VARCHAR(127) NOT NULL,
PUNKTE INTEGER NOT NULL,
TOREFUER INTEGER NOT NULL,
TOREGEGEN INTEGER NOT NULL,
PLATZ INTEGER NOT NULL,
SPIELTAG INTEGER NOT NULL);

CREATE INDEX ILIGA_1 ON LIGA(HRF_ID);

CREATE TABLE XTRADATA(
HRF_ID INTEGER NOT NULL PRIMARY KEY,
CURRENCYRATE DOUBLE PRECISION  NOT NULL,
HASPROMOTED BOOLEAN NOT NULL,
CURRENCYNAME VARCHAR(127) NOT NULL,
LOGOURL VARCHAR(127) NOT NULL,
SERIESMATCHDATE TIMESTAMP NOT NULL,
TRAININGDATE TIMESTAMP NOT NULL,
ECONOMYDATE TIMESTAMP NOT NULL,
LEAGUELEVELUNITID INTEGER NOT NULL);

CREATE INDEX IXTRADATA_1 ON XTRADATA(HRF_ID);


CREATE TABLE FAKTOREN(
HOPOSITION INTEGER NOT NULL, -- Primary key will be set later
TORWART DOUBLE PRECISION NOT NULL,
VERTEIDIGUNG DOUBLE PRECISION NOT NULL,
FLUEGEL DOUBLE PRECISION NOT NULL,
PASSPIEL DOUBLE PRECISION NOT NULL,
STANDARDS DOUBLE PRECISION NOT NULL,
TORSCHUSS DOUBLE PRECISION NOT NULL,
SPIELAUFBAU DOUBLE PRECISION NOT NULL);

CREATE TABLE USERCOLUMNS(
COLUMN_ID INTEGER NOT NULL PRIMARY KEY,
MODELL_INDEX INTEGER NOT NULL,
TABLE_INDEX INTEGER NOT NULL,
COLUMN_WIDTH INTEGER);

CREATE TABLE TRANSFERTYPE(
PLAYER_ID INTEGER NOT NULL PRIMARY KEY,
TYPE INTEGER);

-- HT_WORLDDETAILS was dropped as part of 1.435 update.

-- 1.436

ALTER TABLE SPIELERNOTIZ ADD COLUMN ISFIRED BOOLEAN DEFAULT FALSE;

-- CURRENCYNAME dropped from XTRADATA
-- so marking it as null

ALTER TABLE XTRADATA ALTER COLUMN CURRENCYNAME DROP NOT NULL;

ALTER TABLE MATCHDETAILS ALTER COLUMN MATCHREPORT SET DATA TYPE VARCHAR(20000);
--ALTER TABLE MATCHDETAILS ADD COLUMN HEIMHATSTATS INTEGER;
--ALTER TABLE MATCHDETAILS ADD COLUMN GASTHATSTATS INTEGER;

UPDATE MATCHDETAILS SET HEIMHATSTATS = HEIMLEFTATT + HEIMRIGHTATT + HEIMMIDATT + 3 * HEIMMIDFIELD + HEIMLEFTDEF + HEIMRIGHTDEF + HEIMMIDDEF;
UPDATE MATCHDETAILS SET GASTHATSTATS = GASTLEFTATT + GASTRIGHTATT + GASTMIDATT + 3 * GASTMIDFIELD + GASTLEFTDEF + GASTRIGHTDEF + GASTMIDDEF;

ALTER TABLE MATCHESKURZINFO ADD COLUMN CUPLEVEL INTEGER;
UPDATE MATCHESKURZINFO SET CUPLEVEL = 0;

ALTER TABLE MATCHESKURZINFO ADD COLUMN CUPLEVELINDEX INTEGER;
UPDATE MATCHESKURZINFO SET CUPLEVELINDEX = 0;

CREATE TABLE MATCHORDER(
MATCHID INTEGER NOT NULL,
SPIELERID INTEGER NOT NULL,
POSITIONCODE INTEGER NOT NULL);

CREATE INDEX IMATCHORDER_1 ON MATCHORDER(MATCHID);


-- 2.0

ALTER TABLE FAKTOREN ADD COLUMN POSITIONID INTEGER NOT NULL;
ALTER TABLE FAKTOREN ADD COLUMN GKFACTOR DOUBLE PRECISION NOT NULL;
ALTER TABLE FAKTOREN ADD COLUMN DEFACTOR DOUBLE PRECISION NOT NULL;
ALTER TABLE FAKTOREN ADD COLUMN WIFACTOR DOUBLE PRECISION NOT NULL;
ALTER TABLE FAKTOREN ADD COLUMN PSFACTOR DOUBLE PRECISION NOT NULL;
ALTER TABLE FAKTOREN ADD COLUMN SPFACTOR DOUBLE PRECISION NOT NULL;
ALTER TABLE FAKTOREN ADD COLUMN SCFACTOR DOUBLE PRECISION NOT NULL;
ALTER TABLE FAKTOREN ADD COLUMN PMFACTOR DOUBLE PRECISION NOT NULL;
ALTER TABLE FAKTOREN ADD COLUMN NORMALISATIONFACTOR DOUBLE PRECISION NOT NULL;

-- columns have been renamed, so marking them as nullable

ALTER TABLE FAKTOREN ALTER COLUMN HOPOSITION DROP NOT NULL;
ALTER TABLE FAKTOREN ALTER COLUMN TORWART DROP NOT NULL;
ALTER TABLE FAKTOREN ALTER COLUMN VERTEIDIGUNG DROP NOT NULL;
ALTER TABLE FAKTOREN ALTER COLUMN FLUEGEL DROP NOT NULL;
ALTER TABLE FAKTOREN ALTER COLUMN PASSPIEL DROP NOT NULL;
ALTER TABLE FAKTOREN ALTER COLUMN STANDARDS DROP NOT NULL;
ALTER TABLE FAKTOREN ALTER COLUMN TORSCHUSS DROP NOT NULL;
ALTER TABLE FAKTOREN ALTER COLUMN SPIELAUFBAU DROP NOT NULL;

ALTER TABLE FAKTOREN ADD PRIMARY KEY (POSITIONID);

-- 2.1

ALTER TABLE MATCHESKURZINFO ADD COLUMN MATCHCONTEXTID INTEGER;
ALTER TABLE MATCHESKURZINFO ADD COLUMN TOURNAMENTTYPEID INTEGER;

CREATE TABLE TOURNAMENTDETAILS(
TOURNAMENTID INTEGER NOT NULL PRIMARY KEY,
NAME VARCHAR(256) NOT NULL,
TOURNAMENTTYPE INTEGER NOT NULL,
SEASON SMALLINT NOT NULL,
LOGOURL VARCHAR(256),
TROPHYTYPE INTEGER NOT NULL,
NUMBEROFTEAMS INTEGER NOT NULL,
NUMBEROFGROUPS INTEGER NOT NULL,
LASTMATCHROUND SMALLINT NOT NULL,
FIRSTMATCHROUNDDATE TIMESTAMP NOT NULL,
NEXTMATCHROUNDDATE TIMESTAMP,
ISMATCHESONGOING BOOLEAN NOT NULL,
CREATOR_USERID INTEGER NOT NULL,
CREATOR_LOGINNAME INTEGER);

ALTER TABLE MATCHHIGHLIGHTS ADD COLUMN MATCH_EVENT_ID INTEGER;
ALTER TABLE MATCHHIGHLIGHTS ADD COLUMN EVENT_INDEX INTEGER;
ALTER TABLE MATCHHIGHLIGHTS ADD COLUMN INJURY_TYPE SMALLINT;
UPDATE MATCHHIGHLIGHTS SET MATCH_EVENT_ID = (TYP * 100) + SUBTYP;

-- dropped columns HEIMTORE, GASTTORE, TYP, SUBTYP from MATCHHIGHLIGHTS
-- so making them nullable

ALTER TABLE MATCHHIGHLIGHTS ALTER COLUMN HEIMTORE DROP NOT NULL;
ALTER TABLE MATCHHIGHLIGHTS ALTER COLUMN GASTTORE DROP NOT NULL;
ALTER TABLE MATCHHIGHLIGHTS ALTER COLUMN TYP DROP NOT NULL;
ALTER TABLE MATCHHIGHLIGHTS ALTER COLUMN SUBTYP DROP NOT NULL;


-- 2.2

ALTER TABLE TOURNAMENTDETAILS ALTER COLUMN CREATOR_LOGINNAME SET DATA TYPE VARCHAR(256);
ALTER TABLE SPIELER ADD COLUMN SUBEXPERIENCE REAL;
ALTER TABLE SPIELER ADD COLUMN NATIONALTEAMID INTEGER;

-- 3.0

ALTER TABLE SPIELER ADD COLUMN FIRSTNAME VARCHAR (100);
ALTER TABLE SPIELER ADD COLUMN NICKNAME VARCHAR (100);
ALTER TABLE SPIELER ADD COLUMN LASTNAME VARCHAR (127); -- In DB NAME was renamed to LASTNAME


ALTER TABLE MATCHESKURZINFO ADD COLUMN ARENAID INTEGER;
ALTER TABLE MATCHESKURZINFO ADD COLUMN REGIONID INTEGER;
ALTER TABLE MATCHESKURZINFO ADD COLUMN WEATHER INTEGER;
ALTER TABLE MATCHESKURZINFO ADD COLUMN WEATHERFORECAST INTEGER;
ALTER TABLE MATCHESKURZINFO ADD COLUMN ISDERBY BOOLEAN;
ALTER TABLE MATCHESKURZINFO ADD COLUMN ISNEUTRAL BOOLEAN;


ALTER TABLE TA_PLAYER ADD COLUMN SALARY INTEGER;
ALTER TABLE TA_PLAYER ADD COLUMN STAMINA INTEGER;
ALTER TABLE TA_PLAYER ADD COLUMN MOTHERCLUBBONUS BOOLEAN;
ALTER TABLE TA_PLAYER ADD COLUMN LOYALTY INTEGER;

ALTER TABLE MATCHDETAILS ADD COLUMN RATINGINDIRECTSETPIECESATT INTEGER;
ALTER TABLE MATCHDETAILS ADD COLUMN RATINGINDIRECTSETPIECESDEF INTEGER;


-- 3.1


CREATE INDEX MATCHDETAILS_HEIMID_IDX ON MATCHDETAILS (HEIMID);
CREATE INDEX MATCHDETAILS_GASTID_IDX ON MATCHDETAILS (GASTID);
CREATE INDEX MATCHKURZINFO_HEIMID_IDX ON MATCHESKURZINFO (HEIMID);
CREATE INDEX MATCHKURZINFO_GASTID_IDX ON MATCHESKURZINFO (GASTID);
CREATE INDEX MATCHHIGHLIGHTS_TEAMID_IDX ON MATCHHIGHLIGHTS (TEAMID);
CREATE INDEX MATCHHIGHLIGHTS_EVENTID_IDX ON MATCHHIGHLIGHTS (MATCH_EVENT_ID);

ALTER TABLE MATCHESKURZINFO ALTER COLUMN ISDERBY SET DATA TYPE BOOLEAN;
ALTER TABLE MATCHESKURZINFO ALTER COLUMN ISNEUTRAL SET DATA TYPE BOOLEAN;

-- 3.2

ALTER TABLE SPIELER ADD COLUMN LASTMATCHDATE VARCHAR (100);
ALTER TABLE SPIELER ADD COLUMN LASTMATCHRATING INTEGER;
ALTER TABLE SPIELER ADD COLUMN LASTMATCHID INTEGER;

--

ALTER TABLE VEREIN ADD COLUMN GLOBALRANKING INTEGER;
ALTER TABLE VEREIN ADD COLUMN LEAGUERANKING INTEGER;
ALTER TABLE VEREIN ADD COLUMN REGIONRANKING INTEGER;
ALTER TABLE VEREIN ADD COLUMN POWERRATING INTEGER;

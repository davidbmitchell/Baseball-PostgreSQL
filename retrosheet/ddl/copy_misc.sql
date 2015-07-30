--------------------------------------------------------------------------------
-- populate the players and parkcodes tables with statements below. Replace 
-- /path/to/ with the full path to the players.csv and parks.csv files. They are
-- included in this repository to make it easier.
--------------------------------------------------------------------------------

copy players from '/path/to/ddl/players.csv' with csv header;

copy parks from '/path/to/ddl/parks.csv' with csv header;

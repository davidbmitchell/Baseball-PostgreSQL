-------------------------------------------------------------------------------
-- Because there is not a year_id column in the csv files, we have to create one
-- Obviously this is optional but its highly recommended because your 
-- queries will be easier. After running the following I recommend vacuuming 
-- the database.
-------------------------------------------------------------------------------

alter table events 
    add column year_id int;

update events
    set year_id = substring(game_id, 4, 4)::int;

create index game_idx on events (game_id);

create index year_idx on events (year_id);
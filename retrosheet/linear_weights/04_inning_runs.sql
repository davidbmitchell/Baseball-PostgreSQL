--------------------------------------------------------------------------------
-- Creates a table of average runs per inning for each year 
-- Execution Time: ~ 13 minutes for years 1950 - 2014
--------------------------------------------------------------------------------

create table retrosheet.lwts.inning_runs as
select
    e.year_id,
    round (
        sum (
            e.event_runs_ct )
        / sum (
            case
                when inn_new_fl is true then 1
                else 0
            end ) ::numeric,
        4 ) as inn_runs
from
    retrosheet.public.events e,
    retrosheet.lwts.complete_innings c
where
    e.game_id = c.game_id
    and e.inn_ct = c.inn_ct
    and e.bat_home_id = c.bat_home_id
group by
    e.year_id
order by
    e.year_id asc;
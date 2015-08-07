--------------------------------------------------------------------------------
-- Creates a table of all complete innings 
-- Execution Time: ~ 5 minutes for years 1950 - 2014
--------------------------------------------------------------------------------
create table retrosheet.lwts.complete_innings as
select
    e.year_id,
    e.game_id,
    e.inn_ct,
    e.bat_home_id
from
    retrosheet.public.events e
where
    e.inn_end_fl
    and e.event_outs_ct + e.outs_ct = 3
    and (
        case
            when e.inn_ct = 9
            and e.bat_home_id = 1 then 1
            else 0
        end ) = 0
order by e.game_id, e.year_id;

create index complete_innings_idx on retrosheet.lwts.complete_innings (
    game_id,
    inn_ct,
    bat_home_id );
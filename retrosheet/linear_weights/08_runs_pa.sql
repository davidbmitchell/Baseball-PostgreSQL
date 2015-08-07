--------------------------------------------------------------------------------
-- Creates a table of the runs per plate appearance and runs per out for each year
-- Execution Time: ~ 14 minutes for years 1950 - 2014
--------------------------------------------------------------------------------

create table retrosheet.lwts.runs_pa_complete as
select e.year_id, 
    round(
        sum(e.event_runs_ct
        ) / sum(case when e.bat_event_fl = 'T' and e.event_cd != 17 then 1 
                     else 0
                end)::numeric, 
    4) as r_pa, 
    round(
        sum(e.event_runs_ct
        ) / sum(case when e.event_cd = 3 then 1 
                     when e.event_cd between 14 and 16 then 0 
                     else e.event_outs_ct 
                end)::numeric, 
    4) as r_out
from 
    retrosheet.public.events e, 
    retrosheet.lwts.complete_innings c
where e.game_id = c.game_id
    and e.inn_ct = c.inn_ct
    and e.bat_home_id = c.bat_home_id
group by 
    e.year_id
order by
    e.year_id asc;
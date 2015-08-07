--------------------------------------------------------------------------------
-- Calculates average run expectancy given the number of outs, also calculates
-- the average number of plate appearances per half inning given number of outs. 
-- Execution Time: ~ 13 minutes
--------------------------------------------------------------------------------

create table retrosheet.lwts.fate_runs as
select
    e.year_id,
    e.outs_ct + e.event_outs_ct as outs,
    round ( avg ( e.inn_pa_ct ), 4 ) as avg_pa_ct,
    round (
        avg (
            e.fate_runs_ct + e.event_runs_ct - case
                when e.run3_fate_id > 3 then 1
                else 0
            end - case
                when e.run2_fate_id > 3 then 1
                else 0
            end - case
                when e.run1_fate_id > 3 then 1
                else 0
            end - case
                when e.bat_fate_id > 3 then 1
                else 0
            end ),
        4 ) as fate_re
from
    retrosheet.public.events e,
    retrosheet.lwts.complete_innings c
where
    e.game_id = c.game_id
    and e.inn_ct = c.inn_ct
    and e.bat_home_id = c.bat_home_id
    and e.bat_event_fl is true
    and e.pa_trunc_fl is false
    and e.event_cd <> 23
group by
    e.year_id,
    outs
order by
    e.year_id asc,
    outs asc;
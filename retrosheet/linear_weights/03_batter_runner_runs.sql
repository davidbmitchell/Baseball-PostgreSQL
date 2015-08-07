--------------------------------------------------------------------------------
-- Creates a table of all complete innings 
-- Execution Time: ~ 14 minutes for years 1950 - 2014
--------------------------------------------------------------------------------

create table retrosheet.lwts.batter_runner_runs as
select
    e.year_id,
    outs_ct,
    round (
        avg (
            case
                when e.bat_fate_id > 3 then 1
                else 0
            end ),
        4 ) as bat_re,
    round (
        sum (
            case
                when e.run1_fate_id > 3 then 1
                else 0
            end )
        / sum (
            case
                when e.run1_origin_event_id > 0 then 1
                else 0
            end ) ::numeric,
        4 ) as run1_re,
    round (
        avg (
            case
                when e.run1_origin_event_id > 0 then 1
                else 0
            end ),
        4 ) as run1_num,
    round (
        sum (
            case
                when e.run2_fate_id > 3 then 1
                else 0
            end )
        / sum (
            case
                when e.run2_origin_event_id > 0 then 1
                else 0
            end ) ::numeric,
        4 ) as run2_re,
    round (
        avg (
            case
                when e.run2_origin_event_id > 0 then 1
                else 0
            end ),
        4 ) as run2_num,
    round (
        sum (
            case
                when e.run3_fate_id > 3 then 1
                else 0
            end )
        / sum (
            case
                when e.run3_origin_event_id > 0 then 1
                else 0
            end ) ::numeric,
        4 ) as run3_re,
    round (
        avg (
            case
                when e.run3_origin_event_id > 0 then 1
                else 0
            end ),
        4 ) as run3_num
from
    retrosheet.public.events e,
    retrosheet.lwts.complete_innings c
where
    e.game_id = c.game_id
    and e.inn_ct = c.inn_ct
    and e.bat_home_id = c.bat_home_id
    and e.bat_event_fl is true
    and e.pa_trunc_fl is false
group by
    e.year_id,
    outs_ct
order by
    e.year_id asc,
    outs_ct asc;
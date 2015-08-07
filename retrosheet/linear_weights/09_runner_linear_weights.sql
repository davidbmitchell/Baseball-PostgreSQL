--------------------------------------------------------------------------------
-- Creates a table of the linear weight of stolen bases and caught stealing
-- for each season 
-- Execution Time: ~ 14 minutes for years 1950 - 2014
--------------------------------------------------------------------------------
create table retrosheet.lwts.runner_linear_weights as
select
    e.year_id,
    4 as event,
    sum (
        case
            when run1_sb_fl is true then 1
            else 0
        end + case
            when run2_sb_fl is true then 1
            else 0
        end + case
            when run3_sb_fl is true then 1
            else 0
        end ) as num,
    round (
        sum (
            case
                when e.event_cd = 3 then case
                    when e.event_outs_ct > 0 then e.event_outs_ct - 1
                    else 0
                end
                else e.event_outs_ct
            end )
        / sum (
            case
                when run1_sb_fl is true then 1
                else 0
            end + case
                when run2_sb_fl is true then 1
                else 0
            end + case
                when run3_sb_fl is true then 1
                else 0
            end ) ::numeric,
        8 ) as outs,
    round (
        sum (
            e.event_runs_ct - w.event_runs_ct + r2.re - r1.re )
        / sum (
            case
                when run1_sb_fl is true then 1
                else 0
            end + case
                when run2_sb_fl is true then 1
                else 0
            end + case
                when run3_sb_fl is true then 1
                else 0
            end ) ::numeric,
        8 ) as lwts
from
    retrosheet.public.events e,
    retrosheet.lwts.run_expectancy r1,
    retrosheet.lwts.run_expectancy r2,
    retrosheet.lwts.complete_innings c,
    retrosheet.lwts.walk_state w
where (
    run1_sb_fl is true
    or run2_sb_fl is true
    or run3_sb_fl is true )
    and e.start_bases_cd = w.start_bases_cd
    and e.game_id = c.game_id
    and e.inn_ct = c.inn_ct
    and e.bat_home_id = c.bat_home_id
    and e.year_id = r1.year_id
    and (
        case
            when event_cd = 3 then e.start_bases_cd
            when event_cd between 14
            and 16 then w.end_bases_cd
            else e.start_bases_cd
        end )
    = r1.bases_cd
    and (
        case
            when event_cd = 3 then e.outs_ct + 1
            else e.outs_ct
        end )
    = r1.outs_ct
    and e.year_id = r2.year_id
    and e.end_bases_cd = r2.bases_cd
    and e.outs_ct + e.event_outs_ct = r2.outs_ct
group by
    e.year_id
union
    all
select
    e.year_id,
    6 as event,
    sum (
        case
            when run1_cs_fl is true then 1
            else 0
        end + case
            when run2_cs_fl is true then 1
            else 0
        end + case
            when run3_cs_fl is true then 1
            else 0
        end ) as num,
    round (
        sum (
            case
                when e.event_cd = 3 then case
                    when e.event_outs_ct > 0 then e.event_outs_ct - 1
                    else 0
                end
                else e.event_outs_ct
            end )
        / sum (
            case
                when run1_cs_fl is true then 1
                else 0
            end + case
                when run2_cs_fl is true then 1
                else 0
            end + case
                when run3_cs_fl is true then 1
                else 0
            end ) ::numeric,
        8 ) as outs,
    round (
        sum (
            case
                when e.event_runs_ct > 0 then e.event_runs_ct - w.event_runs_ct
                else 0
            end + r2.re - r1.re )
        / sum (
            case
                when run1_cs_fl is true then 1
                else 0
            end + case
                when run2_cs_fl is true then 1
                else 0
            end + case
                when run3_cs_fl is true then 1
                else 0
            end ) ::numeric,
        4 ) as lwts
from
    retrosheet.public.events e,
    retrosheet.lwts.run_expectancy r1,
    retrosheet.lwts.run_expectancy r2,
    retrosheet.lwts.complete_innings c,
    retrosheet.lwts.walk_state w
where 
    ( run1_cs_fl is true or run2_cs_fl is true or run3_cs_fl is true )
    and e.start_bases_cd = w.start_bases_cd
    and e.game_id = c.game_id
    and e.inn_ct = c.inn_ct
    and e.bat_home_id = c.bat_home_id
    and e.year_id = r1.year_id
    and (
        case
            when event_cd = 3 then e.start_bases_cd
            when event_cd between 14
            and 16 then w.end_bases_cd
            else e.start_bases_cd
        end ) = r1.bases_cd
    and (
        case
            when event_cd = 3 then e.outs_ct + 1
            else e.outs_ct
        end ) = r1.outs_ct
    and e.year_id = r2.year_id
    and e.end_bases_cd = r2.bases_cd
    and e.outs_ct + e.event_outs_ct = r2.outs_ct
group by
    e.year_id
order by
    e.year_id,
    event;
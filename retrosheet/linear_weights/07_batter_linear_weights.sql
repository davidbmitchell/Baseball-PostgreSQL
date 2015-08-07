--------------------------------------------------------------------------------
-- Creates a table of the linear weight of batting events for each season 
-- Execution Time: ~ 14 minutes for years 1950 - 2014
--------------------------------------------------------------------------------

create table retrosheet.lwts.batter_lwts_official as select
    e.year_id,
    case when e.event_cd between 18 and 19 then 2 
          else e.event_cd 
     end as event,
    count (1) as num,
    round(
      avg(case when e.event_cd = 3 then 1 
             when e.event_cd between 14 and 16 then 0
             else e.event_outs_ct
        end),
    8) as outs,
    round(avg (case when e.event_cd = 3 then r2.re - r1.re
              when e.event_cd between 14 and 16 then w.event_runs_ct + r2.re - r1.re
              else e.event_runs_ct + r2.re - r1.re
        end),
    8) as lwts
from
    retrosheet.public.events e,
    retrosheet.lwts.run_expectancy r1,
    retrosheet.lwts.run_expectancy r2,
    retrosheet.lwts.complete_innings c,
    retrosheet.lwts.walk_state w
where
    e.bat_event_fl is true
    and e.event_cd != 17
    and e.start_bases_cd = w.start_bases_cd
    and e.game_id = c.game_id
    and e.inn_ct = c.inn_ct
    and e.bat_home_id = c.bat_home_id
    and e.year_id = r1.year_id
    and e.start_bases_cd = r1.bases_cd
    and e.outs_ct = r1.outs_ct
    and e.year_id = r2.year_id
    and (case when event_cd = 3 then e.start_bases_cd
              when event_cd between 14 and 16 then w.end_bases_cd
              else e.end_bases_cd
        end
    ) = r2.bases_cd
    and (case when event_cd = 3 then e.outs_ct + 1
              when event_cd between 14 and 16 then e.outs_ct
              else e.outs_ct + e.event_outs_ct
        end
    ) = r2.outs_ct
group by
    e.year_id,
    event
order by
    e.year_id asc,
    event asc;
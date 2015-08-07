--------------------------------------------------------------------------------
-- Creates table that shows the movement of base runners after a walk. 
-- Execution Time: ~ 8 seconds
--------------------------------------------------------------------------------
create table retrosheet.lwts.walk_state as
select
    a.start_bases_cd,
    a.end_bases_cd,
    a.event_runs_ct
from (
        select
            e.start_bases_cd,
            e.end_bases_cd,
            e.event_runs_ct,
            count ( 1 ) as num
        from
            retrosheet.public.events e
        where
            e.year_id = '2014'
            and e.event_cd = 14
        group by
            e.start_bases_cd,
            e.end_bases_cd,
            e.event_runs_ct )
    a,
    (
        select
            start_bases_cd,
            max ( a.num ) as num
        from (
                select
                    e.start_bases_cd,
                    e.end_bases_cd,
                    e.event_runs_ct,
                    count ( 1 ) as num
                from
                    retrosheet.public.events e
                where
                    year_id = '2014'
                    and event_cd = 14
                group by
                    e.start_bases_cd,
                    e.end_bases_cd,
                    e.event_runs_ct )
            a
        group by
            start_bases_cd )
    b
where
    a.start_bases_cd = b.start_bases_cd
    and a.num = b.num;
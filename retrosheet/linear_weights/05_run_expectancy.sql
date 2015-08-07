--------------------------------------------------------------------------------
-- Creates a table of run expectancy for each base/out state 
-- Execution Time: ~ 2 seconds for years 1950 - 2014
--------------------------------------------------------------------------------

create table retrosheet.lwts.run_expectancy as
select
    r.year_id,
    r.outs_ct,
    b.start_bases_cd as bases_cd,
    ( r.run1_re * b.runner_1 )
    + ( r.run2_re * b.runner_2 )
    + ( r.run3_re * b.runner_3 )
    + case
        when r.outs_ct = 0 then c.inn_runs
        else f.fate_re
    end as re
from
    retrosheet.public.bases_cd b,
    retrosheet.lwts.batter_runner_runs r,
    retrosheet.lwts.fate_runs f,
    retrosheet.lwts.inning_runs i
where
    r.year_id = f.year_id
    and r.outs_ct = f.outs
    and r.year_id = i.year_id
union
    all
select
    distinct r.year_id,
    3 as outs_ct,
    b.start_bases_cd as bases_cd,
    0 as re
from
    retrosheet.lwts.bases_cd b,
    retrosheet.lwts.batter_runner_runs r
order by
    r.year_id asc,
    r.outs_ct asc,
    bases_cd;

create index run_expectancy_idx on run_expectancy (
    year_id,
    outs_ct,
    bases_cd );
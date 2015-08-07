## Linear Weights
The PostgreSQL code for linear weights assumes you have a 
Retrosheet database stored on your public schema. If you have stored on a schema with a different name, you will have to change some of the scripts. 

The code was orginally written for MySQL, and
you can find it here on [basql.wikidot.com](http://basql.wikidot.com/house-linear-weights). I would like to attribute it correctly but I have no idea
who the original author is. If you know who the author is, please let 
me know. All I did was adapt the code for PostgreSQL.

First create a new schema in you retrosheet databaseThe files are numbered and are meant to be executed in order.

```bash
├── 01_complete_innings.sql
├── 02_fate_runs.sql
├── 03_batter_runner_runs.sql
├── 04_inning_runs.sql
├── 05_run_expectancy.sql
├── 06_walk_state.sql
├── 07_batter_linear_weights.sql
├── 08_runs_pa.sql
└── 09_runner_lwts.sql
```

1. Complete Innings
   * Finds the complete innings from each game for each season wanted. This removes innings from games that ended in a walk off, etc.

2. Fate Runs Complete
	* Calculates the average number of plate appearances for the number of outs, and the average number of runs scored in the rest of an inning given the number of outs.

3. 	Batter Runner Runs
	* Calculates the run expectancy of the batter, a runner on 1st, a runner on 2nd, and a runner on 3rd for a given number of outs. 

4. Inning Runs
	* Calculates the average number of runs scored in an inning for each year.

5. Run Expectancy
	* Calculates the run expectancy of each base/out state for each year.

6. Walk State
	* Accounts for the movement of runners after a walk.

7. Batter Linear Weights
	* Calculates the yearly linear weights for the following batter events: generic out, strike out, non-intentional walk, hit by pitch, single, double, triple, and home run.

8. Runs Per PA
	* Calculates the number of runs scored per plate appearance and number of runs scored per out for each season.

9. Runner Linear Weights
	* Calculates the linear weights for a stolen base and a caught stealing for each season.

### More Informtion About Linear Weights
[FanGraphs](http://www.fangraphs.com/library/principles/linear-weights/)

[The Book: Playing the Percentages in Baseball, By: Tom Tango](http://www.amazon.com/The-Book-Playing-Percentages-Baseball/dp/1597971294)

[Inside the Book](http://www.insidethebook.com/)
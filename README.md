# Baseball-PostgreSQL
This is a repository for PostgreSQL schemas and queries for baseball analytics.
The ```lahman/ddl``` folder contains the schema for the Lahman database, and the 
```retrosheet/ddl``` folder contains the schema for a Retrosheet database.

Please feel free to submit a pull request to add to the repository and report
any issues or improvements that can be made to the code.

## Lahman Database
### How Do I Get the Data?
The Lahman database is maintained by Sean Lahman and can be found on his [website](http://www.seanlahman.com/baseball-archive/statistics/). Download the **comma-delimited version**.
To populate your PostgreSQL Lahman database use the loader sql files in the lahman folder, and
simply replace ```path to``` with the full path to csv files.

## Retrosheet Database
The Retrosheet database is similar to the one Jeff Zimmerman provides at [Baseball Heat Maps](http://www.baseballheatmaps.com/retrosheet-database-download/), but instead of MySQL, this is a PostgreSQL database. The ddl folder contains the database schema ```schema.sql```, the sql scripts to load the parsed Retrosheet data into the database: ```copy_events.sql```, ```copy_games.sql```, ```copy_misc.sql```, two csv files which contains all the players and ball parks, and lastly a script ```indices.sql``` which creates indexes on the different tables.
### How Do I Get the Data?
#### Install [Chadwick](http://chadwick.sourceforge.net/)
This is now really easy as Chadwick is available via the Mac OSX package manager, [Homebrew](http://brew.sh/).

```bash
$ brew install chadwick
```
#### Download the Data from [Retrosheet](http://retrosheet.org/)
First creating a directory to hold all the Retrosheet data is probably best. I set mine up to contain both ```parsed``` and ```unparsed``` directories.
Then we will move into the unparsed directory.

```sh
$ mkdir -p /path/to/retrosheet/{unparsed,parsed}
$ cd /path/to/retrosheet/unparsed
```
All of the following shell commands were inspired by the shell [retrosheet_get](https://github.com/wa-rufio/retrosheet_get)
script created by [wa-rufio](https://github.com/wa-rufio).

```sh
# you can set startDecade to whichever decade you like
$ startDecade=1950 endDecade=2010
$ while [ $startDecade -le $endDecade ] ; do
$ http://www.retrosheet.org/events/"$startDecade"seve.zip
$ let startDecade=startDecade+10
$ done
# unzip the downloaded files
$ find . -name "*.zip" -exec unzip {} \; -exec /bin/rm {} \;
```

### Parse the Data
Finally use a for loop to parse through the ```events```, ```games```, 
and ```subs``` for each year. Make sure you are still in the ```unparsed``` directory.

```sh
# variables for first and last year
$ x=1950 y=2014
$ for (( i=$x; i<=$y; i++)); do cwevent -n -f 0-96 -x 0-60 -y "$i" "$i"*.EV* > ../parsed/all"$i".csv; done
$ for (( i=$x; i<=$y; i++)); do cwgame -n -f 0-83 -x 0-94 -y "$i" "$i"*.EV* > ../parsed/games"$i".csv; done
$ for (( i=$x; i<=$y; i++)); do cwsub -n -f 0-9 -y "$i" "$i"*.EV* > ../parsed/sub"$i".csv; done
```


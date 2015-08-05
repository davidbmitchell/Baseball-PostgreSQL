# Retrosheet Database
The Retrosheet database is similar to the one Jeff Zimmerman provides at [Baseball Heat Maps](http://www.baseballheatmaps.com/retrosheet-database-download/), but instead of MySQL, this is a PostgreSQL database. The ddl folder contains the database schema ```schema.sql```, the sql scripts to load the parsed Retrosheet data into the database: ```copy_events.sql, copy_games.sql, copy_misc.sql```, two csv files which contains all the players and ball parks, and lastly a script ```indices.sql``` which creates indexes on the different tables.

## How Do I Get the Data?
### Install [Chadwick](http://chadwick.sourceforge.net/)
This is now really easy as Chadwick is available via the Mac OSX package manager, [Homebrew](http://brew.sh/).

```sh
startDecade=1950 endDecade=2010
```

	
 	

# Sql Tutor

Clone this repository and `cd` into it.

### Setup

Install gems:
```
$ bundle install
```

Drop the database (if it says no database exists, that's ok):
```
$ bundle exec rake db:drop
```

Create the database:
```
$ bundle exec rake db:create
```

Migrate the database (this will add tables to the DB):
```
$ bundle exec rake db:migrate
```

Seed the database with sample data:
```
$ bundle exec rake db:seed
```

Start the server:
```
$ bundle exec rails s
```

Visit [http://localhost:3000](http://localhost:3000)

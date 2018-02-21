
# Sql Tutor

In this challenge you'll move through a series of challenges that require you to form SQL queries to accomplish various tasks. The challenge itself takes the form of a rails app, so you'll be cloning it down and starting the server before you begin. Instructions are below, let's get started!


### Setup

Clone this repository and `cd` into it.

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
$ bundle exec rake db:sample:seed
```

Start the server:
```
$ bundle exec rails s
```

Visit [http://localhost:3000](http://localhost:3000)

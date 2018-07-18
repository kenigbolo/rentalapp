# DEVELOPERS GUIDE

## Getting Started

+ Clone the repo:
`git clone git@github.com:kenigbolo/rentalapp.git` for SSH
`git clone https://github.com/kenigbolo/rentalapp.git` for HTTPS

## Framework/Tools Versions

* Ruby version 2.5.1 and above
* Rails 5.2.0

## Database
* Development Environment
    Uses Postgres
* Test environment
    Uses Postgres

## Database Setup
***Note*** `The steps below are critical to get the database running`

* For migrations to work, database `user` should be granted super user privileges
* Set database password in a .env file with the name RENTALAPP_DATABASE_PASSWORD e.g. `RENTALAPP_DATABASE_PASSWORD=password1`

Once you have those two, you can then run your command line and navigate into the project's folder and then perform the following:

* Run `bundle install` to install all dependencies
* Run `rails db:migrate` or `rake db:migrate`
* Run `rails db:seed`  or `rake db:seed` to seed the `db` with data available.

(*the `rake` command was used for rails version prior rails 5. But it is no logner required*)

## Running The Server

You can run `rails s` or `rails server` and visit the page on the browser by typing `localhost:3000`. (*you can add the flag `-p <port_number>` to specify a different port number, e.i. `rails s -p 8000`*)

## Running The Specs
After all the setting up as mentioned above, you can run the tests. The tests are driven by rspec. You can get them fired up by running the following command from the terminal.

  `rspec spec`

or

  `bundle exec rspec`
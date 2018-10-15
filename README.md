# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Initialization

    $ bundle
    $ docker-compose up -d
    $ bundle exec rails db:create db:migrate
    $ env RAILS_ENV=test bundle exec rails db:create db:migrate
    $ foreman start

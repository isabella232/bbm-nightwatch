# README

## How to run the build

    $ bundle install
    $ docker-compose up -d
    $ env RAILS_ENV=test bundle exec rails db:create
    $ bundle exec rake

## How to start the application

    $ bundle exec rails db:create db:migrate db:seed
    $ foreman start

You use the following URLs to access the app:
* [Main UI](http://localhost:5100)
* [Admin interface](http://localhost:5100/admin)

The default admin user is:
* Email: admin@example.com
* Password: admin1234

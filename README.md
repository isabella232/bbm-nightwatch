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

## Useful Links

* [Trello](https://trello.com/b/FALRjFUJ)
* [Codeship](https://app.codeship.com/projects/254734)
* [Heroku](https://dashboard.heroku.com/pipelines/6a1f8bcb-62f9-43ef-a170-b4db7333b998)
* [Staging](https://bbm-nightwatch-staging.herokuapp.com)
* [Production](https://etelmentes.hu)

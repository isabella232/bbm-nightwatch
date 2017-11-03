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


## manual setup on env

to make facebook integration workable, you have to get a PAGE access token from the Graph Api explorer, requested as the Bike Maffia page.
You have to be admin to the page in order to do this.

https://developers.facebook.com/tools/explorer

than on the environment execute the following command:

    $ bundle exec rails runner ./bin/access_token_extender -t "THE_RECEIVED_TOKEN_FROM_THE_GRAPH_API"

after this initial manual setup, you can setup maintenance in any kind of scheduler

    $ bundle exec rails runner ./bin/access_token_extender

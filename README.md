# README

## Initialization

```bash
$ bundle
$ docker-compose up -d
$ bundle exec rails db:create db:migrate
$ env RAILS_ENV=test bundle exec rails db:create db:migrate
$ foreman start
```

    
## Admin interface

```bash
$ bundle exec rails db:seed
```

Visit the admin url: `http://localhost:5100/admin`, and use the following credentials:

* email: admin@example.com
* password: admin1234

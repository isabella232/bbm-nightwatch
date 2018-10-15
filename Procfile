release: bundle exec rails db:migrate --verbose
web: bundle exec puma --port $PORT --config ./config/puma.rb
worker: bundle exec sidekiq -t 25 -c 5 -q default -q mailers

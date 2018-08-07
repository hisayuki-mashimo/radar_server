mkdir radar_server
cd radar_server/
git init
bundler init
git remote add origin git@github.com:hisayuki-mashimo/radar_server.git
git add Gemfile
vi Gemfile
bundle install --path vender
bundle exec rails new . -d mysql  --skip-action-cable --skip-turbolinks --skip-test --skip-system-test --skip-action-cable
bundle install
> rbenv: bundle: command not found
> 
> The `bundle' command exists in these Ruby versions:
>   2.4.1
>   2.5.0
gem install bundle --path vendor
bundle exec rails generate controller api
bundle exec rake db:create
ndenv install v8.4.0
ndenv local v8.4.0
bundle exec rails generate model user
bundle exec rails generate model user_parameter
bundle exec rake db:environment:set RAILS_ENV=development
bundle exec rake db:migrate:reset
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec rails db:reset



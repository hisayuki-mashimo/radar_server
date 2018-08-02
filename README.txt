mkdir radar_server
cd radar_server/
git init
bundler init
git remote add origin git@github.com:hisayuki-mashimo/radar_server.git
git add Gemfile
vi Gemfile
bundle install --path vender


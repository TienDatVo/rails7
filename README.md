## SetUp

Project requires: 
  - Rails 7.0.0    
  - Ruby 3.0.0     
   rvm install 3.0.0
   rvm use 3.0.0 --default
   gem install bundler
   ruby -v
  - postgresql-13  --> sudo apt install postgresql-13
  
Create Dockerfile
Create docker-compose.yml

connect DB:
 * sudo -u postgres psql
 * CREATE USER postgres WITH PASSWORD 'password'
 * docker-compose run --rm app rake db:migrate

build docker and run server
 * docker-compose up --build
 * docker-compose up -d

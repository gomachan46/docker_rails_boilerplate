.PHONY: init build up console/web console/db test db/create db/drop db/migrate db/reset

init:
	docker-compose rm

setup: build gem/install db/reset

build:
	docker-compose build

gem/install:
	docker-compose run web bundle install
gem/reset:
	docker-compose rm bundle
	$(MAKE) gem/install

up: db/migrate
	docker-compose up

console/web:
	docker-compose run web bundle exec rails c
console/db:
	docker-compose run web bundle exec rails db -p

test:
	docker-compose run web bundle exec rspec spec

db/create:
	docker-compose run web bundle exec rake db:create
db/drop:
	docker-compose run web bundle exec rake db:drop
db/migrate:
	docker-compose run web bundle exec rake db:migrate
db/reset:
	docker-compose run web bundle exec rake db:reset

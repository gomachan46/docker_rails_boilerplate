.PHONY: init build up console/web console/db test db/create db/drop db/migrate db/reset
init: build db/reset
build:
	docker-compose build
up:
	docker-compose up
console/web:
	docker-compose run web rails c
console/db:
	docker-compose run web rails db -p
test:
	docker-compose run web rspec spec
db/create:
	docker-compose run web rake db:create
db/drop:
	docker-compose run web rake db:drop
db/migrate:
	docker-compose run web rake db:migrate
db/reset:
	docker-compose run web rake db:reset

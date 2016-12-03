build:
	docker-compose build
up:
	docker-compose up
web-console:
	docker-compose run web rails c
db-console:
	docker-compose run web rails db -p

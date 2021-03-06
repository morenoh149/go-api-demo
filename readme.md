# Go demo api

This project demonstrates a small go api with the following features:

* users model
* organizations model
* rest json endpoints
* postgres database
* jwt authorization

Based on https://github.com/go-bun/bun-realworld-app

## api

* GET /
* GET /signup
* GET /login
* POST /signup
* POST /login
* GET /organization
* POST /organization
* GET /organization/:id
* GET /user
* POST /user
* GET /user/:id

## running

Make sure postgres is already installed on your system. On osx you might use https://postgresapp.com/

make db for this project
`$ createdb harry_moreno_go_api_demo`
Note: if you want to change the database name remember to update the name in `Makefile` and `/bunapp/embed/config/dev.yaml`

reset db
`$ make db_reset`

run api
`$ go run cmd/bun/main.go -env=dev api`

open
http://localhost:8000/api/articles

## other commands

`$ make test` runs tests

## current api

* http://localhost:8000/api/articles
* http://localhost:8000/api/articles/feed
* http://localhost:8000/api/user
* http://localhost:8000/api/tags/
* 
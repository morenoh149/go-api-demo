db_reset:
	sudo -u harrymoreno psql -c "DROP DATABASE IF EXISTS harry_moreno_go_api_demo"
	sudo -u harrymoreno psql -c "CREATE DATABASE harry_moreno_go_api_demo"

	make db_migrate

db_migrate:
	go run cmd/bun/main.go -env=test db init
	go run cmd/bun/main.go -env=test db migrate

test:
	TZ= go test ./org
	TZ= go test ./blog

api_test:
	TZ= go run cmd/bun/main.go -env=test api &
	APIURL=http://localhost:8000/api ./scripts/run-api-tests.sh

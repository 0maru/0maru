lint:
	atlas migrate lint --dev-url="mysql://root:pass@localhost:3306/test" --dir="file://ent/migrate/migrations" --dir-format="golang-migrate" --latest=1
apply:
	atlas migrate apply --dir "file://ent/migrate/migrations" --url "mysql://root:pass@localhost:3306/test"
db_up:
	docker run --name migration --rm -p 54320:5432 -e POSTGRES_PASSWORD=pass -e POSTGRES_DB=test -d postgres


lint:
	atlas migrate lint --dev-url="mysql://root:pass@localhost:3306/test2" --dir="file://ent/migrate/migrations" --dir-format="golang-migrate" --latest=1
apply:
	atlas migrate apply --url "mysql://root:pass@localhost:3306/test2" --dir "file://ent/migrate/migrations"
db_up:
	docker run --name mysql_atlas --rm -p 3306:3306 -e MYSQL_ROOT_PASSWORD=pass -e MYSQL_DATABASE=test2 -d mysql
db_ui:
	atlas schema inspect -d "mysql://root:pass@localhost:3306/test2"
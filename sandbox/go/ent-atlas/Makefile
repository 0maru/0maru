lint:
	atlas migrate lint --dev-url="mysql://root:pass@localhost:3306/test" --dir="file://ent/migrate/migrations" --dir-format="golang-migrate" --latest=1
apply:
	atlas migrate apply --dir "file://ent/migrate/migrations" --url "mysql://root:pass@localhost:3306/test"

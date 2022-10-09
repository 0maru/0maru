lint:
	atlas migrate lint --dev-url="postgresql://postgres:pass@localhost:5432/test2?sslmode=disable" --dir="file://ent/migrate/migrations" --latest=2
apply:
	atlas migrate apply --dir "file://ent/migrate/migrations" --url "postgresql://postgres:pass@localhost:5432/test2?sslmode=disable"
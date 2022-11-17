all: ent task atlas

ent:
	go get -d entgo.io/ent/cmd/ent
entgen:
	go generate ./ent
task:
	brew install task
atlas:
	brew install atlas
db:
	docker run --name migration --rm -p 5432:5432 -e POSTGRES_PASSWORD=pass -e POSTGRES_DB=test -d postgres
migrate:
	go run -mod=mod ariga.io/atlas/cmd/atlas@master migrate lint \
      --dev-url="postgresql://postgres:pass@localhost:5432/test?sslmode=disable" \
      --dir="file://ent/migrate/migrations" \
      --dir-format="golang-migrate" \
      --latest=1
apply:
	atlas migrate apply \
      --dir="file://ent/migrate/migrations" \
      --url "postgresql://postgres:pass@localhost:5432/test?sslmode=disable"
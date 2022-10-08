package todo

import (
	"context"
	"github.com/0maru/0maru/sandbox/go/go-ent-gqlgen-atlas/ent"
	"log"

	"entgo.io/ent/dialect"
	_ "github.com/mattn/go-sqlite3"
)

func Example_Todo() {
	client, err := ent.Open(dialect.SQLite, "file:ent?mode=memory&cache=shared&_fk=1")
	if err != nil {
		log.Fatalf("failed opening connection to sqlite: %v", err)
	}
	defer client.Close()
	ctx := context.Background()
	if err := client.Schema.Create(ctx); err != nil {
		log.Fatalf("failed creating schema resources: %v", err)
	}
}

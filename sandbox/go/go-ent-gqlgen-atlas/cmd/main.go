package main

import (
	"context"
	"entgo.io/contrib/entgql"
	"entgo.io/ent/dialect"
	"entgo.io/ent/entc/integration/migrate/versioned/migrate"
	todo "github.com/0maru/0maru/sandbox/go/go-ent-gqlgen-atlas"
	"github.com/0maru/0maru/sandbox/go/go-ent-gqlgen-atlas/ent"
	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	_ "github.com/mattn/go-sqlite3"
	"log"
	"net/http"
)

func main() {
	ds := "postgresql://postgres:pass@localhost:5432/test?sslmode=disable"
	client, err := ent.Open(dialect.Postgres, ds)
	if err != nil {
		log.Fatal("opening ent client", err)
	}
	if err := client.Schema.Create(
		context.Background(),
		migrate.WithGlobalUniqueID(true),
	); err != nil {
		log.Fatal("opening ent client", err)
	}

	// Configure the server and start listening on :8081.
	srv := handler.NewDefaultServer(todo.NewSchema(client))
	srv.Use(entgql.Transactioner{TxOpener: client})
	http.Handle("/",
		playground.Handler("Todo", "/query"),
	)
	http.Handle("/query", srv)
	log.Println("listening on :8081")
	if err := http.ListenAndServe(":8081", nil); err != nil {
		log.Fatal("http server terminated", err)
	}
}

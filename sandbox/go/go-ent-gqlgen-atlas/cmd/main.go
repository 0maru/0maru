package main

import (
	"context"
	"entgo.io/ent/dialect"
	todo "github.com/0maru/0maru/sandbox/go/go-ent-gqlgen-atlas"
	"github.com/0maru/0maru/sandbox/go/go-ent-gqlgen-atlas/ent"
	"github.com/0maru/0maru/sandbox/go/go-ent-gqlgen-atlas/ent/migrate"
	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"log"
	"net/http"

	_ "github.com/mattn/go-sqlite3"
)

func main() {
	client, err := ent.Open(dialect.SQLite, "file:ent?mode=memory&cache=shared&_fk=1")
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
	http.Handle("/",
		playground.Handler("Todo", "/query"),
	)
	http.Handle("/query", srv)
	log.Println("listening on :8081")
	if err := http.ListenAndServe(":8081", nil); err != nil {
		log.Fatal("http server terminated", err)
	}
}

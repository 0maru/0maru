package main

import (
	"context"
	"entgo.io/ent/dialect"
	"github.com/0maru/0maru/sandbox/go/graphql-sample/ent"
	"github.com/0maru/0maru/sandbox/go/graphql-sample/ent/migrate"
	"github.com/0maru/0maru/sandbox/go/graphql-sample/gql"
	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"log"
	"net/http"

	_ "github.com/lib/pq"
)

func main() {
	client, err := ent.Open(dialect.Postgres, "host=localhost port=5432 user=postgres password=pass dbname=postgres sslmode=disable")
	if err != nil {
		log.Fatalf("failed opening connection to sqlite: %v", err)
	}

	// DB Migration
	// マイグレーションのタイミングを管理したいことがあるので実際はatlas やmigrate を使うべき
	if err := client.Schema.Create(context.Background(), migrate.WithGlobalUniqueID(true)); err != nil {
		log.Fatalf("failed creating schema resources: %v", err)
	}

	srv := handler.NewDefaultServer(gql.NewSchema(client))
	http.Handle("/graphql/debug", playground.Handler("GraphQL playground", "/graphql"))
	http.Handle("/graphql", srv)
	log.Println("listening on :8080")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal("http server terminated", err)
	}
}

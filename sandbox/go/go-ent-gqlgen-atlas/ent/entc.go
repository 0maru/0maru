//go:build ignore
// +build ignore

package main

import (
	"entgo.io/contrib/entgql"
	"entgo.io/ent/entc"
	"entgo.io/ent/entc/gen"
	"log"
)

func main() {
	ex, err := entgql.NewExtension(
		entgql.WithWhereInputs(true),
		entgql.WithSchemaPath("ent.graphql"),
		entgql.WithSchemaGenerator(),
		entgql.WithConfigPath("gqlgen.yml"),
	)
	if err != nil {
		log.Fatalln("creating entgql extension: %v", err)
	}

	opts := []entc.Option{
		entc.Extensions(ex),
		entc.TemplateDir("./ent/template"),
	}

	if err = entc.Generate("./ent/schema",
		&gen.Config{Features: []gen.Feature{gen.FeatureVersionedMigration}}, opts...); err != nil {
		log.Fatalf("running ent codegen: %v", err)
	}
}

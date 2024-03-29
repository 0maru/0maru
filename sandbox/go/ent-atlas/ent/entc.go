//go:build ignore

package main

import (
	"log"

	"entgo.io/ent/entc"
	"entgo.io/ent/entc/gen"
)

func main() {
	err := entc.Generate("./ent/schema", &gen.Config{
		Features: []gen.Feature{gen.FeatureVersionedMigration},
	})
	if err != nil {
		log.Fatalf("running ent codegen: %v", err)
	}
}

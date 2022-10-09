package main

import (
	"ariga.io/atlas/sql/sqltool"
	"context"
	"entgo.io/ent/dialect"
	"entgo.io/ent/dialect/sql/schema"
	"flag"
	"log"
	"os"

	migrate "ent-atlas/ent/migrate"
	_ "github.com/go-sql-driver/mysql"
)

// マイグレーションファイルを生成したいときは
// go run -mod=mod cmd/migrate/main.go <name> を実行する
func main() {
	flag.Parse()
	ctx := context.Background()
	dir, err := sqltool.NewGolangMigrateDir("./ent/migrate/migrations")
	if err != nil {
		log.Fatalf("failed creating atlas migration directory: %v", err)
	}
	// Migrate diff options.
	opts := []schema.MigrateOption{
		schema.WithDir(dir),                          // provide migration directory
		schema.WithMigrationMode(schema.ModeInspect), // provide migration mode
		schema.WithDialect(dialect.MySQL),            // Ent dialect to use
	}
	if len(os.Args) != 2 {
		log.Fatalln("migration name is required. Use: 'go run -mod=mod ent/migrate/main.go <name>'")
	}
	url := "mysql://root:pass@localhost:3306/test"
	err = migrate.NamedDiff(ctx, url, os.Args[1], opts...)
	if err != nil {
		log.Fatalf("failed generating migration file: %v", err)
	}
}

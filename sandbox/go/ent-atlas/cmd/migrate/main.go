package main

import (
	"ariga.io/atlas/sql/sqltool"
	"context"
	"ent-atlas/ent/migrate"
	"entgo.io/ent/dialect"
	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/schema"
	"entgo.io/ent/entc"
	"entgo.io/ent/entc/gen"
	"log"
	"os"

	_ "github.com/go-sql-driver/mysql"
)

// マイグレーションファイルを生成したいときは
// go run -mod=mod cmd/migrate/main.go <name> を実行する
func main() {
	if len(os.Args) > 2 {
		log.Fatal("no name given")
	}
	dir, err := sqltool.NewGolangMigrateDir("./ent/migrate/migrations")
	if err != nil {
		log.Fatalln("failed creating migration directory:", err)
	}
	graph, err := entc.LoadGraph("./ent/schema", &gen.Config{})
	if err != nil {
		log.Fatalln("failed loading schemas:", err)
	}
	tbls, err := graph.Tables()
	if err != nil {
		log.Fatalln("failed creating tables:", err)
	}
	drv, err := sql.Open(dialect.MySQL, "root:pass@tcp(localhost:3306)/test2")
	if err != nil {
		log.Fatalln("failed opening database:", err)
	}
	m, err := schema.NewMigrate(drv,
		schema.WithDir(dir),
		migrate.WithDropIndex(true),
		migrate.WithDropColumn(true),
	)
	if err != nil {
		log.Fatalln("failed creating migrate:", err)
	}
	if err := m.NamedDiff(context.Background(), os.Args[1], tbls...); err != nil {
		log.Fatalln("failed creating migration:", err)
	}
}

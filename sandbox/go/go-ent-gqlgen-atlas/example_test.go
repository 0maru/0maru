package todo

import (
	"context"
	"fmt"
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

	task1, err := client.Todo.Create().SetText("Add GraphQL Example").Save(ctx)
	if err != nil {
		log.Fatalf("faild creating a todo: %v", err)
	}
	fmt.Println(task1)
	task2, err := client.Todo.Create().SetText("Add Tracking Example").Save(ctx)
	if err != nil {
		log.Fatalf("faild creating a todo: %v", err)
	}
	fmt.Printf("%d: %q\n", task2.ID, task2.Text)

	// task1とtask2 を親子関係にする
	if err := task2.Update().SetParent(task1).Exec(ctx); err != nil {
		log.Fatalf("failed connecting todo2 to its parent: %v", err)
	}

	// すべてのTODOを取得（Query）
	items, err := client.Todo.Query().All(ctx)
	if err != nil {
		log.Fatalf("failed querying todos: %v", err)
	}
	for _, t := range items {
		fmt.Printf("%d: %q\n", t.ID, t.Text)
	}
}

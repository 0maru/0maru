package internal

import (
	"context"
	"ent/ent"
	"log"

	"entgo.io/ent/dialect"
)

func main() {
	client, e := ent.Open(dialect.MySQL, "")
	if e != nil {
		log.Fatal("")
	}
	ctx := context.Background()
	client.User.Query().All(ctx)
}

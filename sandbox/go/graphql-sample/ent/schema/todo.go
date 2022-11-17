package schema

import (
	"entgo.io/contrib/entgql"
	"entgo.io/ent"
	"entgo.io/ent/dialect/entsql"
	"entgo.io/ent/schema"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
	"time"
)

// Todo holds the schema definition for the Todo entity.
type Todo struct {
	ent.Schema
}

// Fields of the Todo.
func (Todo) Fields() []ent.Field {
	return []ent.Field{
		// GraphQL のid で使うカラムをuuid にした場合はその他のtype でもid にuuid を使う必要がある
		field.UUID("id", uuid.UUID{}).Default(uuid.New),
		field.Text("description"),
		field.Bool("completed").
			Default(false),
		field.Time("created_at").
			Default(time.Now).
			Annotations(&entsql.Annotation{
				Default: "CURRENT_TIMESTAMP",
			}),
		field.Time("updated_at").
			Default(time.Now),
	}
}

// Edges of the Todo.
func (Todo) Edges() []ent.Edge {
	return nil
}

func (Todo) Annotations() []schema.Annotation {
	return []schema.Annotation{
		entgql.QueryField(),
		entgql.Mutations(entgql.MutationCreate(), entgql.MutationUpdate()),
	}
}

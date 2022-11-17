package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
	"github.com/google/uuid"
	"time"
)

// Task holds the schema definition for the Task entity.
type Task struct {
	ent.Schema
}

// Fields of the Task.
func (Task) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.String("title").
			NotEmpty().
			MaxLen(100),
		field.String("description").
			Optional(),
		field.String("category").
			Nillable(),
		field.Int("priority").
			Default(0),
		field.Time("created_at").
			Default(time.Now),
		field.Time("updated_at").
			Default(time.Now),
	}
}

// Edges of the Task.
func (Task) Edges() []ent.Edge {
	return nil
}

func (Task) Indexes() []ent.Index {
	return []ent.Index{
		index.Fields("title"),
		// 複合インデックス
		index.Fields("priority", "category"),
	}
}

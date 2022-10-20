package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/field"
	"entgo.io/ent/schema/index"
	"github.com/google/uuid"
	"regexp"
)

// Category holds the schema definition for the Category entity.
type Category struct {
	ent.Schema
}

// Fields of the Category.
func (Category) Fields() []ent.Field {
	return []ent.Field{
		field.UUID("id", uuid.UUID{}).
			Default(uuid.New),
		field.String("name").
			NotEmpty().
			Match(regexp.MustCompile("[a-zA-Z]")),
		field.Int("priority").
			Default(0),
	}
}

// Edges of the Category.
func (Category) Edges() []ent.Edge {
	return nil
}

func (Category) Indexes() []ent.Index {
	return []ent.Index{
		// Unique インデックス
		index.Fields("name").Unique(),
	}
}

package schema

import (
	"entgo.io/ent"
	"entgo.io/ent/schema/field"
)

type Tenant struct {
	ent.Schema
}

func (Tenant) Fields() []ent.Field {
	return []ent.Field{
		field.String("name"),
	}
}

func (Tenant) Edges() []ent.Edge {
	return nil
}

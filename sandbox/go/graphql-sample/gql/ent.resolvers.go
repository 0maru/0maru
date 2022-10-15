package gql

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	"fmt"

	graphql_sample "github.com/0maru/0maru/sandbox/go/graphql-sample"
	"github.com/0maru/0maru/sandbox/go/graphql-sample/ent"
)

// Node is the resolver for the node field.
func (r *queryResolver) Node(ctx context.Context, id int) (ent.Noder, error) {
	panic(fmt.Errorf("not implemented: Node - node"))
}

// Nodes is the resolver for the nodes field.
func (r *queryResolver) Nodes(ctx context.Context, ids []int) ([]ent.Noder, error) {
	panic(fmt.Errorf("not implemented: Nodes - nodes"))
}

// Todos is the resolver for the todos field.
func (r *queryResolver) Todos(ctx context.Context) ([]*ent.Todo, error) {
	panic(fmt.Errorf("not implemented: Todos - todos"))
}

// Query returns graphql_sample.QueryResolver implementation.
func (r *Resolver) Query() graphql_sample.QueryResolver { return &queryResolver{r} }

type queryResolver struct{ *Resolver }

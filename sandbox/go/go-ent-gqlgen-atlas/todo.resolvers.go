package todo

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"

	"github.com/0maru/0maru/sandbox/go/go-ent-gqlgen-atlas/ent"
	"github.com/0maru/0maru/sandbox/go/go-ent-gqlgen-atlas/ent/todo"
)

// CreateTodo is the resolver for the createTodo field.
func (r *mutationResolver) CreateTodo(ctx context.Context, input ent.CreateTodoInput) (*ent.Todo, error) {
	client := ent.FromContext(ctx)
	return client.Todo.Create().SetInput(input).Save(ctx)
}

// UpdateTodo is the resolver for the updateTodo field.
func (r *mutationResolver) UpdateTodo(ctx context.Context, id int, input ent.UpdateTodoInput) (*ent.Todo, error) {
	return r.client.Todo.UpdateOneID(id).SetInput(input).Save(ctx)
}

// IsCompleted is the resolver for the isCompleted field.
func (r *todoWhereInputResolver) IsCompleted(ctx context.Context, obj *ent.TodoWhereInput, data *bool) error {
	if obj == nil || data == nil {
		return nil
	}
	if *data {
		obj.AddPredicates(todo.StatusEQ(todo.StatusCompleted))
	} else {
		obj.AddPredicates(todo.StatusNEQ(todo.StatusCompleted))
	}
	return nil
}

// Mutation returns MutationResolver implementation.
func (r *Resolver) Mutation() MutationResolver { return &mutationResolver{r} }

type mutationResolver struct{ *Resolver }

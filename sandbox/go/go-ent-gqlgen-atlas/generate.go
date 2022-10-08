package todo

//go:generate go run -mod=mod entgo.io/ent/cmd/ent generate ./ent/schema
//go:generate go run -mod=mod ./ent/entc.go
//go:generate go run -mod=mod github.com/99designs/gqlgen

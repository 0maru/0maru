# 参考URL

- https://entgo.io/
- https://atlasgo.io/
- https://entgo.io/ja/blog/2022/03/14/announcing-versioned-migrations

# マイグレーションファイルの生成

```bash
go run -mod=mod cmd/migrate/main.go <name>
```

# マイグレーションの実行

```bash
make apply
```
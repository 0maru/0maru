-- create "tasks" table
CREATE TABLE "tasks" ("id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY, "name" text NOT NULL, "age" bigint NOT NULL, PRIMARY KEY ("id"));
-- create "users" table
CREATE TABLE "users" ("id" bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY, "name" text NOT NULL, "age" bigint NOT NULL, PRIMARY KEY ("id"));

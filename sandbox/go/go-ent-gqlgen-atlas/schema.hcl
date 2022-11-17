table "atlas_schema_revisions" {
  schema = schema.atlas_schema_revisions
  column "version" {
    null = false
    type = character_varying
  }
  column "description" {
    null = false
    type = character_varying
  }
  column "type" {
    null    = false
    type    = bigint
    default = 2
  }
  column "applied" {
    null    = false
    type    = bigint
    default = 0
  }
  column "total" {
    null    = false
    type    = bigint
    default = 0
  }
  column "executed_at" {
    null = false
    type = timestamptz
  }
  column "execution_time" {
    null = false
    type = bigint
  }
  column "error" {
    null = true
    type = text
  }
  column "hash" {
    null = false
    type = character_varying
  }
  column "partial_hashes" {
    null = true
    type = jsonb
  }
  column "operator_version" {
    null = false
    type = character_varying
  }
  primary_key {
    columns = [column.version]
  }
}
table "versioned_groups" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
    identity {
      generated = BY_DEFAULT
    }
  }
  column "name" {
    null = false
    type = character_varying
  }
  primary_key {
    columns = [column.id]
  }
}
table "versioned_users" {
  schema = schema.public
  column "id" {
    null = false
    type = bigint
    identity {
      generated = BY_DEFAULT
    }
  }
  column "age" {
    null = false
    type = integer
  }
  column "name" {
    null = false
    type = character_varying
  }
  column "address" {
    null = true
    type = character_varying
  }
  primary_key {
    columns = [column.id]
  }
}
schema "atlas_schema_revisions" {
}
schema "public" {
}

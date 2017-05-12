# Ecto2060

Reproduction of [elixir-ecto/ecto](https://github.com/elixir-ecto/ecto) [#2060](https://github.com/elixir-ecto/ecto/issues/2060)

You will have to create the database manually (as opposed to `mix ecto.create -r Ecto2060.Repo`) 
since the database name is purposely not set in config.exs.

Once the database is created:

```
hogan@mbp ~/d/ecto2060> mix ecto.migrate --repo Ecto2060.Repo --prefix ecto2060_dev

16:59:23.781 [info]  == Running Ecto2060.Repo.Migrations.CreateATable.change/0 forward

16:59:23.781 [info]  create table ecto2060_dev.thing_table

16:59:23.796 [info]  == Migrated in 0.0s
hogan@mbp ~/d/ecto2060> mix ecto.rollback --repo Ecto2060.Repo --prefix ecto2060_dev

16:59:29.541 [info]  == Running Ecto2060.Repo.Migrations.CreateATable.change/0 backward

16:59:29.542 [info]  drop table ecto2060_dev.thing_table

16:59:29.553 [info]  == Migrated in 0.0s

16:59:29.557 [error] Could not update schema migrations. This error typically happens when the "schema_migrations" table, which Ecto uses for storing migrationinformation, is already used by another library or for other purposes.

You can fix this by running `mix ecto.drop` in the appropriate `MIX_ENV` to drop the existing database and let Ecto start a new one with a proper definition of "schema_migrations" or by configuring the repository to use another source:

    config :ecto2060, Ecto2060.Repo,
      migration_source: "some_other_table_for_schema_migrations"

The full error is shown below.

** (Mariaex.Error) (1046): No database selected
    (ecto) lib/ecto/adapters/sql.ex:436: Ecto.Adapters.SQL.execute_and_cache/7
    (ecto) lib/ecto/migrator.ex:276: Ecto.Migrator.verbose_schema_migration/3
    (ecto) lib/ecto/adapters/sql.ex:620: anonymous fn/3 in Ecto.Adapters.SQL.do_transaction/3
    (db_connection) lib/db_connection.ex:1275: DBConnection.transaction_run/4
    (db_connection) lib/db_connection.ex:1199: DBConnection.run_begin/3
    (db_connection) lib/db_connection.ex:790: DBConnection.transaction/3
    (ecto) lib/ecto/migrator.ex:251: anonymous fn/4 in Ecto.Migrator.migrate/4
    (elixir) lib/enum.ex:1229: Enum."-map/2-lists^map/1-0-"/2
```



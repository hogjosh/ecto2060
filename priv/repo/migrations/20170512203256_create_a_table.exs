defmodule Ecto2060.Repo.Migrations.CreateATable do
  use Ecto.Migration

  def change do
    create table(:thing_table) do
      add :thing, :string
    end
  end
end

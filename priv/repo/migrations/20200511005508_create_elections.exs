defmodule Voting.Repo.Migrations.CreateElections do
  use Ecto.Migration

  def change do
    create table(:elections) do
      add :name, :string, null: false
      add :cover, :string
      add :notice, :string
      add :starts_at, :naive_datetime, null: false
      add :ends_at, :naive_datetime, null: false
      add :created_by, references(:administrators, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:elections, [:created_by])
  end
end

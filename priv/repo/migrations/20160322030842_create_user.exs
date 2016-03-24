defmodule BlogPhoenix.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :password, :string
      add :role, :integer

      timestamps
    end

    create unique_index(:users, [:username])

  end
end

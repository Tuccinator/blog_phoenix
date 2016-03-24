defmodule BlogPhoenix.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :deleted_at, :datetime
      add :body, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps
    end
    create index(:posts, [:user_id])

  end
end

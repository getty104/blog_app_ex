defmodule BlogApp.Repo.Migrations.AddPublishedToPost do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :published, :boolean, default: false
    end

    create index(:posts, [:published], concurrently: false)
    execute "UPDATE posts SET published = true"
  end
end

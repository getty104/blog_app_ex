defmodule BlogApp.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :title, :string, null: false
      add :body, :text, null: false
      add :image, :string

      timestamps()
    end

  end
end

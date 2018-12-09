defmodule BlogApp.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :title, :string
      add :body, :text
      add :image, :string

      timestamps()
    end

  end
end

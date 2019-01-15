defmodule BlogApp.Repo.Migrations.ModifyImageToPosts do
  use Ecto.Migration

  def up do
    alter table(:posts) do
      modify :image, :text
    end
  end

  def down do
    alter table(:posts) do
      modify :image, :string
    end
  end
end

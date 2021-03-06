defmodule BlogApp.Blogs.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :image, :string
    field :title, :string
    field :published, :boolean

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :image, :published])
    |> validate_required([:title, :body, :published])
  end
end

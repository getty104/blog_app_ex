defmodule BlogAppWeb.Blogs.Resolvers do
  @moduledoc """
  The Blogs context.
  """

  import Ecto.Query, warn: false
  alias Absinthe.Relay.Connection
  alias BlogApp.Repo
  alias BlogApp.Blogs

  def list_posts(pagination_args, _scope) do
    Blogs.Post
    |> where(published: true)
    |> order_by(desc: :inserted_at)
    |> Connection.from_query(&Repo.all/1, pagination_args)
  end

  def get_post(_parent, %{id: id}, _resolution) do
    case Blogs.Post |> where(published: true) |> Repo.get(id) do
      nil ->
        {:error, "Post ID #{id} not found"}

      post ->
        {:ok, post}
    end
  end
end

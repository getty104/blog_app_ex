defmodule BlogApp.Blogs.Resolvers.Schema do
  @moduledoc """
  The Blog's Schema Resover
  """

  import Ecto.Query, warn: false
  alias Absinthe.Relay.Connection
  alias BlogApp.Repo
  alias BlogApp.Blogs

  def post(_parent, %{id: id}, _resolution) do
    case Blogs.Post |> where(published: true) |> Repo.get(id) do
      nil ->
        {:error, "Post ID #{id} not found"}

      post ->
        {:ok, post}
    end
  end

  def post_connection(pagination_args, _scope) do
    Blogs.Post
    |> where(published: true)
    |> order_by(desc: :inserted_at)
    |> Connection.from_query(&Repo.all/1, pagination_args)
  end
end

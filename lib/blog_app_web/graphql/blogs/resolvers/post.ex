defmodule BlogAppWeb.Blogs.Resolvers.Post do
  alias Absinthe.Relay.Connection
  alias BlogApp.Repo
  alias BlogApp.Blogs

  def posts_connection(pagination_args, _scope) do
    Blogs.list_posts_query()
    |> Connection.from_query(&Repo.all/1, pagination_args)
  end

  def find_post(_parent, %{id: id}, _resolution) do
    case Blogs.get_post(id) do
      nil ->
        {:error, "Post ID #{id} not found"}

      post ->
        {:ok, post}
    end
  end
end

defmodule BlogAppWeb.Resolvers.Blog do
  alias Absinthe.Relay.Connection
  alias BlogApp.Repo

  def posts_connection(pagination_args, _scope) do
    offset =
      case pagination_args do
        %{offset: offset} -> offset
        _ -> 0
      end

    args = %{first: pagination_args.first, before: Connection.offset_to_cursor(offset)}

    BlogApp.Blogs.list_posts_query()
    |> Connection.from_query(&Repo.all/1, args)
  end

  def find_post(_parent, %{id: id}, _resolution) do
    case BlogApp.Blogs.get_post(id) do
      nil ->
        {:error, "Post ID #{id} not found"}

      post ->
        {:ok, post}
    end
  end
end

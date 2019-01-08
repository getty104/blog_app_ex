defmodule BlogAppWeb.Blogs.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types(BlogAppWeb.Blogs.Types)
  import_types(Absinthe.Type.Custom)

  alias BlogAppWeb.Blogs.Resolvers
  alias Absinthe.Relay.Connection

  query do
    @desc "Get posts connection"
    connection field :posts, node_type: :post do
      arg(:offset, :integer)
      resolve(&Resolvers.list_posts(convert_offset_to_before(&1), &2))
    end

    @desc "Get a post of the blog"
    field :post, :post do
      arg(:id, non_null(:uuid))
      resolve(&Resolvers.get_post/3)
    end
  end

  defp convert_offset_to_before(pagination_args) do
    case pagination_args do
      %{offset: offset} ->
        Map.merge(pagination_args, %{before: Connection.offset_to_cursor(offset)})

      _ ->
        pagination_args
    end
  end
end

defmodule BlogAppWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  import_types(BlogAppWeb.Schema.BlogTypes)
  import_types(Absinthe.Type.Custom)

  alias BlogAppWeb.Resolvers

  query do
    @desc "Get all posts"
    connection field :posts, node_type: :post do
      arg(:offset, :integer)
      resolve(&Resolvers.Blog.posts_connection/2)
    end

    @desc "Get a post of the blog"
    field :post, :post do
      arg(:id, non_null(:uuid))
      resolve(&Resolvers.Blog.find_post/3)
    end
  end
end

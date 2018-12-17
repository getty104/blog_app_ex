defmodule BlogAppWeb.Schema do
  use Absinthe.Schema
  import_types(BlogAppWeb.Schema.BlogTypes)
  import_types(Absinthe.Type.Custom)

  alias BlogAppWeb.Resolvers

  query do
    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve(&Resolvers.Blog.list_posts/3)
    end

    @desc "Get a user of the blog"
    field :post, :post do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Blog.find_post/3)
    end
  end
end

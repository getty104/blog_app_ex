defmodule BlogAppWeb.Schema do
  use Absinthe.Schema
  import_types BlogAppWeb.Schema.ContentTypes

  alias BlogAppWeb.Resolvers

  query do
    @desc "Get all blogs"
    field :blogs, list_of(:blog) do
      resolve &Resolvers.Content.list_blogs/3
    end
  end
end

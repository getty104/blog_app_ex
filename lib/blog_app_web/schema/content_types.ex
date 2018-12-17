defmodule BlogAppWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :blog do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :body, non_null(:string)
    field :image, :string
  end
end

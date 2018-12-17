defmodule BlogAppWeb.Schema.BlogTypes do
  use Absinthe.Schema.Notation

  object :post do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :body, non_null(:string)
    field :image, :string
    field :inserted_at, non_null(:naive_datetime)
  end
end

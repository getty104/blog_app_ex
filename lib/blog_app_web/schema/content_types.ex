defmodule BlogAppWeb.Schema.BlogTypes do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  use BlogAppWeb.Schema.BlogScalars

  object :post do
    field :id, non_null(:uuid)
    field :title, non_null(:string)
    field :body, non_null(:string)
    field :image, :string
    field :inserted_at, non_null(:naive_datetime)
  end

  connection(node_type: :post)
end

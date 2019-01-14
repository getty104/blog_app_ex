defmodule BlogApp.Blogs.Objects.Post do
  defmacro __using__(_) do
    quote do
      object :post do
        field :id, non_null(:uuid)
        field :title, non_null(:string)
        field :body, non_null(:string)
        field :image, :string
        field :inserted_at, non_null(:naive_datetime)
      end
    end
  end
end

defmodule BlogApp.Blogs.Connections.Post do
  defmacro __using__(_) do
    quote do
      connection(node_type: :post)
    end
  end
end

defmodule BlogAppWeb.Blogs.Connections do
  alias BlogAppWeb.Blogs.Connections

  defmacro __using__(_) do
    quote do
      use Connections.Post
    end
  end
end

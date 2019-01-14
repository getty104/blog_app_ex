defmodule BlogApp.Blogs.Connections do
  alias BlogApp.Blogs.Connections

  defmacro __using__(_) do
    quote do
      use Connections.Post
    end
  end
end

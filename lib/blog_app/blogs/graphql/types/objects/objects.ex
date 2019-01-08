defmodule BlogAppWeb.Blogs.Objects do
  alias BlogAppWeb.Blogs.Objects

  defmacro __using__(_) do
    quote do
      use Objects.Post
    end
  end
end

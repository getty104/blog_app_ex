defmodule BlogApp.Blogs.Objects do
  alias BlogApp.Blogs.Objects

  defmacro __using__(_) do
    quote do
      use Objects.Post
    end
  end
end

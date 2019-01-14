defmodule BlogApp.Blogs.Scalars do
  alias BlogApp.Blogs.Scalars

  defmacro __using__(_) do
    quote do
      use Scalars.UUID
    end
  end
end

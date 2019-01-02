defmodule BlogAppWeb.Blogs.Scalars do
  alias BlogAppWeb.Blogs.Scalars

  defmacro __using__(_) do
    quote do
      use Scalars.UUID
    end
  end
end

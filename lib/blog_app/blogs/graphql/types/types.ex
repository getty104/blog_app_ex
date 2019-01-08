defmodule BlogAppWeb.Blogs.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  use BlogAppWeb.Blogs.Scalars
  use BlogAppWeb.Blogs.Objects
  use BlogAppWeb.Blogs.Connections
end

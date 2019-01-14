defmodule BlogApp.Blogs.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Relay.Schema.Notation, :modern
  use BlogApp.Blogs.Scalars
  use BlogApp.Blogs.Objects
  use BlogApp.Blogs.Connections
end

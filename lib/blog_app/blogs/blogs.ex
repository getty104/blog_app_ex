defmodule BlogApp.Blogs do
  @moduledoc """
  The Blogs context.
  """

  import Ecto.Query, warn: false
  alias BlogApp.Repo

  alias BlogApp.Blogs.Blog

  def list_blogs do
    Repo.all(Blog)
  end

  def get_blog!(id), do: Repo.get!(Blog, id)
end

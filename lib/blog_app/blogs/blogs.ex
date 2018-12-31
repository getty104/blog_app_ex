defmodule BlogApp.Blogs do
  @moduledoc """
  The Blogs context.
  """

  import Ecto.Query, warn: false
  alias BlogApp.Repo

  alias BlogApp.Blogs.Post

  def list_posts_query do
    Post
    |> order_by(desc: :inserted_at)
  end

  def get_post!(id), do: Repo.get!(Post, id)
  def get_post(id), do: Repo.get(Post, id)
end

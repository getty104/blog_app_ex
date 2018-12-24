defmodule BlogApp.Blogs do
  @moduledoc """
  The Blogs context.
  """

  import Ecto.Query, warn: false
  alias BlogApp.Repo

  alias BlogApp.Blogs.Post

  def list_posts do
    Post |> order_by(desc: :inserted_at) |> Repo.all()
  end

  def get_post!(id), do: Repo.get!(Post, id)
  def get_post(id), do: Repo.get(Post, id)
end

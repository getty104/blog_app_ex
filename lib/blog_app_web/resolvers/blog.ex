defmodule BlogAppWeb.Resolvers.Blog do

  def list_posts(_parent, _args, _resolution) do
    {:ok, BlogApp.Blogs.list_posts()}
  end

  def find_post(_parent, %{id: id}, _resolution) do
    case BlogApp.Blogs.get_post(id) do
      nil ->
        {:error, "Post ID #{id} not found"}
      post ->
        {:ok, post}
    end
  end
end

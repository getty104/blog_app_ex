defmodule BlogAppWeb.Resolvers.Content do

  def list_blogs(_parent, _args, _resolution) do
    {:ok, BlogApp.Blogs.list_blogs()}
  end

end

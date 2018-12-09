defmodule BlogAppWeb.Admins.BlogController do
  use BlogAppWeb, :controller
  alias BlogApp.Admins
  alias BlogApp.Admins.Blog

  plug BasicAuth, use_config: {:blog_app, :basic_auth}

  def index(conn, _params) do
    blogs = Admins.list_blogs()
    render(conn, "index.html", blogs: blogs)
  end

  def new(conn, _params) do
    changeset = Admins.change_blog(%Blog{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"blog" => blog_params}) do
    case Admins.create_blog(blog_params) do
      {:ok, blog} ->
        conn
        |> put_flash(:info, "Blog created successfully.")
        |> redirect(to: Routes.admins_blog_path(conn, :show, blog))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    blog = Admins.get_blog!(id)
    render(conn, "show.html", blog: blog)
  end

  def edit(conn, %{"id" => id}) do
    blog = Admins.get_blog!(id)
    changeset = Admins.change_blog(blog)
    render(conn, "edit.html", blog: blog, changeset: changeset)
  end

  def update(conn, %{"id" => id, "blog" => blog_params}) do
    blog = Admins.get_blog!(id)

    case Admins.update_blog(blog, blog_params) do
      {:ok, blog} ->
        conn
        |> put_flash(:info, "Blog updated successfully.")
        |> redirect(to: Routes.admins_blog_path(conn, :show, blog))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", blog: blog, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    blog = Admins.get_blog!(id)
    {:ok, _blog} = Admins.delete_blog(blog)

    conn
    |> put_flash(:info, "Blog deleted successfully.")
    |> redirect(to: Routes.admins_blog_path(conn, :index))
  end
end

defmodule BlogApp.AdminsTest do
  use BlogApp.DataCase

  alias BlogApp.Admins

  describe "blogs" do
    alias BlogApp.Admins.Blog

    @valid_attrs %{body: "some body", image: "some image", title: "some title"}
    @update_attrs %{body: "some updated body", image: "some updated image", title: "some updated title"}
    @invalid_attrs %{body: nil, image: nil, title: nil}

    def blog_fixture(attrs \\ %{}) do
      {:ok, blog} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admins.create_blog()

      blog
    end

    test "list_blogs/0 returns all blogs" do
      blog = blog_fixture()
      assert Admins.list_blogs() == [blog]
    end

    test "get_blog!/1 returns the blog with given id" do
      blog = blog_fixture()
      assert Admins.get_blog!(blog.id) == blog
    end

    test "create_blog/1 with valid data creates a blog" do
      assert {:ok, %Blog{} = blog} = Admins.create_blog(@valid_attrs)
      assert blog.body == "some body"
      assert blog.image == "some image"
      assert blog.title == "some title"
    end

    test "create_blog/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admins.create_blog(@invalid_attrs)
    end

    test "update_blog/2 with valid data updates the blog" do
      blog = blog_fixture()
      assert {:ok, %Blog{} = blog} = Admins.update_blog(blog, @update_attrs)
      assert blog.body == "some updated body"
      assert blog.image == "some updated image"
      assert blog.title == "some updated title"
    end

    test "update_blog/2 with invalid data returns error changeset" do
      blog = blog_fixture()
      assert {:error, %Ecto.Changeset{}} = Admins.update_blog(blog, @invalid_attrs)
      assert blog == Admins.get_blog!(blog.id)
    end

    test "delete_blog/1 deletes the blog" do
      blog = blog_fixture()
      assert {:ok, %Blog{}} = Admins.delete_blog(blog)
      assert_raise Ecto.NoResultsError, fn -> Admins.get_blog!(blog.id) end
    end

    test "change_blog/1 returns a blog changeset" do
      blog = blog_fixture()
      assert %Ecto.Changeset{} = Admins.change_blog(blog)
    end
  end
end

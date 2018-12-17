defmodule BlogApp.PostsTest do
  use BlogApp.DataCase

  alias BlogApp.Blogs

  describe "posts" do
    alias BlogApp.Blogs.Post

    @valid_attrs %{body: "some body", image: "some image", title: "some title"}
    @update_attrs %{
      body: "some updated body",
      image: "some updated image",
      title: "some updated title"
    }
    @invalid_attrs %{body: nil, image: nil, title: nil}

    def post_fixture(attrs \\ %{}) do
      {:ok, post} =
        %Post{}
        |> Post.changeset(Enum.into(attrs, @valid_attrs))
        |> Repo.insert()

      post
    end

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Blogs.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Blogs.get_post!(post.id) == post
    end

    test "get_post/1 returns the post with given id" do
      post = post_fixture()
      assert Blogs.get_post(post.id) == post
    end
  end
end

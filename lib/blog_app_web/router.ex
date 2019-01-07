defmodule BlogAppWeb.Router do
  use BlogAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    if Mix.env() == :prod do
      plug CORSPlug, origin: "https://www.getty104.tk"
    else
      plug CORSPlug, origin: "http://localhost:3000"
    end
  end

  scope "/api" do
    pipe_through :api
    forward "/graph", Absinthe.Plug, schema: BlogAppWeb.Blogs.Schema
    options "/graph", Absinthe.Plug, :options
  end

  scope "/admin", as: :admins do
    pipe_through :browser
    resources "/posts", BlogAppWeb.Admins.PostController
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: BlogAppWeb.Blogs.Schema
  end

  # Other scopes may use custom stacks.
  # scope "/api", BlogAppWeb do
  #   pipe_through :api
  # end
end

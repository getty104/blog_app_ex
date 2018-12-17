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
  end

  scope "/api" do
    pipe_through :api
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: BlogAppWeb.Schema

    forward "/graph", Absinthe.Plug, schema: BlogAppWeb.Schema
  end

  scope "/admin", :"Elixir.BlogAppWeb.Admins", as: :admins do
    pipe_through :browser
    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BlogAppWeb do
  #   pipe_through :api
  # end
end

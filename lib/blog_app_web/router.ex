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
    plug :accepts, ["json"]
  end

  scope "/admin", :"Elixir.BlogAppWeb.Admins", as: :admins do
    pipe_through :browser
    resources "/blogs", BlogController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BlogAppWeb do
  #   pipe_through :api
  # end
end

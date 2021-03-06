defmodule ParallelMarketsWeb.Router do
  use ParallelMarketsWeb, :router

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

  scope "/", ParallelMarketsWeb do
    pipe_through :browser

    get "/", InvestorController, :new
    post "/", InvestorController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", ParallelMarketsWeb do
  #   pipe_through :api
  # end
end

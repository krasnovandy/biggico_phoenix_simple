defmodule BiggicoPhoenixSimpleWeb.Router do
  use BiggicoPhoenixSimpleWeb, :router

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

  scope "/", BiggicoPhoenixSimpleWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/form_datas", FormDataController
  end


end

defmodule ZiplocationPhoenixWeb.PageController do
  use ZiplocationPhoenixWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

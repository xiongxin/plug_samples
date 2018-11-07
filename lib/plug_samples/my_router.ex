defmodule PlugSamples.MyRouter do
  use Plug.Router

  plug Plug.Logger, log: :debug
  plug :json_header_plug
  plug :match
  plug :dispatch

  get "/hello" do
    send_resp(conn, 200, "world")
  end

  #forward("/users", options)

  match _ do
    send_resp(conn, 404, "oops")
  end


  def json_header_plug(conn, _opts) do
    #Plug.Conn.put_resp_header(conn, "server", "elixir phoneix")
    Plug.Conn.put_resp_content_type(conn, "application/json")
  end
end

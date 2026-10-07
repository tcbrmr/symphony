defmodule SymphonyElixirWeb.HelloWorldController do
  @moduledoc """
  Serves the minimal hello-world page.
  """

  use Phoenix.Controller, formats: [:html]

  alias Plug.Conn

  @spec index(Conn.t(), map()) :: Conn.t()
  def index(conn, _params) do
    ip_address = format_remote_ip(conn.remote_ip)
    alert_message = "hallo #{ip_address}"

    html(conn, """
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Hallo World</title>
        <style>
          html,
          body {
            height: 100%;
            margin: 0;
          }

          body {
            display: grid;
            place-items: center;
            background: #ffffff;
            color: #111827;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
          }

          button {
            border: 0;
            background: transparent;
            color: inherit;
            cursor: pointer;
            font: 600 2rem/1.2 system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
            padding: 0.5rem;
          }

          button:focus-visible {
            border-radius: 4px;
            outline: 3px solid #2563eb;
            outline-offset: 4px;
          }
        </style>
      </head>
      <body>
        <main>
          <button type="button" onclick='window.alert(#{Jason.encode!(alert_message)})'>Hallo World</button>
        </main>
      </body>
    </html>
    """)
  end

  defp format_remote_ip(remote_ip) do
    remote_ip
    |> :inet.ntoa()
    |> List.to_string()
  end
end

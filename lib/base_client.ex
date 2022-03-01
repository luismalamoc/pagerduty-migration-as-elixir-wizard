defmodule BaseClient do
  def do_get_request(url, headers) do
    case HTTPoison.get(url, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        case Poison.decode(body) do
          {:ok, decoded} -> {:ok, decoded}
          {:error, error} -> {:error, error}
        end
      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        Logger.error("do_get_request, status_code=#{status_code}")
        {:error, status_code}
      {:error, error} ->
        Logger.error("do_get_request, error=#{error}")
        {:error, error}
    end
  end
end

require Logger

defmodule DataHandler do

  @query_limit 100

  def get_all_users() do
    get_all_users_acc(0, [])
  end

  defp get_all_users_acc(offset, accumulative_list) do
    with {:ok, response} <- PagerdutyClient.get_users(offset, @query_limit) do
      case response["more"] do
        true -> get_all_users_acc((offset + @query_limit), (accumulative_list ++ response["users"]))
        false -> {:ok, accumulative_list ++ response["users"] }
      end
    else
      {:error, error} -> Logger.error("get_all_users_acc, error=#{error}")
    end
  end


end

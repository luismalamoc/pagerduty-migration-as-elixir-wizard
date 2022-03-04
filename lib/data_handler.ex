require Logger

defmodule DataHandler do

  @query_limit 100

  def get_all_users() do
    get_all_users_acc(0, [])
  end

  defp get_all_users_acc(offset, accumulative_list) do
    with {:ok, response} <- ApiClient.get_users(offset, @query_limit) do
      case response["more"] do
        true -> get_all_users_acc((offset + @query_limit), (accumulative_list ++ response["users"]))
        false -> accumulative_list ++ response["users"]
      end
    else
      {:error, error} -> Logger.error("get_all_users_acc, error=#{error}")
    end
  end

  defp get_all_teams(user) do
    result = for team <- user["teams"], do: get_team team
  end

  defp get_team(team) do
    with {:ok, response} <- ApiClient.get_team(team["id"]) do
      response
    else
      {:error, error} -> Logger.error("get_team, error=#{error}")
    end
  end

  defp get_users_s_teams(user) do
    teams = get_all_teams(user)
    %{
      id: user["id"],
      teams: teams
    }
  end


  def do_transformations() do
    for user <- DataHandler.get_all_users(), do: get_users_s_teams user
  end
end


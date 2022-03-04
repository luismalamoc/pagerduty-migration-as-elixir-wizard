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
        false -> {:ok, accumulative_list ++ response["users"] }
      end
    else
      {:error, error} -> Logger.error("get_all_users_acc, error=#{error}")
    end
  end

  def get_all_teams_of_user(users_list, accumulative_list) do
    get_all_teams_of_user_acc(users_list, [])
  end

  defp get_all_teams_of_user_acc(users_list, accumulative_list) do
    Enum.each(users_list, fn user -> (accumulative_list ++ get_all_teams(user["teams"])) end)
  end

  def get_all_teams(teams_list) do
    get_all_teams_acc(teams_list, [])
  end

  defp get_all_teams_acc(teams_list, accumulative_list) do
    Enum.each(teams_list, fn team -> (accumulative_list ++ get_team(team["id"])) end)
  end

  defp get_team(team_id) do
    case ApiClient.get_team(team_id) do
      {:ok, response} -> response
      {:error, error} -> Logger.error("get_team, error=#{error}")
    end
  end
end

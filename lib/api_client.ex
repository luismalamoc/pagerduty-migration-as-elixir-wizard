require Logger

defmodule ApiClient do
  @api_token "y_NbAkKc66ryYTWUXYEu"
  @api_url_base "https://api.pagerduty.com/"
  @common_headers [{"Content-Type", "application/json"}, {"Authorization", "Token token=#{@api_token}"}]

  def get_users(offset, limit) do
    url = "#{@api_url_base}users?offset=#{offset}&limit=#{limit}"
    {:ok, response} = BaseClient.do_get_request(url, @common_headers)
    Logger.info("get_users, offset=#{offset} has_more=#{response["more"]}")
    {:ok, response}
  end

  def get_team(team_id) do
    url = "#{@api_url_base}teams/#{team_id}"
    Logger.info("get_team, team_id=#{team_id}")
    BaseClient.do_get_request(url, @common_headers)
  end

  def get_contact_method(user_id, contact_method_id) do
    url = "#{@api_url_base}users/#{user_id}/contact_methods/#{contact_method_id}"
    BaseClient.do_get_request(url, @common_headers)
  end
end

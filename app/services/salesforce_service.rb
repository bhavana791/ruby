class SalesforceService
  require "rest-client"
  require "json"

  BASE_URL = "https://cunning-shark-ql5xhp-dev-ed.trailblaze.my.salesforce.com"  # Replace with your Salesforce instance URL
  ACCESS_TOKEN = "00DQy00000HPiby!AQEAQO6Xn_0pov62XEycN9gHL5j2DwOgN88M78bV6CFJqP2OgP_V_qq54IOtoQEX.w6RxcsyrsxHaTLxGZoDsDyIcKCUX0EK"  # Replace with your Salesforce access token

  def self.fetch_accounts
    response = RestClient.get(
      "#{BASE_URL}/services/data/v52.0/query/?q=SELECT Id, Name FROM Account",
      { Authorization: "Bearer #{ACCESS_TOKEN}" }
    )

    JSON.parse(response.body)["records"]
  end
end

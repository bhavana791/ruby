# app/controllers/oauth_controller.rb
class OauthController < ApplicationController
  def callback
    # The code parameter in the query string will contain the authorization code
    authorization_code = params[:code]

    # Now, exchange the authorization code for an access token
    # Use this code to call the Salesforce token endpoint and get the access token
    response = HTTParty.post("http://localhost:3000/oauth/callback/services/oauth2/token", {
      body: {
        grant_type: "authorization_code",
        code: authorization_code,
        client_id: "YOUR_CONSUMER_KEY",
        client_secret: "YOUR_CONSUMER_SECRET",
        redirect_uri: "YOUR_REDIRECT_URI"
      }
    })

    if response.success?
      access_token = response["access_token"]
      # You can store the access token or use it to make API calls
      render plain: "Access Token: #{access_token}"
    else
      render plain: "Error: #{response.body}", status: 400
    end
  end
end

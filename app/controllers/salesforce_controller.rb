# class SalesforceController < ApplicationController
#   require "restforce"

#   def accounts
#     begin
#       # Initialize the Salesforce client
#       client = Restforce.new(
#         username: ENV["SALESFORCE_USERNAME"],
#         password: ENV["SALESFORCE_PASSWORD"],
#         security_token: ENV["SALESFORCE_SECURITY_TOKEN"],
#         client_id: ENV["SALESFORCE_CLIENT_ID"],
#         client_secret: ENV["SALESFORCE_CLIENT_SECRET"],
#         host: ENV["SALESFORCE_HOST"]
#       )

#       # Authenticate the client
#       client.authenticate!
#       puts "Authentication successful!"

#       # Fetch Salesforce accounts
#       accounts = client.query("SELECT Id, Name FROM Account")

#       # Check if accounts are returned and render them
#       if accounts.empty?
#         render json: { error: "No accounts found" }, status: :not_found
#       else
#         render json: accounts
#       end
#     rescue Restforce::AuthenticationError => e
#       # Handle authentication error
#       render json: { error: "Authentication failed: #{e.message}" }, status: :unprocessable_entity
#     rescue Restforce::Client::Error => e
#       # Handle Salesforce client errors
#       render json: { error: "Salesforce client error: #{e.message}" }, status: :unprocessable_entity
#     rescue StandardError => e
#       # Handle any other errors
#       render json: { error: "Unexpected error: #{e.message}" }, status: :unprocessable_entity
#     end
#   end
# end
client = Restforce.new(
  username: ENV["SALESFORCE_USERNAME"],
           password: ENV["SALESFORCE_PASSWORD"],
          security_token: ENV["SALESFORCE_SECURITY_TOKEN"],
          client_id: ENV["SALESFORCE_CLIENT_ID"],
           client_secret: ENV["SALESFORCE_CLIENT_SECRET"],
           host: ENV["SALESFORCE_HOST"]
)

accounts = client.query("SELECT Id, Name FROM Account LIMIT 10")
accounts.each do |account|
  Account.create(name: account.Name) # Insert data into local database
end

class AccountsController < ApplicationController
  def import
    # Fetch accounts from Salesforce
    accounts_data = SalesforceService.fetch_accounts

    if accounts_data.empty?
      render json: { message: "No accounts data found in Salesforce." }, status: :not_found
    else
      # Store accounts in the local database
      accounts_data.each do |account|
        # Debugging: check the account data before saving
        puts "Saving account: #{account['Id']} - #{account['Name']}"
        Account.create(
          salesforce_id: account["Id"],
          name: account["Name"]
        )
      end

      render json: { message: "Accounts imported successfully" }, status: :ok
    end
  end
end

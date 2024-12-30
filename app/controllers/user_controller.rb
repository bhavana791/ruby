class AccountsController < ApplicationController
  def import
    accounts_data = SalesforceService.fetch_accounts

    accounts_data.each do |account|
      Account.create(
        salesforce_id: account["Id"],
        name: account["Name"]
      )
    end

    render json: { message: "Accounts imported successfully" }, status: :ok
  end
end

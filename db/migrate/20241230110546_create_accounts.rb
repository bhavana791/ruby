class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.string :salesforce_id
      t.string :name

      t.timestamps
    end
  end
end

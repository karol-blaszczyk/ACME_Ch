# frozen_string_literal: true

class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table(:users) do |t|
      ## Required
      t.string :provider, null: false, default: 'email'
      t.string :uid, null: false, default: ''

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ''

      ## Rememberable
      t.datetime :remember_created_at

      ## User Info
      t.string :email
      t.string :credit_card_token
      t.integer :billing_day
      t.string :billing_first_name
      t.string :billing_last_name
      t.string :billing_adress
      t.string :billing_zip_code
      t.date :last_billed_at

      ## Tokens
      t.text :tokens

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, %i[uid provider], unique: true
  end
end

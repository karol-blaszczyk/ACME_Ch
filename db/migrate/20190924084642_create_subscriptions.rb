# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end

    add_index(:subscriptions, %i[user_id plan_id], unique: true)
  end
end

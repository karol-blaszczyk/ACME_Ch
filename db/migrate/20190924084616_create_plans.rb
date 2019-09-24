# frozen_string_literal: true

class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :name, uniqe: true
      t.integer :price

      t.timestamps
    end

    add_index(:plans, :name, unique: true)
  end
end

class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.float :price
      t.references :user

      t.timestamps
    end
  end
end

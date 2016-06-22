class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :number
      t.string :name
      t.references :company_number
      t.references :user_number
      t.string :uuid

      t.timestamps null: false
    end
  end
end

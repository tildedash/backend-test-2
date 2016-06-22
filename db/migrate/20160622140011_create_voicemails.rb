class CreateVoicemails < ActiveRecord::Migration
  def change
    create_table :voicemails do |t|
      t.string :url
      t.references :call

      t.timestamps null: false
    end
  end
end

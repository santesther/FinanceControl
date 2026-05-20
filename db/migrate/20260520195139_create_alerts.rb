class CreateAlerts < ActiveRecord::Migration[8.1]
  def change
    create_table :alerts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :expense, null: false, foreign_key: true
      t.string :alert_type
      t.text :message
      t.string :channel
      t.string :status
      t.datetime :sent_at

      t.timestamps
    end
  end
end

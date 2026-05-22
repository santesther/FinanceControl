class CreateExpenses < ActiveRecord::Migration[8.1]
  def change
    create_table :expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :description
      t.decimal :amount, precision: 10, scale: 2
      t.date :date

      t.timestamps
    end
  end
end

class CreatePartners < ActiveRecord::Migration[5.0]
  def change
    create_table :partners do |t|
      t.string :name, null: false, default: ''
      t.integer :counter_click, default: 0

      t.timestamps
    end
  end
end

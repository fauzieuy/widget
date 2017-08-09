class AddUrlToPartners < ActiveRecord::Migration[5.0]
  def change
    add_column :partners, :url, :string
  end
end

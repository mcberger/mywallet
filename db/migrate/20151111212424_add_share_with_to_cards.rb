class AddShareWithToCards < ActiveRecord::Migration
  def change
    add_column :cards, :share_with, :string
  end
end

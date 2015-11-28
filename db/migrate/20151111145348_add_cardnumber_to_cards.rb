class AddCardnumberToCards < ActiveRecord::Migration
  def change
    add_column :cards, :cardnumber, :string
  end
end

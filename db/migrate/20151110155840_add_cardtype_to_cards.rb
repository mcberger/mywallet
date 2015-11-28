class AddCardtypeToCards < ActiveRecord::Migration
  def change
    add_column :cards, :cardtype, :string
  end
end

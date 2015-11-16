class RemoveEmailFromRsvps < ActiveRecord::Migration
  def change
    remove_column :rsvps, :email, :string
  end
end

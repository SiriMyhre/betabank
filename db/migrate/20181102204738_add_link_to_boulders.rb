class AddLinkToBoulders < ActiveRecord::Migration[5.2]
  def change
    add_column :boulders, :link, :string
  end
end

class CreateBoulders < ActiveRecord::Migration[5.2]
  def change
    create_table :boulders do |t|
      t.string :name
      t.string :grade
      t.string :position_min
      t.string :position_sec

      t.timestamps
    end
  end
end

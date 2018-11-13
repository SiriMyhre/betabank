class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :position_min
      t.string :position_sec
      t.string :link
      t.references :boulder, foreign_key: true

      t.timestamps
    end
  end
end

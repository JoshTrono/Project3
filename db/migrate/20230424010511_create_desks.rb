class CreateDesks < ActiveRecord::Migration[7.0]
  def change
    create_table :desks do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end

class CreateHumen < ActiveRecord::Migration
  def change
    create_table :humen do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end

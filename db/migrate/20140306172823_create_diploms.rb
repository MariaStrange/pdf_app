class CreateDiploms < ActiveRecord::Migration
  def change
    create_table :diploms do |t|
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end

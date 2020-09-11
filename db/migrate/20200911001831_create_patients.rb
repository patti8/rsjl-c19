class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :nama
      t.string :no_kamar
      t.string :no_rm

      t.timestamps
    end
  end
end

class AddColumnToPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :diagnosa, :string
    add_column :patients, :komorbid, :string
  end
end

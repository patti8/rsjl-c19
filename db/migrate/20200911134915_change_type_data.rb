class ChangeTypeData < ActiveRecord::Migration[5.2]
  def change
    change_column :patients, :nik, :bigint
  end
end

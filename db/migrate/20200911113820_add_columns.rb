class AddColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :nik, :integer
    add_column :patients, :tgl_lahir, :datetime
    add_column :patients, :no_hp, :string
    add_column :patients, :umur, :integer
    add_column :patients, :agama, :string
    add_column :patients, :jenis_kelamin, :string
    add_column :patients, :alamat, :text
    add_column :patients, :pekerjaan, :string
    add_column :patients, :tgl_masuk, :datetime
    add_column :patients, :tgl_keluar, :datetime
  end
end

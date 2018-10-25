class DeleteColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :appointments, :clients_id, :integer
    remove_column :patients, :clients_id, :integer
  end
end

class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    add_reference :appointments, :doctor, index: true
    add_reference :appointments, :patient, index: true
  end
end

class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :reservation_id
      t.string :question
      t.string :answer
      t.timestamps
    end
  end
end

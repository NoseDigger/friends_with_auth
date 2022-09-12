class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :city
      t.date :dob
      t.string :number

      t.timestamps
    end
  end
end

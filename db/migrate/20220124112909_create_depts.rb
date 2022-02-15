class CreateDepts < ActiveRecord::Migration[6.1]
  def change
    create_table :depts do |t|
      t.string :name
      t.integer :students
      t.integer :staff
      t.integer :books

      t.timestamps
    end
  end
end

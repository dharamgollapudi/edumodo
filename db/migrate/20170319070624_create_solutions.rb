class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :homework_id
      t.integer :student_id
      t.text :answer
      t.integer :version

      t.timestamps
    end
  end
end

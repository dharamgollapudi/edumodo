class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :homework_id
      t.integer :student_id

      t.timestamps
    end
  end
end

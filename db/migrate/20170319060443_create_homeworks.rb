class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.integer :teacher_id
      t.string :title
      t.text :question
      t.date :due_on

      t.timestamps null: false
    end
  end
end

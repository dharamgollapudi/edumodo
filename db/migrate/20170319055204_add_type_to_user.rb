class AddTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :type, :string, :after => :id, :default => 'Student'
  end
end

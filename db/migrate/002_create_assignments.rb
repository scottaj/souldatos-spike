class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.column :name, :string
      t.column :type, :string
      t.column :student_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end

class AssignmentTypeRename < ActiveRecord::Migration
  def self.up
    change_table :assignments do |t|
      t.rename :type, :assignment_type
    end
  end

  def self.down
  end
end

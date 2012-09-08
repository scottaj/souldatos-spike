class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :udm_id, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end

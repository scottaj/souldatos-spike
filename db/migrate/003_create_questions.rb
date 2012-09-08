class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.column :number, :integer
      t.column :text, :string
      t.column :value, :integer
      t.column :score, :integer
      t.column :complete, :boolean
      t.column :assignment_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end

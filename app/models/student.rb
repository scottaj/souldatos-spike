class Student < ActiveRecord::Base
  has_many :assignments

  validates_presence_of :first_name, :last_name, :udm_id
  validates_format_of :udm_id, with: /T0\d{7}/
  validates_uniqueness_of :udm_id

  def generate_assignments()
    Assignment.where(student_id: nil).each do |assn|
      new_assn = Assignment.new
      new_assn.name = assn.name
      new_assn.assignment_type = assn.assignment_type
      new_assn.student_id = self.id
      new_assn.save
    end
  end

  after_create do
    generate_assignments
  end
  
  def name()
    return "#{self.first_name} #{self.last_name}"
  end
end

class Student < ActiveRecord::Base
  has_many :assignments

  validates_presence_of :first_name, :last_name, :udm_id
  validates_format_of :udm_id, with: /T0\d{7}/
  validates_uniqueness_of :udm_id

  def name()
    return "#{self.first_name} #{self.last_name}"
  end
end

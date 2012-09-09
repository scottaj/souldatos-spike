class Student < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :udm_id
  
  has_many :assignments

  validates_presence_of :first_name, :last_name, :udm_id
  validates_format_of :udm_id, with: /T0\d{7}/
end

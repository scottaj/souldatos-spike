class Student < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :udm_id

  has_many :assignments
end

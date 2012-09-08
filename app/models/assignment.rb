class Assignment < ActiveRecord::Base
  attr_accessor :name, :type

  belongs_to :student
  has_many :questions
end

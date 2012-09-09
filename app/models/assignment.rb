class Assignment < ActiveRecord::Base
  ASSIGNMENT_TYPES = ['Homework', 'Quiz', 'Exam', 'Project', 'Paper']
  attr_accessor :name, :type, :student_id
  
  belongs_to :student
  has_many :questions

  validates_presence_of :name, :type
  validates_inclusion_of :type, within: ASSIGNMENT_TYPES
end

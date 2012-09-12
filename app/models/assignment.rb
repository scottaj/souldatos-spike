class Assignment < ActiveRecord::Base
  ASSIGNMENT_TYPES = ['Homework', 'Quiz', 'Exam', 'Project', 'Paper']
  
  belongs_to :student
  has_many :questions

  validates_presence_of :name, :assignment_type
  validates_inclusion_of :assignment_type, within: ASSIGNMENT_TYPES
  validates_uniqueness_of :name, scope: :student_id
  
  def total_points()
    return self.questions.inject(0) {|sum, q| sum + q.value}
  end

  def total_score()
    return self.questions.inject(0) {|sum, q| sum + (q.score || 0)}
  end

  def percentage()
    begin
      return (self.total_score.to_f / self.total_points.to_f) * 100
    rescue ZeroDivisionError
      return 0
    end
  end
end

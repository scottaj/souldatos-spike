class Assignment < ActiveRecord::Base
  ASSIGNMENT_TYPES = ['Homework', 'Quiz', 'Exam', 'Project', 'Paper']
  
  belongs_to :student
  has_many :questions

  validates_presence_of :name, :assignment_type
  validates_inclusion_of :assignment_type, within: ASSIGNMENT_TYPES
  validates_uniqueness_of :name, scope: :student_id

  def generate_questions()
    template = Assignment.where(name: self.name, student_id: nil).first
    Question.where(assignment_id: template.id).each do |q|
      new_q = Question.new
      new_q.text = q.text
      new_q.value = q.value
      new_q.assignment_id = self.id
      new_q.save
    end
  end

  after_create do
    generate_questions
  end
  
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

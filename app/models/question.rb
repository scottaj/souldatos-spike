class Question < ActiveRecord::Base
  belongs_to :assignment

  validates_presence_of :text, :value
  validates_uniqueness_of :text, scope: :assignment_id
end

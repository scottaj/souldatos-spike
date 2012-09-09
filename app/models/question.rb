class Question < ActiveRecord::Base
  attr_accessor :number, :text, :value, :score, :complete, :assignment_id

  belongs_to :assignment

  validates_presence_of :number, :text, :value
end

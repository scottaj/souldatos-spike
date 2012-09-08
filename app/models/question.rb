class Question < ActiveRecord::Base
  attr_accessor :number, :text, :value, :score, :complete

  belongs_to :assignment
end

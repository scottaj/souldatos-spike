require 'spec_helper'

describe "Question Model" do
  let(:question) { Question.new }
  it 'can be created' do
    question.should_not be_nil
  end
end

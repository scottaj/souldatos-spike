SouldatosSpike.controllers :question do
  get :new, with: :assn do
    assignment_name = Assignment.find(params[:assn].to_i).name
    render 'question/new_question', locals: {page_title: "New Question", assignment_name: assignment_name}
  end

  post :new do
    assignments = Assignment.where(name: params[:assignment])
    assignments.each do |assn|
      q = Question.new
      q.text = params[:text]
      q.value = params[:points].to_i
      q.assignment_id = assn.id
      q.save
    end
    redirect_assignment = assignments.where(student_id: nil).first
    redirect "/assignment/#{redirect_assignment.id}"
  end

  get :delete, with: :assn do
    assignment = Assignment.find(params[:assn].to_i)
    render 'question/delete_question', locals: {page_title: "Delete Question", assignment: assignment}
  end

  post :delete do
    valid_assignments = Assignment.where(name: params[:assn]).map {|a| a.id}
    Question.delete_all(text: params[:text], assignment_id: valid_assignments)
    redirect "/"
  end
end

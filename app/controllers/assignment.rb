SouldatosSpike.controllers :assignment do
  get :index, with: :id, priority: :low do
    assignment = Assignment.where(id: params[:id]).first
    render 'assignment/assignment_detail', locals: {page_title: assignment.name, assignment: assignment}
  end

  get :new do
    render '/assignment/new_assignment', locals: {page_title: "New Assignment", errors: []}
  end

  post :new do
    template = Assignment.new
    template.name = params[:assignment_name]
    template.assignment_type = params[:assignment_type]
    template.save
    Student.all.each do |student|
      assn = Assignment.new
      assn.name = params[:assignment_name]
      assn.assignment_type = params[:assignment_type]
      assn.student_id = student.id
      assn.save
    end
    redirect "/assignment/#{template.id}"
  end

  get :delete do
    render '/assignment/delete_assignment', locals: {page_title: "Delete Assignment"}
  end

  post :delete do
    Assignment.where(name: params[:name]).each do |assn|
      Question.destroy_all(assignment_id: assn.id)
      assn.destroy
    end
    redirect '/'
  end
end

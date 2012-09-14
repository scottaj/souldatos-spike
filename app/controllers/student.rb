SouldatosSpike.controllers :student do
  get :index, with: :id, priority: :low do
    student = Student.where(udm_id: params[:id]).first
    if student
      render 'student/student_detail', locals: {page_title: student.name, student: student}
    else
      error 404
    end
  end  

  get :new do
    render 'student/new_student', locals: {page_title: "New Student", errors: []}
  end

  post :new do
    new_student = Student.new(first_name: params[:first_name],
                              last_name: params[:last_name],
                              udm_id: params[:id])
    if new_student.valid?
      new_student.save
      redirect '/'
    else
      render 'student/new_student', locals: {page_title: "New Student", errors: new_student.errors}
    end
  end
  
  get :delete do
    # List of students with an option to delete
    render 'student/delete_student', locals: {page_title: "Delete Student"}
  end

  post :delete do
    student = Student.where(udm_id: params[:id]).first
    if student
      student.destroy
      redirect '/'
    else
      redirect '/student/delete'
    end
  end

  get :assignment, with: :id do
    assignment = Assignment.find(params[:id].to_i)
    student = Student.find(assignment.student_id)
    questions = Question.where(assignment_id: assignment.id)

    render "/student/assignment", locals: {page_title: assignment.name, assignment: assignment, student: student, questions: questions}
  end

  post :assignment do
    assignment = Assignment.find(params[:assignment].to_i)
    questions = Question.where(assignment_id: assignment.id)

    questions.each do |q|
      q.score = params[:"score_#{q.id}"].to_i
      q.save
    end

    redirect "/student/#{Student.find(assignment.student_id).udm_id}"
  end
end

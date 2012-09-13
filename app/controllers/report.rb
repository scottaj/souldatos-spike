SouldatosSpike.controllers :report do
  get :index do
    redirect "/report/#{params[:report_type].parameterize.underscore}"
  end

  get :index, with: :id do
    # Render report not found page
    error 404
  end
  
  get :average_grade_on_assignment do
    render '/report/average_grade_on_assignment', locals: {page_title: "Define Report"}
  end

  post :average_grade_on_assignment do
    
  end
end

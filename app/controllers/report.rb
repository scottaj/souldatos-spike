SouldatosSpike.controllers :report do
  get :index do
    redirect "/report/#{params[:report_type].parameterize.underscore}"
  end

  get :index, with: :id, priority: :low do
    # Render report not found page
    error 404
  end
  
  get :average_grade_on_assignment do
    render '/report/average_grade_on_assignment', locals: {page_title: "Define Report"}
  end

  post :average_grade_on_assignment do
    scores = Assignment.where(name: params[:assignment]).map {|a| a.total_score}.delete_if {|n| n <= 0}
    R.scores = scores
    data = {}
    ["mean", "median", "min", "max", "var", "sd"].each do |method|
      R.eval "#{method}_result<-#{method}(scores)"
      data[:"#{method}"] = R.pull("#{method}_result")
    end
    logger.info data.inspect
    render '/report/report_table', locals: {
      page_title: "Report Summary",
      table_title: params[:assignment],
      table_headers: data.map {|k, v| k.to_s.capitalize},
      table: data
    }
  end
end

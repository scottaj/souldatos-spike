SouldatosSpike.controllers :report do
  get :index do
    redirect "/report/#{params[:report_type].parameterize.underscore}"
    # delete any existing report images.
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

  get :distribution_of_scores_on_assignment do
    render '/report/distribution_of_scores_on_assignment', locals: {page_title: "Define Report"}
  end

  post :distribution_of_scores_on_assignment do
    R.data = [
              assignment_percentage_in_range(1..59).size,
              assignment_percentage_in_range(60..69).size,
              assignment_percentage_in_range(70..79).size,
              assignment_percentage_in_range(80..89).size,
              assignment_percentage_in_range(90..100).size
            ]

    image_timestamp = Time.now.to_i
    R.img_path = File.expand_path("img/report/#{image_timestamp}.png", "public")
    img_path = "/img/report/#{image_timestamp}.png"
    R.eval <<STR
png(img_path)
barplot(data, main="Distribution of Scores", xlab="Grade", ylab="Number of Students", names.arg=c("E", "D", "C", "B", "A"), col=rainbow(5))
dev.off()
STR

    render "/report/plot", locals: {page_title: "Report Summary", image: img_path}
  end
end

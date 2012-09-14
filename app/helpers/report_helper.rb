# Helper methods defined here can be accessed in any controller or view in the application

SouldatosSpike.helpers do
  REPORT_TYPES = [
                  "Average Grade on Assignment",
                  "Distribution of Scores on Assignment"
                 ]

  def assignment_percentage_in_range(range)
    return Assignment.where(name: params[:assignment]).select {|a| range.include?(a.percentage)}
  end
end

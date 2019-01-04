class Admin::StatisticsController < AdminController
  def index
    @excercises = Excercise.all.map do |excercise|
      [Date::MONTHNAMES[excercise.created_at.month],
      excercise.created_at.year].join(" ")
    end
    @excercises_by_moth =
      @excercises.each_with_object(Hash.new(0)) do |month_year, counts|
        counts[month_year] += 1
      end
  end
end

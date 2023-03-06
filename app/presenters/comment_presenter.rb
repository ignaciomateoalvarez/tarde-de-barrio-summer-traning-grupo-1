class CommentPresenter
attr_reader :date

  def initialize(date)
    @date = date
  end 

  def formatted_date 
    if date == Date.today
      I18n.t("students.comment.today")
    else
      date.strftime("%A, %B, %e")
    end 
  end

end 
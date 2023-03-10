module DateHelper
  
  def formatted_date(date)
    if date == Date.today
      t("students.comments.today")
    else
      date.strftime("%A, %B %e")
    end
  end 
end
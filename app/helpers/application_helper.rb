module ApplicationHelper
  

  def colindex_to_time(i) 
    Tod::TimeOfDay.new("8","0")+(i*30).minutes
  end

end

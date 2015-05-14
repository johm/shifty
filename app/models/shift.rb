class Shift < ActiveRecord::Base
  belongs_to :worker
  belongs_to :task

  serialize :start_time, Tod::TimeOfDay
  serialize :end_time, Tod::TimeOfDay
  
  def shiftrange 
    Tod::Shift(start_time,end_time)
  end

end

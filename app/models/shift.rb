class Shift < ActiveRecord::Base
  belongs_to :worker
  belongs_to :task
  has_one :workgroup, :through => :task

  serialize :start_time, Tod::TimeOfDay
  serialize :end_time, Tod::TimeOfDay
  
  def shiftrange 
    Tod::Shift.new(start_time,end_time)
  end

  def minutes_long
    shiftrange.duration/60
  end
  
  def minutes_from_eight
    (start_time.second_of_day - 8.hours)/60
  end


end

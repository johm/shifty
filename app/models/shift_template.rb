class ShiftTemplate < ActiveRecord::Base
  has_many :shifts

  def apply_to_monday(monday)
    
    # delete the old shifts for each task
    shifts.collect {|s| s.task}.uniq.each do |t| 
        Shift.where(:monday=>monday,:task_id=>t.id).each {|s| s.destroy}
    end

    # make the new shifts
    shifts.each do |s| 
      Shift.new(:worker=>s.worker,:day_of_week=>s.day_of_week,:monday=>monday,:start_time=>s.start_time,:end_time=>s.end_time,:task=>s.task).save!
    end

  end

end

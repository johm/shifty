module ApplicationHelper
  

  def colindex_to_time(i) 
    Tod::TimeOfDay.new("8","0")+(i*30).minutes
  end

  def shifts_to_summary(shifts)
    summary={}
    shifts.collect {|s| s.worker_id}.uniq.each do |w_id|
      summary[w_id]={
        worker: Worker.find(w_id),
        hours: shifts.find_all {|s| s.worker_id==w_id}.inject(0) {|sum,shift| sum+shift.minutes_long }/60.0
        }
    end
    summary
  end

end

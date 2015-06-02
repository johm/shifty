module ApplicationHelper
  

  def colindex_to_time(i) 
    Tod::TimeOfDay.new("8","0")+(i*30).minutes
  end

  def shifts_to_summary(shifts)
    summary={}
    shifts.collect {|s| s.worker_id}.uniq.each do |w_id|
      summary[w_id]={
        worker: Worker.find(w_id),
        hours: shifts.find_all {|s| s.worker_id==w_id}.inject(0) {|sum,shift| sum+shift.hours_long },
        total_hourly_pay: shifts.find_all {|s| s.worker_id==w_id}.inject(0) {|sum,shift| sum+shift.total_hourly_pay},
        total_hourly_capital_contribution: shifts.find_all {|s| s.worker_id==w_id}.inject(0) {|sum,shift| sum+shift.total_hourly_capital_contribution},
        total_hourly_predicted_extra_wage: shifts.find_all {|s| s.worker_id==w_id}.inject(0) {|sum,shift| sum+shift.total_hourly_predicted_extra_wage}
        }
    end
    summary
  end



end

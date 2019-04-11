module ApplicationHelper

  def getsomemondays(monday)
    mondays=[]
    mondays.append((1..10).collect {|x| monday - x.weeks})
    mondays.append((0..10).collect {|x| monday + x.weeks})
    return mondays.flatten
  end

  def colindex_to_time(i) 
    Tod::TimeOfDay.new("8","0")+(i*30).minutes
  end

  def shifts_to_summary(shifts)
    summary={}
    shifts.collect {|s| s.worker_id}.uniq.each do |w_id|
      w=Worker.find(w_id)
      summary[w.name]={
        worker: w,
        hours: shifts.find_all {|s| s.worker_id==w_id}.inject(0) {|sum,shift| sum+shift.payable_hours_long },
        sick_hours: shifts.find_all {|s| s.worker_id==w_id && s.alert == "sick"}.inject(0) {|sum,shift| sum+shift.hours_long },
        total_hourly_pay: shifts.find_all {|s| s.worker_id==w_id}.inject(0) {|sum,shift| sum+shift.total_hourly_pay},
        total_hourly_capital_contribution: shifts.find_all {|s| s.worker_id==w_id}.inject(0) {|sum,shift| sum+shift.total_hourly_capital_contribution},
        total_hourly_predicted_extra_wage: shifts.find_all {|s| s.worker_id==w_id}.inject(0) {|sum,shift| sum+shift.total_hourly_predicted_extra_wage}
        }
    end
    summary
  end


  def doublebooked?(shifts)
    possible_overlaps=shifts.group_by {|s| [s.worker.id,s.day_of_week] }.values.find_all {|a| a.length > 1}   # get shifts for same worker on same day of week when worker has two shifts on that day 
    possible_overlaps.each do |po| 
      po.each do |shift| #for each possibly overlapping shift
        po.find_all{|y| y != shift}.each do |anothershift| #look at all the other shifts that might overlap
          return "#{shift.worker.name} #{shift.day_of_week}" if shift.shiftrange.overlaps?(anothershift.shiftrange) #return if you find an overlap
        end
      end
    end
    
    
    return false
  end

end

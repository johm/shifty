class Shift < ActiveRecord::Base
  belongs_to :worker
  belongs_to :task
  belongs_to :shift_template
  has_one :workgroup, :through => :task

  serialize :start_time, Tod::TimeOfDay
  serialize :end_time, Tod::TimeOfDay

  validates :task,:presence => true
  validates :worker,:presence => true


  ALERTS = { ontime: "On time!", noshow: "No Show", nocall: "No Call No Show", alittlelate: "A little late", late15: "15 minutes late", late30: "30 minutes late", late45: "45 minutes late", late60: "1 hour late", late75: "1 hour 15 minutes late", late90: "1 hour 30 minutes late", late105: "1 hour 45 minutes late", late120: "2 hours late" } 
  
  validates_inclusion_of :alert, :in => ALERTS.keys.map {|x| x.to_s} , :allow_nil => true
  
  
  def shiftrange 
    Tod::Shift.new(start_time,end_time)
  end

  def minutes_long
    shiftrange.duration/60
  end

  def hours_long
    minutes_long/60.0
  end

  def minutes_late
    case alert
    when "late15"
      15
    when "late30"
      30
    when "late45"
      45
    when "late60"
      60
    when "late75"
      75
    when "late90"
      90
    when "late105"
      105
    when "late120"
      120
    else
      0
    end
  end

  def payable_minutes_long 
    
    payable_minutes=case alert
    when "ontime"
      minutes_long
    when "alittlelate"
      minutes_long
    when "noshow"
      0
    when "nocall"
      0
    when "late15"
      minutes_long-15
    when "late30"
      minutes_long-30
    when "late45"
      minutes_long-45
    when "late60"
      minutes_long-60
    when "late75"
      minutes_long-75
    when "late90"
      minutes_long-90
    when "late105"
      minutes_long-105
    when "late120"
      minutes_long-120
    else
      minutes_long
    end
    payable_minutes < 0 ? 0 : payable_minutes

  end

  def payable_hours_long
    payable_minutes_long/60.0
  end

 

  def minutes_from_eight
    (start_time.second_of_day - 8.hours)/60
  end

  def date
    monday+day_of_week.days
  end
  
  def applicable_pay_rate
    worker.pay_rates.where("effective <= ?",monday).last 
  end

  def total_hourly_pay
    applicable_pay_rate.hourly_pay*payable_hours_long rescue Money.new(0)
  end

  def total_hourly_capital_contribution
    applicable_pay_rate.hourly_capital_contribution*payable_hours_long rescue Money.new(0)
  end

  def total_hourly_predicted_extra_wage
    applicable_pay_rate.hourly_predicted_extra_wage*payable_hours_long rescue Money.new(0)
  end

  def total_expense
    total_hourly_pay+total_hourly_predicted_extra_wage+total_hourly_capital_contribution
  end

  def shifts_this_week 
    if shift_template.nil?
      Shift.where(:monday => monday)
    else
      shift_template.shifts
    end
  end

end

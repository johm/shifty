class Shift < ActiveRecord::Base
  belongs_to :worker
  belongs_to :task
  belongs_to :shift_template
  has_one :workgroup, :through => :task

  serialize :start_time, Tod::TimeOfDay
  serialize :end_time, Tod::TimeOfDay

  validates :task,:presence => true
  validates :worker,:presence => true
  
  def shiftrange 
    Tod::Shift.new(start_time,end_time)
  end

  def minutes_long
    shiftrange.duration/60
  end

  def hours_long
    minutes_long/60.0
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
    applicable_pay_rate.hourly_pay*hours_long rescue Money.new(0)
  end

  def total_hourly_capital_contribution
    applicable_pay_rate.hourly_capital_contribution*hours_long rescue Money.new(0)
  end

  def total_hourly_predicted_extra_wage
    applicable_pay_rate.hourly_predicted_extra_wage*hours_long rescue Money.new(0)
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

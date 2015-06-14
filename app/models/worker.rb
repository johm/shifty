class Worker < ActiveRecord::Base
  has_many :workgroup_memberships, :dependent => :destroy
  has_many :workgroups, :through=>:workgroup_memberships
  has_many :shifts
  has_many :transactions
  has_many :pay_rates
  default_scope {includes(:pay_rates).order(:firstname)}
  validates :pronoun, :presence=> {:message=>"No cisnormativity. Be explicit!"}
  accepts_nested_attributes_for :pay_rates

  def name 
    "#{firstname} #{lastname}"
  end

  def shortname 
    "#{firstname} #{last_initial}"
  end

  def to_s 
    shortname
  end

  def capital_account_balance(on_date)
    shifts.where(:shift_template_id=>nil).where("monday <= ?",on_date).inject(Money.new(0)) {|sum,s| sum+s.total_hourly_capital_contribution }
    #should also account for initial balance, lump contributions and distributions
  end

end

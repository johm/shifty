class Worker < ActiveRecord::Base
  has_many :workgroup_memberships, :dependent => :destroy
  has_many :workgroups, :through=>:workgroup_memberships
  has_many :pay_rates

  accepts_nested_attributes_for :pay_rates

  def name 
    "#{firstname} #{lastname}"
  end

  def to_s 
    name
  end

end

class Worker < ActiveRecord::Base
  has_many :workgroup_memberships, :dependent => :destroy
  has_many :workgroups, :through=>:workgroup_memberships

  def name 
    "#{firstname} #{lastname}"
  end

end

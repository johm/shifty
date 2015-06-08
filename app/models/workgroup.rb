class Workgroup < ActiveRecord::Base
  has_many :workgroup_memberships, :dependent => :destroy
  has_many :workers, :through=>:workgroup_memberships
  has_many :tasks
  has_many :shifts, :through=>:tasks

  accepts_nested_attributes_for :tasks

  
end

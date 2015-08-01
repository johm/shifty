class MilestoneAccomplishment < ActiveRecord::Base
  belongs_to :milestone
  belongs_to :worker
  default_scope {order("date ASC")}
  validates :worker,:presence => true
  validates :milestone,:presence => true
  validates :date,:presence => true


end

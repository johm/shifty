class WorkgroupMembership < ActiveRecord::Base
  belongs_to :worker
  belongs_to :workgroup
end

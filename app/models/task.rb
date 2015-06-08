class Task < ActiveRecord::Base
  belongs_to :workgroup
  has_many :shifts

  def to_s
    name
  end
end

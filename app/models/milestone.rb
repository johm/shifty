class Milestone < ActiveRecord::Base
  has_many :milestone_accomplishments,  :dependent => :destroy
  has_many :workers,:through=>:milestone_accomplishments

end

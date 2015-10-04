class Patient < ActiveRecord::Base
  belongs_to :health_plan
end

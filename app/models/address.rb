class Address < ActiveRecord::Base
  belongs_to :patient
  belongs_to :city
end

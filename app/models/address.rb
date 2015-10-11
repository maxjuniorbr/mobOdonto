class Address < ActiveRecord::Base
  belongs_to :patient
  belongs_to :city

  validates :street, presence: true
  validates :street_number, presence: true
  validates :neighborhood, presence: true
  validates :city_id, presence: true
end

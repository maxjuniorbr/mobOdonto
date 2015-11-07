class Phone < ActiveRecord::Base
  belongs_to :patient

  validates :landline_phone, presence: true, if: :checkfone?
  validates :cell_phone, presence: true, if: :checkfone?
  validates :other_phone_contact, presence: true, :unless => lambda { self.other_phone.blank? }
  validates :other_phone, presence: true, :unless => lambda { self.other_phone_contact.blank? }

  def checkfone?
  	self.landline_phone.blank? && self.cell_phone.blank?
  end
end
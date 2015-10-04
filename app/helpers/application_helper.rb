module ApplicationHelper
	def date_format(date)
  	date ? date.strftime("%d/%m/%Y") : nil
	end
end

module ApplicationHelper
	def date_format(date)
  	date ? date.strftime("%d/%m/%Y") : nil
	end

	def link_to_add_fields(name, f, association, button_type, data, target)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields #{button_type}", data: {toggle: data, target: targed, id: id, fields: fields.gsub("\n", "")})
  end	
end

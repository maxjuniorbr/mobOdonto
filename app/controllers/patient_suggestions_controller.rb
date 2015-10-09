class PatientSuggestionsController < ApplicationController
	def index
		render json: Patient.select(:id, :patient).terms_for(params[:term]).collect { |p| { :value => p.id, :label => p.patient } }.compact
	end	
end

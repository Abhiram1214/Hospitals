class MedicationsController < ApplicationController

	def new
		#logger.debug(params)
		
	end

	def create
		@med=Medication.create(new_med)
		 if @med.save
		 	redirect_to(patient_path(@med.patient_id))
		 end
	end

	def new_med
		params.require(:medication).permit(:name,:patient_id)
	end

	def edit
		@med=Medication.find(params[:id])
	end

	def update
		@med=Medication.find(params[:id])
		if @med.update_attributes(med_update)
			redirect_to(patient_path(@med.patient_id))
		end
	end

	def med_update
		params.require(:medication).permit(:name,:patient_id)
	end

	def patient_med
		@med=Medication.new
		@med.patient_id = params[:id]
	end
end

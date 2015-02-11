class PatientsController < ApplicationController
	def show
 	   @patient=Patient.find(params[:id])
	end

	def add_patient
		@pat=Patient.new
		@pat.doctor_id=params[:id]
		 1.times{@pat.medications.build}   
	end

    def create
    		@pat=Patient.create(new_pat)
    	if @pat.save
    			redirect_to(doctor_path(@pat.doctor_id))
		 end
	end

	def destroy
		@pu=params[:id]
		@patient=Patient.find(params[:id]).destroy
		redirect_to(doctor_path(@patient.doctor_id))
	end


	def new_pat
		params.require(:patient).permit(:name,:doctor_id,medications_attributes: [:name,:patient_id])
	end
end

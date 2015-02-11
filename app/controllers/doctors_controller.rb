class DoctorsController < ApplicationController


	def index
	   @doctors=Doctor.all	
	end

	def show
      @doctor=Doctor.find(params[:id])
    end

	def new
	  @doc_create=Doctor.new
	end

	def create
 		@doc_create=Doctor.new(doctor_create)
 		if @doc_create.save
 			redirect_to(doctors_path)
 		end
	end

	def doctor_create
		params.require(:doctor).permit(:name)
	end

	def edit
		@doctor=Doctor.find(params[:id])
	end

	def doctor_edit
		params.require(:doctor).permit(:name)
	end

	def update
		@doctor=Doctor.find(params[:id])
		@doctor.update(doctor_edit)
		if @doctor.save
			redirect_to(doctors_path)
		end
	end
	

	def destroy
		@doctor=Doctor.find(params[:id]).destroy
		#@doctor.destroy
		 redirect_to(doctors_path)
	end
end

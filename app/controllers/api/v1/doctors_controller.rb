class API::V1::DoctorsController < ApplicationController
    def index
        render json: Doctor.all
    end

    def create
        doctor = Doctor.create(doctor_params)
        if doctor.valid?
            render json: doctor
        else
            render json: {"error" => doctor.errors.full_messages}, status: 422
        end
    end

    def show
        render json: doctor.find(params[:id])
    end

    def update
        doctor = Doctor.update(params[:id], doctor_params)
        if doctor.valid?
            render json: doctor
        else
            render json: doctor.errors.full_messages
        end
    end

    def destroy
        doctor = Doctor.find(params[:id])
        if doctor.destroy
            render json: {"message" => "Doctor Has Been Deleted"}
        else
            render json: {"error" => doctor.errors.full_messages}, status: 409
        end
    end

    private

    def doctor_params
        params.require(:doctor).permit(:name, :email)
    end
end

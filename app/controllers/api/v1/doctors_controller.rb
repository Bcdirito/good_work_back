class Api::V1::DoctorsController < ApplicationController
    skip_before_action :authorized, only: [:destroy]
    
    def index
        obj = filter(@user)
        render json: obj
    end

    def create
        doctor = Doctor.create(doctor_params)
        if doctor.valid?
            DoctorUser.create(doctor_id: doctor.id, user_id: params[:user_id])
            create_practices(doctor, params[:practices])
            render json: doctor
        else
            render json: {"error" => doctor.errors.full_messages}, status: 422
        end
    end

    def create_practices(doctor, practices)
        practices.each do |practice|
            address = "#{practice[:visit_address][:street]}, #{practice[:visit_address][:city]}, #{practice[:visit_address][:state]} #{practice[:visit_address][:zip]}"
            Practice.create(doctor_id: doctor.id, name: practice[:name], address: address, phone: practice[:phones][0][:number] )
        end
    end

    def filter(user)
        arr = []
        Doctor.all.each do |doc|
            if doc.users.ids.include?(user.id)
                arr << {doctor: doc, practices: doc.practices}
            end
        end
        arr
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
        params.require(:doctor).permit(:name, :bio, :image)
    end
end

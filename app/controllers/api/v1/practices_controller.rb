class Api::V1::PracticesController < ApplicationController
  def index
    render json: Practice.all
  end

  def create
      practice = Practice.create(practice_params)
      if practice.valid?
          render json: practice
      else
          render json: {"error" => practice.errors.full_messages}, status: 422
      end
  end

  def update
      practice = Practice.update(params[:id], practice_params)
      if practice.valid?
          render json: practice
      else
          render json: practice.errors.full_messages
      end
  end

  def destroy
      practice = Practice.find(params[:id])
      if practice.destroy
          render json: {"message" => "Practice Has Been Deleted"}
      else
          render json: {"error" => practice.errors.full_messages}, status: 409
      end
  end

  private

  def practice_params
      params.require(:practice).permit(:name, :address, :phone)
  end
end

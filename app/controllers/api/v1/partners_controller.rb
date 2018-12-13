class Api::V1::PartnersController < ApplicationController
    def index
        render json: Partner.all
    end
end

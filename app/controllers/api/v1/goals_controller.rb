class Api::V1::GoalsController < ApplicationController
    def index
        render json: Goal.all
    end
end

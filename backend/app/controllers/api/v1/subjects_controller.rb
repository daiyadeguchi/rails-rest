class Api::V1::SubjectsController < ApplicationController
    before_action :find_subject, only: [:show, :update, :destroy]

    def index
        @subject = Subject.all
        render json: @subject
    end

    def show
        render json: @subject
    end

    def create
        @subject = Subject.new(subject_params)
        if @subject.save
            render json: @subject
        else
            render error: { error: 'Unable to create subject. ' } , status: 400
        end
    end

    def update
        if @subject
            @subject.update(subject_params)
            render json: { message: 'Subject successfully updated.' }, status: 200
        else 
            render json: { error: 'Unable to update subject.' }, status: 400
        end
    end

    private
    def subject_params
        params.require(:subject).permit(:subject, :likes, :user_id)
    end

    def find_subject
        @subject = Subject.find(params[:id])
    end

end

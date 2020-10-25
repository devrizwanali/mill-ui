# frozen_string_literal: true

class FoldersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_profile

  def create
    @folder = Folder.new(folder_params)
    @folder.profile = @profile
    if @folder.save
      render json: { folder: @folder }, status: 200
    else
      render json: { errors: @folder.erros }, status: :unprocessable_entity
    end
  end

  def index
    @folders = @profile.folders
    render json: { folders: @folders }, status: :ok
  end

  private

  def find_profile
   @profile = Profile.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name)
  end
end

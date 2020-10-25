# frozen_string_literal: true

class ProfilesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      render json: { profile: @profile }, status: 200
    else
      render json: { errors: @profile.erros }, status: :unprocessable_entity
    end
  end

  def show
    @profile = Profile.find(params[:id])
    render json: { profile: @profile }, status: 200
  end

  def index
    @profiles = Profile.all
    render json: { profiles: @profiles }, status: :ok
  end

  private

  def profile_params
    params.require(:profile).permit(:name)
  end
end
